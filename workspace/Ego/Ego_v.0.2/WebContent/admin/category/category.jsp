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
						<div class="column">번호</div>
						<div class="column">카테고리 이름</div>
						<div class="column">수정</div>
						<div class="column">삭제</div>
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
								<div class="column"><a id="mod_btn" href="#">수정</a></div>
								<div class="column"><a id="del_btn" href="javascript:alert('카테고리 하위에 테스트가 있는 경우 삭제 불가능합니다.');">삭제</a></div>
							</div>
							<%
						}
					}
					%>
					<div class="row">
						<div class="column"></div>
						<div class="column">5</div>
						<div class="column"><input type="text" placeholder="카테고리 명을 입력하세요"></div>
						<div class="column"></div>
						<div class="column"><a id="del_btn" href="javascript:alert('준비중입니다.');">추가</a></div>
					</div>
				</div>
			</div>
			
			<input id="del_btn" class="del_btn btn" type="button" value="삭제하기" onclick="javascript:alert('준비중입니다.');">
		</form>
	</div>
</main>
<%@ include file="../../include/ad_footer.jsp" %>