<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%
//============= 매개변수 분석 처리 [ 시작 ] ==
request.setCharacterEncoding("euc-kr");

String   uid        = request.getParameter("id");            //아이디
String   uemail     = request.getParameter("email");         //이메일
String   upw        = request.getParameter("pw");            //비번
String   unick      = request.getParameter("nickname");      //닉네임
String   ugender    = request.getParameter("gender");        //성별
String   ubirth     = "";									 //생일
String   year       = request.getParameter("year");          //년
String   month      = request.getParameter("month");         //월
String   day        = request.getParameter("day");           //일
String   uretire    = request.getParameter("retire");        //탈퇴
String[] keyword    = request.getParameterValues("keyword"); //관심분야
String   mbti       = request.getParameter("mbti");          //mbti
//============= 매개변수 분석 처리 [ 종료 ] ==


   
    

UserDTO dto = new UserDTO();

int code = dto.IsDuplicate(uid);
if(code == UserDTO.NOT_DUPLICATE)
{
	//회원가입 진행
	UserVO user = new UserVO();
	
	ubirth = year + "-" + month + "-" + day;
	
	user.setId(uid);
	user.setEmail(uemail);
	user.setPw(upw);
	user.setNickname(unick);
	user.setGender(ugender);
	user.setBdate(ubirth);
	user.setRetire("N");
	user.setHost("N");
	user.setMbti(mbti);
	user.setKeywordList(keyword);
	
	
	
	if(dto.Insert(user) == false)
	{
		//회원가입 실패
		%>
		<script>
			alert("회원가입을 실패했습니다. 다시 시도해 주세요");
			document.location="join.jsp";
		</script>
		<%
	}else
	{
		//회원가입 완료시 자동 로그인.
		UserVO loginVO = dto.Login(uid, upw);
		if( loginVO != null)
		{
			session.setAttribute("login", loginVO);
		}
		
		response.sendRedirect("../index.jsp");
	}
	
}else
{
	//아이디 중복
	%>
	<script>
		alert("중복된 아이디가 존재합니다. 회원가입을 다시 하세요.");
		document.location = "join.jsp";
	</script>
	<%
}

%>