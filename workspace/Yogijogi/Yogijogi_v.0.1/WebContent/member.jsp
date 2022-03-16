<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage member">
			<div class="btn_wrap">
				<a href="mypage.jsp">뒤로</a>
			</div>

			<div class="title">
				<h2>회원관리</h2>
			</div>

			<div>
				<div class="memver_search">
					<form id="myform" name="member" method="post" action="member.jsp" onsubmit="return FormCheck('shearch');">
						<select name="filter">
							<option value="mno">번호</option>
							<option value="mid">아이디</option>
							<option value="mname">이름</option>
						</select>
						<input type="text" name="key">
						<input type="submit" value="검색">
					</form>
				</div>

				<div class="member_list">
					<div class="table">
						<div class="thead">
							<div class="row">
								<div class="column">번호</div>
								<div class="column">아이디</div>
								<div class="column">이름</div>
								<div class="column">이메일</div>
								<div class="column">상태</div>
								<div class="column">수정</div>
							</div>
						</div>

						<div class="tbody">
						<%for(int i=1; i<=5; i++) {%>
							<div class="row">
								<div class="column"><%=i%></div>
								<div class="column"><a href="">hong<%=i%></a></div>
								<div class="column">홍길동</div>
								<div class="column">hong<%=i%>@naver.com</div>
								<div class="column">회원</div>
								<div class="column"><a href="javascript:openModal('refund')">삭제</a></div>
							</div>
						<%}%>
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

	<div id="password" class="modal">
		<form id="myForm" name="pwcheck" method="post" action="info.jsp" onsubmit="return FormCheck('pwcheck');">
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
</div>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<script>
	function closeModal(obj) {

		let modal_wrap = document.getElementById("modal_wrap");
		let modal      = document.getElementById(obj);
		modal_wrap.style.display = "none";
		modal.style.display      = "none";

	}

	function openModal(obj) {

		let modal_wrap = document.getElementById("modal_wrap");
		let modal      = document.getElementById(obj);
		modal_wrap.style.display = "block";
		modal.style.display      = "block";
		$('#mpw').focus();

	}
</script>
<%@ include file="./include/footer.jsp" %>