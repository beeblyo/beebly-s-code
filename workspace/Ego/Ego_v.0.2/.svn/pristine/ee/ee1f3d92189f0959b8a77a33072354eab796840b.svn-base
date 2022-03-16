<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../include/ad_header.jsp" %>
<main>
	<div>
		<form class="admin_wrap" name="add" method="post" action="writeok.jsp" enctype="multipart/form-data">
			<div class="btn_wrap">
				<input id="back_btn" class="btn" type="button" value="취소하기" onclick="backBtn('test.jsp?tab=2')">
				<input class="btn" type="submit" value="등록하기">
			</div>
			
			<div class="add_form">
				<input type="hidden" name="tab" value="2">
				<input type="hidden" name="host" value="<%=login.getNo()%>">
				<div class="title">
					<div>
						<span>제목</span>
						<input type="text" name="title" placeholder="제목을 입력하세요.">
					</div>
					<div>
						<span>카테고리</span>
						<select name="cate">
							<option>없음</option>
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
						<span>해쉬태그</span>
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
								<span>해쉬태그가 없습니다.</span>
								<%
							}
							%>
						</p>
					</div>
					<div>
						<span>테스트 폴더명</span>
						<input type="text" name="folder">
					</div>
					<div>
						<span>테스트 파일 첨부</span>
						<input type="file" name="file">
					</div>
				</div>
			</div>
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>