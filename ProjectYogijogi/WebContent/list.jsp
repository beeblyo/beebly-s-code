<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="./css/list.css" rel="stylesheet">
	</head>
	<style>
		
	</style>
	
	<%@ include file="./include/header.jsp" %>
		<div class="slide_wrap">
			<%@include file="slide.jsp" %>
		</div>
		
		<div class="wrap">
			<div class="month_title">
				<div class="search_box">
					<form name="frm" method="get" action="view.jsp">
						<input id="search" name="search" type="text" placeholder="이곳에 제목과 내용을 검색해 보세요">
						<input id="submit" type="submit" value="검색">
						<label class="search_btn" for="submit">
						검색
						</label>
					</form>
				</div>
				<div class="view_cal_btn btn_wrap" title="이벤트 일정을 달력으로 한눈에 보기">
					<a href="calendar.jsp">
						<img src="./img/calendar_icon.png">
						달력으로 보기
					</a>
				</div>
			</div>
			
			
			<script>
				window.onload = function()
				{
					/*
					$('.content_box').hover(function(){
						
						$(this).find('.content_info').animate({height:"100px"});
						$('.content_box').mouseout(function(){
							
						});
						$(this).find('.content_info').animate({height:"80px"});
					});*/
					function slideinfobox()
					{
						alert('ddd');
						
					}
					
				}
			
				
			</script>
			
			
			<% for(int i=0; i<8; i++){%>
				<div class="content_box content_box0<%=i%>" onmouseover="slideinfobox()">
					<div class="content_info">
						<div><a href="view.jsp">꽃과 행복의 축제</a></div>
						<div>전주시 (22.22.11~22.22.11)</div>
						<div class="list_btn" title="북마크로 등록하기"></div>
					</div>
				</div>
			<%} %>
			
			
			
			</div>
<%@ include file="./include/footer.jsp" %>