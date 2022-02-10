<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage info">	
			<div class="title">
				<h2>안녕하세요 [홍길동]님</h2>
			</div>

			<div>
				<form name="info" method="post" action="mypage.jsp">
					<p><span>이름</span><input class="readonly" type="text" name="name" value="홍길동" readonly="readonly"></p>
					<p><span>전화번호</span><input class="readonly" type="text" name="phone" value="010-0000-0000" readonly="readonly"></p>
					<p><span>이메일</span><input type="email" name="email" value="ezen@naver.com"></p>
					<p><span>아이디</span><input class="readonly" type="text" name="id" value="ezen" readonly="readonly"></p>
					<p><span>비밀번호</span><input type="password" name="pw"></p>
					<p><span>비밀번호확인</span><input type="password" name="pwcheck"></p>

					<div class="btn_wrap">
						<input class="btn" type="button" onclick="window.location ='mypage.jsp'" value="취소">
						<input class="btn" type="submit" value="저장">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="./include/footer.jsp" %>