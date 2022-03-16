<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% for(int i=0; i<8; i++){%>
		<div class="content_box content_box0<%=i%>">
			<div>
				<a href="view.jsp" style="display: contents">
					<div class="img"></div>
				</a>
			</div>
			<div class="content_info">
				<div><a href="view.jsp" style="display: contents">꽃과 행복의 축제</a></div>
				<div style="font-size: 14px">전주시 (22.22.11~22.22.11)</div>
				<div class="list_btn" id="list_bookmark" title="북마크로 등록하기"></div>
			</div>
		</div>
	<%} %>