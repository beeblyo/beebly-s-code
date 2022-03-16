const projectName = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

window.onload = function() {

	//화면 로드 시 form에 focus
	var myForm = document.getElementById("myForm");
	if(myForm != null) {
		myForm.querySelectorAll('input:not([type=hidden],[type=radio])')[0].focus();
	}

}

//링크 복사하기
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

//폼 체크
function FormCheck(formName) {

  /* login */
  if(formName == 'login') {

    if($('#mid').val() == '') {

      alert("아이디를 입력해주세요.");
      $('#mid').focus();
      return false;

    } else if($('#mpw').val() == '') {

      alert("비밀번호를 입력해주세요.");
      $('#mpw').focus();
      return false;

    }
    
    let param = {
    		mid   : $('#mid').val()
          , mpw   : $('#mpw').val()
    }
    
    $.ajax({
    	
        type: "POST",
        url: projectName+"/memberLoginOk.jsp",
        data: param,
        dataType: 'html',
        beforeSend : function(){
        	//alert("beforeSend");
        },
        success: function (data) {
        	data = data.trim();
        	//alert(data);
        	
        	if(data == "TRUE") {
        		
        		var formElement = document.createElement("form");
        	    formElement.setAttribute("method", "post");
        	    formElement.setAttribute("action", projectName+"/member/loginAction.do");
        	    formElement.setAttribute("target", "_parent");

    	        var hiddenField = document.createElement("input");
    	        hiddenField.setAttribute("name", "mid");
    	        hiddenField.setAttribute("value", $('#mid').val());
    	        formElement.appendChild(hiddenField);
    	        
    	        var hiddenField = document.createElement("input");
    	        hiddenField.setAttribute("name", "mpw");
    	        hiddenField.setAttribute("value", $('#mpw').val());
    	        formElement.appendChild(hiddenField);

        	    document.body.appendChild(formElement);
        	    formElement.submit();
            	
        	} else if(data == "FALSE") {
        		
        		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
        		$('#mid').focus();
        		
        	}
        },
        error: function (request,status,error) {
        	//alert("request="+request+",status="+status+",error="+error);
        	alert("오류가 발생하였습니다.");
        	return false;
        }
        
    });
  } else
  /* join */
  if(formName == 'join') {

    if($('#use_N').is(':checked')) {

      alert("이용약관에 동의해주세요!");
      return false;

    } else if($('#mid').val() == '') {

      alert("아이디를 입력해주세요.");
      $('#mid').focus();
      return false;

    } else if($('#mpw').val() == '') {

      alert("비밀번호를 입력해주세요.");
      $('#mpw').focus();
      return false;

    } else if($('#mpw').val() != $('#mpwcheck').val()) {

      alert("비밀번호가 일치하지 않아요.");
      $('#mpw').focus();
      return false;

    } else if($('#mname').val() == '') {

      alert("이름을 입력해주세요.");
      $('#mname').focus();
      return false;

    } else if($('#first').val() == '' || $('#meddle').val() == '' || $('#last').val() == '') {

      alert("전화번호를 정상적으로 입력해주세요.");
      $('#first').focus();
      return false;

    } else if($('#memail').val() == '') {

      alert("이메일을 입력해주세요.");
      $('#memail').focus();
      return false;

    } else if ($("#mid_mss").css("display") == "block" || $("#mpw_mss").css("display") == "block" || $("#mpwcheck_mss").css("display") == "block" || $("#memail_mss").css("display") == "block") {

        alert("유효하지 않은 정보가 있습니다.");
        $('#mid').focus();
        return false;
    }
    
    return true;

  } else
  /* search */
  if(formName == 'search') 
  {
    if($('#key').val() == '') {

      alert("검색어를 입력해주세요.");
      $('#key').focus();
      return false;

    }
    
    return true;

  } else
  /* write/modify */
  if(formName == 'board') {

    if($('#btitle').val() == '') {

      alert("제목을 입력해주세요.");
      $('#btitle').focus();
      return false;

    } else if($('#bnote').val() == '') {

      alert("내용을 입력해주세요.");
      $('#bnote').focus();
      return false;

    }
    
    return true;

  } else
  /* comment */
  if(formName == 'comment') {

    if($('#post').val() == '') {

      alert("댓글을 입력해주세요.");
      $('#post').focus();
      return false;

    }
    
    return true;

  } else
  /* recomment */
  if(formName == 'recomment') {

    if($('#repost').val() == '') {

      alert("대댓글을 입력해주세요.");
      $('#repost').focus();
      return false;

    }
    
    return true;

  }

  /* pwcheck */
  /* else
  if(formName == 'pwcheck') {

    if($('#mpw').val() == '') {

      alert("비밀번호를 입력해주세요.");
      $('#mpw').focus();
      return false;

    }

	let param = "mpw=" + $('#mpw').val();
    $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/memberPwCheck.jsp",
        data : param,
        success : function(data){
            if($('#mpw').val() != data) {

              $('#mpw').focus();
              return false;

            }
            
        }, error : function(XMLHttpRequest, textStatus, errorThrown){
            alert("비밀번호가 일치하지 않아요.");
        }
    });
    return false;
  }
  */
  else
  /* info */
  if(formName == 'info') {

    if($('#first').val() == '' && $('#middle').val() == '' && $('#last').val() == '') {

      alert("휴대폰 번호를 입력해주세요");
      $('#first').focus();
      return false;

    } else if($('#first').val() == '' || $('#middle').val() == '' || $('#last').val() == '') {

        alert("휴대폰 번호를 정상적으로 입력해주세요");
        $('#first').focus();
        return false;

    } else if($('#mpw').val() != '') {

        if($('#mpw').val() != $('#mpwcheck').val()) {

          alert("비밀번호가 일치하지 않아요.");
          $('#mpw').focus();
          return false;

        }

      }
    
    return true;

  }
  return false;
}