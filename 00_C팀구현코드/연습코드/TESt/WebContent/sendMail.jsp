<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.net.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="animal.*" %>

<%
request.setCharacterEncoding("euc-kr");  	//mysql 한글깨짐 오류 해결

String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");
String useremail = request.getParameter("useremail");

AnimalDB a = new AnimalDB();

a.DBOpen();

String sql;
sql  = "insert into user ";
sql += "(userid, userpw, useremail) values ";
sql += "('" + userid + "', md5('"+ userpw +"'), '"+ useremail +"')";
a.RunSQL(sql);


a.DBClose();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>