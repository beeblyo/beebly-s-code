<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	 <form action="sendMail.jsp" method="post">
           <table>
               <tr><th colspan="2">JSP </th></tr>
               <tr><td>아이디</td><td><input type="text" name="userid" /></td></tr>
               <tr><td>비밀번호</td><td><input type="password" name="userpw" /></td></tr>
               <tr><td>이메일</td><td><input type="text" name="useremail" /><input type="button"value="버튼"></td></tr>
               <tr><td>이메일 코드</td><td><input type="text" name="usercode" /></td></tr>
               <input type="submit" value="버튼">
           </table>
        </form>
	</body>
</html>