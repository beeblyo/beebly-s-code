<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<main>
	<div>
		<form class="admin_wrap" name="add" method="post" action="writeok.jsp" enctype="multipart/form-data">
			<div class="btn_wrap">
				<input id="back_btn" class="btn" type="button" value="����ϱ�" onclick="backBtn('test.jsp?tab=2')">
				<input class="btn" type="submit" value="����ϱ�">
			</div>
			
			<div class="add_form">
				<input type="hidden" name="tab" value="2">
				<input type="hidden" name="host" value="<%=login.getNo()%>">
				<div class="title">
					<div>
						<span>����</span>
						<input type="text" name="title" placeholder="������ �Է��ϼ���.">
					</div>
					<div>
						<span>ī�װ�</span>
						<select name="cate">
							<option>����</option>
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
									<option value="<%=c_no%>"><%=item.getCategoryName().split(" ")[0]%></option>
									<%
								}
							}
							%>
						</select>
					</div>
					<div class="clearfix">
						<span>�ؽ��±�</span>
						<p class="hash">
							<%
							ArrayList<HashtagVO> h_vo = new ArrayList<HashtagVO>();
							
							for(int i=1; i<=40; i++)
							{
								String hash_no = "";
								if(i<10) hash_no = "0"+i;
								else hash_no = ""+i;
								
								HashtagVO hash = new HashtagVO();
								hash.setHash(hash_no);
								h_vo.add(hash);
							}
							
							if(!(h_vo == null || h_vo.size() == 0))
							{
								for(HashtagVO item : h_vo)
								{
									%>
									<span>
										<input id="<%=item.getHash()%>" type="checkbox" name="hash" value="<%=item.getHash()%>"> 
										<label for="<%=item.getHash()%>"><%=item.getHashname()%></label>
									</span>
									<%
								}
							} else
							{
								%>
								<span>�ؽ��±װ� �����ϴ�.</span>
								<%
							}
							%>
						</p>
					</div>
					<div>
						<span>�׽�Ʈ ������</span>
						<input type="text" name="folder">
					</div>
					<div>
						<span>�׽�Ʈ ���� ÷��</span>
						<input type="file" name="file">
					</div>
				</div>
			</div>
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>