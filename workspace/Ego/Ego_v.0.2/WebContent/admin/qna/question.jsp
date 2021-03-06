<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String kind   = request.getParameter("kind");

if(kind == null) kind ="Q";

//페이징을 위한 변수 선언
int total   = 0;  //전체 게시물 갯수
int maxpage = 0;  //최대 페이지 갯수
int curpage = 0;  //현재 페이지 번호

int startno = 0;  //SQL limit 시작 번호
int startBlock = 0; //페이징 시작 블럭 번호
int endBlock   = 0; //페이징 끝 블럭 번호

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
sql += "from board ";
sql += "where b_kind = '" + kind + "' ";

dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInt("count");

maxpage = total / 15;
if( total % 15 != 0) maxpage++;

startno = (curpage - 1) * 15;

sql  = "select b_no,u_no,b_title,b_kind,date(b_date) as b_date,b_ansnote,";
sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
sql += "from board ";
sql += "where b_kind = 'Q' ";

sql += "order by b_no desc ";
sql += "limit " + startno + ",15 ";

dbms.OpenQuery(sql);

//(9)페이징 시작블럭번호와 끝블럭 번호를 계산한다.
startBlock = ( (curpage - 1)  / 10) * 10 + 1;
endBlock   = startBlock + 10 - 1; 

//(10)endBlock 이 최대 페이지 번호보다 크면 안됨.
if( endBlock > maxpage)
{
	//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
	endBlock = maxpage;
}

%>

<main>
	<form class="search" name="search" method="post" action="question.jsp">
		<select>
			<option>회원번호</option>
			<option>닉네임</option>
			<option>제목</option>
		</select>
		<input id="key" type="text" name="key">
		<input class="btn" type="submit" value="검색">
	</form>
		
	
	<div class="content_from">
		<form class="question">
			<!-- ===== 미답변만 보이도록 하는 버튼 ===== -->
			<div class="answer_filter">
				<a href="#" class="no_answer now">미답변</a>
				<a href="#" class="all_answer">전체</a>
			</div>
			<!-- ===== 미답변만 보이도록 하는 버튼 ===== -->
			
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">번호</div>
						<div class="column">문의 제목</div>
						<div class="column">작성자</div>
						<div class="column">작성일</div>
						<div class="column">답변여부</div>
					</div>
				</div>
				<div class="tbody">
					<%
					while(dbms.GetNext() == true)
					{	
						String bno = dbms.GetValue("b_no");
						String uno = dbms.GetValue("u_no");
						String btitle = dbms.GetValue("b_title");
						String bkind = dbms.GetValue("b_kind");
						String bdate = dbms.GetValue("b_date");
						String unick = dbms.GetValue("u_nickname");
						String anote = dbms.GetValue("b_ansnote");
						%>
						<div class="row">
							<div class="column"><input type="checkbox"></div>
							<div class="column"><%= bno %></div>
							<div class="column"><a href="view.jsp?tab=5&kind=<%= bkind %>&page=<%= curpage %>&no=<%= bno %>"><%= btitle %></a></div>
							<div class="column"><%= unick %></div>
							<div class="column"><%= bdate %></div>
							<div class="column">
							<%
							if( anote != null)
							{
								%>
								답변함
								<% 
							}else
							{
								%>
								<b style="color:#6667ab">확인중</b>
								<% 
							}
							%>
							</div>
						</div>
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
					%><a href="question.jsp?tab=5&kind=<%= kind %>&page=<%= startBlock - 1 %>">이전 페이지</a> | <%
				}		
				//(3, 4, 11)최대 페이지 갯수 만큼 페이지를 표시한다.
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						//현재 페이지와 같은 경우 빨간색으로 표시
						%><a href="question.jsp?tab=5&kind=<%= kind %>&page=<%= pageno %>" style="color:darkred;"><%= pageno %></a> | <%
					}else
					{
						%><a href="question.jsp?tab=5&kind=<%= kind %>&page=<%= pageno %>"><%= pageno %></a> | <%
					}
				}	
				//(12) 다음 블럭을 출력한다.
				if( endBlock < maxpage)
				{
					%><a href="question.jsp?tab=5&kind=<%=kind%>&page=<%= endBlock + 1 %>">다음 페이지</a><%
				}
				%>
				</ul>
			</div>
			
			<input class="del_btn btn" type="button" value="삭제하기">		
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>