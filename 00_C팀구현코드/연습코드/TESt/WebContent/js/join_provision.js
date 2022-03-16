var radioVal

window.onload = function()
{
	$(".agree").click(function()
	{
		radioVal = $('input[class="agree"]:checked').val();
    });
	
	//약관동의 여부에 따라 링크 부여
	$("#join_go").click(function()
	{
		if(radioVal == "yes")
		{	
			$(location).attr("href", "join.jsp")
		} 
		else
		{
    		alert("약관에 동의해주세요");
		}
	});
}