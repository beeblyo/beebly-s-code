
var scroll = $(window).scrollTop();

window.onload = function() {
	$('#del_btn').click(function() {
		confirm('삭제하시겠습니까?');
	});
	
	/* ===== 검색 인풋 클릭시 최근 검색어 보여주기 ===== */
	$('#key').focus(function() {
		$('.recent').css('display','block');
	});
	$('#key').blur(function() {
		$('.recent').css('display','none');
	});
	
	/* ===== 브라우저가 400px 아래로 스크롤되면 투탑버튼 보여주기 ===== */
	if(scroll > 400)
	{
		$('.to_top').css('transform','translateY(-140px)');
	}
	
	$(window).scroll(function(){
		scroll = $(window).scrollTop();
		//console.log(scroll);
		if(scroll == 0)
		{
			$('.to_top').css('transform','translateY(140px)');
		}
		if(scroll > 400)
		{
			$('.to_top').css('transform','translateY(-140px)');
		}
	});

	/* ===== 관리자 페이지 전체 체크 ===== */
	$('#all_check').click(function(){
		var checked = $('#all_check').is(':checked');
		
		if(checked) $('input:checkbox').prop('checked',true);
		else        $('input:checkbox').prop('checked',false);
	});
}

/* ====================== 슬라이드 코드 ==================== */
var swiper = new Swiper(".mySwiper", 
{
    slidesPerView: 3,
    spaceBetween: 30,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
    el: ".swiper-pagination",
    clickable: true,
 },
    navigation: 
  	{
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
 });

/* =================== 투탑 버튼 클릭 시 제일 상단으로 올라가기 =================== */
function ToTop()
{
	$('body,html').animate({
      scrollTop:0 
    },400 );
    return false;
}

/* =================== 최근 검색어 마우스 호버시 해당 내용 인풋에 넣기 =================== */
function SearchIn(obj)
{
	console.log(obj);
	console.log(obj.innerHTML);
	$('#key').val(obj.innerHTML);
}

/* =================== 회원 정보 수정 비밀번호 모달 띄우기 ==================== */
const body = document.querySelector('body');
let scrollPosition = 0;

function OpenModal()
{
	document.getElementById("pw").focus();
	$('.modal_back').css('display','block');
	scrollPosition = window.pageYOffset;
    body.style.overflow = 'hidden';
  	body.style.position = 'fixed';
  	body.style.top = `-${scrollPosition}px`;
 	body.style.width = '100%';
}

function CloseModal()
{
	$('.modal_back').css('display','none');
	body.style.removeProperty('overflow');
	body.style.removeProperty('position');
	body.style.removeProperty('top');
	body.style.removeProperty('width');
	window.scrollTo(0, scrollPosition);
}

/* =================== 북마크 ==================== */
function bookmark(t_no,u_no) {
	$.ajax({
		type: "get",
		url: "./bookmark.jsp?tno="+t_no+"&uno="+u_no,
		dataType: "html",
		success: function(data) {
			data = data.trim();
			//alert(data);
			if(data == "TRUE")
			{
				alert("북마크를 추가하였습니다.");
			} else
			{
				alert("북마크를 취소하였습니다.");
			}
		}
	});
}

/* =================== 댓글 있으면 보여주기 ==================== */
function ToggleReply(obj)
{
	console.log($(obj).parent().parent().next());
	var reply = $(obj).parent().parent().next();
	console.log(reply.attr('class'));
	
	if(reply.attr('class') == "re_reply_wrap clearfix"){
		if(reply.css('display') == 'none')
		{
			reply.css('display','block');
		} else
		{
			reply.css('display','none');
		}
	}
	
}

/* =================== 카피 =================== */
function copy(){
  const tempElem=document.createElement('textarea');
  tempElem.value = window.location.href;
  document.body.appendChild(tempElem);
  tempElem.select();
  document.execCommand('copy');
  document.body.removeChild(tempElem);
  alert("주소가 복사 됐습니다. 친구에게 공유해보세요!"); 
}

/* =================== 공지사항 내용 보여주기 ==================== */
function DoDisplay(obj)
{
	console.log(obj);
	console.log($(obj).find('.notice_view'));
	
	console.log($(obj).find('.notice_view').attr('class'));
	var hidden = "";
	if($(obj).find('.notice_view').attr('class') == "notice_view")
	{
		hidden = $(obj).find('.notice_view');
		$(hidden).attr('class','notice_active');
	}else
	{
		hidden = $(obj).find('.notice_active');
		$(hidden).attr('class','notice_view');
	}
}

/* =================== 탈퇴하기 ==================== */
function secession()
{
	if(confirm('탈퇴하시겠습니까?'))
	{
		alert('탈퇴 되었습니다.');
		window.location = "/Ego_v.0.2/index.jsp";
	}
}

/* =================== [관리자] ==================== */
/* =================== 전체 체크 ==================== */
$('#all_check').click(function(){
	var checked = $('#all_check').is(':checked');
	
	if(checked) $('input:checkbox').prop('checked',true);
	else        $('input:checkbox').prop('checked',false);
});

/* =================== 뒤로가기 ==================== */
function backBtn(url)
{
	if(confirm('취소하시겠습니까?'))
	{
		window.location = url;
	}
}