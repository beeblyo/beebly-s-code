<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../config/config.jsp"%>
<%
request.setCharacterEncoding("euc-kr");
String t_no = request.getParameter("tno");
String u_no = request.getParameter("uno");

BookmarkDTO dto = new BookmarkDTO();

if(u_no == null || u_no.equals(""))
{
	out.print("FALSE");
} else
{
	if(dto.bookmarkInsert(t_no,u_no))
	{
		out.print("TRUE");
	} else
	{
		dto.bookmarkDelete(t_no,u_no);
		out.print("FALSE");
	}
}
%>