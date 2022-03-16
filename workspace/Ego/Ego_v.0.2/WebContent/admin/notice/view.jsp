<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String bno = request.getParameter("no");
String kind  = request.getParameter("kind");  
String curpage = request.getParameter("page");
tab = request.getParameter("tab");

if( curpage == null ) curpage = "1";
if(bno == null || bno.equals(""))
{
	%>
	<script>
		alert("�߸� ȣ��� �Խù� ��ȣ�Դϴ�.");
		document.location = "notice.jsp?tab=4&kind=N";
	</script>
	<%
	return;
}

String sql = "";
//�Խù��� ������ ��´�.
sql  = "select b_no,u_no,b_title,b_kind,b_note,b_date,";
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
		document.location = "notice.jsp?tab=4&kind=<%= kind %>";
	</script>
	<%
	return;
}
String uno     = dbms.GetValue("uno");
String btitle  = dbms.GetValue("b_title");
String bkind   = dbms.GetValue("b_kind");
String bnote   = dbms.GetValue("b_note");
String bdate  = dbms.GetValue("b_date").split(" ")[0];
String unick   = dbms.GetValue("u_nickname");
%>

<main>	
	<div class="admin_wrap">
		<div class="btn_wrap">
			<a id="back_btn" class="btn" href="notice.jsp?tab=4">�ڷΰ���</a>
			<a class="btn" href="modify.jsp?tab=4&kind=N&page=<%= curpage %>&no=<%=bno%>">�����ϱ�</a>
			<a class="btn" href="noticedel.jsp?tab=4&kind=N&page=<%= curpage %>&no=<%=bno%>">�����ϱ�</a>
		</div>
		
		<div class="view_form">
			<p><%= btitle %></p>
			<p>�ۼ���: <%= unick %></p>
			<p>�ۼ���: <%= bdate %></p>
			<div>
				<%= bnote.replace("\n", "<br>") %>
			</div>
		</div>
	</div>
</main>
	
<script>
	$('#back_btn').click(function () {
		//alert('�ڷΰ���');
		if(confirm('����Ͻðڽ��ϱ�?'))
		{
			window.location = 'notice.jsp?tab=4';
		}
	});
</script>
<%@ include file="../../include/ad_footer.jsp" %>