<%@page import="api.ApiVo"%>
<%@page import="api.ApiDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<%
ApiDao dao = new ApiDao();
String[] kind_name = {"S","E","F"};
%>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">

			<div class="container">
				<ul>
				<% for(String view : kind_name) {
					String ko_name = "";
					String en_name = "";
					String kind    = "";
					String etime      = "";
					
					ApiVo vo = dao.selectLastOneApi(view);
					etime      = vo.getETime().replace("/", "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					if(view.equals("S")) {
						ko_name = "공연";
						en_name = "Performance";
						kind    = "S";
					} else if(view.equals("E")) {
						ko_name = "전시";
						en_name = "exhibition";
						kind    = "E";
					} else if(view.equals("F")) {
						ko_name = "축제";
						en_name = "festival";
						kind    = "F";
					}
				%>
					<li>
						<div>
							<div class="main_flag_box">
								<div class="main_flag flag1"><%=en_name%></div>
								<div class="main_flag flag2"><%=ko_name%></div>
								<div class="main_flag flag3">공연 전시 축제 정보를 한눈에! 티켓 구입도 한방에!</div>
							</div>
							<section>
								<div>
									<div class="index_title">
										<a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=vo.getAkind()%>&no=<%=vo.getAno()%>"><%=vo.getSubject()%></a>
									</div>
									<div class="info">
										<span class="main_specific_info">
											<b>날짜: </b> <%=vo.getStartDay()%>~<%=vo.getEndDay()%><br>
											<b>입장료: </b> <%=vo.getAdmfee()%><br>
											<b>시간: </b> <%=etime%><br>
										</span>
										<a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=vo.getAkind()%>&no=<%=vo.getAno()%>">
											<div class="index_btn">
											바로가기
											</div>
										</a>
									</div>
									<div class="more">
										<a href="<%=request.getContextPath()%>/culture/list.do?bkind=<%=kind%>">더보기</a>
									</div>
								</div>
							</section>
						</div>
					</li>
				<%}%>
				</ul>
				<div class="left arrow"></div>
				<div class="right arrow"></div>
			</div>
		</main>
		<script>
			/*if header background is black, change logo picture to white*/
			var logo = document.querySelector(".logo img");
			logo.setAttribute("src","<%=request.getContextPath()%>/img/logo_white_color.png");
			
			window.onload = function() {
				//슬라이드 버튼 클릭 시 슬라이드 하기
				let btn_left  = $('.left'),
					btn_right = $('.right'),
					slide_list_wrap = $('.container'),
					count = $('.container').find('ul').find('li').length,
					now   = 0,
					left  = slide_list_wrap.find('ul').css('left').replace('px', '');
				
				btn_right.click(function(){
					//alert(left);
					if(now >= 0 && now < count-1) {
						slide_list_wrap.find('ul').css('left',+left-window.innerWidth);
						left = +left-window.innerWidth;
						now++;
					}
				});
				
				btn_left.click(function(){
					if(now <= count-1 && now > 0) {
						slide_list_wrap.find('ul').css('left',(+left+window.innerWidth));
						left = +left+window.innerWidth;
						now--;
					}
				});
			}
		</script>
	</body>
</html>
<!-- ============================ 메인 컨텐츠 영역 ================================ -->


