var thumb_h_img  = null;
var folder = null;
var start = null;

window.addEventListener('DOMContentLoaded', function(){
  thumb_h_img = document.getElementById("thumb_h_img");
  folder = getParameterByName('folder');
  if(folder == null || folder == "") folder = 'test01';

  thumb_h_img.src = "../testlist/" + folder + "/images/h_img.jpg";
  $(thumb_h_img).on('error',function() {
	  start = document.getElementById("start");
	  start.innerHTML = "<div class=\"center error\"><h2>없는 테스트입니다.</h2><a class=\"btn\" href=\"../index.jsp\">메인으로</a></div>";
  });
});

function testStart(no,folder) {
	window.location.href = "progress.jsp?no=" + no + "&folder=" + folder;
} 