<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<% 

String bno = request.getParameter("no");
BoardDTO dto = new BoardDTO();

BoardVO vo = dto.Read(bno);
%>
<main>
	<div class="wrap">
		<div class="preview">
			<h3><a href="/Ego_v.0.2/admin/user/user.jsp?tab=1">회원</a></h3>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">이메일</div>
						<div class="column">닉네임</div>
						<div class="column">가입일자</div>
					</div>
				</div>
				<div class="tbody">
					<%
					UserDTO u_dto = new UserDTO();
					ArrayList<UserVO> u_list = null;
					
					u_list = u_dto.testRead("7");
					if(u_list != null)
					{
						for(UserVO item : u_list)
						{
							%>
							<div class="row">
								<div class="column"><%=item.getNo()%></div>
								<div class="column"><a href="user/info.jsp?no=<%=item.getNo()%>" onclick="window.open(this.href, '_blank', 'width=560, height=600, top=60, left=250'); return false;"><%=item.getEmailAll()%></a></div>
								<div class="column"><%=item.getNickname()%></div>
								<div class="column"><%=item.getBdate()%></div>
							</div>
							<%
						}
					}
					%>
				</div>
			</div>
		</div>
		<div class="preview  test">
			<h3><a href="/Ego_v.0.2/admin/test/test.jsp?tab=2">테스트</a></h3>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">테스트 이름</div>
						<div class="column">참여수</div>
						<div class="column">게시일자</div>
					</div>
				</div>
				<div class="tbody">
					<%
					TestDTO t_dto = new TestDTO();
					ArrayList<TestVO> t_list = null;
					
					t_list = t_dto.testRead("7");
					if(t_list != null)
					{
						for(TestVO item : t_list)
						{
							%>
							<div class="row">
								<div class="column"><%=item.getTestNumber()%></div>
								<div class="column"><a href="./test/view.jsp?tab=2&no=<%=item.getTestNumber()%>"><%=item.getTestTitle()%></a></div>
								<div class="column"><%=item.getJoinCount()%></div>
								<div class="column"><%=item.getPostdate().split(" ")[0]%></div>
							</div>
							<%
						}
					}
					%>
				</div>
			</div>
		</div>
		<div class="preview">
			<h3><a href="/Ego_v.0.2/admin/category/category.jsp?tab=4">공지사항</a></h3>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">제목</div>
						<div class="column">작성자</div>
						<div class="column">작성일</div>
					</div>
				</div>
				<div class="tbody">
					<%
					for(int i=1; i<=7; i++)
					{
						%>
						<div class="row">
							<div class="column"><%= i %></div>
							<div class="column"><a href="#">공지사항입니다.</a></div>
							<div class="column">관리자</div>
							<div class="column">2021-12-30</div>
						</div>
						<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="preview category">
			<h3><a href="/Ego_v.0.2/admin/notice/notice.jsp?tab=3">카테고리</a></h3>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">카테고리 명</div>
					</div>
				</div>
				<div class="tbody">
					<div class="row">
						<div class="column">1</div>
						<div class="column"><a href="#">연애 테스트</a></div>
					</div>
					<div class="row">
						<div class="column">2</div>
						<div class="column"><a href="#">심리 테스트</a></div>
					</div>
					<div class="row">
						<div class="column">3</div>
						<div class="column"><a href="#">공포 테스트</a></div>
					</div>
					<div class="row">
						<div class="column">4</div>
						<div class="column"><a href="#">운세</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>