<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();

Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

request.setCharacterEncoding("euc-kr");

String anote   = request.getParameter("anote");
String bno     = request.getParameter("no");
String tab     = request.getParameter("tab");

System.out.println(bno);
System.out.println(anote);

System.out.println( sf.format(nowTime) );

String sql = "";
sql += "update board "; 
sql += "set b_ansnote = '" + anote.replace("'","''") + "' , ";
sql += "b_ansdate = '" + sf.format(nowTime) + "' ";
sql += "where b_no = '" + bno + "' ";
dbms.RunSQL(sql);

//response.sendRedirect("view.jsp?no=" + bno);
%>
<%= anote %>
[ <a href="javascript:;" onclick="modifyansnote(this,<%= bno %>);">????</a> ] &nbsp;|&nbsp;
 <a href="ansnotedel.jsp?no=<%= bno %>">????</a> ]
<%
dbms.DBClose();
%>
