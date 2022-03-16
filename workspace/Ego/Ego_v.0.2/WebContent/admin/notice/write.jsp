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
<main>
	<div>
		<form class="admin_wrap" name="write" method="post" action="writeok.jsp" onsubmit="return WriteCheck();">
			<input type="hidden" name="kind" value="N">
			<div class="btn_wrap">
				<input id="back_btn" class="btn" type="button" value="취소하기">
				<input class="btn" type="submit" value="등록하기">
			</div>
			<div class="write_form">
				<input type="hidden" name="tab" value="4">
				<input id="ntitle" type="text" name="title" placeholder="제목을 입력하세요.">
				<p>작성자: <%= login.getNickname() %></p>
				<p>작성일: 2022-01-05</p>
				<textarea name="note" placeholder="내용을 입력하세요."></textarea>
			</div>
		</form>
	</div>
</main>

<script>
	$('#back_btn').click(function () {
		//alert('뒤로가기');
		if(confirm('취소하시겠습니까?'))
		{
			window.location = 'notice.jsp?tab=4';
		}
	});
</script>
<%@ include file="../../include/ad_footer.jsp" %>