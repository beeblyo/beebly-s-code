<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/header.jsp" %>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<link rel="stylesheet" href="/Ego_v.0.2/css/mainslide.css">  		
<div class="main">
	<div class="wrap">
		<div class="slide">
			<h2>인기 테스트 TOP 7</h2>
            <div class="hidden">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                    <%
					ArrayList<TestVO> list = null;
					
					TestDTO dto = new TestDTO();
					list = dto.testReadTop("7");
					if(!(list == null || list.size() == 0))
					{
						for(TestVO item : list)
						{
							%>
                        	<div class="swiper-slide">
                        		<a title="<%=item.getTestTitle()%>" href="/Ego_v.0.2/test/start.jsp?no=<%=item.getTestNumber()%>&folder=<%=item.getFoldername()%>">
                        			<img src="/Ego_v.0.2/testlist/<%=item.getFoldername()%>/images/h_img.jpg">
                        		</a>
                        	</div>
							<%
						}
					}else
					{
						%>
                    	<div class="swiper-slide">
                    		<a title="이런 테스트가 없어요" href="javascript:alert('이런 테스트가 없어요');">
                    			<img src="/Ego_v.0.2/img/placeholder/placeholder.jpg">
                    		</a>
                    	</div>
						<%
					}
					%>
                    </div>
                    <!-- Add Arrows -->
                </div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
<script src="/Ego_v.0.2/js/mainslide.js"></script>
		
		<div class="category">
		<%
		if(c_vo != null)
		{
			for(CategoryVO item : c_vo)
			{
				%>
				<a href="search.jsp?cate=<%=item.getCategoryNumber()%>"><%= item.getCategoryName() %></a>
				<%
			}
		}
		%>
		</div>
		
		<div class="test_list">
			<ul>
				<%
				list = dto.testRead();
				if(!(list == null || list.size() == 0))
				{
					list = dto.testRead();
					for(TestVO item : list)
					{
					%>
					<li>
						<div class="test_view_wrap">
							<a href="/Ego_v.0.2/test/start.jsp?no=<%=item.getTestNumber()%>&folder=<%=item.getFoldername()%>" title="<%=item.getTestTitle()%>">
								<div class="test_view">
									<div>
										<div class="test_cate"><%=item.getCategoryName().split(" ")[0]%></div>
									</div>
									<img alt="title" src="/Ego_v.0.2/testlist/<%=item.getFoldername()%>/images/w_img.jpg">
								</div>
								<div class="test_title"><%=item.getTestTitle()%></div> 
								<div class="test_count">
									<img src="/Ego_v.0.2/img/icon/eye.png"> <%=item.getJoinCount()%>
								</div>
							</a>
						</div>
					</li>
					<%
					}
				}else
				{
					%>
					<p class="no_data">테스트가 없습니다.</p>
					<%
				}
				%>
			</ul>
		</div>
	</div>
</div>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="./include/footer.jsp" %>