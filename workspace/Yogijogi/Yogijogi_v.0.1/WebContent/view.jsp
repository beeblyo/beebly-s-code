<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./css/view.css">
	<link rel="stylesheet" href="./css/modal1.css">
	<link rel="stylesheet" href="./css/modal2.css">
</head>
<script>
function ShowModal()
{
	/**뷰화면 숨기기**/
	$('.wrap').css('display','none');
	/**모달2 숨기기**/
	$('.wrap4').css('display','none');
	$('.overlay2').css('display','none');
	/**모달1 보이기**/
	$('.overlay').css('display','block');
	$('.wrap3').css('display','block');
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}

function ShowModal2()
{
	/**모달2 보이기**/
	$('.wrap4').css('display','block');
	$('.overlay2').css('display','block');
	/**모달1 숨기기**/
	$('.overlay').css('display','none');
	$('.wrap3').css('display','none');	
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': 'hidden', 'height': '100%'});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}

function CloseModal()
{
	/**뷰화면 보이기**/
	$('.wrap').css('display','block');
	/**모달2 숨기기**/
	$('.wrap4').css('display','none');
	$('.overlay2').css('display','none');
	/**모달1 숨기기**/
	$('.overlay').css('display','none');
	$('.wrap3').css('display','none');	
	
	/**스크롤 없애기**/
	$('html, body').css({'overflow': '', 'height': ''});
	$('#element').on('scroll touchmove mousewheel', function(event) {
	  event.preventDefault();
	  event.stopPropagation();
	  return false;
	});
}
</script>
<body>
<%@ include file="./include/header.jsp" %>
<!--------------------------------- 모달1 --------------------------------------->
<div class="overlay">
		</div>
			<div class="wrap3 modal" id="modal">
			<span class=modal1_join>참여하기</span>
				<div class="one">
					<div>성인</div>
					<div>
						<input type="text" size="20">
					</div>
					<div class="btn1 plus">+</div>
					<div class="btn1 minus">-</div>
					<div class="ticket_count">(0/200)</div>
				</div>
				<div class="two">
					<div>어린이</div>
					<div>
						<input type="text" size="20">
					</div>
					<div class="btn1 plus">+</div>
					<div class="btn1 minus">-</div>
					<div class="ticket_count">(0/200)</div>
				</div>
				<div class="three">
					<div>합계</div>
					<div>
						8000
					</div>
					<div>원</div>
				</div>
				<div class="btn_box1">
					<div class="btn1" onclick="CloseModal()">취소</div>
					<div class="btn1 get_ticket" onclick="ShowModal2()">예매하기</div>
				</div>
				<div class="bottom">
					<div>티켓 구입시 안내<hr> 티켓은 공연 하루전 환불 신청이 불가합니다<br> 티켓 환불은 내정보에서 신청할 수 있습니다</div>
				</div>
			</div>

<!--------------------------------- 모달2 --------------------------------------->

<div class="overlay2"></div>
	<div class="wrap4">
		<div><span class="point">
			[</span> 소리와 빛의 <span class="point">]</span>
			<br>축제 티켓
		</div>
		<div class="ticket_box">
			<div>티켓 번호<br>63</div>
			<div>바코드 번호</div>
		</div>
		<div>
			화면에 보이는 티켓을 저장해 <br>안내 직원에게 보여주세요<br>
			고객 문의 000)000-0000
		</div>
		<div class="btn_box2">
			<div class="btn2" onclick="CloseModal()">닫기</div>
			<div class="btn2">이미지로 저장</div>
			<div class="btn2">이메일로 전송</div>
		</div>
	</div>


<!--------------------------------- 뷰화면 --------------------------------------->

	
	<div class="wrap">
	
		<div class="forcenter">	
			<div>
				<span class="back_btn"><a href="list.jsp">뒤로가기</a></span>
				<a href="list.jsp" class="nav_tag">공연</a> >
				<a href="list.jsp" class="nav_tag">1월</a> >
				<a href="#" class="nav_tag atag_now">빛과 소리 축제</a>
			</div>
			<div class="info_box">
				<div class="view_image">
					<img src="./img/view_picture.png">
				</div>			
				<div>
					<div class="title">빛과 소리 축제에 어서오세요</div>
					<div class="adress">
						<span class="grayblock">도로명</span>&nbsp;전주시 뭐뭐구 뭐뭐동 뭐1길 00-0<br>
						<span class="grayblock">지 번</span>&nbsp;전라북도 전주시 완산구 뭐뭐길 뭐뭐동 뭐뭐00-0
					</div>
					<div><span class="grayblock">기간</span>&nbsp;22년 22월 22일 ~ 22년 22월 22일</div>
					<div><span class="grayblock">성인</span>&nbsp;1만원 <span class="grayblock">어린이</span>&nbsp;8천원</div>
					<div class="whoopen"><span class="grayblock">주최</span>&nbsp;행정안전부</div>
					<div>
					<span class="grayblock">
						홈페이지</span><a class="whowebsite" href="http://www.naver.com">&nbsp;<u>www.naver.com</u>&nbsp;</a>
						<span class="grayblock">전화번호</span>&nbsp;000)000-0000</div>
					
					<div class="btn_box">
					<div onclick="ShowModal()">예매하기</div>
					<div>공유</div>
					<div>북마크</div>
				</div>	
				</div>			
			</div>
			<div class="moreinfo" style="color:#8B8B8B">
				<span class="moreinfo_title">소개</span>
				<div class="specific_info">
				빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다
				빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다
				빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다 빛과 소리 축제는 이런 축제입니다
				</div>
				<span class="moreinfo_title">오시는길</span>
				<!-- map start -->
				<div>
    				<img src="https://www.google.com/imgres?imgurl=https%3A%2F%2Fgeology.com%2Fworld%2Fthe-united-states-of-america-map.gif&imgrefurl=https%3A%2F%2Fgeology.com%2Fworld%2Fthe-united-states-of-america-satellite-image.shtml&tbnid=8UvmoW6XDLB0zM&vet=12ahUKEwi86L-u8_H1AhXCMHAKHW-GDdAQMygLegUIARDzAQ..i&docid=nRPPVq6h2TAk1M&w=1100&h=704&itg=1&q=map&ved=2ahUKEwi86L-u8_H1AhXCMHAKHW-GDdAQMygLegUIARDzAQ">
				</div>
				<!-- map end -->
				
			</div>
			<div>
				<span class="grayblock data">공공데이터</span>
				<img class="license_img" src="./img/license1.png">
				<img class="license_img" src="./img/license2.png"></div>	
			</div>
		</div>
		<%@ include file="./include/footer.jsp" %>
	</div>
	
