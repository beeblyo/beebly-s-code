<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">

<%
ReplyDao rd = new ReplyDao();
MemberVo mv = new MemberVo();

String bkind = (String)request.getAttribute("bkind");
String page2 = (String)request.getAttribute("page");
String key = (String)request.getAttribute("key");
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
//ListDTO dto = new ListDTO(search);
//int total = dto.GetTotal();
BoardDao bd = new BoardDao();
int total = bd.boardTotal(bkind, key);
int maxpage = 0;  //최대 페이지 갯수
int curpage = 0;  //현재 페이지 번호

int startno = 0;  //SQL limit 시작 번호
int startBlock = 0; //페이징 시작 블럭 번호
int endBlock   = 0; //페이징 끝 블럭 번호

maxpage = total / 10;
if( total % 10 != 0) maxpage++;

//(5)"index.jsp?page=1"에서 넘어온 page를 분석한다.

	//넘어온 page 값을 정수형 curpage로 변환한다.
curpage = Integer.parseInt(page2);


startno = (curpage - 1) * 10;

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
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<script>
function DoSearch(obj)
{
	document.location = "<%=request.getContextPath()%>/board/board.do?bkind=" + obj.value;
}
</script>	
	<div class="wrap">
		<div class="board_wrap">
			<div class="title">
				<h2>요기조기 주막</h2>
				<p>회원분들이 자유롭게 글을 게시할 수 있습니다.</p>
			</div>
			
			<div class="search_wrap clearfix">
				<form id="myForm" class="clearfix" name="search" method="post" action="<%= request.getContextPath() %>/board/board.do" onsubmit="return FormCheck('search');">
					<div>
						<select name="bkind" onchange="DoSearch(this);">
						<% if(bkind.equals("A"))
						{
							%>
							<option value="A" selected>전체</option>
							<option value="S">공연</option>
							<option value="E">전시</option>
							<option value="F">축제</option>
					 		<%
						}else if(bkind.equals("S"))
						{
							%>
							<option value="A">전체</option>
							<option value="S" selected>공연</option>
							<option value="E">전시</option>
							<option value="F">축제</option>
							<%
						}else if(bkind.equals("E"))
						{
							%>
							<option value="A">전체</option>
							<option value="S">공연</option>
							<option value="E" selected>전시</option>
							<option value="F">축제</option>
							<%
						}else if(bkind.equals("F"))
						{
							%>
							<option value="A">전체</option>
							<option value="S">공연</option>
							<option value="E">전시</option>
							<option value="F" selected>축제</option>
							<%
						}
						%>		
						</select>
					</div>
						<div class="search">	
							<input type="hidden" name="bkind" value="<%=bkind %>">
							<input type="hidden" name="page" value="<%=page2%>">				
							<input id="key" type="text" name="key" value="<%=key%>">
							<input class="btn" type="submit" value="검색">	
						</div>					
					<% 
					if(login != null)
					{
						%>
						<div class="btn_wrap">
							<a class="btn" href="<%=request.getContextPath() %>/board/boardwrite.do">글쓰기</a>
						</div>
						<%
					}else
					{
						
					}
					%>
				</form>
			</div>
			
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">구분</div>
						<div class="column">제목</div>
						<div class="column">작성자</div>
						<div class="column">작성일</div>
						<div class="column">조회수</div>
					</div>
				</div>	
				<div class="tbody">
				<%
		
				for(BoardVo bv : alist) 
				{	
					
					%>
					<div class="row">
						<div class="column"><%= bv.getBno() %></div>
						<div class="column"><%= bv.getKindName() %></div>
						<div class="column"><a href="<%=request.getContextPath()%>/board/boardview.do?bno=<%=bv.getBno()%>"><span><%=bv.getBtopic()%></span>
						<%= bv.getBtitle() %><%int rtotal = rd.getListTotal(bv.getBno()); if(rtotal != 0)
						{
							%><span class="replycolor">(<%= rtotal %>)</span><% 
						}
						%>
						</a></div>
						<div class="column"><%= bv.getMname() %></div>
						<div class="column"><%= bv.getBwdate() %></div>
						<div class="column"><%= bv.getBhit() %></div>
					</div>
					<%
					
				}
				%>
				</div>
			</div>
			
			<div class="paging">
				<ul>
				<%
				if( startBlock >= 10)
				{
					%><li><a href="<%=request.getContextPath() %>/board/board.do?bkind=<%= bkind %>&page=<%= startBlock - 1 %>">◀</a></li><%	
				}
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						%><li><a href="<%=request.getContextPath() %>/board/board.do?bkind=<%= bkind %>&page=<%= pageno %>" class="now"><%= pageno %></a></li><% 
					
					}else
					{
						%><li><a href="<%=request.getContextPath() %>/board/board.do?bkind=<%= bkind %>&page=<%= pageno %>" ><%= pageno %></a></li><%
					
					}
				}
				if( endBlock < maxpage)
				{
					%><li><a href="<%=request.getContextPath() %>/board/board.do?bkind=<%= bkind %>&page=<%= endBlock + 1 %>">▶</a></li>	<%
				}
				%>
				</ul>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>