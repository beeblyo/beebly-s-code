var folder = null;
var features = [];
var powerName = ["","",""];
var powerDisc = ["","",""];
var harmony=[];
var text2 = null;
var text3 = null;
var discription = null;
var resultImage = null;
var goodImage = null;
var badImage = null;
var goodPower = null;
var badPower = null;

var winH = window.innerHeight;
var scrollY = window.scrollY;
var animElements = [];

/* =============== 각 값 가져오기 =============== */
function initElements()
{
    text2        = document.getElementById("text2");
    text3        = document.getElementById("text3");
    discription  = document.getElementById("discription");
    resultImage  = document.getElementById("resultImage");
    goodImage    = document.getElementById("goodImage");
    badImage     = document.getElementById("badImage");
    goodPower    = document.getElementById("goodPower");
    badPower     = document.getElementById("badPower");
}

/* =============== 파일 가져오기 =============== */
window.addEventListener('DOMContentLoaded', function(){
  initElements();
  folder = getParameterByName('folder');
	  
  var type = window.location.hash.slice(1);
  if(type == null || type == "") type="ENFJ";
  //var rawData = loadFile("results/"+type+".txt");
  var featuresRaw = loadFile("../../testlist/" + folder + "/datas/results/"+type+".txt");
  var harmonyRaw = loadFile("../../testlist/harmonyData.txt");
  var powersRaw = loadFile("../../testlist/" + folder + "/datas/MBTItoPowerData.txt");
  var sentances = featuresRaw.split('\n');
  for (var i =0; i<sentances.length; i++) {
    if(sentances[i]=='')
      continue;
      features.push(sentances[i].slice(1));
  }
  sentances = harmonyRaw.split('\n');
  if(sentances != '')
  {
	  for(var i=0; i<sentances.length; i++) {
	    if(sentances[i]=='') continue;
	
	    var words = sentances[i].split('#');
	    if(words[0] == type)
	    {
	      harmony.push(words[1]);
	      harmony.push(words[2]);
	    }
	  }
	  sentances = powersRaw.split('\n');
	  for(var i=0; i<sentances.length; i++) {
	    if(sentances[i]=='') continue;
	    var words = sentances[i].split('#');
	    if(words[0] == type)
	    {
	      powerName[0] = words[1];
	      powerDisc[0] = words[2];
	    }
	    else if(words[0] == harmony[0])
	    {
	      powerName[1] = words[1];
	      powerDisc[1] = words[2];
	    }
	    else if(words[0] == harmony[1])
	    {
	      powerName[2] = words[1];
	      powerDisc[2] = words[2];
	    }
	  }
	
	  text2.innerHTML = powerName[0];
	  text3.innerHTML = powerDisc[0];
	  goodPower.innerHTML = powerName[1];
	  badPower.innerHTML = powerName[2];
	  var tstr = "";
	  for(var i=0; i<features.length; i++) tstr += "<li>"+features[i]+"</li>";
	  discription.innerHTML = tstr;

	  resultImage.src = "../testlist/" + folder + "/images/results/"+type+".jpg";
	  goodImage.src = "../testlist/" + folder + "/images/results/"+harmony[0]+".jpg";
	  badImage.src = "../testlist/" + folder + "/images/results/"+harmony[1]+".jpg";
  } else
  {
	 var result = document.getElementById("result");
	 result.innerHTML = "<div class=\"center error\"><h2>없는 테스트입니다.</h2><a class=\"btn\" href=\"../index.jsp\">메인으로</a></div>";
	  
  }

});

function loadImage(path, id)
{
  var img = document.createElement("img");
  img.setAttribute("src",path);
  img.id = id;
  return img;
}
 
