<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dto.*" %>
<%@ page import="ego.vo.*" %> 
<%
//============= 매개변수 분석 처리 [ 시작 ] ==
request.setCharacterEncoding("euc-kr");

String uid  = request.getParameter("id");     //아이디
String upw  = request.getParameter("pw");     //비번
//============= 매개변수 분석 처리 [ 종료 ] ==

UserDTO dto = new UserDTO();
UserVO loginVO = dto.Login(uid, upw);
if( loginVO != null)
{
	//로그인 성공
	session.setAttribute("login", loginVO);
	out.print("TRUE");
}else
{
	//로그인 실패
	out.print("FALSE");
}
%>
