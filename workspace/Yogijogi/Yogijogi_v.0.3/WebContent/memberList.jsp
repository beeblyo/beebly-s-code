<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/siteintro.css" rel="stylesheet">
<%
ArrayList<MemberVo> alist = (ArrayList<MemberVo>)session.getAttribute("alist");
%>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro_form mypage member">
			<div class="btn_wrap">
				<a href="<%=request.getContextPath()%>/member/memberInfo.do">뒤로</a>
			</div>

			<div class="title">
				<h2>회원관리</h2>
			</div>

			<div>
				<div class="memver_search">
					<form id="myform" name="member" method="post" action="member.jsp" onsubmit="return FormCheck('shearch');">
						<select name="filter">
							<option value="mno">번호</option>
							<option value="mid">아이디</option>
							<option value="mname">이름</option>
						</select>
						<input type="text" name="key">
						<input type="submit" value="검색">
					</form>
				</div>

				<div class="member_list">
					<div class="table">
						<div class="thead">
							<div class="row">
								<div class="column">번호</div>
								<div class="column">아이디</div>
								<div class="column">이름</div>
								<div class="column">이메일</div>
								<div class="column">상태</div>
								<div class="column">수정</div>
							</div>
						</div>

						<div class="tbody">
						<%for(MemberVo item : alist) {%>
							<div class="row">
								<div class="column"><%=item.getMno()%></div>
								<div class="column"><a href="javascript:openModal('info','<%=item.getMno()%>')"><%=item.getMid()%></a></div>
								<div class="column"><%=item.getMname()%></div>
								<div class="column"><%=item.getMemail()%></div>
								<div class="column" <%if(item.getMretireName().equals("대기")){%>style="color: #bbb"<%}%>><%=item.getMretireName()%></div>
								<div class="column" <%if(item.getMretireName().equals("탈퇴")){%>style="color: #ccc"<%}%>><a href="javascript:<%if(item.getMretireName().equals("탈퇴")){%>alert('이미 탈퇴한 회원입니다.')<%}else{%>openModal('retire','<%=item.getMno()%>')<%}%>">탈퇴</a></div>
							</div>
						<%}%>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<div id="modal_wrap" class="modal_wrap">
	<div id="retire" class="modal">
		<div class="text">
			<p>홍길동님의 아이디를 탈퇴처리 하시겠습니까?</p>
			<small>*탈퇴 처리 이후 14일 동안은 해당 이메일로 가입이 불가합니다.</small>
		</div>

		<div class="btn_wrap">
			<a class="btn" href="javascript:closeModal()">취소</a>
			<a class="btn" href="javascript:refundMember()">확인</a>
		</div>
	</div>

	<div id="info" class="modal">
		<div>
			<div class="member_info">
				<div id="mname"><span>이름</span></div>
				<div id="mpnum"><span>전화번호</span></div>
				<div id="memail"><span>이메일</span></div>
				<div id="mid"><span>아이디</span></div>
				<div id="mretire"><span>상태</span></div>
				<div id="mhost"><span>등급</span></div>
				<div id="mjdate"><span>가입일</span></div>
				<div id="mrdate"><span>탈퇴일</span></div>
				<div id="mno" style="display: none;"></div>
			</div>

			<div class="btn_wrap">
				<a class="btn" href="javascript:closeModal()">닫기</a>
				<a id="retire_btn" class="btn" href="javascript:refundMember();">탈퇴</a>
			</div>
		</div>
	</div>
</div>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<script>
/* ================= modal =================== */
function closeModal() {

	let modal_wrap = document.getElementById("modal_wrap");
	
	modal_wrap.style.display = "none";
	document.getElementById("info").style.display   = "none";
	document.getElementById("retire").style.display = "none";

}

function openModal(obj,mno) {
	document.getElementById("info").style.display   = "none";
	document.getElementById("retire").style.display = "none";
	
	let modal_wrap = document.getElementById("modal_wrap");
	let modal      = document.getElementById(obj);
	modal_wrap.style.display = "block";
	modal.style.display      = "block";
	
	
	let param = {
			'mno'   : mno
    }
	$.ajax({
    	
        type: "POST",
        url: projectName+"/memberOneCheck.jsp",
        data: param,
        dataType: 'html',
        beforeSend : function(){
        	//alert("beforeSend");
        },
        success: function (data) {
        	data = data.trim();
        	//alert(data);
        	datalist = data.split("&&");
        	for(i=0; i<datalist.length; i++)
        	{
        		datalist[i] = datalist[i].trim();
        	}
        	
        	if(data != "") {
				$("#mname").html("<span>이름</span>"+datalist[0]);
				$("#mpnum").html("<span>전화번호</span>"+datalist[1]);
				$("#memail").html("<span>이메일</span>"+datalist[2]);
				
				$("#mid").html("<span>아이디</span>"+datalist[3]);
				$("#mretire").html("<span>상태</span>"+datalist[4]);
				$("#mhost").html("<span>등급</span>"+datalist[5]);
				$("#mjdate").html("<span>가입일</span>"+datalist[6]);
				$("#mrdate").html("<span>탈퇴일</span>"+datalist[7]);
				$("#mno").html(datalist[8]);
				
				if($("#retire_btn").css("display") == "none") $("#retire_btn").css("display","inline-block");
				if(datalist[4] == "탈퇴") $("#retire_btn").css("display","none");
        	} else {

				$("#mname").html("없는 회원입니다.");
				$("#mpnum").html("");
				$("#memail").html("");
				
				$("#mid").html("");
				$("#mretire").html("");
				$("#mhost").html("");
				$("#mjdate").html("");
				$("#mrdate").html("");
				
				$("#retire_btn").css("display","none");
        	}
        },
        error: function (request,status,error) {
        	//alert("request="+request+",status="+status+",error="+error);
        	alert("오류가 발생하였습니다.");
        	return false;
        }
        
    });

}

function refundMember() {
	//alert("html=>"+$("#mno").html());
	
	let param = {
			'mno'   : $("#mno").html()
    }
	$.ajax({
    	
        type: "POST",
        url: projectName+"/memberOneRetire.jsp",
        data: param,
        dataType: 'html',
        beforeSend : function(){
        	//alert("beforeSend");
        },
        success: function (data) {
        	data = data.trim();
        	//alert(data);
        	
        	if(data == "TRUE") {
            	alert("탈퇴 처리 되었습니다.");
            	location.reload();
        	} else {
            	alert("FALSE");
        	}
        },
        error: function (request,status,error) {
        	//alert("request="+request+",status="+status+",error="+error);
        	alert("오류가 발생하였습니다.");
        	return false;
        }
        
    });
}
</script>
<%@ include file="./include/footer.jsp" %>