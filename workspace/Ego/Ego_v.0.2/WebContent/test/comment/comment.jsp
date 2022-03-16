<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../../config/config.jsp" %>
<!-- 댓글 뷰 영역 -->
<%
request.setCharacterEncoding("euc-kr");
UserVO login = (UserVO)session.getAttribute("login");
String tno = request.getParameter("no");
String folder = request.getParameter("folder");


%>
<script>
var IsCommentEdit = 0;

function modifycomment(obj,tno,cno)
{
	if(IsCommentEdit == 1)
	{
		alert("댓글 편집 중입니다");
		return;	
	}
	$.ajax({
		type :"get",
		url: "../test/comment/commentmodi.jsp?cno=" + cno,
		datatype: "html",
		success : function(data)
		{	
			$(obj).parent().html(data);
			
			IsCommentEdit = 1;
		}
		
	});	
}

function commentmodi_ok()
{
	var no    = document.commentmodi.no.value;
	var cno   = document.commentmodi.cno.value;
	var cnote = document.commentmodi.cnote.value;
	
	mydata  = "no=" + no;
	mydata += "&cno=" + cno;
	mydata += "&cnote=" + cnote;
	$.ajax({
		type :"post",
		url: "../test/comment/commentmodiok.jsp",
		datatype: "html",
		data : mydata,
		success : function(data)
		{
			$("#commentmodi").parent().html(data);
			IsCommentEdit = 0;
		}
	});		
}
</script>
<div>
<%
CommentDTO dto = new CommentDTO();
CommentDTO rdto = new CommentDTO();
dto.GetList(tno,"0");

if(dto.GetListArray() != null)
{
	for(CommentVO vo : dto.GetListArray())
	{				
		%>
		<div class="reply view_reply">	
			<div class="reply_profile">
			</div>
			<div class="reply_box">
				<div>
					<div class="reply_name"><%= vo.getCnick() %></div>
					<div class="reply_date"><%= vo.getCdate() %></div>
				</div>
				<div>
					<p>
						<%= vo.getCnote() %>
					</p>
					<%
					if( login != null && login.getNo().equals(vo.getC_uno()) )
					{
						%>
						<a href="javascript:;" onclick="modifycomment(this,<%= tno %>,cno=<%= vo.getCno() %>);">수정</a>
						<a href="comment/commentdel.jsp?no=<%= tno %>&folder=<%= folder %>&cno=<%= vo.getCno() %>">삭제</a>
						<%
					}
					%>
				</div>
				<div class="re_reply_btn" onclick="ToggleReply(this);">└댓글(0)</div>
			</div>
		</div>
	
		<!-- 대댓글 뷰 영역 -->
		<div id="re_reply_wrap" class="re_reply_wrap clearfix">
	
					<div class="reply view_re_reply">
						<div class="reply_profile">
						</div>
						<div class="reply_box">
							<div>
								<div class="reply_name">이고에고</div>
								<div class="reply_date">2021.01.01</div>
							</div>
							<div>
								<p>
								</p>
								<a>수정</a>
								<a>삭제</a>
							</div>
						</div>
					</div>

		<!-- 대댓글 입력 영역 -->
		<div class="reply view_re_reply">
			<div class="reply_profile">
			</div>
			<div class="reply_box">
				<div>
					<div class="reply_name"><%= vo.getCnick() %></div>
					<div class="reply_date"><%= vo.getCdate() %></div>
				</div>
				<form name="reply" method="post" action="commentok.jsp">
					<input type="hidden" name="folder" value="<%= folder %>">
					<input type="hidden" name="uno" value="<%= login.getNo() %>">
					<input type="hidden" name="no" value="<%= tno %>">
					<textarea name="note"></textarea>
					<input type="submit" value="등록">
				</form>
			</div>
		</div>
	</div>
	<%
	}
}	
%>
		</div>	
<!-- 
<div class="paging">
	<ul>
		<li><a href="#">◀</a></li>
		<li><a href="#" class="now">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">6</a></li>
		<li><a href="#">7</a></li>
		<li><a href="#">8</a></li>
		<li><a href="#">9</a></li>
		<li><a href="#">10</a></li>
		<li><a href="#">▶</a></li>
	</ul>
 -->	
</div>