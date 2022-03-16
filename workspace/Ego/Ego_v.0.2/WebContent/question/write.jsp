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
			alert("������ �Է��ϼ���.");
			document.write.title.focus();
			return false;
		}
		if(document.write.note.value == "")
		{
			alert("������ �Է��ϼ���.");
			document.write.note.focus();
			return false;
		}
		if(confirm("�ۼ��� �Խù��� �����Ͻðڽ��ϱ�?") !=1)
		{
			return false;
		}	
		return true;
	}
	
</script>
<!-- ====================== ���� ������ ���� ==================== -->
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
				<span>����</span>
				<input type="text" name="title" id="title">
			</div>
			<div>
				<span>�ۼ���</span>
				<p>�����</p>
			</div>
			<div>
				<span>�ۼ���</span>
				<p><%= sf.format(nowTime) %></p>
			</div>
			<textarea name="note"></textarea>
		</div>
		
		<div class="btn_wrap">
			<input class="btn" type="submit" value="�۾���">
		</div>
	</form>
</main>
<!-- ====================== ���� ������ �� ==================== -->
<%@ include file="../include/footer.jsp" %>