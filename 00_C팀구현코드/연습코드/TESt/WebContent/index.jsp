<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>TEST</title>
	<script src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
	
	function save(){
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//스마트 에디터 값을 텍스트컨텐츠로 전달
		var content = document.getElementById("smartEditor").value;
		$("#frm").submit();
	    		// 값을 불러올 땐 document.get으로 받아오기
		return; 
	}
	
	</script>
	</head>
	<body>
	<form action="join.jsp" method="get" id="frm" >
			<div id="se2_sample" style="margin:10px 0;">
			<input type="text" name="id">
				<input id="asd" name="asd" type="button" onclick="save();" value="aa">
			</div>
			<textarea id="txtContent" name="txtContent" rows="10" cols="100" style="width: 100%;"></textarea>
	</form>
		<!-- textarea 밑에 script 작성하기 -->
		<script id="smartEditor" type="text/javascript"> 
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "txtContent",  //textarea ID 입력
			    sSkinURI: "smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
			    fCreator: "createSEditor2",
			    htParams : { 
			    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			        bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : false 
			    }
			});
		</script>
	</body>

</html>