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
				<input id="back_btn" class="btn" type="button" value="����ϱ�">
				<input class="btn" type="submit" value="����ϱ�">
			</div>
			
			<div class="write_form">
				<input type="hidden" name="tab" value="4">
				<input type="text" name="title" value="<%= vo.getTitle()%>">
				<p>�ۼ���: <%= vo.getUnick() %></p>
				<p>�ۼ���: <%= vo.getDate().split(" ")[0] %></p>
				<textarea name="note"><%= vo.getNote() %></textarea>
			</div>
		</form>
	</div>
</main>
	
<script>
$('#back_btn').click(function () {
	//alert('�ڷΰ���');
	if(confirm('����Ͻðڽ��ϱ�?'))
	{
		window.location = 'view.jsp?tab=4';
	}
});
</script>
<%@ include file="../../include/ad_footer.jsp" %>