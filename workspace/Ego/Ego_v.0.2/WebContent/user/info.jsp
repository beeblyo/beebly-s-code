<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/slide.css">
<script src="../js/slide.js"></script>

<%
if(login == null)
{
	%>
	<script>
		alert('로그인 해주세요');
		window.location = "/Ego_v.0.2/login/login.jsp";
	</script>
	<%
} else
{
%>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<main>
	<div class="backward_wrap">
		<div class="back_btn">
			<a href="/Ego_v.0.2/index.jsp"></a>
		</div>
	</div>
	
	<div>
		<h3>회원정보</h3>
		<div class="info_wrap">
			<div class="clearfix">
				<div class="user_profile">
					<img src="/Ego_v.0.2/img/placeholder/profile.jpg">
					<p>${login.nickname}</p>
					<a class="mod_btn btn" href="javascript:OpenModal();">회원정보수정</a>
					<a class="logout_btn btn" href="/Ego_v.0.2/login/logout.jsp">로그아웃</a>
				</div>
				<div class="user_contents">
					<div>
						<p class="title">키워드</p>
						
						<a href="keyword.jsp">▶</a>
						<div class="keyword">
						<%
						for(KeywordVO key : login.getKeywordList())
						{
							%>
							<label><%= key.getName() %></label>
							<%
						}
						%>
						</div>
						
						<p class="title">MBTI</p>
						<div class="keyword">
							<%
							if(!(login.getMbti() == "" || login.getMbti() == null))
							{
								%>
								<label><%= login.getMbti() %></label>
								<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			
			<div class="info_swiper">
				<div class="user_recommend">
					<p class="title">찜한 테스트</p>
					<div class="slideShow">
						<ul class="slides">
							<%
							BookmarkDTO b_dto = new BookmarkDTO();
							if(b_dto.isBookmark(login.getNo()))
							{
								ArrayList<BookmarkVO> b_ary = new ArrayList<BookmarkVO>();
								b_ary = b_dto.bookmarkIndex(login.getNo());
								if(!(b_ary == null || b_ary.size() == 0))
								{
									
									System.out.println("성공!");
									//System.out.println("getno : " + login.getNo());
						
									for(BookmarkVO item : b_ary)
									{
										%>
			                        	<li>
			                        		<a title="<%=item.getTitle()%>" href="/Ego_v.0.2/test/start.jsp?no=<%=item.getTest_Number()%>&folder=<%=item.getFolder()%>">
			                        			<img src="/Ego_v.0.2/testlist/<%=item.getFolder()%>/images/h_img.jpg">
			                        		</a>
			                        	</li>
										<%
									}
								}else
								{
									%>
			                    	<li class="no_test">테스트가 없어요</li>
									<%
								}
							}
							%>
						</ul>
					</div>
				</div>
				<p class="controller">
					<span class="prev"><img src="/Ego_v.0.2/img/icon/back_btn.png"></span>
					<span class="next"><img src="/Ego_v.0.2/img/icon/next_btn.png"></span>
				</p>
			</div>
			
			<div class="info_swiper">
				<div class="user_record">
					<p class="title">내가 한 테스트</p>
					<div class="slideShow">
						<ul class="slides">
							<%
							TestRecordDTO recorddto = new TestRecordDTO();
							ArrayList<TestRecordVO> ary = new ArrayList<TestRecordVO>();
							ary = recorddto.Read(login.getNo());
							if(!(ary == null || ary.size() == 0))
							{
								
								System.out.println("성공!");
								//System.out.println("getno : " + login.getNo());
					
								for(TestRecordVO item : ary)
								{
									%>
		                        	<li>
		                        		<a title="<%=item.getTitle_name()%>" href="/Ego_v.0.2/test/result.jsp?no=<%=item.getNo()%>&folder=<%=item.getFolder_name()%>#<%=item.getMBTI()%>">
		                        			<img src="/Ego_v.0.2/testlist/<%=item.getFolder_name()%>/images/h_img.jpg">
		                        		</a>
		                        	</li>
									<%
								}
							}else
							{
								%>
			                    	<li class="no_test">테스트가 없어요</li>
								<%
							}
							%>
						</ul>
					</div>
				</div>
				<p class="controller">
					<span class="prev"><img src="/Ego_v.0.2/img/icon/back_btn.png"></span>
					<span class="next"><img src="/Ego_v.0.2/img/icon/next_btn.png"></span>
				</p>
			</div>
		</div>
	</div>
	
	<div class="background modal_back">
		<div class="modal">
			<h3>비밀번호 확인</h3>
			<form name="pwcheck" method="post" action="modify.jsp" onsubmit="return pwCheck();">
				<input id="pw" type="password" name="pw" placeholder="비밀번호 확인" autofocus><br>
				<input class="btn" type="submit" value="확인">
				<input class="btn" type="button" value="취소" onclick="CloseModal();">
			</form>
		</div>
	</div>
</main>
<script>
	function pwCheck()
	{
		var flag = true;
		var pw = $("#pw").val();
		$.ajax({
			type: "get",
			url: "./pwCheck.jsp?pw="+pw,
			dataType: "html",
			async: false,
			success: function(data) {
				data = data.trim();
				
				if(data == "TRUE")
				{
					flag = true;
				} else
				{
					alert("비밀번호가 틀렸습니다.");
					flag = false;
					$("#pw").focus();
				}
			}
		});
		return flag;
	}
</script>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%} %>
<%@ include file="../include/footer.jsp" %>