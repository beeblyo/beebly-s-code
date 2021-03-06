<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<script>
	window.onload = function(){
	<%
	if(login == null)
	{
		%>		
		alert('로그인 되지 않았습니다.');
		window.location = "/Ego_v.0.2/index.jsp";
		<%
	}
	%>
	}
	
	function infoModify()
	{
		if($("#nickname").val() == "")
		{
			alert("닉네임을 입력해주세요.");
			nickname.focus();
		}
		
		if( $("#pw").val() != "")
		{
			if($("#pwcheck").val() == "" || $("#pw").val() != $("#pwcheck").val())
			{
				alert("비밀번호가 일치하지 않습니다.");
				$("#pw").focus();
				return false;
			}
		}
		
		var nickname = $("#nickname").val();
		var pw = $("#pw").val();

		var param = "";
	    param += "?nickname=" + nickname;
	    param += "&pw=" + pw;
	    
		$.ajax({
			type: "post",
			url: "./update.jsp" + param,
			dataType: "html",
			async: false,
			success: function(data) {
				data = data.trim();
				
				if(data == "TRUE")
				{
					alert("정상적으로 수정 되었습니다.");
					document.modify.submit();
				} else
				{
					alert("수정 중 오류가 발생했습니다.");
				}
			}
		});
	}
</script>
<main>
	<div class="backward_wrap">
		<div class="back_btn">
			<a href="./info.jsp"></a>
		</div>
	</div>
	
	<div>
		<h3>회원정보</h3>
		<div class="info_wrap">
			<form name="modify" method="post" action="info.jsp" onsubmit="return false;">
				<div class="clearfix">
					<div class="user_profile">
						<label for="input_file"><img src="/Ego_v.0.2/img/placeholder/profile.jpg"></label>
						<label class="input_file_btn btn" for="input_file">
						 	프로필 사진
						</label>
						<input id="input_file" type="file" name="profile" accept="image/png, image/jpeg, image/jpg">
						<a class="sec_btn btn" href="javascript:secession();">탈퇴하기</a>
					</div>
					<div class="user_contents">
						<p>* 표시만 수정이 가능합니다.</p>
						<div class="re_info">
							<div>
								<span>이메일</span>
								<input class="readonly" type="text" name="email" value="${login.id}@${login.email}" readonly="readonly">
							</div>
							<div>
								<span>닉네임(*)</span>
								<input id="nickname" type="text" name="nickname" value="${login.nickname}">
							</div>
							<div>
								<span>비밀번호(*)</span>
								<input id="pw" type="password" name="pw">
							</div>
							<div>
								<span>비밀번호 확인(*)</span>
								<input id="pwcheck" type="password" name="pwcheck">
							</div>
							<div>
								<span>성별</span>
								<label><input type="radio" name="gender" value="M" <%if(login.getGender().equals("M")){%>checked="checked"<%}%> disabled="disabled">남</label>
								<label><input type="radio" name="gender" value="F" <%if(login.getGender().equals("F")){%>checked="checked"<%}%> disabled="disabled">여</label>
							</div>
							<div>
								<span>생년월일</span>
								<input class="readonly" type="text" name="birth" value="${login.bdate}" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap">
					<input class="re_info_btn btn" type="submit" value="수정완료" onclick="infoModify();">
				</div>
			</form>
		</div>
	</div>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>