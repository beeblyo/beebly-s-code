<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/test/progressStyle.css">
<link rel="stylesheet" href="../css/test/resultStyle.css">
<script type="text/javascript" src="../js/test/startPageScript.js?version=2"></script>
<script type="text/javascript" src="../js/test/fileRead.js?version=2"></script>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->

<%
String no = request.getParameter("no");
String folder = request.getParameter("folder");



TestVO vo = null;
TestDTO dto = new TestDTO();
vo = dto.selectTestView(no);
if(vo != null)
{
%>
<script>
	$(function(){
		$.ajax({
			type: "get",
			url: "./comment/comment.jsp?no=<%= no %>&folder=<%= folder %>",
			dataType: "html",
			success: function(data) {
				data = data.trim();
				//alert(data);
				
				$('#reply_view_wrap').html(data);
			}
		});
	});
</script>
<main>
	<div class="test_wrap">
		<div id="start">
			<div class="test_image">
				<img id="thumb_h_img" src="#">
			</div>
			<div class="test_info">
				<div class="info_category"><%=vo.getCategoryName().split(" ")[0]%></div>
				<div class="info_title"><%=vo.getTestTitle()%></div>
				<div class="info_joinmember"><%=vo.getJoinCount()%>명<br>참여</div>
				<button id="startButton" class="start_btn btn" onclick="testStart('<%=no%>','<%=folder%>');">START</button>
				<div class="test_button_box">
				<%
					if(login!=null)
					{
						%>
						<a href="javascript:bookmark('<%=no%>','<%=login.getNo() %>');" title="즐겨찾기"></a>
						<%
					} else
					{
						%>
						<a href="javascript:alert('로그인 후 이용이 가능합니다.');" title="즐겨찾기"></a>
						<%
					}
					%>
					<a href="javascript:alert('추천인 척 하였습니다.');" title="잘맞아요"></a>
					<a href="javascript:alert('추천인 척 하였습니다.');" title="재밌어요"></a>
					<a href="javascript:copy();" title="공유하기"></a>
				</div>
			</div>
		</div>
		
		<!-- 댓글 영역 -->
		<div class="reply_wrap">
			<!-- 댓글 입력 영역 -->
			<%
			if(login != null)
			{
				%>
				<div class="reply new_reply">
					<div class="reply_profile">
					</div>
					<div class="reply_box">
						<div>
							<div class="reply_name">에고고</div>
							<div class="reply_date">2021.01.01</div>
						</div>
						<form name="reply" method="post" action="comment/commentok.jsp">
							<input type="hidden" name="no" value="<%= no %>" >
							<input type="hidden" name="folder" value="<%= folder %>">
							<textarea name="note"></textarea>
							<input type="submit" value="등록">
						</form>
					</div>
				</div>
				<%
			}
			%>
				
			<div id="reply_view_wrap">
			
			</div>
		</div>
		<!-- 댓글 영역 -->
	</div>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%
} else
{
	%>
	<script>
		alert("테스트가 없습니다.");
	</script>
	<%
	response.sendRedirect("/Ego_v.0.2/index.jsp");
}
%>
<%@ include file="../include/footer.jsp" %>