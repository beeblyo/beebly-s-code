<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>


<%
DBManager dbms = new DBManager();
dbms.DBOpen();

String bno = request.getParameter("no");
String kind = request.getParameter("kind");
String curpage = request.getParameter("page");
String tab = request.getParameter("tab");

String sql = "";
sql  = "delete from board ";
sql += "where b_no = " + bno;
dbms.RunSQL(sql);

%>
<script>
	alert("글이 삭제되었습니다.");
	document.location = "question.jsp?tab=5&kind=<%= kind %>";
</script>
<%
dbms.DBClose();
%>
