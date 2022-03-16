<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%@ include file="../../include/ad_header.jsp" %>

<%
request.setCharacterEncoding("euc-kr");

String bno = request.getParameter("no");
BoardDTO dto = new BoardDTO();
BoardVO vo = dto.Read(bno);

String btitle = request.getParameter("title"); 
String bnote  = request.getParameter("note"); 
tab  = request.getParameter("tab"); 

vo.setTitle(btitle);
vo.setNote(bnote);

dto.Update(vo);
%>
<script>
	alert("글 수정이 완료되었습니다.");
	document.location = "view.jsp?tab=4&kind=N&no=<%= vo.getNo() %>";
</script>
<%@ include file="../../include/ad_footer.jsp" %>