<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.removeAttribute("login");
%>
<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	document.location = "login.jsp";
</script>