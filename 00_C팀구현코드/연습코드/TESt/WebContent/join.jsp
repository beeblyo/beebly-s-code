<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String Board_Memo = request.getParameter("txtContent");
String id = request.getParameter("id");

System.out.println("����:" + Board_Memo);
System.out.println("���̵�:" + id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form id="ss" name="ss" method="post" action="joinok.jsp">
<img src="sign.jsp">
<input type="text" name="aa" id="aa">
<input type="submit" value="����" >
</form>
</body>
</html>