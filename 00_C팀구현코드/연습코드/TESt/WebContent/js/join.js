var stop_code = "No";

window.onload = function()
{
	join_provisoin.User_Id.focus();
	
	
	//아이디 체크
	$('#User_Id').keyup(function() 
	{ 
		var id = $("#User_Id").val();
		
		$.ajax
		({
			type : "get",
			url: "join_idcheck.jsp?Uesr_Id=" + id,
			dataType: "html",
			success : function(data) 
			{
				data = data.trim();
				
				if(data == "002")
				{
					$(".Id_Cheak").text("중복된 아이디 입니다.");
					stop_code = "No";
				}
				else 
				{
					$(".Id_Cheak").text("OK");
					stop_code = "Yes"
				}		
			},
			complete : function(data)
			{
				
			}
		});	
	});

	$('#User_passwordCheck').keyup(function() 
	{ 		
		if($("#User_passwordCheck").val() != "")
		{
			
			if($("#User_Pw").val() != $("#User_passwordCheck").val() ) 
			{
				$(".Pw_Cheak").text("비밀번호 불일치");
			}
			else
			{
				$(".Pw_Cheak").text("비밀번호 일치");
			}					
		}
	});

	$('#User_Pw').keyup(function() 
	{ 		
		if($("#User_Pw").val() != "")
		{
			
			if($("#User_Pw").val() != $("#User_passwordCheck").val() ) 
			{
				$(".Pw_Cheak").text("비밀번호 불일치.");
			}
			else
			{
				$(".Pw_Cheak").text("비밀번호 일치");
			}					
		}
	});
	
	 
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
	
	//아이디 중복
	if(stop_code == "No")
	{
		alert('중복된 아이디 입니다.');
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
	
	//PW 확인 공란 체크
	if($("#User_passwordCheck").val() == "") 
	{
		alert('비밀번호 확인란을 입력해주세요.');
		$("#User_passwordCheck").focus();            
		return false;
	}
	
	//PW일치여부 체크
	if($("#User_Pw").val() != $("#User_passwordCheck").val() ) 
	{
		alert('비밀번호 확인의 내용이 다릅니다.');
		$("#User_passwordCheck").focus();            
		return false;
	}
	
	//이름 공란 체크
	if($("#User_Name").val() == "") 
	{
		alert('이름을 입력해주세요.');
		$("#User_Name").focus();            
		return false;
	}
	
	//이메일 공란 체크
	if($("#User_Email").val() == "") 
	{
		alert('이메일을 입력해주세요.');
		$("#User_Email").focus();            
		return false;
	}

	//이메일 선택 체크
	if($("#mail_kind").val() == "") 
	{
		alert('이메일 주소를 선택해주세요.');
		$("#mail_kind").focus();            
		return false;
	}
		
	//캡챠 공란 체크
	$.ajax({
		type : "get",
		url: "../captcha/getsign.jsp",
		dataType: "html",
		success : function(data) 
		{
			data = data.trim();
			
			if($("#captcha").val() == "")
			{
				alert("가입방지코드를 입력하세요");
				return false;
			}else if($("#captcha").val()  != data )
			{
				alert("가입방지코드가 일치하지 않습니다.");
				return false;
			}else
			{
				if( confirm("회원가입을 진행하시겠습니까?") != 1)
				{
					return false;	
				}
				document.join_provisoin.submit();					
				return false;					
			}
		}
	});
	return false;

}
