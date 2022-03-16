<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="login_wrap">
		<h2>이메일 전송 완료</h2>
		<p>입력하신 이메일로 링크를 발송하였습니다.<br>발송된 이메일의 링크를 클릭하시면 회원가입이 완료됩니다.</p>
		<div class="mail_send">
			<img src="./img/mailsend.png" alt="메일 전송 이미지">
			
			<div class="btn_wrap">
				<a class="btn" href="index.jsp">메인으로</a>
			</div>
		</div>
	</div>
</div>

<script>
/*로고 하얀색으로 바꾸기*/
var logo = document.querySelector(".logo img");
logo.setAttribute("src","<%=request.getContextPath()%>/img/logo_white_color.png");

</script>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>