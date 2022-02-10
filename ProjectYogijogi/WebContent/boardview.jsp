<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<div>
					<span>구&ensp;&ensp;분</span>
					<!-- ========== 구분 ========== -->
					공연
					<!-- ========== 구분 ========== -->
				</div>
				<div>
					<span>주&ensp;&ensp;제</span>
					<!-- ========== 주제 ========== -->
					리뷰
					<!-- ========== 주제 ========== -->
				</div>
				<div>
					<span>제&ensp;&ensp;목</span>
					<!-- ========== 제목 ========== -->
					재미있게 봤어요!!
					<!-- ========== 제목 ========== -->
				</div>
				<div>
					<span>내&ensp;&ensp;용</span>
					<div class="textarea">
					<!-- ========== 내용 ========== -->
						진짜 재미있게 봤어요!!
					<!-- ========== 내용 ========== -->
					</div>
				</div>
				
				<div class="btn_wrap">
					<a class="btn" href="./board.jsp">목록으로</a>
					<a class="btn" href="./boardmodify.jsp">수정</a>
					<a class="btn" href="./boarddelete.jsp">삭제</a>
				</div>
			</div>
			
			<!-- ===================================== -->
			<!-- =============== 댓글 위치 =============== -->
			<!-- ===================================== -->
			<div class="comment_wrap">
			
				<!-- =========================== -->
				<!-- ========== 댓글 달기 ========== -->
				<!-- =========================== -->
				<div class="comment_write">
					홍길동&ensp;&ensp;2022-01-01
					<form name="comment" method="get" action="./boardview.jsp">
						<input type="hidden" name="no" value="1">
						<textarea name="post" placeholder="댓글을 입력하세요"></textarea>
						<input type="submit" value="등록">
					</form>
				</div>
				
				<!-- ========== 달린 댓글 위치 ========== -->
				<div class="comment_view">
				
					<!-- ========== 댓글 ========== -->
					<div class="comment clearfix">
					
						<!-- ============================= -->
						<!-- ========== 댓글 내용 ========== -->
						<!-- ============================= -->
						<div>
							홍길동&ensp;&ensp;2022-01-01
							<div>
								<div class="textarea">
									맞아요 재미있어요!
								</div>
								
								<a href="./commentmodify.jsp">수정</a>
								<a href="./commentdelete.jsp">삭제</a>
							</div>
							<span>댓글(0)</span>
						</div>
						<!-- ========== 댓글 내용 끝 ========== -->
						
						<!-- ========== 달린 대댓글 위치 ========== -->
						<div class="recomment_wrap">
						
							<!-- ============================ -->
							<!-- ========== 달린 대댓글 ========== -->
							<!-- ============================ -->
							<div class="comment recomment">
								<div>
									홍길동&ensp;&ensp;2022-01-01
									<div>
										<div class="textarea">
											맞아요 재미있어요!
										</div>
										
										<a href="./commentmodify.jsp">수정</a>
										<a href="./commentdelete.jsp">삭제</a>
									</div>
								</div>
							</div>
							<!-- ========== 달린 대댓글 끝 ========== -->
							
							<!-- ============================ -->
							<!-- ========== 대댓글 달기 ========== -->
							<!-- ============================ -->
							<div class="comment_write recomment_write">
								홍길동&ensp;&ensp;2022-01-01
								<form name="comment" method="get" action="./boardview.jsp">
									<input type="hidden" name="no" value="1">
									<textarea name="post" placeholder="대댓글을 입력하세요"></textarea>
									<input type="submit" value="등록">
								</form>
							</div>
							<!-- ========== 대댓글 달기 끝 ========== -->
						</div>
						<!-- ========== 달린 대댓글 위치 끝 ========== -->
						
					</div>
					<!-- ========== 댓글 끝 ========== -->
					
				</div>
				<!-- ========== 달린 댓글 위치 끝 ========== -->
				
			</div>
			<!-- ========== 댓글 위치 끝 ========== -->
			
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>