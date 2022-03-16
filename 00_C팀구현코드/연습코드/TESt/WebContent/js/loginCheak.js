$(document).ready(function()
{
	$.ajax
	({
		type : "get",
		url: "../user/loginCheak.jsp",
		dataType: "html",
		success : function(data) 
		{	
			data = data.trim();
			
			if(data == "001")
			{
				alert("접근 권한이 없습니다. 로그인을 부탁드립니다.")
				location.href="../user/login.jsp"
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
	
});
