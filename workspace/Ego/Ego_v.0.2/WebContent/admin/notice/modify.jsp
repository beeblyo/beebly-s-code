<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String bno  = request.getParameter("no");
String kind = request.getParameter("kind");
String curpage = request.getParameter("page");
tab = request.getParameter("tab");

BoardDTO dto = new BoardDTO();

BoardVO vo = dto.Read(bno);


%>
<main>
	<div>
		<form class="admin_wrap" name="write" method="post" action="modifyok.jsp">
			<input type="hidden" name="no" value="<%= bno %>">
			<div class="btn_wrap">
				<input id="back_btn" class="btn" type="button" value="취소하기">
				<input class="btn" type="submit" value="등록하기">
			</div>
			
			<div class="write_form">
				<input type="hidden" name="tab" value="4">
				<input type="text" name="title" value="<%= vo.getTitle()%>">
				<p>작성자: <%= vo.getUnick() %></p>
				<p>작성일: <%= vo.getDate().split(" ")[0] %></p>
				<textarea name="note"><%= vo.getNote() %></textarea>
			</div>
		</form>
	</div>
</main>
	
<script>
$('#back_btn').click(function () {
	//alert('뒤로가기');
	if(confirm('취소하시겠습니까?'))
	{
		window.location = 'view.jsp?tab=4';
	}
});
</script>
<%@ include file="../../include/ad_footer.jsp" %>