<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/config.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Ego_join</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- 공통 스타일 		-->
		<link href="/Ego_v.0.2/css/login.css" rel="stylesheet">       <!-- admin 스타일	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- 제이쿼리 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer" charset="euc-kr"></script> <!-- 공통 스트립트 		-->
		<script src="/Ego_v.0.2/js/join.js" defer="defer" charset="euc-kr"></script>   <!-- join 스트립트 	-->
		<link href="/Ego_v.0.2/css/animation.css" rel="stylesheet">   <!-- animation	-->
	</head>
	<!-- ====================== 메인 컨텐츠 시작 ==================== -->
	<body>
		<div class="join wrap">
			<form class="join_form" name="join" method="post" action="joinok.jsp" onsubmit="return confirm('가입하시겠습니까?');">
				<h1>
					<a class="b_logo" href="/Ego_v.0.2/index.jsp"></a>
				</h1>
				<div class="join_wrap">
					<a class="back_btn" href="javascript:back();">◀</a>
					
					<div id="step01" class="assent_wrap">
						<div class="assent">
							
						</div>
						
						<div class="center">
							<input id="assentY" type="radio" name="assent" value="Y"><label for="assentY">동의합니다.</label>
							<input id="assentN" type="radio" name="assent" value="N"><label for="assentN">동의하지 않습니다.</label><br>
							
							<div class="btn_wrap">
								<input class="next_btn btn" type="button" value="다음" onclick="formCheck(1);">
							</div>
						</div>
					</div>
					
					<div id="step02" class="info_wrap">
						<p>
							<input type="text" id="id" name="id" placeholder="아이디"> @
							<select id="email" name="email">
								<option value="naver.com">naver.com
								<option value="gmail.com">gmail.com
								<option value="daum.com">daum.com
							</select>
						</p>
						<p><input type="text" id="mailnumber" name="mailnumber" placeholder="인증번호"></p>
						
						<div class="center btn_wrap">
							<input class="certify_btn btn" type="button" value="인증번호 발송" onclick="formCheck(2);">
							<input class="next_btn btn" type="button" value="다음" onclick="formCheck(2);">
						</div>
					</div>
				
					<div id="step03" class="info_wrap">
						<p><input type="password" id="pw" name="pw" placeholder="비밀번호"></p>
						<p><input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호확인"></p>
						<p><input type="text" id="nickname" name="nickname" placeholder="닉네임"></p>
						<p class="genders center">
							<label><input type="radio" class="gender" name="gender" value="M" checked="checked">남</label>
							<label><input type="radio" class="gender" name="gender" value="F">여</label>
						</p>
						<p>
							<div id="birth" class="center">
								<select name="year">
								<%
								for(int i=2022; i>=1930; i--)
								{
									%>
									<option value="<%=i%>"><%=i%></option>
								 	<%
								 }
								 %>
							     </select>년&nbsp;
							     <select name="month">
							     <%
								for(int i=1; i<=12; i++)
								{
									%>
									<option value="<%=i%>"><%=i%></option>
								 	<%
								 }
								 %>
							     </select>월&nbsp;
							     <select name="day">
							     <%
								for(int i=1; i<=31; i++)
								{
									%>
									<option value="<%=i%>"><%=i%></option>
								 	<%
								 }
								 %>
							     </select>일
							</div>
						</p>
	
						<div class="center btn_wrap">
							<input class="next_btn btn" type="button" value="다음" onclick="formCheck(3);">
						</div>
					</div>
			
					<div id="step04" class="keyword">
						<h3>키워드<span> (선택사항)</span></h3>
						<div class="key">
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
							
							for(KeywordVO key : all_key)
							{
								%>
								<input id="key_<%=key.getKeyword()%>" name="keyword" type="checkbox" value="<%=key.getKeyword() %>">
								<label for="key_<%=key.getKeyword()%>" onclick="setFavKeyword(this);"><%=key.getName() %></label>
								<%
							}
							%>
						</div>
		
						<h3>MBTI<span> (선택사항)</span></h3>
						<div class="mbti">
							<input id="mbti_01" type="radio" name="mbti" value="ESFP">
							<label for="mbti_01">ESFP</label>
							
							<input id="mbti_02" type="radio" name="mbti" value="ESFJ">
							<label for="mbti_02">ESFJ</label>
							
							<input id="mbti_03" type="radio" name="mbti" value="ESTP">
							<label for="mbti_03">ESTP</label>
							
							<input id="mbti_04" type="radio" name="mbti" value="ESTJ">
							<label for="mbti_04">ESTJ</label>
							
							<input id="mbti_05" type="radio" name="mbti" value="ENFP">
							<label for="mbti_05">ENFP</label>
							
							<input id="mbti_06" type="radio" name="mbti" value="ENFJ">
							<label for="mbti_06">ENFJ</label>
							
							<input id="mbti_07" type="radio" name="mbti" value="ENTP">
							<label for="mbti_07">ENTP</label>
							
							<input id="mbti_08" type="radio" name="mbti" value="ENTJ">
							<label for="mbti_08">ENTJ</label>
							
							<input id="mbti_09" type="radio" name="mbti" value="ISFP">
							<label for="mbti_09">ISFP</label>
							
							<input id="mbti_10" type="radio" name="mbti" value="ISFJ">
							<label for="mbti_10">ISFJ</label>
							
							<input id="mbti_11" type="radio" name="mbti" value="ISTP">
							<label for="mbti_11">ISTP</label>
							
							<input id="mbti_12" type="radio" name="mbti" value="ISTJ">
							<label for="mbti_12">ISTJ</label>
							
							<input id="mbti_13" type="radio" name="mbti" value="INFP">
							<label for="mbti_13">INFP</label>
							
							<input id="mbti_14" type="radio" name="mbti" value="ISFJ">
							<label for="mbti_14">INFJ</label>
							
							<input id="mbti_15" type="radio" name="mbti" value="ISTP">
							<label for="mbti_15">ISTP</label>
							
							<input id="mbti_16" type="radio" name="mbti" value="INTJ">
							<label for="mbti_16">INTJ</label>
						</div>
						<!-- 메인화면으로 바로 이동 jsp작업할 때 redirect 쓰자 -->
						<div class="center btn_wrap">
							<input class="btn" type="submit" value="회원가입 완료">
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<script>
			document.addEventListener('keydown', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			}, true);
		</script>
	</body>
	<!-- ====================== 메인 컨텐츠 끝 ==================== -->
</html>