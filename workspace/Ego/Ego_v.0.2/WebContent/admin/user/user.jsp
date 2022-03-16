<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String kind   = request.getParameter("kind");

String retire = request.getParameter("retire");
if(retire == null) retire = "N";
String no = request.getParameter("no");
if(no == null) no = "";

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
<main>
	<form class="search" name="search" method="post" action="user.jsp">
		<select>
			<option>ȸ����ȣ</option>
			<option>�г���</option>
			<option>�̸���</option>
		</select>
		<input id="key" type="text" name="key">
		<input class="btn" type="submit" value="�˻�">
	</form>
		
	<div class="content_from">
		<form>
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">��ȣ</div>
						<div class="column">�̸���</div>
						<div class="column">�г���</div>
						<div class="column">��������</div>
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
						<li><a href="#">��</a></li>
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
						<li><a href="#">��</a></li>
					</ul>
				</div>
				
				<input id="del_btn" class="del_btn btn" type="button" value="�����ϱ�">
			</div>
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>