<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String kind   = request.getParameter("kind");

String key = request.getParameter("key");
if(key == null) key = "";
String cate = request.getParameter("cate");
if(cate == null) cate = "";

//����¡�� ���� ���� ����
int total   = 0;  //��ü �Խù� ����
int maxpage = 0;  //�ִ� ������ ����
int curpage = 0;  //���� ������ ��ȣ

int startno = 0;  //SQL limit ���� ��ȣ
int startBlock = 0; //����¡ ���� ���� ��ȣ
int endBlock   = 0; //����¡ �� ���� ��ȣ
int paging_num = 15;//�������� �ѷ��� �� ����

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

//(9)����¡ ���ۺ�����ȣ�� ������ ��ȣ�� ����Ѵ�.
startBlock = ( (curpage - 1)  / paging_num) * 10 + 1;
endBlock   = startBlock + paging_num - 1; 

//(10)endBlock �� �ִ� ������ ��ȣ���� ũ�� �ȵ�.
if( endBlock > maxpage)
{
	//��: maxpage�� 22�ε�, endBlock�� 30�̸� endBlock�� 22�� ����
	endBlock = maxpage;
}
%>
<main>
	<form class="search" name="search" method="post" action="test.jsp?tab=2">
		<select name="cate"> 
			<option value="">��ü</option>
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
		<input class="btn" type="submit" value="�˻�">
	</form>
		
	<div class="content_from">
		<form class="test">
			<a href="write.jsp?tab=2" class="write_btn btn">�� ����</a>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">��ȣ</div>
						<div class="column">�׽�Ʈ �̸�</div>
						<div class="column">������ ��</div>
						<div class="column">�Խ�����</div>
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
						<div class="error">���� �����ϴ�.</div>
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
					%><a href="test.jsp?tab=2&page=<%= startBlock - 1 %>">���� ������</a> | <%
				}		
				//(3, 4, 11)�ִ� ������ ���� ��ŭ �������� ǥ���Ѵ�.
				for(int pageno = startBlock; pageno <= endBlock; pageno++)
				{
					%>
					<a href="test.jsp?tab=2&page=<%= pageno %>" <%if(curpage == pageno){%> class="now"<%}%>><%= pageno %></a> | 
					<%
				}	
				//(12) ���� ������ ����Ѵ�.
				if( endBlock < maxpage)
				{
					%><a href="notice.jsp?tab=2&page=<%= endBlock + 1 %>">���� ������</a><%
				}
				%>
				</ul>
			</div>
			
			<input class="del_btn btn" type="button" value="�����ϱ�" onclick="javascript:alert('�غ����Դϴ�.');">		
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>