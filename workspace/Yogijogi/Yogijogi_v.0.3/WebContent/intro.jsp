<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %> 
<link href="<%=request.getContextPath()%>/css/siteintro.css" rel="stylesheet">
<!-- ============================ 메인 컨텐츠 영역 ================================ -->

<div class="intro_wrap">
	<div class="title">
		<h2>요기조기 소개</h2>
		<p>전라북도 공연/전시/축제 일정을 확인하고<br>예매를 할 수 있는 사이트 입니다.</p>
	</div>
</div>

<div class="wrap">
	<div class="intro_wrap">
		<div class="intro">
			<div>
				<h3 class="intro_title">공연</h3>
				<div class="explan">
					<img src="<%=request.getContextPath()%>/img/intro1.jpg" alt="공연 이미지">
					<div>
						<div class="intro_number">01</div>
						<span class="intro_kind">Performance</span>
						<h4><span class="comma">"</span>전라북도 요기조기의 공연은</h4>
						<div>
							'아시아'를 주제로 한 공연예술 작품의 제작과 유통 플랫폼을 지향하고 있으며, 광주라는 작은 동심원에서 시작하여 한국과 아시아, 나아가 세계와 교류하는 국제적 허브로 자리매김하고자 노력하고 있습니다. 장르의 경계를 초월하여 새로운 공연작품의 미래를 선도하는 창·제작공연과 초청공연 등을 추진하고 있습니다
						</div>
						<a class="btn" href="<%=request.getContextPath()%>/culture/list.do?bkind=S">더보기</a>
					</div>
				</div>
			</div>

			<div>
				<h3 class="intro_title">전시</h3>
				<div class="explan">
					<div>
						<div class="intro_number">02</div>
						<span class="intro_kind">exhibition</span>
						<h4><span class="comma">"</span>전라북도 요기조기의 전시는</h4>
						<div>
							국립아시아문화전당은 전 세계인들이 공감할 수 있는 동시대 주요 주제와 이슈, 아시아를 비롯한 세계 역사와 문화에 대한 다학제적 연구와 창제작을 기반으로 한 다양한 전시를 선보이고 있습니다.
						</div>
						<a class="btn" href="<%=request.getContextPath()%>/culture/list.do?bkind=E">더보기</a>
					</div>
					<img src="<%=request.getContextPath()%>/img/intro2.jpg" alt="전시 이미지">
				</div>
			</div>

			<div>
				<h3 class="intro_title">축제</h3>
				<div class="explan">
					<img src="<%=request.getContextPath()%>/img/intro3.jpg" alt="전시 이미지">
					<div>
						<div class="intro_number">03</div>
						<span class="intro_kind">festival</span>
						<h4><span class="comma">"</span>전라북도 요기조기의 축제는</h4>
						<div>
							요기조기 축제는 보다 많은 시민이 향유하고 직접 참여할 수 있는
분야별 축제와 다채로운 행사를 연중 운영하고 있습니다.
						</div>
						<a class="btn" href="<%=request.getContextPath()%>/culture/list.do?bkind=F">더보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<!-- ============================ 메인 컨텐츠 영역 ================================ -->
<%@ include file="./include/footer.jsp" %>