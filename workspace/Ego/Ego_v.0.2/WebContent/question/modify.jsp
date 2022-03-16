<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<main>
	<form class="question_wrap" name="write" method="post" action="view.jsp">
		<div class="backward_wrap">
			<div class="back_btn">
				<a href="./view.jsp"></a>
			</div>
		</div>
	
		<div class="content">
			<div>
				<span>제목</span>
				<input type="text" name="title" value="질문 있어요!!!">
			</div>
			<div>
				<span>작성자</span>
				<p>에고고</p>
			</div>
			<div>
				<span>작성일</span>
				<p>2022-01-05</p>
			</div>
			<textarea>테스트 종류는 언제쯤 늘어나나요?</textarea>
		</div>
		
		<div class="btn_wrap">
			<input class="btn" type="submit" value="글수정">
		</div>
	</form>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>