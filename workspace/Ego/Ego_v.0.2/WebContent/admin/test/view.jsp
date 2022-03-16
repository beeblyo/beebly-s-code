<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<%
String no = request.getParameter("no");

TestDTO dto = new TestDTO();
TestVO vo = dto.selectTestView(no);
%>
<main>
	<div>
		<div class="admin_wrap">
			<div class="btn_wrap">
				<a id="back_btn" class="btn" href="test.jsp?tab=2">�ڷΰ���</a>
				<a class="btn" href="modify.jsp?tab=2&no=<%=no%>">�����ϱ�</a>
				<a class="btn" href="test.jsp?tab=2&no=<%=no%>">�����ϱ�</a>
			</div>
			
			<div class="add_form">
				<div class="title">
					<div class="test_title"><%=vo.getTestTitle()%></div>
					<div><span>������ ��</span><%=vo.getJoinCount()%></div>
					<div><span>��õ ��</span>11</div>
					<div><span>ī�װ���</span><%=vo.getCategoryName()%></div>
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
									<span><input id="<%=item.getHash()%>" type="checkbox" name="hash" value="<%=item.getHash()%>" 
									<%

									if(vo.makeHashteg() != null)
									{
										for(HashtagVO hash : vo.makeHashteg())
										{
											if(item.getHash().equals(hash.getHash()))
											{
												%>checked="checked"<%
											}
										}
									}
									%> disabled="disabled"> 
									<label for="<%=item.getHash()%>"><%=item.getHashname()%></label></span>
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
					<div><span>������</span><%=vo.getFoldername() %></div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>