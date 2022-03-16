<%@page import="api.ApiVo"%>
<%@page import="api.ApiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ApiVo> bestlist = (ArrayList<ApiVo>)session.getAttribute("bestlist");
%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/list.css" rel="stylesheet">
<!-- <link href="<%=request.getContextPath()%>/css/calendar.css" rel="stylesheet"> -->
<link href="<%=request.getContextPath()%>/css/slide.css" rel="stylesheet">
<!-- slide area [start] -->
<div class="slide_wrap">
	<div class="wrap">
		<div class="slide_btn_wrap">
			<div class="slide_btn btn_left"></div>
			<div class="slide_btn btn_right"></div>
		</div>
		<div class="slide_radius_btnbox">
			<% for(int i=0; i<bestlist.size(); i++) { %>
				<div class="slide_btns <% if(i==0){%>now<%}%>"></div>
			<% } %>
		</div>
		<div class="slide_container">
			<div class="slide_list_wrap">
				<ul>
					<% 
					for(ApiVo item : bestlist) {
					%>
						<li>
							<div class="slide_flag">
								이달의<br><b style="color:yellow">PICK</b>
							</div>
							<div class="slide_img" style="background:url('<%=request.getContextPath()%>/img/thum_<%=item.getAkind()%>.jpg') no-repeat center; background-size: cover;">
							</div>
							<div class="slide_infobox">
								<div class="slide_infobox_title">
									<span><%= item.getAkindName() %></span><%= item.getSubject() %>
								</div>
								<div class="slide_infobox_note">
									<b>날짜: </b> <%=item.getStartDay()%>~<%=item.getEndDay()%><br>
									<b>입장료: </b> <%=item.getAdmfee()%><br>
									<b>시간: </b> <%=item.getETime()%><br>
								</div>
								<div class="slide_infobox_btn"><a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=item.getAkind()%>&no=<%=item.getAno()%>">확인하기</a></div>
							</div>
						</li>
					<% } %>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- slide area [end] -->

