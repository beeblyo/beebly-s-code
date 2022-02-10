<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>달력보기 페이지</title>
		<link href="./css/calendar.css" rel="stylesheet">
	</head>
	<%@ include file="./include/header.jsp" %>
		<div class="slide_wrap">
			<%@include file="slide.jsp" %>
		</div>
		<div class="list_wrap">
			<div class="wrap">
				<div class="month_title">
					<div class="btn_wrap">
						<a class="btn" href="./list.jsp">목록보기</a>
					</div>
					<div>2020</div>
					<div class="month_box">
						<div class="month front_month">
							<div></div>
							<div><a href="#">8월</a></div>
							<div><a href="#">9월</a></div>
							<div><a href="#">10월</a></div>
							<div><a href="#">11월</a></div>
							<div><a href="#">12월</a></div>
						</div>
						<div class="recent_month">1월</div>
						<div class="month back_month">
							<div><a href="#">2월</a></div>
							<div><a href="#">3월</a></div>
							<div><a href="#">4월</a></div>
							<div><a href="#">5월</a></div>
							<div><a href="#">6월</a></div>
							<div><a href="#">7월</a></div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="wrap2">
				<div class="calendar_monthbox">
					<div>월</div>
					<div>화</div>
					<div>수</div>
					<div>목</div>
					<div>금</div>
					<div>토</div>
					<div>일</div>
				</div>
				<div class="calendar_daybox">
					<div><div>1</div></div>
					<div>
					<div>2</div>
					<div class="bar bar1">빛과 소리축제</div>
					</div>
					<div>
					<div>3</div>
					<div class="bar bar1"></div>
					</div>
					<div><div>4</div></div>
					<div><div>5</div></div>
					<div><div>6</div></div>
					<div><div>7</div></div>
				</div>
				<div class="calendar_daybox">
					<div><div>1</div></div>
					<div><div>2</div></div>
					<div><div>3</div></div>
					<div><div>4</div></div>
					<div><div>5</div></div>
					<div><div>6</div></div>
					<div><div>7</div></div>
				</div>
				<div class="calendar_daybox">
					<div><div>1</div></div>
					<div><div>2</div></div>
					<div><div>3</div></div>
					<div>
						<div>4</div>
						<div class="bar bar2">뮤지컬 캣츠</div>
					</div>
					<div>
						<div>5</div>
						<div class="bar bar2"></div>
					</div>
					<div>
						<div>6</div>
						<div class="bar bar2"></div>
					</div>
					<div><div>7</div></div>
				</div>
				<div class="calendar_daybox">
					<div>
						<div>1</div>
						<div class="bar bar3">유명한 화가의 전시관</div>
					</div>
					<div>
						<div>2</div>
						<div class="bar bar3"></div>
					</div>
					<div>
						<div>3</div>
						<div class="bar bar3"></div>
					</div>
					<div>
						<div>4</div>
						<div class="bar bar3"></div>
					</div>
					<div><div>5</div></div>
					<div><div>6</div></div>
					<div><div>7</div></div>
				</div>
				<div class="calendar_daybox">
					<div><div>1</div></div>
					<div><div>2</div></div>
					<div><div>3</div></div>
					<div><div>4</div></div>
					<div><div>5</div></div>
					<div><div>6</div></div>
					<div><div>7</div></div>
				</div>
				<div class="calendar_daybox">
					<div><div>1</div></div>
					<div><div>2</div></div>
					<div><div>3</div></div>
					<div><div>4</div></div>
					<div><div>5</div></div>
					<div><div>6</div></div>
					<div><div>7</div></div>
				</div>
			</div>
		</div>

<%@ include file="./include/footer.jsp" %>