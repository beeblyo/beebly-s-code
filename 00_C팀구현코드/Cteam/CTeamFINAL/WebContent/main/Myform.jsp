<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	db.DBOpen();
 %>
<link rel="stylesheet" href="../css/Myform.css">
<div class="center_shell" style="border:none">
	<div id="user_info_container" style="justify-content:right;">
		<span style="margin-right:0px;">[<%= login.getUser_Name() %>]님</span>	
		<div style="width: 42%; margin-left:100px;border:none"><a href="../user/user.jsp">상세정보</a>/<a href="../user/logout.jsp">로그아웃</a></div>		
	</div>
	
	<div id="line"></div>
	<div class="section">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02" checked>
		<style>
			.section input[id*="slide"]{
				display:none;
			}
			.section .slidewrap{
				max-width:350px;
				max-height:40px;
				margin:0 auto;
				overflow:hidden;
			}
			.section .slidelist{
				white-space:nowrap;	
			}
			.section .slidelist > li{
				display:inline-block;
				vertical-align:middle;
				width:132%;
				max-height:50px;
				transition:all .5s;
			}
			.section .slidelist > li > a{
				display:block;
				position:relative;
				width:100%
			}
			.section .slidelist > li > a > div{
			}
			.section .slidelist > li > a > label
			{
				position:absolute;
				z-index:10;
				transform:translateY(-50%);
				padding:17px;
				cursor:pointer;
				background-color: red;				
			}
			.section .slidelist .left{
				left:-37px; 
				background:url('../image/left.png')center center / 100% no-repeat;
			}
			.section .slidelist .right{
				right:110px;
				background:url('../image/right.png')center center / 100% no-repeat;
			}
			.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0.8%);}
			.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100.8%);}
			.section .slidelist > li > a >p{
			transform:translate(-85%,-110%);
			cursor:pointer;
			}
			
		</style>		
		<script>
		
		window.onload = function()
		{
			ShowList(1);
		}
		
		//mode=1:최근본, 2:가고싶다, 3: 내가쓴
		function ShowList(mode)
		{
			myWriteDiv.style.display = "none";
			myViewDiv.style.display  = "none";
			myAlarmDiv.style.display  = "none";
			
			if(mode == 1)
			{
				myViewDiv.style.display = "block";
			}
			if(mode == 3)
			{
				myWriteDiv.style.display = "block";
			}
			if(mode == 4)
			{
				myAlarmDiv.style.display = "block";
			}
		}
		
		</script>
		<div class="slidewrap" >
			<ul class="slidelist">
				<li>
					<a>
						<label for="slide02" class="left"></label>
							<p style="padding-right:25px;display:inline-block;font-size:10pt;" onclick="ShowList(4)">신고 내역</p>
							<p style="padding-right:25px;display:inline-block;font-size:10pt;" onclick="ShowList(5)">고객 센터</p>
							<p style="padding-right:25px;display:inline-block;font-size:10pt;" onclick="ShowList(6)">개발 중임</p>
						<label for="slide02" class="right"></label>
					</a>
				</li>
				<li>
					<a>
						<label for="slide01" class="left" ></label>
							<p style="padding-right:10px;display:inline-block;font-size:10pt;" onclick="ShowList(1);">최근 본 게시물</p>
							<p style="padding-right:25px;display:inline-block;font-size:10pt;" onclick="ShowList(2);">가고 싶다</p>
							<p style="padding-right:10px;display:inline-block;font-size:10pt;" onclick="ShowList(3);">내가 쓴 게시물</p>
						<label for="slide01" class="right"></label>
					</a>
				</li> 
				
			</ul>
		</div>
	</div>
	<div id="line"></div>
	<div id="scroll" class="scroll" style="border:none">
		<!-- 내가 쓴 게시물 내용 -->
		<div id="myWriteDiv" style="display:none;">
			<% 
			String sql = "";
			sql  = "select Board_No, User_No, Board_Title, Board_Memo, Board_Kind, ";
			sql += "(select User_Name from user where User_No = Board.User_No) as User_Name ";
			sql += "from board ";
			sql += "where User_No = " + login.getUser_No() + " ";
			sql += "order by Board_No desc ";
			sql += "limit 0,10";
			//System.out.println(sql);
			db.OpenQurey(sql);
			while(db.GetNext() == true)
			{
				String Board_No = db.GetString("Board_No");
				String User_No = db.GetString("User_No");
				String Board_Title = db.GetString("Board_Title");
				String Board_Memo = db.GetString("Board_Memo");
				String Board_Kind = db.GetString("Board_Kind");
				%>
				<div id="content_container" style="margin-top:5px">
					<div style="border:none;"><img id="content_img" src="../public/download.jsp?no=<%= Board_No%>"></div>
					<div id="title"style="border:"><span style="font-size:11pt;margin-right:90px"><%=Board_Title %></span>							
					</div>
				</div>
				<%
			}
			%>
		</div>
		<!-- 내가 쓴 게시물 내용 -->
		<!-- 최근 본 게시물 내용 -->
		<div id="myViewDiv" style="display:none;">
			<% 
			sql  = "select Board_No, User_No, Board_Title, Board_Memo, Board_Kind, ";
			sql += "(select User_Name from user where User_No = Board.User_No) as User_Name ";
			sql += "from board ";
			sql += "where User_No = " + login.getUser_No() + " ";
			sql += "order by Board_No desc ";
			sql += "limit 0,10";
			//System.out.println(sql);
			db.OpenQurey(sql);
			while(db.GetNext() == true)
			{
				String Board_No = db.GetString("Board_No");
				String User_No = db.GetString("User_No");
				String Board_Title = db.GetString("Board_Title");
				String Board_Memo = db.GetString("Board_Memo");
				String Board_Kind = db.GetString("Board_Kind");
				%>
				<div id="content_container" style="margin-top:5px">
					<div style="border:none;"><img id="content_img" src="../image/jeonju.jpg"></div>
					<div id="title"style="border:"><span style="font-size:11pt;margin-right:90px"><%=Board_Title %></span>								
					</div>
				</div>
				<%
			}
			%>
		</div>
		<!-- 최근 본 게시물 내용 -->
		<!-- 신고 내역 내용 -->
		<div id="myAlarmDiv" style="display:none;">
			<% 

			sql  = "select Board_No, Board_Title from board where User_No='" +  login.getUser_No() + "' order by Board_No desc";
			System.out.println("신고내역 조회" + sql);
			//System.out.println(sql);
			db.OpenQurey(sql);
			while(db.GetNext() == true)
			{
				String Board_No		 = db.GetString("Board_No");
				System.out.println(Board_No);
				String Board_Title   = db.GetString("Board_Title");
				System.out.println("보드넘버"+ Board_No);
				System.out.println(Board_Title);
				%>
				<div id="content_container" style="margin-top:5px; border:none">
					<div style="border:none;"><img style="height:80px; width:140px;" src="../public/download.jsp?no=<%=Board_No%>" onerror="this.src='../image/jeonju.jpg'"></div>
					<div id="title"style="border:"><span style="font-weight:bold;font-size:11pt;margin-right:90px">신고!!</span>
					<div id="title"><span style="font-size:11pt; margin-right:100px;"><%=Board_Title %></span></div>			
					</div>
				</div>
				<%
			}
			%>
		</div>
		<!-- 신고 내역 내용 -->
	</div>
</div>
