
var scroll = $(window).scrollTop();

window.onload = function() {
	$('#del_btn').click(function() {
		confirm('�����Ͻðڽ��ϱ�?');
	});
	
	/* ===== �˻� ��ǲ Ŭ���� �ֱ� �˻��� �����ֱ� ===== */
	$('#key').focus(function() {
		$('.recent').css('display','block');
	});
	$('#key').blur(function() {
		$('.recent').css('display','none');
	});
	
	/* ===== �������� 400px �Ʒ��� ��ũ�ѵǸ� ��ž��ư �����ֱ� ===== */
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

	/* ===== ������ ������ ��ü üũ ===== */
	$('#all_check').click(function(){
		var checked = $('#all_check').is(':checked');
		
		if(checked) $('input:checkbox').prop('checked',true);
		else        $('input:checkbox').prop('checked',false);
	});
}

/* ====================== �����̵� �ڵ� ==================== */
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

/* =================== ��ž ��ư Ŭ�� �� ���� ������� �ö󰡱� =================== */
function ToTop()
{
	$('body,html').animate({
      scrollTop:0 
    },400 );
    return false;
}

/* =================== �ֱ� �˻��� ���콺 ȣ���� �ش� ���� ��ǲ�� �ֱ� =================== */
function SearchIn(obj)
{
	console.log(obj);
	console.log(obj.innerHTML);
	$('#key').val(obj.innerHTML);
}

/* =================== ȸ�� ���� ���� ��й�ȣ ��� ���� ==================== */
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

/* =================== �ϸ�ũ ==================== */
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
				alert("�ϸ�ũ�� �߰��Ͽ����ϴ�.");
			} else
			{
				alert("�ϸ�ũ�� ����Ͽ����ϴ�.");
			}
		}
	});
}

/* =================== ��� ������ �����ֱ� ==================== */
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

/* =================== ī�� =================== */
function copy(){
  const tempElem=document.createElement('textarea');
  tempElem.value = window.location.href;
  document.body.appendChild(tempElem);
  tempElem.select();
  document.execCommand('copy');
  document.body.removeChild(tempElem);
  alert("�ּҰ� ���� �ƽ��ϴ�. ģ������ �����غ�����!"); 
}

/* =================== �������� ���� �����ֱ� ==================== */
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

/* =================== Ż���ϱ� ==================== */
function secession()
{
	if(confirm('Ż���Ͻðڽ��ϱ�?'))
	{
		alert('Ż�� �Ǿ����ϴ�.');
		window.location = "/Ego_v.0.2/index.jsp";
	}
}

/* =================== [������] ==================== */
/* =================== ��ü üũ ==================== */
$('#all_check').click(function(){
	var checked = $('#all_check').is(':checked');
	
	if(checked) $('input:checkbox').prop('checked',true);
	else        $('input:checkbox').prop('checked',false);
});

/* =================== �ڷΰ��� ==================== */
function backBtn(url)
{
	if(confirm('����Ͻðڽ��ϱ�?'))
	{
		window.location = url;
	}
}