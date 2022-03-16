<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbconn.*"%>
<%@ page import="model.*"%>
<%
//파라미터로 값 넘겨받기
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");

System.out.println(mid);
System.out.println(mpw);

//객체생성 후 로그인 메소드를 호출해서 값을 넘긴다.
MemberDao md = new MemberDao();
MemberVo  mv = md.loginMember(mid, mpw);

if(mv != null) {
	//리턴값 받은 회원 정보 값을 세션에 담는다.
	session.setAttribute("login", mv);

	System.out.println("TRUE");
	out.println("TRUE");
} else {
	System.out.println("FALSE");
	out.println("FALSE");
}
%>