<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>

<%
ReplyVo rv = (ReplyVo)request.getAttribute("rv");

%>
<div class="textarea">
	<%= rv.getRnote() %>
</div>
<a href="javascript:;" onclick="modifyreply(this,<%= rv.getBno() %>,rno=<%= rv.getRno() %>);">수정</a>
<a href="/commentdelete.jsp">삭제</a>
