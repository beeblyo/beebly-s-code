<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dto.*" %>
<%@ page import="ego.vo.*" %> 
<%
//============= �Ű����� �м� ó�� [ ���� ] ==
request.setCharacterEncoding("euc-kr");

String uid  = request.getParameter("id");     //���̵�
String upw  = request.getParameter("pw");     //���
//============= �Ű����� �м� ó�� [ ���� ] ==

UserDTO dto = new UserDTO();
UserVO loginVO = dto.Login(uid, upw);
if( loginVO != null)
{
	//�α��� ����
	session.setAttribute("login", loginVO);
	out.print("TRUE");
}else
{
	//�α��� ����
	out.print("FALSE");
}
%>
