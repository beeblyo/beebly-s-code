<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<form id="myForm" name="write" method="post" action="<%=request.getContextPath() %>/board/boardWriteAction.do" onsubmit="return FormCheck('board');">
					<div>
						<span>구&ensp;&ensp;분</span>
						<select name="bkind">
							<option value="S">공연</option>
							<option value="E">전시</option>
							<option value="F">축제</option>
						</select>
					</div>
					<div>
						<span>주&ensp;&ensp;제</span>
						<input id="topic_1" type="radio" name="topic" checked="checked" value="리뷰"><label for="topic_1">리뷰</label>
						<input id="topic_2" type="radio" name="topic" value="질문"><label for="topic_2">질문</label>
						<input id="topic_3" type="radio" name="topic" value="자유"><label for="topic_3">자유</label>
					</div>
					<div>
						<span>제&ensp;&ensp;목</span>
						<input id="btitle" type="text" name="btitle">
					</div>
					<div>
						<span>내&ensp;&ensp;용</span>
						<textarea id="bnote" name="bnote"></textarea>
					</div>
					
					<div class="btn_wrap">
						<a class="btn" href="./board.jsp">취소</a>
						<input class="btn" type="submit" value="글쓰기">
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>