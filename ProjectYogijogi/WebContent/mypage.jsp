<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage">	
			<div class="title">
				<h2>안녕하세요 [홍길동]님</h2>
			</div>

			<div>
				<div class="email">
					<p>gjekdmlwl@naver.com</p>
					<a href="javascript:openModal('password')">회원정보</a>
				</div>

				<div class="ticket">
					<div class="ticket_menu">
						<a href="">내 티켓목록</a>
						<a href="">즐겨찾기 목록</a>
					</div>

					<div class="ticket_list">
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
									<div class="column"><a href="" title="뮤지컬 지킬앤하이드 (Jekyll＆Hyde)">뮤지컬 지킬앤하이드 (Jekyll＆Hyde)</a></div>
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

					<div class="ticket_list bookmark">
						<div class="table">
							<div class="thead">
								<div class="row">
									<div class="column">번호</div>
									<div class="column">이름</div>
									<div class="column">지역</div>
									<div class="column">기간</div>
								</div>
							</div>

							<div class="tbody">
							<%for(int i=1; i<=3; i++) {%>
								<div class="row">
									<div class="column"><%=i%></div>
									<div class="column"><a href="" title="산속 여우빛 축제">산속 여우빛 축제</a></div>
									<div class="column">완주</div>
									<div class="column">2021-01-01 ~ 2021-02-01</div>
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

	<div id="password" class="modal">
		<form name="pwcheck" method="post" action="info.jsp">
			<div class="text">
				<p>비밀번호를 입력하세요</p>
				<input type="password" name="pw">
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

	}
</script>
<%@ include file="./include/footer.jsp" %>