<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/login.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="login_wrap">
			<h2>회원가입</h2>
			<form name="login" method="post" action="mailsend.jsp">
				<div class="use">
					<div>이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라이용약관 이리저리 솰라솰라 룰루랄라 으라차차 도란도란 요기조기 룰루랄라</div>
					<input id="use_N" type="radio" name="use" value="N" checked="checked"> <label for="use_N">동의하지 않습니다</label> &ensp;&ensp;
					<input id="use_Y" type="radio" name="use" value="Y"> <label for="use_Y">동의합니다</label>
				</div>
				<div>
					<span>아이디</span> <input type="text" name="id">
					<b>사용 가능한 아이디가 아닙니다.</b>
				</div>
				<div>
					<span>비밀번호</span> <input type="password" name="pw">
					<b>사용 가능한 비밀번호가 아닙니다.</b>
				</div>
				<div>
					<span>비밀번호 확인</span> <input type="password" name="pwcheck">
					<b>비밀번호가 일치하지 않습니다.</b>
				</div>
				<div>
					<span>이름</span> <input type="text" name="name">
				</div>
				<div class="phone">
					<span>전화번호</span>
					<div>
						<input type="text" name="first"> - <input type="text" name="meddle"> - <input type="text" name="last">
					</div>
				</div>
				<div>
					<span>이메일</span> <input type="email" name="email">
					<b>사용 가능한 이메일이 아닙니다.</b>
				</div>
				<div class="btn_wrap join clearfix">
					<a class="btn" href="./login.jsp">취소</a>
					<input class="btn" type="submit" value="가입">
				</div>
			</form>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>