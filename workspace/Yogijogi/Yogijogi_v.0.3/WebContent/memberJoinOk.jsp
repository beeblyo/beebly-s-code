<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbconn.*"%>
<%@ page import="model.*"%>
<%
//파라미터로 값 넘겨받기
String mid    = request.getParameter("mid");    //아이디
String memail = request.getParameter("memail"); //이메일
String first  = request.getParameter("first");  //번호 앞자리
String middle = request.getParameter("middle"); //번호 중간자리
String last   = request.getParameter("last");   //번호 뒷자리

System.out.println(mid);
System.out.println(memail);

if(mid == null) mid = "";
if(memail == null) memail = "";

//객체생성 후 로그인 메소드를 호출해서 값을 넘긴다.
MemberDao md = new MemberDao();
int duplicate = 0;
if(!mid.equals("")) duplicate = md.IsDuplicate(mid);
else if(!memail.equals("")) duplicate = md.IsDuplicate1(memail);
else if(first.equals("") && middle.equals("") && last.equals("")) {
	duplicate = md.IsDuplicate2(first+"-"+middle+"-"+last);
}

if(duplicate == 0) { //ID_ERROR
	
	System.out.println("FALSE");
	out.println("FALSE");
	
} else if (duplicate == 1) { //DUPLICATE
	
	System.out.println("FALSE");
	out.println("FALSE");
	
} else { // NOT_DUPLICATE
	
	System.out.println("TRUE");
	out.println("TRUE");
	
}
%>