<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/login.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="login_wrap">
			<h2>로그인</h2>
			<form name="login" method="post" action="loginok.jsp">
				<div>
					<span>아이디</span> <input type="text" name="id">
				</div>
				<div>
					<span>비밀번호</span> <input type="password" name="pw">
				</div>
				<div class="btn_wrap">
					<input class="btn" type="submit" value="로그인">
				</div>
			</form>
			<div class="btn_wrap">
				<a href="./join.jsp">회원가입</a><br>
				<a href="">비밀번호를 잊으셨나요?</a>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>