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
					<form id="myForm" name="frm" method="get" action="list.jsp" onsubmit="return FormCheck('search')">
						<input id="key" name="key" type="text">
						<input id="submit" type="submit" value="검색">
						<label class="search_btn" for="submit">
						검색
						</label>
					</form>
				</div>
				<!-- 
				<div class="year">
				2022
				</div>
				<div class="month_slider_box">
					<div>
					&#8592;
					</div>
					<div>
					1월 
					</div>
					<div>
					&#8594;
					</div>
				</div>
				 -->
				<div class="/*view_cal_btn*/ btn_wrap" title="이벤트 일정을 달력으로 한눈에 보기">
					<a href="calendar.jsp">
						<img src="./img/calendar_icon.png">
						달력으로 보기
					</a>
				</div>
			</div>
			<% for(int i=0; i<8; i++){%>
				<div class="content_box">
					<div>
						<div><a href="view.jsp">꽃과 행복의 축제</a></div>
						<div>전주시 (22.22.11~22.22.11)</div>
						<div class="list_btn" title="북마크로 등록하기"></div>
					</div>
				</div>
			<%} %>
			</div>
<%@ include file="./include/footer.jsp" %>