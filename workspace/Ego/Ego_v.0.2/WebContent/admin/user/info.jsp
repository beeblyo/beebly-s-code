<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>
<%
String no = request.getParameter("no");

UserVO vo = null;
UserDTO dto = new UserDTO();
vo = dto.Read(no);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ego [회원 정보]</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- 공통 스타일 		-->
		<link href="/Ego_v.0.2/css/admin.css" rel="stylesheet">       <!-- admin 스타일	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- 제이쿼리 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer"></script> <!-- 공통 스트립트 		-->
	</head>
	<body>
		<div class="info">
			<div class="profile">
				<div class="img"><img src="../../img/placeholder/profile.jpg"></div>
				<button class="sec_btn">회원 삭제</button>
			</div>
			<div class="detail">
				<p><span>이메일</span><%=vo.getId()%>@<%=vo.getEmail()%></p>
				<p><span>닉네임</span><%=vo.getNickname()%></p>
				<p><span>성별</span><%=vo.getGenderName()%></p>
				<p><span>생년월일</span><%=vo.getBdate()%></p>
			</div>
			<div class="keyword">
				<div>
					<p>키워드</p>
					<p>착한</p>
				</div>
				<div>
					<p>mbti</p>
					<p><%=vo.getMbti()%></p>
				</div>
			</div>
			<div class="btn_wrap">
				<button class="close_btn btn" onclick="window.close();">닫기</button>
			</div>
		</div>
	</body>
</html>