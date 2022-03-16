<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>
<%
String tno = request.getParameter("no");
String cnote =request.getParameter("cnote");
String cno = request.getParameter("cno");

CommentVO vo = new CommentVO();
CommentDTO dto = new CommentDTO();

vo.setT_no(tno);
vo.setCnote(cnote);
vo.setCno(cno);

dto.Update(vo);

%>
	<p><%= cnote %></p>
	<a href="javascript:;" onclick="modifycomment(this,<%= tno %>,cno=<%= vo.getCno() %>);">수정</a>
	<a href="comment/commentdel.jsp?no=<%= tno %>&cno=<%= vo.getCno() %>">삭제</a>
