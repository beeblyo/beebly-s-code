<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<link href="./css/board.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

	<div class="wrap">
		<div class="board_wrap">
			<div class="title">
				<h2>요기조기 주막</h2>
				<p>회원분들이 자유롭게 글을 게시할 수 있습니다.</p>
			</div>
			
			<div class="search_wrap clearfix">
				<form id="myForm" class="clearfix" name="search" method="post" action="board.jsp" onsubmit="return FormCheck('search');">
					<div>
						<select>
							<option>전체</option>
							<option>공연</option>
							<option>전시</option>
							<option>축제</option>
						</select>
					</div>
					
					<div class="search">
						<input id="key" type="text" name="key">
						<input class="btn" type="submit" value="검색">
					</div>
					
					<div class="btn_wrap">
						<a class="btn" href="./boardwrite.jsp">글쓰기</a>
					</div>
				</form>
			</div>
			
			<div class="table">
				<div class="thead">
					<div class="row">
						<div class="column">번호</div>
						<div class="column">구분</div>
						<div class="column">제목</div>
						<div class="column">작성자</div>
						<div class="column">작성일</div>
						<div class="column">조회수</div>
					</div>
				</div>	
				<div class="tbody">
				<%for(int i=1; i<=10; i++) {%>
					<div class="row">
						<div class="column"><%=i%></div>
						<div class="column">공연</div>
						<div class="column"><a href="./boardview.jsp"><span>리뷰</span>캣츠 재미있게 봤어요</a></div>
						<div class="column">홍길동</div>
						<div class="column">2022-01-01</div>
						<div class="column">64</div>
					</div>
				<%}%>
				</div>
			</div>
			
			<div class="paging">
				<ul>
					<li><a href="">◀</a></li>
					<%for(int i=1; i<=10; i++) {%>
						<li><a href="" <%if(i==1){%>class="now"<%}%>><%=i%></a></li>
					<%}%>
					<li><a href="">▶</a></li>
				</ul>
			</div>
		</div>
	</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>