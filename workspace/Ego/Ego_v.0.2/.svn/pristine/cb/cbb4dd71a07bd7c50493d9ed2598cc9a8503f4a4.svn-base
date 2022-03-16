<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>


<%
DBManager dbms = new DBManager();
dbms.DBOpen();

String bno = request.getParameter("no");
String anote = request.getParameter("anote");

String sql = "";
sql = "update board set b_ansnote= null where b_no= " + bno;
dbms.RunSQL(sql);

response.sendRedirect("view.jsp?tab=5&no=" + bno);

dbms.DBClose();
%>
