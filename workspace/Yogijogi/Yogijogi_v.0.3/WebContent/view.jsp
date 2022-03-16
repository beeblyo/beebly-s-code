<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="api.*"%>
<%@ include file="./include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/modal1.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/modal2.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/view.css">
<%
ApiVo vo = (ApiVo)session.getAttribute("vo");
BookmarkDao dao = new BookmarkDao();

if(vo != null) {
%>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=240b5b6307cd2b4aa1bf954d5605f336"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1962d42f0614125fc184134cdfbe67cf"></script>
<script>
function ShowModal()
{
	/**뷰화면 숨기기**/
	$('.wrap').css('display','none');
	/**모달2 숨기기**/
	$('.wrap4').css('display','none');
	$('.overlay2').css('display','none');
	/**모달1 보이기**/
	$('.overlay').css('display','block');
	$('.wrap3').css('display','block');
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}

function ShowModal2()
{
	/**모달2 보이기**/
	$('.wrap4').css('display','block');
	$('.overlay2').css('display','block');
	/**모달1 숨기기**/
	$('.overlay').css('display','none');
	$('.wrap3').css('display','none');	
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}

function CloseModal()
{
	/**뷰화면 보이기**/
	$('.wrap').css('display','block');
	/**모달2 숨기기**/
	$('.wrap4').css('display','none');
	$('.overlay2').css('display','none');
	/**모달1 숨기기**/
	$('.overlay').css('display','none');
	$('.wrap3').css('display','none');	
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': '', 'height': ''});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}
</script>

<!--------------------------------- 모달1 --------------------------------------->
<div class="overlay">
		</div>
			<div class="wrap3 modal" id="modal">
			<span class=modal1_join>참여하기</span>
				<div class="one">
					<div>S석</div>
					<div>
						<input type="text" size="20">
					</div>
					<div class="btn1 plus">+</div>
					<div class="btn1 minus">-</div>
					<div class="ticket_count">(0/200)</div>
				</div>
				<div class="two">
					<div>A석</div>
					<div>
						<input type="text" size="20">
					</div>
					<div class="btn1 plus">+</div>
					<div class="btn1 minus">-</div>
					<div class="ticket_count">(0/200)</div>
				</div>
				<div class="three">
					<div>합계</div>
					<div>
						8000
					</div>
					<div>원</div>
				</div>
				<div class="btn_box1">
					<div class="btn1" onclick="CloseModal()">취소</div>
					<div class="btn1 get_ticket" onclick="ShowModal2()">예매하기</div>
				</div>
				<div class="bottom">
					<div>티켓 구입시 안내<hr> 티켓은 공연 하루전 환불 신청이 불가합니다<br> 티켓 환불은 내정보에서 신청할 수 있습니다</div>
				</div>
			</div>

<!--------------------------------- 모달2 --------------------------------------->

<div class="overlay2"></div>
	<div class="wrap4">
		<div><span class="point">
			[</span> 소리와 빛의 <span class="point">]</span>
			<br>축제 티켓
		</div>
		<div class="ticket_box">
			<div>티켓 번호<br>63</div>
			<div>바코드 번호</div>
		</div>
		<div>
			화면에 보이는 티켓을 저장해 <br>안내 직원에게 보여주세요<br>
			고객 문의 000)000-0000
		</div>
		<div class="btn_box2">
			<div class="btn2" onclick="CloseModal()">닫기</div>
			<div class="btn2">이미지로 저장</div>
			<div class="btn2">이메일로 전송</div>
		</div>
	</div>


<!--------------------------------- 뷰화면 --------------------------------------->

	
	<div class="wrap">
	
		<div class="forcenter">	
			<div>
				<span class="back_btn"><a href="<%=request.getContextPath()%>/culture/list.do?bkind=<%=vo.getAkind()%>">< 뒤로가기</a></span>
				<a href="<%=request.getContextPath()%>/culture/list.do?bkind=<%=vo.getAkind()%>" class="nav_tag"><%=vo.getAkindName()%></a> >
				<a href="<%=request.getContextPath()%>/culture/list.do?bkind=<%=vo.getAkind()%>" class="nav_tag"><%=vo.getStartDay().split("-")[1] %>월</a> >
				<a href="#" class="nav_tag atag_now"><%= vo.getSubject() %></a>
			</div>
			<div class="info_box">
				<div class="view_image"  style="background:url('<%=request.getContextPath()%>/img/thum_<%=vo.getAkind()%>.jpg') no-repeat center; background-size: cover;"></div>			
				<div>
					<div class="title"><%= vo.getSubject() %></div>
					<div class="adress">
						<!--
						<span class="grayblock">도로명</span>&nbsp;전주시 뭐뭐구 뭐뭐동 뭐1길 00-0<br>
						<span class="grayblock">지 번</span>&nbsp;전라북도 전주시 완산구 뭐뭐길 뭐뭐동 뭐뭐00-0
						-->
						<span class="grayblock">장 소</span>&nbsp;<%= vo.getPlace() %>
					</div>
					<div><span class="grayblock">기간</span>&nbsp;<%= vo.getStartDay() %> ~ <%= vo.getEndDay() %></div>
					<div><span class="grayblock">시간</span>&nbsp;<%= vo.getETime() %></div>
					<div><span class="grayblock">입장료</span>&nbsp;<%= vo.getAdmfee() %></div>
					<div class="whoopen"><span class="grayblock">주최</span>&nbsp;<%= vo.getHostName() %></div>
					<div>
						<span class="grayblock">홈페이지</span>
						<a class="whowebsite" href="<%= vo.getUrl() %>" target="_blank">&nbsp;<u><%=vo.getUrl()%></u>&nbsp;</a>
					</div>
					<div><span class="grayblock">전화번호</span>&nbsp;<%= vo.getMngTel() %></div>
					<div class="btn_box">
					<!-- <div onclick="ShowModal()">예매하기</div> -->
					<div title="해당 콘텐츠는 예매 서비스가 제공되지 않습니다">예매하기</div>
					<div id="clip">공유</div>
					<div <%if(login!=null && dao.bookmarkIs(login.getMno(), vo.getAno())!=0){%>class="check"<%}%>" onclick="bookmark(this,'<%= vo.getAno() %>')">북마크</div>
				</div>	
				</div>			
			</div>
			<div class="moreinfo" style="color:#8B8B8B">
				<span class="moreinfo_title">소개</span>
				<div class="specific_info">
				<%
				if(!(vo.getContent().trim().equals("") || vo.getContent() == null)) {
					%><%=vo.getContent()%><%
				} else {
					%>소개 내용이 없습니다.<%
				}
				%>
				</div>
				<span class="moreinfo_title">오시는길</span>
				<!-- map start -->
				<div id="map" style="    height: 400px;">
    				
				</div>
				<!-- map end -->
				
			</div>
			<div>
				<span class="grayblock data">공공데이터</span>
				<img class="license_img" src="<%=request.getContextPath()%>/img/license1.png">
				<img class="license_img" src="<%=request.getContextPath()%>/img/license2.png"></div>	
			</div>
		</div>
		
		<script>
			// jjezen.cafe24.com
			var container = document.getElementById('map');
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(<%=vo.getLatitude()%>, <%=vo.getLongitude()%>), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			var markerPosition  = new kakao.maps.LatLng(<%=vo.getLatitude()%>, <%=vo.getLongitude()%>); 
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
	
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null); 
			
			
			window.onload = function () {
				//링크 복사
				$("#clip").on('click',function() {
					var url = '';
					var textarea = document.createElement("textarea");
					document.body.appendChild(textarea);
					url = window.document.location.href;
					textarea.value = url;
					textarea.select();
					document.execCommand("copy");
					document.body.removeChild(textarea);
					alert("URL이 복사되었습니다.");
				});
			}
			
			//북마크 버튼
			function bookmark(obj,cno) {

				<% if(login != null) { %>
					if($(obj).attr('class') != "check") {
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
					    			$(obj).toggleClass('check');
					            	
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
					    			$(obj).toggleClass('check');
					            	
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
<%
} else {
	%>
	<div class="wrap">
		<div class="error">
			<h2>없는 게시물입니다.</h2>
			<a class="btn" href="<%=request.getContextPath()%>/">메인으로</a>
		</div>
	</div>
	<%
}
%>
<%@ include file="./include/footer.jsp" %>