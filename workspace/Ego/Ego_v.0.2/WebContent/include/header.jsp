<%@page import="javax.sound.sampled.AudioFormat.Encoding"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%@ include file="../config/config.jsp" %>
<%
request.setCharacterEncoding("euc-kr");
UserVO login = (UserVO)session.getAttribute("login");
DBManager dbms = new DBManager();
dbms.DBOpen();

ArrayList<CategoryVO> c_vo = null;
CategoryDTO c_dto = new CategoryDTO();

c_vo = c_dto.categoryRead();

String keywords = request.getParameter("key");
if(keywords == null) keywords = "";
String category = request.getParameter("cate");
if(category == null) category = "";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Ego [���� �˾ư��� �ð�]</title>
		<link href="/Ego_v.0.2/css/base.css" rel="stylesheet">        <!-- ���� ��Ÿ�� 		-->
		<link href="/Ego_v.0.2/css/main.css" rel="stylesheet">        <!-- admin ��Ÿ��	-->
		<script src="/Ego_v.0.2/js/jquery-3.6.0.js"></script>         <!-- �������� 		-->
		<script src="/Ego_v.0.2/js/script.js" defer="defer" charset="euc-kr"></script> <!-- ���� ��Ʈ��Ʈ 		-->
		<!-- �����̵带 ���� ��ũ��Ʈ -->
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" charset="euc-kr"/>
  
	</head>
	
	<body>
		<div class="cookies">��Ű ���</div>
		<header>
			<div>
				<h1>
					<a class="b_logo" href="/Ego_v.0.2/index.jsp"></a>
				</h1>
				<div class="login_wrap">
				<%
				if( login == null )
				{
					%>
					<a href="/Ego_v.0.2/login/login.jsp"></a>
					<%
				}else
				{
					%>
					<a href="/Ego_v.0.2/user/info.jsp"></a>
					<a href="/Ego_v.0.2/login/logout.jsp"></a>
					<%
				}
				%>
				</div>
				
				<form name="search" method="get" action="/Ego_v.0.2/search.jsp">
					<div class="search" >
						<select class="search_select" name="cate"> 
							<option value="">��ü</option>
							<%
							if(c_vo != null)
							{
								for(CategoryVO item : c_vo)
								{
									%>
									<option value="<%=item.getCategoryNumber()%>" <%if(category.equals(item.getCategoryNumber())){%>selected="selected"<%}%>><%=item.getCategoryName().split(" ")[0]%></option>
									<%
								}
							}
							%>
						</select>
						
						<input id="key" name="key" type="text" placeholder="�˻�" autocomplete="off" value="<%=keywords%>">
						<input class="search_btn" type="image" src="/Ego_v.0.2/img/icon/search.jpg" onclick="this.form.submit();return false">
					</div>
				</form>
				
				<div class="notice_wrap">
					<a href="/Ego_v.0.2/question/question.jsp?kind=Q">�����ϱ�</a> | 
					<a href="/Ego_v.0.2/notice.jsp?kind=N">��������</a>
				</div>
			</div>
			
			<div class="recent">
				<div>
					<p>�ֱ� �˻���</p>
					<ul>					
					<%
						request.setCharacterEncoding("euc-kr");
						String tempkey = request.getParameter("key");
						
						if(tempkey != null && !tempkey.equals(""))
						{
							%>
							<li onmouseover="SearchIn(this);"><%= tempkey %></li>
							<%						
						}
						
						String srecent = "";
						String sql = "";
						
						sql += "select s_recent from search_record group by s_recent order by s_date desc ";
						sql += "limit 0,4 ";
						
					    dbms.OpenQuery(sql);
						while(dbms.GetNext() == true)
						{
							srecent = dbms.GetValue("s_recent");	
							%>
							<li onmouseover="SearchIn(this);"><%= srecent %></li>
							<%
						}
						System.out.println(srecent);			
					%>
					</ul>
				</div>
			</div>
		</header>