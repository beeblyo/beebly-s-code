<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbconn.*"%>
<%@ page import="model.*"%>
<%
//파라미터로 값 넘겨받기
String mno = request.getParameter("mno");
int int_mno = 0;
if(mno != null || !mno.equals("")) int_mno = Integer.parseInt(mno); 

System.out.println(mno);

//객체생성 후 로그인 메소드를 호출해서 값을 넘긴다.
MemberDao md = new MemberDao();
int rerult = md.retireMember(int_mno);

if(rerult != 0) {
	System.out.println("TRUE");
	out.println("TRUE");
} else {
	System.out.println("FALSE");
	out.println("FALSE");
}
%>