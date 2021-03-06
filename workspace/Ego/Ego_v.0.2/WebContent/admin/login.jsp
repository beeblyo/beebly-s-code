<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ego [관리자 페이지]</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- 공통 스타일 		-->
		<link href="/Ego_v.0.2/css/admin.css" rel="stylesheet">       <!-- admin 스타일	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- 제이쿼리 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer"></script> <!-- 공통 스트립트 		-->
	</head>
	<body>
	<script>
	$(document).ready(function()
	{ 
		$("#id").focus(); 
	})
	
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
					document.location = "admin.jsp";	
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
		<div class="background">
			<div class="wrap login_wrap">
				<h1>
					<a class="w_logo" href="#"></a>
				</h1>
				<div class="login">
					<h2>로그인</h2>
					<form name="login" method="post" action="/Ego_v.0.2/admin/loginok.jsp" onsubmit="return LoginCheck();">
						<input id="id" type="text" name="id" placeholder="아이디" value="admin">
						<input id="pw" type="password" name="pw" placeholder="비밀번호" value="1234"><br>
						<input class="btn" type="submit" value="로그인">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>