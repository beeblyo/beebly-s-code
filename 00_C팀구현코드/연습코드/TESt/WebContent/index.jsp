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
	    		//����Ʈ ������ ���� �ؽ�Ʈ�������� ����
		var content = document.getElementById("smartEditor").value;
		$("#frm").submit();
	    		// ���� �ҷ��� �� document.get���� �޾ƿ���
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
		<!-- textarea �ؿ� script �ۼ��ϱ� -->
		<script id="smartEditor" type="text/javascript"> 
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "txtContent",  //textarea ID �Է�
			    sSkinURI: "smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html ��� �Է�
			    fCreator: "createSEditor2",
			    htParams : { 
			    	// ���� ��� ���� (true:���/ false:������� ����) 
			        bUseToolbar : true, 
				// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����) 
				bUseVerticalResizer : false, 
				// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����) 
				bUseModeChanger : false 
			    }
			});
		</script>
	</body>

</html>