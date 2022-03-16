<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ego_login</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- 공통 스타일 		-->
		<link href="/Ego_v.0.2/css/login.css" rel="stylesheet">       <!-- admin 스타일	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- 제이쿼리 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer"></script> <!-- 공통 스트립트 		-->
		<script src="/Ego_v.0.2/js/join.js" defer="defer"></script>   <!-- login 스트립트 	-->
	</head>
	<!-- ====================== 메인 컨텐츠 시작 ==================== -->
	<script>
	window.onload = function()
	{
		$("#id").focus();
	}
	
	//로그인 폼 검사
	function LoginCheck()
	{
		if( $("#id").val() == "")
		{
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}
		if( $("#pw").val() == "")
		{
			alert("암호를 입력하세요.");
			$("#pw").focus();
			return false;
		}
		var param = "";
		
		param  = "id=" + $("#id").val();
		param += "&";
		param += "pw=" + $("#pw").val();
		
		$.ajax({
			type : "get",
			url: "loginok.jsp?" + param,
			dataType: "html",
			success : function(data) 
			{
				data = data.trim();
				if(data == "TRUE")
				{
					document.location = "../index.jsp";	
				}else
				{
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");	
					$("#id").focus();
				}
			}
		});		
		
		return false;
	}
	</script>
	<body>
		<div class="login wrap">
			<h1>
				<a class="b_logo" href="/Ego_v.0.2/index.jsp"></a>
			</h1>
			<div class="login_wrap">
				<h2>로그인</h2>
				<form class="login_form" name="login" method="post" action="loginok.jsp" onsubmit="return LoginCheck();">
					<input type="text" id="id" name="id" placeholder="아이디">
					<input type="password" id="pw" name="pw" placeholder="비밀번호" value="">
					
					<div class="center btn_wrap">
						<input class="btn" type="submit" value="로그인하기"><br>
						<a class="join_btn" href="javascript:alert('준비중입니다');">비밀번호 찾기</a><br>
						<a class="join_btn" href="join.jsp">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</body>
	<!-- ====================== 메인 컨텐츠 끝 ==================== -->
</html>