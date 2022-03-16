<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%@ page import="dbconn.*"%>
<%@ page import="model.*"%>
<link href="<%=request.getContextPath()%>/css/siteintro.css" rel="stylesheet">

<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="title">
		<!-- <h2>입점문의</h2> -->
	</div>

	<div class="intro_wrap">
		<div class="intro_form inquiry">
			<img src="<%=request.getContextPath()%>/img/inquiry.png">

			<div>
				<h5>문의사항 있으면 연락 주세요</h5>
				<div class="explan">
					<p>ego7302@naver.com</p>
					<p>1588-0126</p>
					<small>문의가능 시간: 9:00 ~ 17:00</small>
				</div>
			</div>
		</div>
	</div>
	
	<!-- QnA -->
	<script>
	window.onload = function()
	{
		/*question_box를 클릭하면 answer_box가 보여지고 사라지는 메소드(기존)*/
		/*for( i=0; i<10; i++ ) 
		{ 
			$('.question_box0'+i).click(function(){
				 $(this).next().slideToggle();
			});
		}*/
	}
	
	/*question_box를 클릭하면 answer_box가 보여지고 사라지는 메소드(수정후)*/
	function changehtml(name) {
		
		$('.'+name).next().slideToggle();
		
	}
	
	</script>
	
	<%ArrayList<FaqVo> alist = (ArrayList<FaqVo>)request.getAttribute("alist"); %>
	<div class="QnA_wrap">
	<div class="inquiry_title">FAQ 자주찾는 질문</div>
	<%
	if(alist.size() == 0) {
		%>
		<div class="qebox">
			<div>
				<div class="question_title">질문이 없습니다.</div>
			</div>
		</div>
		<%
	} else {
		for(FaqVo fv : alist)
		{
			%>
			<div class="qebox question_box0<%=fv.getFno()%>">
				<div>
					<div class="question_title">Q <%= fv.getFtitle() %></div>
					<div class="qusarrow question_arrow<%=fv.getFno()%>" onclick="changehtml('question_box0<%= fv.getFno() %>')">↓</div>
				</div>
			</div>
			<div class="ans answer_box">
				<div>
					<span>A</span>
					<%=fv.getFnote() %>
				</div>
			</div>
			<%
		}
	}
	%>
	</div>
	
	
</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>