<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<% BoardVo bv = (BoardVo)request.getAttribute("boardmodi"); %>
	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<form id="myForm" name="modify" method="post" action="<%=request.getContextPath()%>/board/boardModifyAction.do?bno=<%= bv.getBno() %>" onsubmit="return FormCheck('board');">
					<div>
						<span>구&ensp;&ensp;분</span>
						<select name="bkind">
							<%if(bv.getBkind().equals("S"))
							{
								%>
								<option value="S">공연</option>
								<% 
							}else if(bv.getBkind().equals("F"))
							{
								%>
								<option value="F">축제</option>
								<%
							}else
							{
								%>
								<option value="E">전시</option>
								<%
							}
							%>
						</select>
					</div>
					<div>
						<span>주&ensp;&ensp;제</span>
						<%= bv.getBtopic() %>
						<input id="topic" type="hidden" name="topic" value="<%= bv.getBtopic() %>">
					</div>
					<div>
						<span>제&ensp;&ensp;목</span>
						<input id="btitle" type="text" name="btitle" value="<%= bv.getBtitle() %>">
					</div>
					<div>
						<span>내&ensp;&ensp;용</span>
						<textarea id="bnote" name="bnote"><%= bv.getBnote() %></textarea>
					</div>
					
					<div class="btn_wrap">
						<a class="btn" href="<%=request.getContextPath()%>/board/boardview.do?bno=<%= bv.getBno()%>">취소</a>
						<input class="btn" type="submit" value="수정하기">
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>