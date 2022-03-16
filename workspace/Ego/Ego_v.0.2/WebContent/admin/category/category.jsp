<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<main>
	<div class="content_from">
		<form>
			<div class="table category">
				<div class="thead">
					<div class="row">
						<div class="column"><input id="all_check" type="checkbox"></div>
						<div class="column">��ȣ</div>
						<div class="column">ī�װ� �̸�</div>
						<div class="column">����</div>
						<div class="column">����</div>
					</div>
				</div>
				<div class="tbody">
					<%
					ArrayList<CategoryVO> c_vo = null;
					CategoryDTO c_dto = new CategoryDTO();

					c_vo = c_dto.categoryRead();
					if(c_vo != null)
					{
						for(CategoryVO item : c_vo)
						{
							String c_no = item.getCategoryNumber();
							%>
							<div class="row">
								<div class="column"><input type="checkbox"></div>
								<div class="column"><%=item.getCategoryNumber()%></div>
								<div class="column"><%=item.getCategoryName()%></div>
								<div class="column"><a id="mod_btn" href="#">����</a></div>
								<div class="column"><a id="del_btn" href="javascript:alert('ī�װ� ������ �׽�Ʈ�� �ִ� ��� ���� �Ұ����մϴ�.');">����</a></div>
							</div>
							<%
						}
					}
					%>
					<div class="row">
						<div class="column"></div>
						<div class="column">5</div>
						<div class="column"><input type="text" placeholder="ī�װ� ���� �Է��ϼ���"></div>
						<div class="column"></div>
						<div class="column"><a id="del_btn" href="javascript:alert('�غ����Դϴ�.');">�߰�</a></div>
					</div>
				</div>
			</div>
			
			<input id="del_btn" class="del_btn btn" type="button" value="�����ϱ�" onclick="javascript:alert('�غ����Դϴ�.');">
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>