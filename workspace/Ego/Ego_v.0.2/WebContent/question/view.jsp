<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>
<%

String bno = request.getParameter("no");
String kind  = request.getParameter("kind");  
String curpage = request.getParameter("page");

if( curpage == null ) curpage = "1";
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "question.jsp?kind=Q";
	</script>
	<%
	return;
}

//게시물의 정보를 얻는다.
sql  = "select b_no,u_no,b_title,b_kind,b_note,b_date,b_ansnote,b_ansdate,";
sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
sql += "from board ";
sql += "where b_no = '" + bno + "' ";
System.out.println("SQL:" + sql);
dbms.OpenQuery(sql);
if(dbms.GetNext() == false)
{
	dbms.CloseQuery();
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "question.jsp?kind=<%= kind %>";
	</script>
	<%
	return;
}
String uno     = dbms.GetValue("uno");
String btitle  = dbms.GetValue("b_title");
String bkind   = dbms.GetValue("b_kind");
String bnote   = dbms.GetValue("b_note");
String bdate  = dbms.GetValue("b_date");
String unick   = dbms.GetValue("u_nickname");
String anote   = dbms.GetValue("b_ansnote");
String adate   = dbms.GetValue("b_ansdate");

%>
<!-- ====================== 메인 컨텐츠 시작 ==================== -->
<main>
	<div class="question_wrap">
		<div class="backward_wrap">
			<div class="back_btn">
				<a href="./question.jsp"></a>
			</div>
		</div>
		
		<div class="question">
			<div class="content">
				<div>
					<span>제목</span>
					<p><%= btitle %></p>
				</div>
				<div>
					<span>작성자</span>
					<p><%= unick %></p>
				</div>
				<div>
					<span>작성일</span>
					<p><%= bdate %></p>
				</div>
				<div class="textarea">
					<%= bnote %>
				</div>
			</div>
				
			<div class="btn_wrap">
				<a class="btn" href="./modify.jsp">글수정</a>
				<a class="btn" href="./question.jsp">글삭제</a>
			</div>
		</div>
		
		<%
		if(anote != null)
		{
			%>
			<div class="answer">
				<div>[관리자] <%= adate.split(" ")[0] %></div>
				
				<div><%= anote %></div>
			</div>
			<%
		}	
		%>
	</div>
</main>
<!-- ====================== 메인 컨텐츠 끝 ==================== -->
<%@ include file="../include/footer.jsp" %>