<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="login_wrap">
			<h2>로그인</h2>
			<form id="myForm" name="login" method="post" action="<%=request.getContextPath()%>/member/loginAction.do" onsubmit="return FormCheck('login');">
				<div>
					<span>아이디</span> <input id="mid" type="text" name="mid">
				</div>
				<div>
					<span>비밀번호</span> <input id="mpw" type="password" name="mpw">
				</div>
				<div class="btn_wrap">
					<input class="btn" type="submit" value="로그인">
				</div>
			</form>
			<form style="display: none" id="login" name="login" method="post" action="<%=request.getContextPath()%>/member/loginAction.do">
				<input id="mid" type="text" name="mid"><span>비밀번호</span>
				<input id="mpw" type="password" name="mpw">
			</form>
			<div class="btn_wrap">
				<a href="<%=request.getContextPath()%>/member/join.do">회원가입</a><br>
				<a href="javascript:alert('준비중입니다.');">비밀번호를 잊으셨나요?</a>
			</div>
		</div>
	</div>
	
	<script>
		/*로고 하얀색으로 바꾸기*/
		var logo = document.querySelector(".logo img");
		logo.setAttribute("src","<%=request.getContextPath()%>/img/logo_white_color.png");
	
		var message = "${retire}";
		if(message != "") alert(message);
		<%session.removeAttribute("retire");%>
	</script>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>