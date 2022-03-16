<%@page pageEncoding="UTF-8" %>
<link href="<%=request.getContextPath()%>/css/slide.css" rel="stylesheet">
	<div class="slide_wrap">
		<div class="wrap">
			<div class="slide_btn_wrap">
				<div class="slide_btn btn_left"></div>
				<div class="slide_btn btn_right"></div>
			</div>
			<div class="slide_radius_btnbox">
				<% for(int i=0; i<5; i++) { %>
					<div class="slide_btns <% if(i==0){%>now<%}%>"></div>
				<% } %>
			</div>
			
			<div class="slide_container">
				<div class="slide_list_wrap">
					<ul>
						<% for(int i=0; i<5; i++) { %>
						<li>
							<div class="slide_flag">이달의<br><b style="color:yellow">PICK</b>
							</div>
							<div class="slide_img">
							</div>
							<div class="slide_infobox">
								<div class="slide_infobox_title">
									<span>축제</span>겨울과 바람과 함께
								</div>
								<div class="slide_infobox_note">
									<p>이 축제는 이런 축제입니다 한번 즐겨보지 않으실?<br>
									<b>[장소]</b>엊쩌고북도 전주시 누누구 누누 <%=i%>-<%=i%></p>
								</div>
								<div class="slide_infobox_btn"><a href="view.jsp">확인하기</a></div>
							</div>
						</li>
						<% } %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		window.onload = function() {
			
			var btn_left  = $('.btn_left'),
				btn_right = $('.btn_right'),
				slide_list_wrap = $('.slide_list_wrap'),
				count = $('.slide_list_wrap').find('ul').find('li').length,
				now   = 0;
			let left;
			
			
			btn_left.click(function(){
				if(now >= 0 && now < count-1) {
					left = slide_list_wrap.find('ul').css('left');
					slide_list_wrap.find('ul').css('left',left.replace('px', '')-650);
					now++;
					
					$('.slide_radius_btnbox').find('div').removeClass('now');
					$('.slide_radius_btnbox').find('div').eq(now).addClass('now');
				}
			});
			
			btn_right.click(function(){
				if(now <= count-1 && now > 0) {
					left = slide_list_wrap.find('ul').css('left');
					slide_list_wrap.find('ul').css('left',(+left.replace('px', '')+650));
					now--;
					
					$('.slide_radius_btnbox').find('div').removeClass('now');
					$('.slide_radius_btnbox').find('div').eq(now).addClass('now');
				}
			});
			
		}
	</script>
</body>
