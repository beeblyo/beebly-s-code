<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

request.setCharacterEncoding("euc-kr");

String anote   = request.getParameter("anote");
String bno     = request.getParameter("no");
String curpage = request.getParameter("page");
String kind    = request.getParameter("kind");


System.out.println(bno);
System.out.println(anote);
System.out.println(curpage);
System.out.println(kind);
System.out.println( sf.format(nowTime) );

String sql = "";
sql += "update board "; 
sql += "set b_ansnote = '" + anote.replace("'","''") + "' , ";
sql += "b_ansdate = '" + sf.format(nowTime) + "' ";
sql += "where b_no = '" + bno + "' ";
dbms.RunSQL(sql);

response.sendRedirect("view.jsp?tab=5&no=" + bno);
%>

<%@ include file="../../include/footer.jsp" %>
