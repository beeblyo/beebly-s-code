<%@page import="javax.mail.internet.NewsAddress"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<script src="/Ego_v.0.2/js/keyword.js" defer="defer"></script>   <!-- keyword 스트립트 	-->
<script>
	function updateKeyword()
	{
		var flag = false;
		var param = "";
		
		var keyword = [];
		var mbti = "";
	    $("input[name='keyword']:checked").each(function(i) {
	    	keyword.push($(this).val());
	    });
	    //alert(keyword);
	    
	    $("input[name='mbti']:checked").each(function(i) {
	    	mbti = $(this).val();
	    });
	    //alert(mbti);
	    
	    param += "?keyword=" + keyword;
	    param += "&mbti=" + mbti;
	    
		$.ajax({
			type: "post",
			url: "./update.jsp" + param,
			dataType: "html",
			async: false,
			success: function(data) {
				data = data.trim();
				//alert(data);
				
				if(data == "TRUE")
				{
					alert("정상적으로 수정 되었습니다.");
					flag = true;
				} else
				{
					alert("수정 중 오류가 발생했습니다.");
					flag = false;
				}
			}
		});
		return flag;
	}
</script>
<%
ArrayList<KeywordVO> all_key = new ArrayList<KeywordVO>();
for(int i=1; i<=20; i++)
{
	String code = "";
	if(i <= 9) code = "00"+i;
	else code = "0"+i;
	
	KeywordVO key = new KeywordVO();
	key.setKeyword(code);
	all_key.add(key);
}
%>
<main>
	<div class="backward_wrap">
		<div class="back_btn">
			<a href="./info.jsp"></a>
		</div>
	</div>
	
	<div>
		<h3>회원정보</h3>
		<form class="join_form" name="join" method="post" action="./info.jsp" onsubmit="return updateKeyword();">
			<div class="info_wrap">
				<div class="keyword_wrap keyword">
						<div>
							<p class="title">선택 키워드</p>
							<div class="select_key">
								<%
								for(KeywordVO key : all_key)
								{
									%>
									<label for="key_<%=key.getKeyword()%>" onclick="setFavKeyword(this);"><%=key.getName()%></label>
									<%
								}
								%>
								
								<label for="mbti_01" onclick="setFalse(this);">ESFP</label>
								<label for="mbti_02" onclick="setFalse(this);">ESFJ</label>
								<label for="mbti_03" onclick="setFalse(this);">ESTP</label>
								<label for="mbti_04" onclick="setFalse(this);">ESTJ</label>
								<label for="mbti_05" onclick="setFalse(this);">ENFP</label>
								<label for="mbti_06" onclick="setFalse(this);">ENFJ</label>
								<label for="mbti_07" onclick="setFalse(this);">ENTP</label>
								<label for="mbti_08" onclick="setFalse(this);">ENTJ</label>
								<label for="mbti_09" onclick="setFalse(this);">ISFP</label>
								<label for="mbti_10" onclick="setFalse(this);">ISFJ</label>
								<label for="mbti_11" onclick="setFalse(this);">ISTP</label>
								<label for="mbti_12" onclick="setFalse(this);">ISTJ</label>
								<label for="mbti_13" onclick="setFalse(this);">INFP</label>
								<label for="mbti_14" onclick="setFalse(this);">INFJ</label>
								<label for="mbti_15" onclick="setFalse(this);">ISTP</label>
								<label for="mbti_16" onclick="setFalse(this);">INTJ</label>
							</div>
						</div>
					
						<div>
							<h3>키워드</h3>
							<div class="key">
								<%
								for(KeywordVO key : all_key)
								{
									%>
									<input id="key_<%=key.getKeyword()%>" name="keyword" type="checkbox" value="<%=key.getKeyword() %>"
									<%
									for(KeywordVO my_key : login.getKeywordList())
									{
										if(key.getKeyword().equals(my_key.getKeyword()))
										{
											%>checked="checked"<%
										}
									}
									%>>
									<label for="key_<%=key.getKeyword()%>" onclick="setFavKeyword(this);"><%=key.getName() %></label>
									<%
								}
								%>
							</div>
			
							<h3>MBTI <span>선택시 취소가 불가능합니다.</span></h3>
							<div class="mbti">
								<input id="mbti_01" type="radio" name="mbti" value="ESFP" <%if(login.getMbti().equals("ESFP")){%>checked="checked"<%}%>>
								<label for="mbti_01" onclick="setMbti(this);">ESFP</label>
								
								<input id="mbti_02" type="radio" name="mbti" value="ESFJ" <%if(login.getMbti().equals("ESFJ")){%>checked="checked"<%}%>>
								<label for="mbti_02" onclick="setMbti(this);">ESFJ</label>
								
								<input id="mbti_03" type="radio" name="mbti" value="ESTP" <%if(login.getMbti().equals("ESTP")){%>checked="checked"<%}%>>
								<label for="mbti_03" onclick="setMbti(this);">ESTP</label>
								
								<input id="mbti_04" type="radio" name="mbti" value="ESTJ" <%if(login.getMbti().equals("ESTJ")){%>checked="checked"<%}%>>
								<label for="mbti_04" onclick="setMbti(this);">ESTJ</label>
								
								<input id="mbti_05" type="radio" name="mbti" value="ENFP" <%if(login.getMbti().equals("ENFP")){%>checked="checked"<%}%>>
								<label for="mbti_05" onclick="setMbti(this);">ENFP</label>
								
								<input id="mbti_06" type="radio" name="mbti" value="ENFJ" <%if(login.getMbti().equals("ENFJ")){%>checked="checked"<%}%>>
								<label for="mbti_06" onclick="setMbti(this);">ENFJ</label>
								
								<input id="mbti_07" type="radio" name="mbti" value="ENTP" <%if(login.getMbti().equals("ENTP")){%>checked="checked"<%}%>>
								<label for="mbti_07" onclick="setMbti(this);">ENTP</label>
								
								<input id="mbti_08" type="radio" name="mbti" value="ENTJ" <%if(login.getMbti().equals("ENTJ")){%>checked="checked"<%}%>>
								<label for="mbti_08" onclick="setMbti(this);">ENTJ</label>
								
								<input id="mbti_09" type="radio" name="mbti" value="ISFP" <%if(login.getMbti().equals("ISFP")){%>checked="checked"<%}%>>
								<label for="mbti_09" onclick="setMbti(this);">ISFP</label>
								
								<input id="mbti_10" type="radio" name="mbti" value="ISFJ" <%if(login.getMbti().equals("ISFJ")){%>checked="checked"<%}%>>
								<label for="mbti_10" onclick="setMbti(this);">ISFJ</label>
								
								<input id="mbti_11" type="radio" name="mbti" value="ISTP" <%if(login.getMbti().equals("ISTP")){%>checked="checked"<%}%>>
								<label for="mbti_11" onclick="setMbti(this);">ISTP</label>
								
								<input id="mbti_12" type="radio" name="mbti" value="ISTJ" <%if(login.getMbti().equals("ISTJ")){%>checked="checked"<%}%>>
								<label for="mbti_12" onclick="setMbti(this);">ISTJ</label>
								
								<input id="mbti_13" type="radio" name="mbti" value="INFP" <%if(login.getMbti().equals("INFP")){%>checked="checked"<%}%>>
								<label for="mbti_13" onclick="setMbti(this);">INFP</label>
								
								<input id="mbti_14" type="radio" name="mbti" value="ISFJ" <%if(login.getMbti().equals("ISFJ")){%>checked="checked"<%}%>>
								<label for="mbti_14" onclick="setMbti(this);">INFJ</label>
								
								<input id="mbti_15" type="radio" name="mbti" value="ISTP" <%if(login.getMbti().equals("ISTP")){%>checked="checked"<%}%>>
								<label for="mbti_15" onclick="setMbti(this);">ISTP</label>
								
								<input id="mbti_16" type="radio" name="mbti" value="INTJ" <%if(login.getMbti().equals("INTJ")){%>checked="checked"<%}%>>
								<label for="mbti_16" onclick="setMbti(this);">INTJ</label>
							</div>
						</div>
						<!-- 메인화면으로 바로 이동 jsp작업할 때 redirect 쓰자 -->
				</div>
			</div>
			<div class="clearfix">
				<input class="re_info_btn btn" type="submit" value="수정완료">
			</div>
		</form>
	</div>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>