<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="title">
		<!-- <h2>입점문의</h2> -->
	</div>

	<div class="intro_wrap">
		<div class="intro_form inquiry">
			<img src="./img/inquiry.png">

			<div>
				<h5>문의사항 있으면 연락 주세요</h5>
				<div class="explan">
					<p>gjekdmlwl@naver.com</p>
					<p>000)000-0000</p>
					<small>문의가능 시간: 9:00 ~ 17:00</small>
				</div>
			</div>
		</div>
	</div>
	
	<!-- QnA -->
	
	
	<style>
	.ans
	{
		display:none;
	}
	
	</style>
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
	
	
	<div class="QnA_wrap">
	<div class="inquiry_title">FAQ 자주찾는 질문</div>
	<% for(int i=1; i<10; i++ ) { %>
		<div class="qebox question_box0<%=i%>">
			<div>
				<div class="question_title">Q 로그인/회원가입이 안됩니다</div>
				<div class="qusarrow question_arrow<%=i%>" onclick="changehtml('question_box0<%=i%>')">↓</div>
			</div>
		</div>
		<div class="ans answer_box">
			<div>
				<span>A</span>
				대답
			</div>
		</div>
		<% } %>
	</div>
	
	
</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>