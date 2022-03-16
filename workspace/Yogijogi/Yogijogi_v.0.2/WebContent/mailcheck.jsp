<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ page import="model.*"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%
MemberDao md = new MemberDao();
String mid = (String)session.getAttribute("mid");
String code = null;

if(request.getParameter("code") != null)
{
	   code = request.getParameter("code");

	String userEmail = md.getUserEmail(mid);
	if(userEmail.equals(code))
	{
		   login = md.setUserEmailChecked(mid);
		   session.setAttribute("login", login);
	%>
	<div class="wrap">
		<div class="login_wrap">
			<h2>이메일 인증 완료</h2>
			<p>이메일 인증이 완료되었습니다.<br>로그인 해주세요.</p>
			<div class="mail_send">
				<img src="./img/mailcheck.png" alt="메일 인증 성공 이미지">
				
				<div class="btn_wrap">
					<a class="btn" href="<%=request.getContextPath()%>/member/login.do">로그인하기</a>
				</div>
			</div>
		</div>
	</div>
	<%}
}else {%>
	<div class="wrap">
		<div class="login_wrap">
			<h2>이메일 인증 실패</h2>
			<p>이메일 인증이 실패되었습니다.<br>다시 가입을 시도해주세요.</p>
			<div class="mail_send">
				<img src="./img/opps.png" style="width: 100%;" alt="메일 인증 실패 이미지">
				
				<div class="btn_wrap">
					<a class="btn" href="./index.jsp">메인으로</a>
				</div>
			</div>
		</div>
	</div>
<%}%>
<script>
/*로고 하얀색으로 바꾸기*/
var logo = document.querySelector(".logo img");
logo.setAttribute("src","<%=request.getContextPath()%>/img/logo_white_color.png");

</script>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>