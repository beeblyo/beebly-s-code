<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>

<%
DBManager dbms = new DBManager();
dbms.DBOpen();

String bno = request.getParameter("no");
String tab = request.getParameter("tab");

String sql = "select b_ansnote from board where b_no = " + bno + " ";
dbms.OpenQuery(sql);
dbms.GetNext();
String b_no = dbms.GetValue("bno");
String anote = dbms.GetValue("b_ansnote");
dbms.CloseQuery();
%>
<form id="ansnotemodi" name="ansnotemodi" method="post" action="ansnotemodiok.jsp">
	<input type="hidden" name="tab" value="5">
	<input type="hidden" id="no" name="no" value="<%= bno %>">
	<textarea id="anote" name="anote"><%= anote %></textarea>
	<input type="button" onclick="ansnotemodi_ok();" value="수정완료">
</form>

