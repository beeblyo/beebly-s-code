<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<form action="boardview.jsp">
					<div>
						<span>구&ensp;&ensp;분</span>
						<select>
							<option>공연</option>
							<option>전시</option>
							<option>축제</option>
						</select>
					</div>
					<div>
						<span>주&ensp;&ensp;제</span>
						<input id="topic_1" type="radio" name="topic" checked="checked" value="[리뷰]"><label for="topic_1">리뷰</label>
						<input id="topic_2" type="radio" name="topic" value="[질문]"><label for="topic_2">질문</label>
						<input id="topic_3" type="radio" name="topic" value="[자유]"><label for="topic_3">자유</label>
					</div>
					<div>
						<span>제&ensp;&ensp;목</span>
						<input type="text" name="title">
					</div>
					<div>
						<span>내&ensp;&ensp;용</span>
						<textarea></textarea>
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