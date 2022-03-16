window.onload = function()
{
	join_provisoin.User_Id.focus();
	// 영문, 특수문자 자동삭제
	$('#User_Name').keyup(function()
	{
		var name = $(this).val();
		$(this).val(name.replace(/[[a-zA-Z0-9~!@#$%^&*()_+-\|<>?:{}= ]/g,''));
	});	
	
	//한글, 특수문자 자동 삭제
	$('#User_Id').keyup(function()
	{
		var id = $(this).val();
		$(this).val(id.replace(/[ㄱ-힣~!@#$%^&*()_+|<>?:{}= ]/g,''));
	});
	
}