
window.onload = function()
{
	login.User_Id.focus();
	
	$.ajax
	({
		type : "get",
		url: "../user/loginCheak.jsp",
		dataType: "html",
		success : function(data) 
		{	
			data = data.trim();
			
			if(data == "002")
			{
				alert("이미 로그인 상태입니다.")
				location.href="../main/main.jsp"				
			}
			else
			{
			}

		},
		complete : function(data) 
		{
			// 통신이실패했어도완료가되었을때이함수를타게된다.
			//alert("complete");
		},
		error : function(xhr, status, error) 
		{
			//alert("error");
		}
	});	
	return false;
}

function FormCheck()
{
	
	//ID 공란 체크
	if($("#User_Id").val() == "")
	{
		alert('아이디를 입력해주세요.');
		$("#User_Id").focus();
		return false;
	}

	
	//PW 공란 체크
	if($("#User_Pw").val() == "") 
	{
		alert('비밀번호를 입력해주세요');
		$("#User_Pw").focus();
		return false;
	}
	
}