<script>
	
	var paging = 1;
	window.onload = function()
	{
		//스크롤 제일 상단으로 이동
		var scroll = $(window).scrollTop(0);
		
	  	//아래에 문화 리스트 뿌려주기 
		openGallery();
	  	
	  	//key있으면 keyword 보여주기
	  	var key = getParameter("key");
	  	if(!(key == null || key == "")) {
	  		$('.keyword').css('display','block');
	  	}
		
	  	/* 슬라이드 버튼 클릭 시 슬라이드 하기 */
	  	//슬라이드에 필요한 객체 생성 및 초기화
		let btn_left  = $('.btn_left'),
			btn_right = $('.btn_right'),
			slide_list_wrap = $('.slide_list_wrap'),
			count = $('.slide_list_wrap').find('ul').find('li').length,
			now   = 0,
			left  = slide_list_wrap.find('ul').css('left').replace('px', '');

	  	//오른쪽 버튼 클릭시 실행 함수
		btn_right.click(function(){
			//alert(left);
			if(now >= 0 && now < count-1) {
				slide_list_wrap.find('ul').css('left',+left-650);
				left = +left-650;
				now++;
				
				$('.slide_radius_btnbox').find('div').removeClass('now');
				$('.slide_radius_btnbox').find('div').eq(now).addClass('now');
			}
		});
		
		//왼쪽 버튼 클릭시 실행 함수
		btn_left.click(function(){
			if(now <= count-1 && now > 0) {
				slide_list_wrap.find('ul').css('left',(+left+650));
				left = +left+650;
				now--;
				
				$('.slide_radius_btnbox').find('div').removeClass('now');
				$('.slide_radius_btnbox').find('div').eq(now).addClass('now');
			}
		});
		
		//하단 버튼 클릭시 실행 함수
		let slide_btns = $('.slide_btns');
		//console.log(slide_btns);
		slide_btns.on('click',function() {
			var index = $(this).index();
			$('.slide_radius_btnbox').find('div').removeClass('now');
			$(this).addClass('now');
			
			console.log(index);
			
			slide_list_wrap.find('ul').css('left',(index*-650));
			left = index*-650;
			now = index;
		});
		
		/* infinity */
		const a = +document.querySelector('.infinity').getBoundingClientRect().bottom;
		const infinity = document.querySelector('.infinity');
		$(document).on('mousewheel', function(){
			var bottom = infinity.getBoundingClientRect();
			
			//console.log('a => ' + a);
			//console.log('bottom => ' + bottom.bottom);
			if(bottom.bottom < a+100 && paging != -1) {
				openGallery();
			}
		});
		  
		/* ===== 브라우저가 400px 아래로 스크롤되면 투탑버튼 보여주기 ===== */
		$(window).scroll(function(){
			scroll = $(window).scrollTop();
			//console.log(scroll);
			if(scroll == 0)
			{
				$('.to_top').css('transform','translateY(140px)');
			}
			if(scroll > 400)
			{
				$('.to_top').css('transform','translateY(-140px)');
			}
		});
		
	}

	/* gallery 보여주기 */
	function openGallery() {
		$.ajax({
	        type: 'POST',
	        url: projectName+'/culture/addlist.do?paging='+paging,
	        dataType: 'html',
	        beforeSend : function(){
	        	//alert("beforeSend");
	        },
	        success: function (data) {
	        	data = data.trim();
	        	//alert(data);
	        	if(paging != -1) {
		        	if(data != '') {
	
			        	if(paging == 1) {
			    			$('.infinity').html(data);
			    			paging++;
			        	} else if(paging > 1) {
			        		$('.infinity').append(data);
			    			paging++;
			        	}
			        	
			        	if(data == '<h3>게시물이 없습니다</h3>') {
			    			$('.infinity').append(data);
			    			paging = -1;
		    			}
		    			
		        	} else {
	
		        		alert('값이 없습니다.');
		        		
		        	}
	        	}
	        },
	        error: function (request,status,error) {
	        	//alert("request="+request+",status="+status+",error="+error);
	        	//alert('오류가 발생하였습니다.');
    			$('.infinity').append('<h3>게시물이 없습니다</h3>');
    			paging = -1;
	        	return false;
	        }
	        
	    });
	}
	
	/* calendar 보여주기 */
	/*//month 파라메터 값을 가져와서 값이 있으면 캘린더 보여주기 
	function openCalendar() {
		
		$.ajax({
	        type: 'POST',
	        url: projectName+'/calendar.jsp',
	        dataType: 'html',
	        beforeSend : function(){
	        	//alert("beforeSend");
	        },
	        success: function (data) {
	        	data = data.trim();
	        	//alert(data);
	        	
	        	if(data != '') {

	    			$('#data_wrap').html(data);
	            	
	        	} else {

	        		alert('값이 없습니다.');
	        		
	        	}
	        },
	        error: function (request,status,error) {
	        	//alert("request="+request+",status="+status+",error="+error);
	        	alert('오류가 발생하였습니다.');
	        	return false;
	        }
	        
	    });
	}
	*/
	
	//북마크 버튼
	function bookmark(cno) {

		<% if(login != null) { %>
			if($('#cno_'+cno).attr('class') != "list_btn check") {
				$.ajax({
			        type: 'POST',
			        url: projectName+'/bookmarkadd.jsp?cno='+cno+"&mno=<%=login.getMno()%>",
			        dataType: 'html',
			        beforeSend : function(){
			        	//alert("beforeSend");
			        },
			        success: function (data) {
			        	data = data.trim();
			        	//alert(data);
			        	
			        	if(data == 'TRUE') {
	
			    			alert('북마크 등록이 완료되었습니다.');
			    			//alert(data);
			    			$('#cno_'+cno).toggleClass('check');
			            	
			        	} else {
	
			        		alert('오류가 발생하였습니다.');
			        		
			        	}
			        },
			        error: function (request,status,error) {
			        	//alert("request="+request+",status="+status+",error="+error);
			        	alert('오류가 발생하였습니다.');
			        	return false;
			        }
			        
			    });
			} else {
				$.ajax({
			        type: 'POST',
			        url: projectName+'/bookmarkremove.jsp?cno='+cno+"&mno=<%=login.getMno()%>",
			        dataType: 'html',
			        beforeSend : function(){
			        	//alert("beforeSend");
			        },
			        success: function (data) {
			        	data = data.trim();
			        	//alert(data);
			        	
			        	if(data == 'TRUE') {

							alert('북마크가 취소되었습니다.');
			    			$('#cno_'+cno).toggleClass('check');
			            	
			        	} else {
	
			        		alert('오류가 발생하였습니다.');
			        		
			        	}
			        },
			        error: function (request,status,error) {
			        	//alert("request="+request+",status="+status+",error="+error);
			        	alert('오류가 발생하였습니다.');
			        	return false;
			        }
			        
			    });
			}
		<%} else {%>
		alert('로그인 후 이용이 가능합니다.');
		<%}%>
	}
</script>

<div class="list_wrap wrap">
<!-- =========================================================== -->
	<!-- slide area [end] -->
	<div class="month_title">
		<div class="search_box">
			<form name="frm" method="get" action="<%=request.getContextPath()%>/culture/list.do">
				<input id="search" name="key" type="text" placeholder="이곳에 제목과 내용을 검색해 보세요">
				<input id="submit" type="submit" value="검색">
				<input name="bkind" type="hidden" value="${bkind}">
			</form>
		</div>
		<div>
			<h3 class="keyword">"<b>${key}</b>"로 검색한  <b>${kindName}</b> 결과입니다.</h3>
		</div>
		<!-- 
		<div class="view_cal_btn btn_wrap" title="이벤트 일정을 달력으로 한눈에 보기">
			<a href="javascript:openCalendar()">
				<img src="<%=request.getContextPath()%>/img/calendar_icon.png">달력으로 보기
			</a>
		</div>
		-->
	</div>
	<div id="data_wrap">
		<!-- =========================================================== -->
		<!-- ===========gallery.jsp or calendar.jsp ==================== -->
		<div class="infinity">
			<h3>잠시만 기다려주세요</h3>
		</div>
		<!-- =========================================================== -->
	</div>
<!-- =========================================================== -->
</div>
<%@ include file="./include/footer.jsp" %>