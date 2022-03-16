<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String ans = (String)request.getSession().getAttribute("sign");
	out.print(ans);
%>