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
               <tr><td>���̵�</td><td><input type="text" name="userid" /></td></tr>
               <tr><td>��й�ȣ</td><td><input type="password" name="userpw" /></td></tr>
               <tr><td>�̸���</td><td><input type="text" name="useremail" /><input type="button"value="��ư"></td></tr>
               <tr><td>�̸��� �ڵ�</td><td><input type="text" name="usercode" /></td></tr>
               <input type="submit" value="��ư">
           </table>
        </form>
	</body>
</html>