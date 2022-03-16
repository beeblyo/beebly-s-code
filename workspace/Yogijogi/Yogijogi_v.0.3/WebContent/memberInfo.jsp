<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<style>
a { cursor: pointer;}
</style>
<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage">	
			<div class="btn_wrap">
				<a href="<%=request.getContextPath()%>/list.jsp">뒤로</a>
			</div>

			<div class="title">
				<h2>안녕하세요 <p>[${mv.mname}]님</p></h2>
				<%if(login.getMhost().equals("Y")) {%>
				<a href="<%=request.getContextPath()%>/member/memberList.do">회원관리</a>
				<%}%>
			</div>

			<div class="ticket_wrap">
				<div class="email">
					<p>${mv.memail}</p>
					<a href="<%=request.getContextPath()%>/member/memberModify.do">회원정보</a>
					<!-- <a href="javascript:openModal('password')">회원정보</a> -->
				</div>

				<div>
					<div class="ticket_menu">
						<!-- <a id="t_title" href="javascript:show('ticket');">내 티켓목록</a> -->
						<a id="b_title" href="javascript:show('bookmark');">즐겨찾기 목록</a>
					</div>
	<!-- 
					<div class="ticket_list ticket">
						<div class="table">
							<div class="thead">
								<div class="row">
									<div class="column">번호</div>
									<div class="column">이름</div>
									<div class="column">지역</div>
									<div class="column">성인</div>
									<div class="column">어린이</div>
									<div class="column">가격</div>
									<div class="column">환불</div>
								</div>
							</div>
						
							<div class="tbody">
							<%for(int i=1; i<=3; i++) {%>
								<div class="row">
									<div class="column"><%=i%></div>
									<div class="column"><a href="javascript:openModal('ticket')" title="뮤지컬 지킬앤하이드 (Jekyll＆Hyde)">뮤지컬 지킬앤하이드 (Jekyll＆Hyde)</a></div>
									<div class="column">완주</div>
									<div class="column">2</div>
									<div class="column">1</div>
									<div class="column">56,000</div>
									<div class="column"><a class="btn" href="javascript:openModal('refund')">환불신청</a></div>
								</div>
							<%}%>
							</div>
						</div>
					</div>
 -->
					<div class="ticket_list bookmark">
						<div class="table">
							<div class="thead">
								<div class="row">
									<div class="column">번호</div>
									<div class="column">이름</div>
									<div class="column">장소</div>
									<div class="column">기간</div>
									<div class="column">삭제</div>
								</div>
							</div>

							<div class="tbody">
							<%
							ArrayList<BookmarkVo> bookmark = (ArrayList<BookmarkVo>)session.getAttribute("bookmark");
							if(bookmark.size() != 0) {
								int size = bookmark.size();
								for(BookmarkVo bv : bookmark) {%>
									<div class="row">
										<div class="column"><%=size--%></div>
										<div class="column"><a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=bv.getCkind()%>&no=<%=bv.getCno()%>" title="<%=bv.getCsubject()%>"><%=bv.getCsubject()%></a></div>
										<div class="column"><%=bv.getCplace()%></div>
										<div class="column"><%=bv.getCstartDay()%> ~ <%=bv.getCendDay()%></div>
										<div class="column"><a class="btn" href="javascript:openModal(<%=bv.getCno()%>,'bookmark')">삭제</a></div>
									</div>
								<%}
							} else {%>
								<div class="row">
									북마크가 없습니다.
								</div>
							<%}%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="modal_wrap" class="modal_wrap">
	<div id="refund" class="modal">
		<div class="text">
			<p>빛의 소리축제 티켓을 환불처리 하시겠습니까?</p>
			<small>*(전시)일 당일 및 하루 전에는 환불이 불가능 합니다</small>
		</div>

		<div class="btn_wrap">
			<a class="btn" href="javascript:closeModal('refund')">취소</a>
			<a class="btn" href="javascript:closeModal('refund')">환불</a>
		</div>
	</div>

	<!-- 
	<div id="password" class="modal">
		<form id="myForm" name="pwcheck" method="post" action="<%=request.getContextPath()%>/member/memberModify.do" onsubmit="return FormCheck('pwcheck');">
			<div class="text">
				<p>비밀번호를 입력하세요</p>
				<input id="mpw" type="password" name="mpw">
			</div>

			<div class="btn_wrap">
				<a class="btn" href="javascript:closeModal('password')">취소</a>
				<input class="btn" type="submit" value="확인">
			</div>
		</form>
	</div>
	-->
	
	<div id="bookmark" class="modal">
		<div class="text">
			<p>북마크를 삭제하시겠습니까?</p>
			<p class="cno" style="display: none;"></p>
		</div>

		<div class="btn_wrap">
			<a class="btn" href="javascript:closeModal('bookmark')">취소</a>
			<a class="btn" href="javascript:bookmark('bookmark')">삭제</a>
		</div>
	</div>
	
	<div id="ticket" class="modal">
		<div>
			<span class="point">[</span> 소리와 빛의 <span class="point">]</span>
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
			<div class="btn2" onclick="closeModal('ticket')">닫기</div>
			<div class="btn2">이미지로 저장</div>
			<div class="btn2">이메일로 전송</div>
		</div>
	</div>
	
	
</div>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<script>
	function closeModal() {

		let modal_wrap = document.getElementById("modal_wrap");
		let modal_id   = ["ticket","bookmark","refund"];
		let modal = "";

		modal_wrap.style.display = "none";
		modal_wrap.style.display = "none";
		for(i=0; i<modal_id.length; i++)
		{
			modal = document.getElementById(modal_id[i]);
			modal.style.display      = "none";
		}

	}

	function openModal(cno,obj) {

		let modal_wrap = document.getElementById("modal_wrap");
		let modal      = document.getElementById(obj);
		
		modal_wrap.style.display = "block";
		modal.style.display      = "block";
		$('.cno').html(cno);

	}
	
	//북마크 버튼
	function bookmark() {
		let cno = $('.cno').html();
		//alert(cno);
		
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
					closeModal();
					location.reload();
	            	
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
	
	window.onload = function()
	{
		$(".ticket_list").css("display","block");
		$(".bookmark").css("display","block");
	}
	/*
	function show(menu) {
		if(menu == "ticket") {
			$(".ticket").css("display","block");
			$(".bookmark").css("display","none");
			$("#t_title").css("border-bottom","3px solid #11273f");
			$("#b_title").css("border-bottom","none");
		} else {
			$(".ticket").css("display","none");
			$(".bookmark").css("display","block");
			$("#t_title").css("border-bottom","none");
			$("#b_title").css("border-bottom","3px solid #11273f");
		} 
	}
	*/
</script>
<%@ include file="./include/footer.jsp" %>