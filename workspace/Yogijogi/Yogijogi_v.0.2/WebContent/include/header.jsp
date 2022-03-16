<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%
MemberVo login = (MemberVo)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전라북도 요기조기</title>
		<link href="<%=request.getContextPath()%>/css/basic.css" rel="stylesheet">
		<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
		<script src="<%=request.getContextPath()%>/js/script.js"></script>
	</head>
	<body>
		<header class="back">
			<div class="logo">
				<h1>
					<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/logo_basic_color.png" alt="요기조기"></a>
				</h1>
			</div>
			
			<div class="menu">
				<nav>
					<ul>
						<li><a href="<%=request.getContextPath()%>/culture/list.do?bkind=S">공연</a></li>
						<li><a href="<%=request.getContextPath()%>/culture/list.do?bkind=E">전시</a></li>
						<li><a href="<%=request.getContextPath()%>/culture/list.do?bkind=F">축제</a></li>
						<li>요기조기
							<ul class="sub_menu">
								<li><a href="<%=request.getContextPath()%>/board/intro.do">소개</a></li>
								<li><a href="<%=request.getContextPath()%>/board/inquiry.do">입점문의</a></li>
								<li><a href="<%=request.getContextPath()%>/board/board.do">요기조기 주막</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			
			<div class="login">
			<%if(login==null){%>
				<a href="<%=request.getContextPath()%>/member/login.do">로그인</a> <a href="<%=request.getContextPath()%>/member/join.do">회원가입</a>
			<%} else {%>
				<a href="<%=request.getContextPath()%>/member/memberInfo.do">마이페이지</a> <a href="javascript:logout();">로그아웃</a>
			<%}%>
			</div>
		</header>
		
		<script>
			function logout() {
				alert('로그아웃 되었습니다.');
				window.location = '<%=request.getContextPath()%>/member/logout.do';
			}
		</script>
		
		<main>
		<!-- ============================ 메인 컨텐츠 영역 ================================ -->