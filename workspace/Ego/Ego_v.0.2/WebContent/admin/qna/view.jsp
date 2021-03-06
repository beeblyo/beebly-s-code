<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String bno = request.getParameter("no");
String kind  = request.getParameter("kind");  
String curpage = request.getParameter("page");

System.out.println(bno);
if( kind == null) kind = "Q";
if( curpage == null ) curpage = "1";
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("잘못 호출된 게시물 번호입니다.");
		document.location = "question.jsp?tab=5&kind=Q";
	</script>
	<%
	return;
}
String sql = "";

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
		document.location = "question.jsp?tab=5&kind=<%= kind %>";
	</script>
	<%
	return;
}

String uno     = dbms.GetValue("uno");
String btitle  = dbms.GetValue("b_title");
String bkind   = dbms.GetValue("b_kind");
String bnote   = dbms.GetValue("b_note");
String bdate   = dbms.GetValue("b_date").split(" ")[0];
String unick   = dbms.GetValue("u_nickname");
String anote   = dbms.GetValue("b_ansnote");
String adate   = dbms.GetValue("b_ansdate");

%>
<script>
function AddAnswer()
{
	if( $("#anote").val() == "")
	{
		alert("답변 내용을 입력하세요");
		$("#anote").focus();
		return;
	}
	document.comment.submit();
}

var IsCommentEdit = 0;

function modifyansnote(obj,bno)
{
	if(IsCommentEdit == 1)
	{
		alert("답변 편집 중입니다!!");
		return;	
	}
	$.ajax({
		type :"get",
		url: "ansnotemodi.jsp?tab=5&no=" + bno,
		datatype: "html",
		success : function(data)
		{	
			//입력폼으로 바꾼다.
			$(obj).parent().html(data);
			
			//편집중으로 변경한다.
			IsCommentEdit = 1;
		}
	});	
}

function ansnotemodi_ok()
{
	var no    = document.ansnotemodi.no.value;
	var cnote = document.ansnotemodi.anote.value;
	
	mydata  = "tab=5&no=" + no;
	mydata += "&anote=" + anote;
	$.ajax({
		type :"post",
		url: "ansnotemodiok.jsp",
		datatype: "html",
		data : mydata,
		success : function(data)
		{
			alert(data);
			$("#ansnotemodi").parent().html(data);
			IsCommentEdit = 0;
		}
	});		
}
</script>
<main>
	<div>
		<div class="admin_wrap">
			<div class="btn_wrap">
				<a id="back_btn" class="btn" href="question.jsp?tab=5&kind=Q&page=<%=curpage%>">뒤로가기</a>
				<a class="btn" href="questiondel.jsp?tab=5&kind=Q&page=<%=curpage%>&no=<%= bno %>">삭제하기</a>
			</div>
			
			<div class="question_wrap">
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
				</div>
				
				<!-- ===== 답변 하기 전 혹은 수정할 때 보임 ===== -->
				<%
				if( anote == null)
				{
					%>
					<div class="answer">
						<form name="answer" method="get" action="answerok.jsp" onsubmit="return AddAnswer();">
							<input type="hidden" name="tab" value="5">
							<input type="hidden" id="no" name="no" value="<%= bno %>">
							<div>
								<input type="submit" value="등록">
							</div>		
							<textarea id="anote" name="anote"></textarea>
						</form>
					</div>
					<%
				}
				%>
				<!-- ===== 답변 하기 전 혹은 수정할 때 보임 ===== -->
				
				<!-- ===== 답변 하면 보임 ===== -->
				<%
				if( anote != null )
				{	
					%>
					<div class="answer">
						<div>
							[관리자] <%= adate.split(" ")[0] %>
							<a href="javascript:;" onclick="modifyansnote(this,<%= bno %>);">수정</a>
							<a href="ansnotedel.jsp?no=<%= bno %>">삭제</a>
						</div>
						
						<div>
						<%= anote %>
						</div>
					</div>
					<%
				}
				%>
				<!-- ===== 답변 하면 보임 ===== -->
			</div>
		</div>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>