<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<script>
	$(document).ready(function()
	{ 
		$("#ntitle").focus();
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
<main>
	<div>
		<form class="admin_wrap" name="write" method="post" action="writeok.jsp" onsubmit="return WriteCheck();">
			<input type="hidden" name="kind" value="N">
			<div class="btn_wrap">
				<input id="back_btn" class="btn" type="button" value="����ϱ�">
				<input class="btn" type="submit" value="����ϱ�">
			</div>
			<div class="write_form">
				<input type="hidden" name="tab" value="4">
				<input id="ntitle" type="text" name="title" placeholder="������ �Է��ϼ���.">
				<p>�ۼ���: <%= login.getNickname() %></p>
				<p>�ۼ���: 2022-01-05</p>
				<textarea name="note" placeholder="������ �Է��ϼ���."></textarea>
			</div>
		</form>
	</div>
</main>

<script>
	$('#back_btn').click(function () {
		//alert('�ڷΰ���');
		if(confirm('����Ͻðڽ��ϱ�?'))
		{
			window.location = 'notice.jsp?tab=4';
		}
	});
</script>
<%@ include file="../../include/ad_footer.jsp" %>