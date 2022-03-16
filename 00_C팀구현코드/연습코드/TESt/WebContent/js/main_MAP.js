
window.onload = function()
{
	
	
}
//지도 효과

let cprovin = "";
function SetJido(provin)
{
	//var jido_image = "../image/map/all.png";

	if(cprovin != provin){

		{
	
			switch(provin)
			{
			case "경상북도" : jido_image = "../image/map/Gyeongsang_up.png"; break;
			case "경상남도" : jido_image = "../image/map/Gyeongsang_down.png"; break;
			case "강원도"  : jido_image = "../image/map/gangwon.png"; break;
			case "부산광역시"  	: jido_image = "../image/map/busan.png"; break;
			case "충청북도" : jido_image = "../image/map/chung_up.png"; break;
			case "충청남도" : jido_image = "../image/map/chung_down.png"; break;
			case "경기도" 	: jido_image = "../image/map/Gyeongi.png"; break;
			case "제주특별자치도"		: jido_image = "../image/map/jeju.png"; break;
			case "전라남도"	: jido_image = "../image/map/jeon_down.png"; break;
			case "전라북도"	: jido_image = "../image/map/jeon_up.png"; break;
			case "서울특별시"	: jido_image = "../image/map/seoul.png"; break;
			}
		}
		$("#jidoimg").attr("src",jido_image);
		$('#Provin_title').css('font-size','30px');
		$('#Provin_title').css('text-align','center');
		
		if(provin == '경상북도'){
			$('#Provin_title').html(provin);
		}else if(provin == '강원도'){
			$('#Provin_title').html(provin);
		}else if(provin == '경상남도'){
			$('#Provin_title').html(provin);
		}else if(provin == '부산광역시'){
			$('#Provin_title').html(provin);
		}else if(provin == '충청북도'){
			$('#Provin_title').html(provin);
		}else if(provin == '경기도'){
			$('#Provin_title').html(provin);
		}else if(provin == '제주특별자치도'){
			$('#Provin_title').html(provin);
		}else if(provin == '전라남도'){
			$('#Provin_title').html(provin);
		}else if(provin == '전라북도'){
			$('#Provin_title').html(provin);
		}else if(provin == '충청남도'){
			$('#Provin_title').html(provin);
		}else if(provin == '서울특별시'){
			$('#Provin_title').html(provin);
		}
		cprovin = provin;

	}else{
		var provin = "전국";
		jido_image = "../image/map/all.png";
		$("#jidoimg").attr("src",jido_image);
		$('#Provin_title').html("전국");
		$('#Provin_title').css('font-size','30px');
		$('#Provin_title').css('text-align','center');
		cprovin = "";
	}

	$.ajax({
		type : "get",
		url: "provin.jsp?provin=" + provin,
		dataType: "html",
		success : function(data) 
		{		
			data = data.trim();
			$("#data").html(data);
			$("#City").html(data);
		}		
	})

}

