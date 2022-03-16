<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbconn.*"%>
<%@ page import="model.*"%>
<%
//파라미터로 값 넘겨받기
String cno    = request.getParameter("cno");    //글번호
String mno    = request.getParameter("mno");    //아이디

System.out.println(cno);
System.out.println(mno);

if(cno == null) cno = "";
if(mno == null) mno = "";

//객체생성 후 로그인 메소드를 호출해서 값을 넘긴다.
BookmarkDao bd = new BookmarkDao();
BookmarkVo  bv = new BookmarkVo();
bv.setMno(mno);
bv.setCno(cno);

int exec = bd.bookmarkInsert(bv);
if(exec != 0) { //TRUE
	
	System.out.println("TRUE");
	out.println("TRUE");
	
} else { //FALSE

	System.out.println("FALSE");
	out.println("FALSE");
	
}
%>