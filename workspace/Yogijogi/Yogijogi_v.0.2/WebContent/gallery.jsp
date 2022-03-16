<%@page import="model.MemberVo"%>
<%@page import="model.BookmarkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="api.*"%>
<%
ArrayList<ApiVo> alist = (ArrayList<ApiVo>)session.getAttribute("alist");
MemberVo login = (MemberVo)session.getAttribute("login");
BookmarkDao dao = new BookmarkDao();

if(alist.size() != 0) {
	for(ApiVo item : alist){%>
		<div class="content_box">
			<div>
				<a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=item.getAkind()%>&no=<%=item.getAno()%>" style="display: contents">
					<div class="img" style="background:url('<%=request.getContextPath()%>/img/thum_<%=item.getAkind()%>.jpg') no-repeat center; background-size: cover;"></div>
				</a>
			</div>
			<div class="content_info">
				<div style="width: 165px; white-space: nowrap; overflow:hidden; text-overflow:ellipsis;">
					<a href="<%=request.getContextPath()%>/culture/view.do?bkind=<%=item.getAkind()%>&no=<%=item.getAno()%>" style="display: contents;" title="<%=item.getSubject()%>"><%=item.getSubject()%></a>
				</div>
				<div style="font-size: 14px">전주시 (<%=item.getStartDay().substring(2).replace("-", ".")%>~<%=item.getEndDay().substring(2).replace("-", ".")%>)</div>
				<div id="cno_<%=item.getAno()%>" class="list_btn <%if(login!=null && dao.bookmarkIs(login.getMno(), item.getAno())!=0){%>check<%}%>" onclick="bookmark('<%=item.getAno()%>');" title="북마크로 등록하기"></div>
			</div>
		</div>
	<%}
} else {
	%><h3>게시물이 없습니다</h3><%
}%>