<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%
ReplyVo rv = (ReplyVo)request.getAttribute("rv");

%>

<script>
function replymodi_ok()
{
	alert("test");
	
	var bno   = document.replymodi2.bno.value;
	
	var rno   = document.replymodi2.rno.value;
	
	var rnote = document.replymodi2.rnote.value;
	
	var mydata;
	
	
	mydata  = "bno=" + bno;
	mydata += "&rno=" + rno;
	mydata += "&rnote=" + rnote;
	$.ajax({
		type :"post",
		url: "<%=request.getContextPath()%>/board/replyModiAction.do?"+mydata,
		datatype: "html",
		success : function(data)
		{
			alert(data);
			$("#replymodi2").parent().html(data);
			IsReplyEdit = 0;
		},
		error : function(request,status,error)
		{
			alert("error");
		}
		
	});		
	return false;
}
</script>
	<form id="replymodi2" name="replymodi2"  onsubmit="return replymodi_ok();">
		<input type="hidden" name="rno" value="<%= rv.getRno() %>">
		<input type="hidden" name="bno" value="<%= rv.getBno() %>">
		<textarea id="post" name="rnote" placeholder="댓글을 입력하세요"><%=rv.getRnote() %></textarea>
		<input type="submit" value="수정">
		<input type="button" value="취소">
	</form>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->