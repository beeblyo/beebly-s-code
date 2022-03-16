<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<!-- ====================== ���� ������ ���� ==================== -->
<script>
	window.onload = function(){
	<%
	if(login == null)
	{
		%>		
		alert('�α��� ���� �ʾҽ��ϴ�.');
		window.location = "/Ego_v.0.2/index.jsp";
		<%
	}
	%>
	}
	
	function infoModify()
	{
		if($("#nickname").val() == "")
		{
			alert("�г����� �Է����ּ���.");
			nickname.focus();
		}
		
		if( $("#pw").val() != "")
		{
			if($("#pwcheck").val() == "" || $("#pw").val() != $("#pwcheck").val())
			{
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$("#pw").focus();
				return false;
			}
		}
		
		var nickname = $("#nickname").val();
		var pw = $("#pw").val();

		var param = "";
	    param += "?nickname=" + nickname;
	    param += "&pw=" + pw;
	    
		$.ajax({
			type: "post",
			url: "./update.jsp" + param,
			dataType: "html",
			async: false,
			success: function(data) {
				data = data.trim();
				
				if(data == "TRUE")
				{
					alert("���������� ���� �Ǿ����ϴ�.");
					document.modify.submit();
				} else
				{
					alert("���� �� ������ �߻��߽��ϴ�.");
				}
			}
		});
	}
</script>
<main>
	<div class="backward_wrap">
		<div class="back_btn">
			<a href="./info.jsp"></a>
		</div>
	</div>
	
	<div>
		<h3>ȸ������</h3>
		<div class="info_wrap">
			<form name="modify" method="post" action="info.jsp" onsubmit="return false;">
				<div class="clearfix">
					<div class="user_profile">
						<label for="input_file"><img src="/Ego_v.0.2/img/placeholder/profile.jpg"></label>
						<label class="input_file_btn btn" for="input_file">
						 	������ ����
						</label>
						<input id="input_file" type="file" name="profile" accept="image/png, image/jpeg, image/jpg">
						<a class="sec_btn btn" href="javascript:secession();">Ż���ϱ�</a>
					</div>
					<div class="user_contents">
						<p>* ǥ�ø� ������ �����մϴ�.</p>
						<div class="re_info">
							<div>
								<span>�̸���</span>
								<input class="readonly" type="text" name="email" value="${login.id}@${login.email}" readonly="readonly">
							</div>
							<div>
								<span>�г���(*)</span>
								<input id="nickname" type="text" name="nickname" value="${login.nickname}">
							</div>
							<div>
								<span>��й�ȣ(*)</span>
								<input id="pw" type="password" name="pw">
							</div>
							<div>
								<span>��й�ȣ Ȯ��(*)</span>
								<input id="pwcheck" type="password" name="pwcheck">
							</div>
							<div>
								<span>����</span>
								<label><input type="radio" name="gender" value="M" <%if(login.getGender().equals("M")){%>checked="checked"<%}%> disabled="disabled">��</label>
								<label><input type="radio" name="gender" value="F" <%if(login.getGender().equals("F")){%>checked="checked"<%}%> disabled="disabled">��</label>
							</div>
							<div>
								<span>�������</span>
								<input class="readonly" type="text" name="birth" value="${login.bdate}" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="btn_wrap">
					<input class="re_info_btn btn" type="submit" value="�����Ϸ�" onclick="infoModify();">
				</div>
			</form>
		</div>
	</div>
</main>
<!-- ====================== ���� ������ �� ==================== -->
<%@ include file="../include/footer.jsp" %>