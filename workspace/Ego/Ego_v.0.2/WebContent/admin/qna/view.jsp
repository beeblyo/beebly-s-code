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
		alert("�߸� ȣ��� �Խù� ��ȣ�Դϴ�.");
		document.location = "question.jsp?tab=5&kind=Q";
	</script>
	<%
	return;
}
String sql = "";

//�Խù��� ������ ��´�.
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
		alert("�߸� ȣ��� �Խù� ��ȣ�Դϴ�.");
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
		alert("�亯 ������ �Է��ϼ���");
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
		alert("�亯 ���� ���Դϴ�!!");
		return;	
	}
	$.ajax({
		type :"get",
		url: "ansnotemodi.jsp?tab=5&no=" + bno,
		datatype: "html",
		success : function(data)
		{	
			//�Է������� �ٲ۴�.
			$(obj).parent().html(data);
			
			//���������� �����Ѵ�.
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
				<a id="back_btn" class="btn" href="question.jsp?tab=5&kind=Q&page=<%=curpage%>">�ڷΰ���</a>
				<a class="btn" href="questiondel.jsp?tab=5&kind=Q&page=<%=curpage%>&no=<%= bno %>">�����ϱ�</a>
			</div>
			
			<div class="question_wrap">
				<div class="question">
					<div class="content">
						<div>
							<span>����</span>
							<p><%= btitle %></p>
						</div>
						<div>
							<span>�ۼ���</span>
							<p><%= unick %></p>
						</div>
						<div>
							<span>�ۼ���</span>
							<p><%= bdate %></p>
						</div>
						<div class="textarea">
							<%= bnote %>
						</div>
					</div>
				</div>
				
				<!-- ===== �亯 �ϱ� �� Ȥ�� ������ �� ���� ===== -->
				<%
				if( anote == null)
				{
					%>
					<div class="answer">
						<form name="answer" method="get" action="answerok.jsp" onsubmit="return AddAnswer();">
							<input type="hidden" name="tab" value="5">
							<input type="hidden" id="no" name="no" value="<%= bno %>">
							<div>
								<input type="submit" value="���">
							</div>		
							<textarea id="anote" name="anote"></textarea>
						</form>
					</div>
					<%
				}
				%>
				<!-- ===== �亯 �ϱ� �� Ȥ�� ������ �� ���� ===== -->
				
				<!-- ===== �亯 �ϸ� ���� ===== -->
				<%
				if( anote != null )
				{	
					%>
					<div class="answer">
						<div>
							[������] <%= adate.split(" ")[0] %>
							<a href="javascript:;" onclick="modifyansnote(this,<%= bno %>);">����</a>
							<a href="ansnotedel.jsp?no=<%= bno %>">����</a>
						</div>
						
						<div>
						<%= anote %>
						</div>
					</div>
					<%
				}
				%>
				<!-- ===== �亯 �ϸ� ���� ===== -->
			</div>
		</div>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>