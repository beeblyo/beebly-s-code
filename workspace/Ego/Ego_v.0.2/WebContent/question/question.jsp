<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/header.jsp" %>

<%
String kind   = request.getParameter("kind");

if(kind == null) kind ="Q";

//����¡�� ���� ���� ����
int total   = 0;  //��ü �Խù� ����
int maxpage = 0;  //�ִ� ������ ����
int curpage = 0;  //���� ������ ��ȣ

int startno = 0;  //SQL limit ���� ��ȣ
int startBlock = 0; //����¡ ���� ���� ��ȣ
int endBlock   = 0; //����¡ �� ���� ��ȣ

//(5)"index.jsp?page=1"���� �Ѿ�� page�� �м��Ѵ�.
if( request.getParameter("page") != null)
{
	//�Ѿ�� page ���� ������ curpage�� ��ȯ�Ѵ�.
	curpage = Integer.parseInt(request.getParameter("page"));
}else
{
	//�Ѿ�� page ���� �����Ƿ� ���� ������ ��ȣ�� 1�� �����Ѵ�.
	curpage = 1;
}


sql  = "select count(*) as count ";
sql += "from board ";
sql += "where b_kind = '" + kind + "' ";

dbms.OpenQuery(sql);
dbms.GetNext();
total = dbms.GetInt("count");

maxpage = total / 10;
if( total % 10 != 0) maxpage++;

startno = (curpage - 1) * 10;

sql  = "select b_no,u_no,b_title,b_kind,date(b_date) as b_date,b_ansnote,";
sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
sql += "from board ";
sql += "where b_kind = 'Q' ";

sql += "order by b_no desc ";
sql += "limit " + startno + ",10 ";

dbms.OpenQuery(sql);

//(9)����¡ ���ۺ�����ȣ�� ������ ��ȣ�� ����Ѵ�.
startBlock = ( (curpage - 1)  / 10) * 10 + 1;
endBlock   = startBlock + 10 - 1; 

//(10)endBlock �� �ִ� ������ ��ȣ���� ũ�� �ȵ�.
if( endBlock > maxpage)
{
	//��: maxpage�� 22�ε�, endBlock�� 30�̸� endBlock�� 22�� ����
	endBlock = maxpage;
}

%>

<!-- ====================== ���� ������ ���� ==================== -->
<main>
	<div class="question_wrap">
		<div class="title_wrap">
			<h2>���� ����</h2>
			<p>�ۼ��� ���θ� ���� �� �ֽ��ϴ�.</p>
		</div>
		
		<div class="btn_wrap">
			<a href="write.jsp" class="btn">�۾���</a>
		</div>
		<div class="table">
			<div class="thead">
				<div class="row">
					<div class="column">��ȣ</div>
					<div class="column">���� ����</div>
					<div class="column">�ۼ���</div>
					<div class="column">�ۼ���</div>
					<div class="column">�亯����</div>
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
						<div class="column"><%= bno %></div>
						<div class="column"><a href="view.jsp?kind=<%= bkind %>&page=<%= curpage %>&no=<%= bno %>"><%= btitle %></a></div>
						<div class="column"><%= unick %></div>
						<div class="column"><%= bdate %></div>
						<div class="column">
						<%
						if( anote != null)
						{
							%>
							�亯��
							<% 
						}else
						{
							%>
							<b style="color:#6667ab">Ȯ����</b>
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
					%><a href="question.jsp?kind=<%= kind %>&page=<%= startBlock - 1 %>">���� ������</a> | <%
				}		
				//(3, 4, 11)�ִ� ������ ���� ��ŭ �������� ǥ���Ѵ�.
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					if(curpage == pageno)
					{
						//���� �������� ���� ��� ���������� ǥ��
						%><a href="question.jsp?kind=<%= kind %>&page=<%= pageno %>" style="color:darkred;"><%= pageno %></a> | <%
					}else
					{
						%><a href="question.jsp?kind=<%= kind %>&page=<%= pageno %>"><%= pageno %></a> | <%
					}
				}	
				//(12) ���� ������ ����Ѵ�.
				if( endBlock < maxpage)
				{
					%><a href="question.jsp?kind=<%=kind%>&page=<%= endBlock + 1 %>">���� ������</a><%
				}
				%>
			</ul>
		</div>
	</div>
</main>
<!-- ====================== ���� ������ �� ==================== -->
<%@ include file="../include/footer.jsp" %>