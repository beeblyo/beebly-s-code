<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/header.jsp" %>
<%
String tno  = request.getParameter("no");
String cno = request.getParameter("cno");
String folder= request.getParameter("folder");

sql  = "delete from comment ";
sql += "where t_no = " + tno + " and c_no = " + cno;
dbms.RunSQL(sql);

response.sendRedirect("../start.jsp?no=" + tno + "&folder=" + folder);
%>
<%@ include file="../../include/footer.jsp" %>