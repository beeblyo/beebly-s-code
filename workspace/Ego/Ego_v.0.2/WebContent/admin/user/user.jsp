<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String kind   = request.getParameter("kind");

String retire = request.getParameter("retire");
if(retire == null) retire = "N";
String no = request.getParameter("no");
if(no == null) no = "";

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
sql += "from test ";

dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInt("count");

maxpage = total / 10;
if( total % 10 != 0) maxpage++;

startno = (curpage - 1) * 10;

ArrayList<UserVO> list = null;

UserDTO dto = new UserDTO();
list = dto.testRead("15",""+startno,retire,no);

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
	<form class="search" name="search" method="post" action="user.jsp">
		<select>
			<option>회원번호</option>
			<option>닉네임</option>
			<option>이메일</option>
		</select>
		<input id="key" type="text" name="key">
		<input class="btn" type="submit" value="검색">
	</form>
		
	<div class="content_from">
		<form>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">번호</div>
						<div class="column">이메일</div>
						<div class="column">닉네임</div>
						<div class="column">가입일자</div>
					</div>
				</div>
				<div class="tbody">
					<%
					if(!(list == null || list.size() == 0))
					{
						for(UserVO item : list)
						{
							%>
							<div class="row">
								<div class="column"><input type="checkbox"></div>
								<div class="column"><%=item.getNo()%></div>
								<div class="column">
									<a href="info.jsp?no=<%=item.getNo()%>" onclick="window.open(this.href, '_blank', 'width=560, height=600, top=60, left=250'); return false;"><%=item.getEmailAll()%></a>
								</div>
								<div class="column"><%=item.getNickname()%></div>
								<div class="column">2021-12-30</div>
							</div>
							<%
						}
					}
					%>
				</div>
				
				<div class="paging">
					<ul>
						<li><a href="#">◀</a></li>
						<li><a href="#" class="now">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#">▶</a></li>
					</ul>
				</div>
				
				<input id="del_btn" class="del_btn btn" type="button" value="삭제하기">
			</div>
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>