<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%
BoardVo bv = (BoardVo)request.getAttribute("boardview");
ArrayList<ReplyVo> alist = (ArrayList<ReplyVo>)request.getAttribute("alist");
int total = (Integer)request.getAttribute("total");
String bno = request.getParameter("bno");

%>
<script>
var IsReplyEdit = 0;

function modifyreply(obj,bno,rno)
{
	if(IsReplyEdit == 1)
	{
		alert("댓글 편집 중입니다!!");
		return;	
	}
	$.ajax({
		type :"get",
		url: "<%= request.getContextPath() %>/board/replymodi.do?rno="+ rno,
		datatype: "html",
		success : function(data)
		{	
			//입력폼으로 바꾼다.
			$(obj).parent().html(data);
			
			//편집중으로 변경한다.
			IsReplyEdit = 1;
		}
	});	
}


</script>
	<div class="wrap">
		<div class="board_wrap">
			<div class="form">
				<div>
					<span>구&ensp;&ensp;분</span>
					<!-- ========== 구분 ========== -->
					<%= bv.getKindName() %>
					<!-- ========== 구분 ========== -->
				</div>
				<div>
					<span>주&ensp;&ensp;제</span>
					<!-- ========== 주제 ========== -->
					<%= bv.getBtopic() %>
					<!-- ========== 주제 ========== -->
				</div>
				<div>
					<span>제&ensp;&ensp;목</span>
					<!-- ========== 제목 ========== -->
					<%= bv.getBtitle().replace("\n", "<br>")%>
					<!-- ========== 제목 ========== -->
				</div>
				<div>
					<span>작&ensp;성&ensp;자</span>
					<!-- ========== 작성자 ========== -->
					<%= bv.getMname() %>
					<!-- ========== 작성자 ========== -->
				</div>
				<div>
					<span>조&ensp;회&ensp;수</span>
					<!-- ========== 조회수 ========== -->
					<%= bv.getBhit() %>
					<!-- ========== 조회수 ========== -->
				</div>
				<div>
					<span>내&ensp;&ensp;용</span>
					<div class="textarea">
					<!-- ========== 내용 ========== -->
						<%=bv.getBnote().replace("\n", "<br>") %>
					<!-- ========== 내용 ========== -->
					</div>
				</div>
				
				<div class="btn_wrap">
					<a class="btn" href="<%=request.getContextPath()%>/board/board.do">목록으로</a>
					<%
					if(login != null)
					{
						String login2 = login.getMno() + ""; 
						if(login2.equals(bv.getMno()))
						{
							%>
							<a class="btn" href="<%=request.getContextPath()%>/board/boardmodify.do?bno=<%= bv.getBno() %>">수정</a>
							<a class="btn" href="<%=request.getContextPath()%>/board/boarddelete.do?bno=<%= bv.getBno() %>">삭제</a>
							<%
						}else 
						{
							
						}
					}	
					%>
				</div>
			</div>
			
			<!-- ===================================== -->
			<!-- =============== 댓글 위치 =============== -->
			<!-- ===================================== -->
			<div class="comment_wrap">
			
				<!-- =========================== -->
				<!-- ========== 댓글 달기 ========== -->
				<!-- =========================== -->
				<%if(login != null) 
				
				{
					%>
				<div class="comment_write">
					<%=login.getMname() %>&ensp;&ensp;
					<form id="replymodi" name="replymodi" method="get" action="<%=request.getContextPath()%>/board/replyAction.do" onsubmit="return FormCheck('comment')">
						<input type="hidden" name="mno" value="<%= login.getMno() %>">
						<input type="hidden" name="bno" value="<%= bv.getBno() %>">
						<textarea id="post" name="rnote" placeholder="댓글을 입력하세요"></textarea>
						<input type="submit" value="등록">
					</form>
				</div>
				<%
				}else
				{
					
				}
				%>
				
				<!-- ========== 달린 댓글 위치 ========== -->
				<div class="comment_view">
				
					<!-- ========== 댓글 ========== -->
					<div class="comment clearfix">
					
						<!-- ============================= -->
						<!-- ========== 댓글 내용 ========== -->
						<!-- ============================= -->
					<span>댓글(<%= total %>)</span>	
						<%
						for(ReplyVo rv : alist)
						{	
							%>
						<div>
							<%= rv.getMname() %>&ensp;&ensp;<%= rv.getRwdate() %>
							<div>
								<div class="textarea">
									<%= rv.getRnote() %>
								</div>
								<%
								if(login != null)
								{
									String login2 = login.getMno() + ""; 
									if(login2.equals(rv.getMno()))
									{
										%>
										<a onclick="modifyreply(this,<%= bno %>,<%= rv.getRno() %>);">수정</a>
										<a href="<%= request.getContextPath() %>/board/replyDelete.do?bno=<%=bno%>&rno=<%= rv.getRno() %>">삭제</a>
										<%
									}else 
									{
										
									}
								}	
								%>
							</div>
							
						</div>
							<%
						}
						%>
						<!-- ========== 댓글 내용 끝 ========== -->
						
						<!-- ========== 달린 대댓글 위치 ========== -->
						<!-- 
						<div class="recomment_wrap"> -->
						
							<!-- ============================ -->
							<!-- ========== 달린 대댓글 ========== -->
							<!-- ============================ -->
						<!--<div class="comment recomment">
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
							</div> -->
							<!-- ========== 달린 대댓글 끝 ========== -->
							
							<!-- ============================ -->
							<!-- ========== 대댓글 달기 ========== -->
							<!-- ============================ -->
							<!--<div class="comment_write recomment_write">
								홍길동&ensp;&ensp;2022-01-01
								<form name="recomment" method="get" action="./boardview.jsp" onsubmit="return FormCheck('recomment')">
									<input type="hidden" name="no" value="1">
									<textarea id="repost" name="repost" placeholder="대댓글을 입력하세요"></textarea>
									<input type="submit" value="등록">
								</form>
							</div>
							<!-- ========== 대댓글 달기 끝 ========== -->
						<!--</div> -->
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