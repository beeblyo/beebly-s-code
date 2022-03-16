<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ego [������ ������]</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- ���� ��Ÿ�� 		-->
		<link href="/Ego_v.0.2/css/admin.css" rel="stylesheet">       <!-- admin ��Ÿ��	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- �������� 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer"></script> <!-- ���� ��Ʈ��Ʈ 		-->
	</head>
	<body>
	<script>
	$(document).ready(function()
	{ 
		$("#id").focus(); 
	})
	
	//�α��� �� �˻�
	function LoginCheck()
	{
		if( $("#id").val() == "")
		{
			alert("���̵� �Է��ϼ���.");
			$("#id").focus();
			return false;
		}
		if( $("#pw").val() == "")
		{
			alert("��ȣ�� �Է��ϼ���.");
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
					alert("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");	
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
					<h2>�α���</h2>
					<form name="login" method="post" action="/Ego_v.0.2/admin/loginok.jsp" onsubmit="return LoginCheck();">
						<input id="id" type="text" name="id" placeholder="���̵�" value="admin">
						<input id="pw" type="password" name="pw" placeholder="��й�ȣ" value="1234"><br>
						<input class="btn" type="submit" value="�α���">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>