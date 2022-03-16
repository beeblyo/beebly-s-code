<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<form id="myForm" name="modify" method="post" action="boardview.jsp" onsubmit="return FormCheck('board');">
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
						리뷰
					</div>
					<div>
						<span>제&ensp;&ensp;목</span>
						<input id="btitle" type="text" name="btitle" value="재미있게 봤어요!!">
					</div>
					<div>
						<span>내&ensp;&ensp;용</span>
						<textarea id="bnote" name="bnote">진짜 재미있게 봤어요!!</textarea>
					</div>
					
					<div class="btn_wrap">
						<a class="btn" href="./board.jsp">취소</a>
						<input class="btn" type="submit" value="수정하기">
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>