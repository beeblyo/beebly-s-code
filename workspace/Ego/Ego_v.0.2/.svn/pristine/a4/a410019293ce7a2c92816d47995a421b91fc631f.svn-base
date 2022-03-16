<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>
<%
DBManager dbms  = new DBManager();
dbms.DBOpen();

String cno = request.getParameter("cno");

String sql ="";

sql = "select t_no,c_note from comment where c_no = " + cno + " ";
dbms.OpenQuery(sql);
dbms.GetNext();
String tno = dbms.GetValue("t_no");
String cnote = dbms.GetValue("c_note");
dbms.CloseQuery();
%>
<form id="commentmodi" name="commentmodi" method="post" action="commentmodiok.jsp">
	<input type="hidden" id="no" name="no" value="<%= tno %>">
	<input type="hidden" id="cno" name="cno" value="<%= cno %>">
	<textarea id="cnote" name="cnote"><%= cnote %></textarea>
	<input type="button" onclick="commentmodi_ok();" value="수정완료">
</form>   
<%
dbms.DBClose();
%>
