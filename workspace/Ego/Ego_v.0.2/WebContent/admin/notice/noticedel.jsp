<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%@ include file="../../include/ad_header.jsp" %>
<%
String bno  = request.getParameter("no");
String bkind = request.getParameter("kind");
tab = request.getParameter("tab");

BoardVO vo   = new BoardVO();
BoardDTO dto = new BoardDTO();

dto.Delete(bno);
%>
<script>
	alert("글 삭제가 완료되었습니다.");
	document.location = "notice.jsp?tab=4";
</script>
<%@ include file="../../include/ad_footer.jsp" %>