<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
%>
<script>
	$(document).ready(function()
	{ 
		$("#title").focus();
	})
	
	function WriteCheck()
	{
		if(document.write.title.value == "")
		{
			alert("제목을 입력하세요.");
			document.write.title.focus();
			return false;
		}
		if(document.write.note.value == "")
		{
			alert("내용을 입력하세요.");
			document.write.note.focus();
			return false;
		}
		if(confirm("작성된 게시물을 저장하시겠습니까?") !=1)
		{
			return false;
		}	
		return true;
	}
	
</script>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<main>
	<form class="question_wrap" name="write" method="post" action="writeok.jsp" onsubmit="return WriteCheck();">
		<input type="hidden" name="kind" value="Q">
		<div class="backward_wrap">
			<div class="back_btn">
				<a href="./question.jsp"></a>
			</div>
		</div>
	
		<div class="content">
			<div>
				<span>제목</span>
				<input type="text" name="title" id="title">
			</div>
			<div>
				<span>작성자</span>
				<p>에고고</p>
			</div>
			<div>
				<span>작성일</span>
				<p><%= sf.format(nowTime) %></p>
			</div>
			<textarea name="note"></textarea>
		</div>
		
		<div class="btn_wrap">
			<input class="btn" type="submit" value="글쓰기">
		</div>
	</form>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>