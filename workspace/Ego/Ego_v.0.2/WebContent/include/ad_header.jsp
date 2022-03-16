<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%@ include file="../config/config.jsp" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();
request.setCharacterEncoding("euc-kr");
UserVO login = (UserVO)session.getAttribute("login");
String host = request.getParameter("u_host");
String tab = request.getParameter("tab");
if(tab == null) tab = "0";

if( login == null )
{
	%>
	<script>
	 alert("권한 없음");
	 document.location = "/Ego_v.0.2/admin/login.jsp";
	</script>
	<%
	return;
}
if( !login.getHost().equals("Y"))
{
	%>
	<script>
	 alert("권한 없음");
	 document.location = "/Ego_v.0.2/admin/login.jsp";
	</script>
	<%
	return;
}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ego [관리자 페이지]</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- 공통 스타일 		-->
		<link href="/Ego_v.0.2/css/admin.css" rel="stylesheet">       <!-- admin 스타일	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- 제이쿼리 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer"></script> <!-- 공통 스트립트 		-->
	</head>
	
	<body>
		<header>
			<h1>
				<a class="w_logo" href="/Ego_v.0.2/admin/admin.jsp"></a>
			</h1>
			<p>[<%=login.getNickname() %>]님</p>
			<nav>
				<ul>
					<li><a href="/Ego_v.0.2/admin/user/user.jsp?tab=1" <%if(tab.equals("1")){%>class="now"<%}%>>회원</a></li>
					<li><a href="/Ego_v.0.2/admin/test/test.jsp?tab=2" <%if(tab.equals("2")){%>class="now"<%}%>>테스트</a></li>
					<li><a href="/Ego_v.0.2/admin/category/category.jsp?tab=3" <%if(tab.equals("3")){%>class="now"<%}%>>카테고리</a></li>
					<li><a href="/Ego_v.0.2/admin/notice/notice.jsp?tab=4&kind=N" <%if(tab.equals("4")){%>class="now"<%}%>>공지사항</a></li>
					<li><a href="/Ego_v.0.2/admin/qna/question.jsp?tab=5&kind=Q" <%if(tab.equals("5")){%>class="now"<%}%>>문의</a></li>
				</ul>
			</nav>
			
			<a class="logout" href="/Ego_v.0.2/admin/logout.jsp">로그아웃</a>
		</header>