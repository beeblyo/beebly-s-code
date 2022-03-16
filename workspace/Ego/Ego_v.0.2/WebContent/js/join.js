/**
 * join 화면
 */

window.onload = function () {
	$('#id').focus();
	
	/* ===== 개인정보처리방침 ===== */
	$.ajax({
		type: "get",
		url: "ego_assent.html",
		dataType: "html",
		success: function(data) {
			//alert(data);
			$('.assent').html(data);
		}
	});
}

/* =============== join 화면 이동 =============== */
let   step_num  = 1; //현재 스텝 번호
const max_step  = 4; //마지막 스텝 번호
let   now_step;
let   next_step;
let   back_step;
let   class_name;

/* ===== 다음으로 ===== */
function next()
{
	class_name = "#step0"+step_num;
	now_step  = document.querySelector(class_name); //현재 객체
	now_step.style.display = "none";
	
	if(step_num >= 1)
	{
		class_name = "#step0"+(step_num+1);
		next_step = document.querySelector(class_name); //다음 객체
		next_step.style.display = "block"
		console.log(next_step);
		step_num++;
	} else if(step_num == max_step)
	{
		alert('last');
	}
}

/* ===== 이전으로 ===== */
function back()
{
	class_name = "#step0"+step_num;
	now_step  = document.querySelector(class_name); //현재 객체
	now_step.style.display = "none";
	
	if(step_num > 1)
	{
		class_name = "#step0"+(step_num-1);
		back_step = document.querySelector(class_name); //다음 객체
		back_step.style.display = "block"
		console.log(back_step);
		step_num--;
	} else if(step_num == 1)
	{
		window.location = 'login.jsp';
	}
}

/* =============== join 폼 체크 =============== */
function formCheck(step) {
	switch (step) {
		case 1:
			if($('#assentY').is(':checked')) next();
			break;
		case 2:
			if($('#mail').val() == "")
			{
				alert('이메일을 입력해주세요.');
				$('#mail').focus();
				return
			}else
			{
				alert('인증번호를 발송했습니다.');
				$('.certify_btn').css('display','none');
				$('#mailnumber').css('display','block');
				$('.next_btn').css('display','inline-block');
				$('#mailnumber').focus();
			}
			
			if($('#mailnumber').val() != "" ) next();
			break;
		case 3:
			if($('#pw').val() != "" && $('#pwcheck').val() != "" )
			{
				$('#nickname').css('display','block');
				$('.genders').css('display','block');
				$('#birth').css('display','block');
				$('.next_btn').css('display','inline-block');
			} else
			{
				if($('#pw').val() == "")
				{
					alert('비밀번호를 입력해주세요.');
					$('#pw').focus();
				} else
				{
					alert('비밀번호가 일치하지 않습니다.');
					$('#pw').focus();
				}
			}
			
			if($('#nickname').val() != "")
			{
				next();
			} else
			{
				alert('닉네임을 입력해주세요.');
				$('#nickname').focus();
			}
			break;
	}
} 