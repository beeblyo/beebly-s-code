<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./include/header.jsp" %>
<!-- ====================== ???? ?????? ???? ==================== -->
<%

sql  = "select b_no,u_no,b_title,b_note,b_kind,date(b_date) as b_date,";
sql += "(select u_nickname from user where u_no = board.u_no) as u_nickname ";
sql += "from board ";
sql += "where b_kind = 'N' ";
sql += "order by b_no desc ";
sql += "limit " + 0 + ",10 ";

dbms.OpenQuery(sql);
%>
<main>
	<div class="wrap">
		<div class="notice_view_wrap">
			<div class="backward_wrap">
				<div class="back_btn">
					<a href="index.jsp"></a>
				</div>
			</div>
			<%
				while(dbms.GetNext() == true)
				{	
					String bno = dbms.GetValue("b_no");
					String uno = dbms.GetValue("u_no");
					String btitle = dbms.GetValue("b_title");
					String bnote = dbms.GetValue("b_note");
					String bkind = dbms.GetValue("b_kind");
					String bdate = dbms.GetValue("b_date");
					String unick = dbms.GetValue("u_nickname");
					%>
					<div onclick="javascript:DoDisplay(this);" class="notice_item">
						<div class="notice">
							<div class="notice_title"><%= btitle %></div>
							<div class="notice_date"><%= bdate %></div>
							<div class="arrow_btn"></div>
						</div>
						<div class="notice_view">
							<%= bdate %><br>
							<%= bnote %>
						</div>
					</div>
				<%
			}
			%>
		</div>
	</div>
</main>
<!-- ====================== ???? ?????? ?? ==================== -->
<%@ include file="./include/footer.jsp" %>