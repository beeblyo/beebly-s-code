<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage info">	
			<div class="title">
				<h2>안녕하세요 [${mv.mname}]님</h2>
			</div>

			<div>
				<form id="myForm" name="info" method="post" action="<%=request.getContextPath()%>/member/memberModiAction.do" onsubmit="return FormCheck('info');">
					<div><span>이름</span><input class="readonly" type="text" name="mname" value="${mv.mname}" readonly="readonly"></div>
					<input type="hidden" name="mno" value="${mv.mno}">
					<div>
						<span>전화번호</span><div class="mpnum">
							<input id="first" type="text" name="first" maxlength="3" value="${mv.mpnum.split('-')[0]}"> - 
							<input id="middle" type="text" name="middle" maxlength="4" value="${mv.mpnum.split('-')[1]}"> - 
							<input id="last" type="text" name="last" maxlength="4" value="${mv.mpnum.split('-')[2]}">
						</div>
					</div>
					<div><span>이메일</span><input class="readonly" type="email" name="memail" value="${mv.memail}" readonly="readonly"></div>

					<div><span>아이디</span><input class="readonly" type="text" name="mid" value="${mv.mid}" readonly="readonly"></div>
					<div><span>비밀번호 수정</span><input id="mpw" type="password" name="mpw"></div>
					<div><span>비밀번호 확인</span><input id="mpwcheck" type="password" name="pwcheck"></div>

					<div class="btn_wrap">
						<input class="btn" type="button" onclick="window.location ='<%=request.getContextPath()%>/member/retire.do'" value="탈퇴">
						<input class="btn" type="button" onclick="window.location ='<%=request.getContextPath()%>/member/memberInfo.do'" value="취소">
						<input class="btn" type="submit" value="저장">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	window.onload = function() {
		/* ===== phone number auto ===== */
		var first = $("#first");
		var middle = $("#middle");
		var last = $("#last");
		first.on("keyup", function(){
			if ($(this).val().length == 3) {
				meddle.focus();
			}
		});
		middle.on("keyup", function(){
			if ($(this).val().length == 4) {
				last.focus();
			}
		});
	}
</script>
<%@ include file="./include/footer.jsp" %>