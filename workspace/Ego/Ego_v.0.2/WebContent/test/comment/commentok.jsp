<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/header.jsp" %>
<%
String bno    = request.getParameter("no");
String cnote = request.getParameter("note");
String folder = request.getParameter("folder");

CommentVO vo   = new CommentVO();
CommentDTO dto = new CommentDTO();

vo.setT_no(bno);
vo.setC_uno(login.getNo());
vo.setCnote(cnote);
dto.Insert(vo);
%>
<script>
	alert("???? ?ۼ? ?Ϸ?");
	document.location = "/Ego_v.0.2//test/start.jsp?no=<%= bno %>&folder=<%= folder %> ";
</script>