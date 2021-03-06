<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/test/progressStyle.css">
<link rel="stylesheet" href="../css/test/resultStyle.css">
<link rel="stylesheet" href="../css/test/slide.css">
<script type="text/javascript" src="../js/test/fileRead.js?version=2"></script>
<script type="text/javascript" src="../js/test/resultPageScript.js?version=2"></script>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<%
String test_number = request.getParameter("no");
String folder = request.getParameter("folder");
String mbti = (String)request.getParameter("mbti");
System.out.println("mbti" + mbti);

TestRecordVO record = new TestRecordVO();
record.setMBTI(mbti);
record.setNo(test_number);
if (login == null )
{
%>
	<script>
	alert('재로그인 하세요');
	window.location.href = "/login/login.jsp";
	</script>
<% return;
}else{
	record.setU_no(login.getNo());	
}

TestRecordDTO recorddto = new TestRecordDTO();
recorddto.insertTestRecord(record);



%>

<script>
	$(function(){
		$.ajax({
			type: "get",
			url: "./comment/comment.jsp",
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
	<div class="backward_wrap">
		<div class="back_btn">
			<a href="/Ego_v.0.2/index.jsp" title="메인으로"></a>
		</div>
	</div>
	
	<div class="result">
		<div>
			<div id="result" class="test_result">
				<p id="text2">대단한 사람</p>
				<p id="text3">좋은 능력</p>
				<img id="resultImage" src="/Ego_v.0.2/img/placeholder/placeholder.jpg">
				
				<ul id="discription">
					
     			</ul>
     			
				<div id = "harmonyWrapper">
					<div class="harmony" id="good">
						<p id="goodText">잘 맞는 초능력자</p>
						<img id="goodImage" src="/Ego_v.0.2/img/placeholder/placeholder.jpg">
						<p id="goodPower"></p>
					</div>
					<div class="harmony" id="bad">
						<p id="badText">잘 안맞는 초능력자</p>
						<img id="badImage" src="/Ego_v.0.2/img/placeholder/placeholder.jpg">
						<p id="badPower"></p>
					</div>
				</div>
			</div>
			
			<div class="test_btn">
				<a class="replay_btn" href="./start.jsp?folder=test01" title="다시하기"></a>
				<div class="test_button_box">
				<%
					if(login!=null)
					{
						%>
						<a href="javascript:bookmark('<%=test_number%>','<%=login.getNo() %>');" title="즐겨찾기"></a>
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
						<form name="reply" method="post" action="#">
							<textarea name="post"></textarea>
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
		
		<div class="test_recommend">
			<p class="title">비슷한 테스트</p>
			<div id="slideShow">
				<ul class="slides">
					<li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/08.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/06.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/03.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/04.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/05.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/02.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/07.jpg"></a></li>
			        <li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/01.jpg"></a></li>
			    	<li><a href="./test_start.html"><img src="/Ego_v.0.2/img/thumb/09.jpg"></a></li>
				</ul>
			</div>
				
			<p class="controller">
				<span class="prev"><img src="/Ego_v.0.2/img/icon/back_btn.png"></span>
				<span class="next"><img src="/Ego_v.0.2/img/icon/next_btn.png"></span>
			</p>
			<script src="../js/slide.js"></script>
		</div>
	</div>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>