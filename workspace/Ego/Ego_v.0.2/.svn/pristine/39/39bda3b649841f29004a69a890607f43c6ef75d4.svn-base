<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="ego.dbms.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/config.jsp" %>
<%
UserVO login = (UserVO)session.getAttribute("login");
String pw = request.getParameter("pw");

//out.print(pw);
UserDTO dto = new UserDTO();

UserVO user = dto.pwCheck(login.getId(),pw);
if(user == null) out.print("FALSE");
else out.print("TRUE");
%>