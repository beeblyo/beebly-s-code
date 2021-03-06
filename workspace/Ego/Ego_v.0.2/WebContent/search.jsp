<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/header.jsp" %>
<%@ page import="ego.dbms.*" %>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<%
/*************검색 키워드 값 받아서 DB에 저장하는 로직****************/
System.out.println(keywords);

if(keywords != null && !keywords.equals(""))
{
	sql  = "insert into search_record (s_recent) ";
	sql += "values ('" + keywords + "')";
	dbms.RunSQL(sql);
}

String cate = request.getParameter("cate");

ArrayList<TestVO> list = null;

TestDTO dto = new TestDTO();
list = dto.testRead("",cate,keywords);
%>
<div class="main">
	<div class="wrap">
		<div class="search_result">
			“<b><%= keywords %></b>”검색 결과 <b><%= list.size() %></b>개
		</div>
		<div class="test_list">
			<ul>
				<%
				
				if(!(list == null || list.size() == 0))
				{
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
				} else
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