/**
 * 키워드 선택
 */

window.onload = function() {
	/* ===== 선택한 값 가져오기 ===== */
	keySelect();
	mbtiSelect();
}

/* ========== 선택된 keyword 보여주기 ========== */
function keySelect()
{
	$($(".select_key").children("label")).css('display','none');
	$(".key").children("input").each(function(idx){
		//console.log($(".key").find("input")[idx]);
		
		//console.log($($(".key").find("input")[idx]).is(":checked"));
		if($($(".key").find("input")[idx]).is(":checked"))
		{
			//console.log($(".select_key").children("label")[idx]);
			$($(".select_key").children("label")[idx]).css('display','inline-block');
		}
	});
}

/* ========== 선택된 mbti 보여주기 ========== */
function mbtiSelect()
{
	let checked;
	$(".mbti").children("input").each(function(idx){
		//console.log($('.mbti').find("input")[idx]);
		//console.log("====================================");
		
		if($($('.mbti').find("input")[idx]).is(":checked"))
		{
			let val = $($('.mbti').find("input")[idx]).attr("id");
			$($('.select_key').find("label[for='"+val+"']")).css('display','inline-block');
			//console.log($($('.mbti').find("input")[idx]).attr('id'));
			//$($('.mbti').find("input")[idx]).css('display','inline-block');
		}
	});
}

/* ========== keyword 선택 ========== */
function setFavKeyword(obj)
{
	/* ===== 선택한 keyword의 for값 구하기 ===== */
	console.log($(obj).attr('for'));
	let val = $(obj).attr('for');

	/* ===== 선택한 keyword의 for값 구하기 ===== */
	let item = $(".select_key").find("label[for='"+val+"']");
	//console.log($(obj).prev().is(":checked"));
	console.log($(item).attr("for"));
	let id = $(item).attr("for");
	
	let checkbox;
	console.log($(".key").find("input#"+id).is(":checked"));
	checkbox = $(".key").find("input#"+id);
	
	
	if(checkbox.is(":checked"))
	{
		item.css("display","none");
	} else
	{
		item.css("display","inline-block");
	}
}

/* ========== mbti 선택 ========== */
function setMbti(obj)
{
	/* ===== 전체 지우기 ===== */
	for(i=1; i<=16; i++)
	{
		let num;
		if(i < 10) { num = '0' + i; }
		else       { num = i;       }
		
		//console.log($($('.select_key').find("label[for='mbti_" + num + "']")).attr('for'));
		$($('.select_key').find("label[for='mbti_" + num + "']")).css('display','none');
	}
	
	/* ===== 선택한 mbti의 for값 구하기 ===== */
	console.log($(obj).attr('for'));
	let val = $(obj).attr('for');
	
	/* ===== radio버튼 조작 ===== */
	let checkbox;
	console.log($(".key").find("input#"+val).is(":checked"));
	checkbox = $(".key").find("input#"+val);
	
	/* 보여주기 */
	let item = $($('.select_key').find("label[for='"+val+"']"));
	if(checkbox.is(":checked"))
	{
		item.css("display","none");
	} else
	{
		item.css("display","inline-block");
	}
}

/* ========== mbti 선택 취소 ========== */
function setFalse(obj)
{
	console.log(obj);
	console.log($(obj).is(":checked"));
	obj.checked = false;
	
	let val = $(obj).attr('for');
	let item = $($('.select_key').find("label[for='"+val+"']"));
	item.css("display","none");
	
	
} 