<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage info">	
			<div class="title">
				<h2>안녕하세요 [홍길동]님</h2>
			</div>

			<div>
				<form id="myForm" name="info" method="post" action="mypage.jsp" onsubmit="return FormCheck('info');">
					<p><span>이름</span><input class="readonly" type="text" name="mname" value="홍길동" readonly="readonly"></p>
					<p><span>전화번호</span><input class="readonly" type="text" name="mphone" value="010-0000-0000" readonly="readonly"></p>
					<p><span>이메일</span><input id="memail" type="email" name="memail" value="ezen@naver.com"><button onclick="return FormCheck('reemail')">인증</button></p>
					<p><span>아이디</span><input class="readonly" type="text" name="mid" value="ezen" readonly="readonly"></p>
					<p><span>비밀번호</span><input id="mpw" type="password" name="mpw"></p>
					<p><span>비밀번호확인</span><input id="mpwcheck" type="password" name="pwcheck"></p>

					<div class="btn_wrap">
						<input class="btn" type="button" onclick="window.location ='mypage.jsp'" value="취소">
						<input class="btn" type="submit" value="저장">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="./include/footer.jsp" %>