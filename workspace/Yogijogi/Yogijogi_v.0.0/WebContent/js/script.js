
window.onload = function() {

  var myForm = document.getElementById("myForm");
  if(myForm != null) {
    myForm.querySelectorAll('input:not([type=hidden],[type=radio])')[0].focus();
  }

}

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
  }

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

    }

  }

  /* search */
  if(formName == 'search') 
  {
    if($('#key').val() == '') {

      alert("검색어를 입력해주세요.");
      $('#key').focus();
      return false;

    }

  }

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

  }

  /* comment */
  if(formName == 'comment') {

    if($('#post').val() == '') {

      alert("댓글을 입력해주세요.");
      $('#post').focus();
      return false;

    }

  }

  /* recomment */
  if(formName == 'recomment') {

    if($('#repost').val() == '') {

      alert("대댓글을 입력해주세요.");
      $('#repost').focus();
      return false;

    }

  }

  /* pwcheck */
  if(formName == 'pwcheck') {

    if($('#mpw').val() == '') {

      alert("비밀번호를 입력해주세요.");
      $('#mpw').focus();
      return false;

    } else if($('#mpw').val() != '1234') {

      alert("비밀번호가 일치하지 않아요.");
      $('#mpw').focus();
      return false;

    }

  }

  /* info */
  if(formName == 'info') {

    if($('#memail').val() == '') {

      alert("이메일을 입력해주세요.");
      $('#memail').focus();
      return false;

    } else if($('#mpw').val() != '') {

      if($('#mpw').val() != $('#mpwcheck').val()) {

        alert("비밀번호가 일치하지 않아요.");
        $('#mpw').focus();
        return false;

      }

    }

  }

  /* reemail */
  if(formName == 'reemail') {

    if($('#memail').val() == '') {

      alert("이메일을 입력해주세요.");
      $('#memail').focus();
      return false;

    } else {

      alert("작성하신 이메일로 인증 링크를 보냈어요.");
      window.location = 'login.jsp';
      return false;

    }

  }

  return true;

}