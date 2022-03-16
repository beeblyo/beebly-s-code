<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/test/progressStyle.css">
<link rel="stylesheet" href="../css/test/resultStyle.css">
<script type="text/javascript" src="../js/test/fileRead.js?version=2"></script>
<script type="text/javascript" src="../js/test/progressPageScript.js?version=2"></script>
<!-- ====================== ¸ŞÀÎ ÄÁÅÙÃ÷ ½ÃÀÛ ==================== -->
<%
String no     = request.getParameter("no");
String folder = request.getParameter("folder");

TestDTO dto = new TestDTO();
dto.upJoinCount(no);
%>
<main>
	<div class="backward_wrap">
		<div class="back_btn">
			<a id="exit_btn" href="start.jsp?no=<%=no%>&folder=<%=folder%>"></a>
			<a id="prev_btn" href="#" onclick="moveSlider(-1)"></a>
		</div>
	</div>
	
	<div class="test_page_wrap" id="main_contents">
		<div  id ="progressDiv">
			<div id="progressText">0</div>
			<div class="test_progress_bar" id ="progressBar">
				<div class="progress" id="progressValue"></div>
			</div>
		</div>
		
		<div class="test_question" id="qna_mask">
			
			<div class="test_answer claerfix">
				<ul id = "qna_slider">
	     		</ul>
			</div>
		</div>
	</div>
</main>
<!-- ====================== ¸ŞÀÎ ÄÁÅÙÃ÷ ³¡ ==================== -->
<%@ include file="../include/footer.jsp" %>