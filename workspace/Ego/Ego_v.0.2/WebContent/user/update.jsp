<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="ego.dbms.DBManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/config.jsp" %>
<%
//============= 매개변수 분석 처리 [ 시작 ] ==
UserVO login     = (UserVO)session.getAttribute("login");
String pw        = request.getParameter("pw");
String nickname  = request.getParameter("nickname");
String keyword   = request.getParameter("keyword"); //관심분야
String mbti      = request.getParameter("mbti");

UserDTO dto = new UserDTO();
if(!(pw == null || pw.equals(""))) login.setPw(pw);
if(!(nickname == null || nickname.equals(""))) login.setNickname(nickname);
if(!(keyword == null || keyword.equals(""))) login.setKeyword(keyword);
if(!(mbti == null || mbti.equals(""))) login.setMbti(mbti);


if(!dto.update(login)) out.print("FALSE");
else out.print("TRUE");
%>