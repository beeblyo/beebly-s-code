<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String kind   = request.getParameter("kind");

String key = request.getParameter("key");
if(key == null) key = "";
String cate = request.getParameter("cate");
if(cate == null) cate = "";

//페이징을 위한 변수 선언
int total   = 0;  //전체 게시물 갯수
int maxpage = 0;  //최대 페이지 갯수
int curpage = 0;  //현재 페이지 번호

int startno = 0;  //SQL limit 시작 번호
int startBlock = 0; //페이징 시작 블럭 번호
int endBlock   = 0; //페이징 끝 블럭 번호
int paging_num = 15;//페이지에 뿌려질 글 갯수

//(5)"index.jsp?page=1"에서 넘어온 page를 분석한다.
if( request.getParameter("page") != null)
{
	//넘어온 page 값을 정수형 curpage로 변환한다.
	curpage = Integer.parseInt(request.getParameter("page"));
}else
{
	//넘어온 page 값이 없으므로 현재 페이지 번호를 1로 설정한다.
	curpage = 1;
}

String sql = "";
sql  = "select count(*) as count ";
sql += "from test ";

dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInt("count");

maxpage = total / paging_num;
if( total % paging_num != 0) maxpage++;

startno = (curpage - 1) * paging_num;

ArrayList<TestVO> list = null;

TestDTO dto = new TestDTO();
list = dto.testRead(""+paging_num,""+startno,cate,key);

//(9)페이징 시작블럭번호와 끝블럭 번호를 계산한다.
startBlock = ( (curpage - 1)  / paging_num) * 10 + 1;
endBlock   = startBlock + paging_num - 1; 

//(10)endBlock 이 최대 페이지 번호보다 크면 안됨.
if( endBlock > maxpage)
{
	//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
	endBlock = maxpage;
}
%>
<main>
	<form class="search" name="search" method="post" action="test.jsp?tab=2">
		<select name="cate"> 
			<option value="">전체</option>
			<%
			ArrayList<CategoryVO> c_vo = null;
			CategoryDTO c_dto = new CategoryDTO();
			
			c_vo = c_dto.categoryRead();

			if(c_vo != null)
			{
				for(CategoryVO item : c_vo)
				{
					%>
					<option value="<%=item.getCategoryNumber()%>" <%if(cate.equals(item.getCategoryNumber())){%>selected="selected"<%}%>><%=item.getCategoryName().split(" ")[0]%></option>
					<%
				}
			}
			%>
		</select>
		<input id="key" type="text" name="key">
		<input class="btn" type="submit" value="검색">
	</form>
		
	<div class="content_from">
		<form class="test">
			<a href="write.jsp?tab=2" class="write_btn btn">글 쓰기</a>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">번호</div>
						<div class="column">테스트 이름</div>
						<div class="column">참여자 수</div>
						<div class="column">게시일자</div>
					</div>
				</div>
				<div class="tbody">
					<%
					if(!(list == null || list.size() == 0))
					{
						for(TestVO item : list)
						{
						%>
						<div class="row">
							<div class="column"><input type="checkbox"></div>
							<div class="column"><%= item.getTestNumber() %></div>
							<div class="column"><a href="view.jsp?tab=2&no=<%=item.getTestNumber()%>"><%= item.getTestTitle() %></a></div>
							<div class="column"><%= item.getJoinCount() %></div>
							<div class="column"><%= item.getPostdate().split(" ")[0] %></div>
						</div>
						<%
						}
					} else
					{
						%>
						<div class="error">글이 없습니다.</div>
						<%
					}
					%>
				</div>
			</div>
			
			<div class="paging">
				<ul>
				<%
				if( startBlock >= 10 )
				{
					%><a href="test.jsp?tab=2&page=<%= startBlock - 1 %>">이전 페이지</a> | <%
				}		
				//(3, 4, 11)최대 페이지 갯수 만큼 페이지를 표시한다.
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					%>
					<a href="test.jsp?tab=2&page=<%= pageno %>" <%if(curpage == pageno){%> class="now"<%}%>><%= pageno %></a> | 
					<%
				}	
				//(12) 다음 블럭을 출력한다.
				if( endBlock < maxpage)
				{
					%><a href="notice.jsp?tab=2&page=<%= endBlock + 1 %>">다음 페이지</a><%
				}
				%>
				</ul>
			</div>
			
			<input class="del_btn btn" type="button" value="삭제하기" onclick="javascript:alert('준비중입니다.');">		
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>