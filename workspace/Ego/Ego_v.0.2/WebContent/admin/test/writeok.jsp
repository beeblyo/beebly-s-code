<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ include file="../../config/config.jsp" %>
<%
UserVO login = (UserVO)session.getAttribute("login");
//request.setCharacterEncoding("euc-kr");

int maxPostSize = 10 * 1024 * 1024; // 10MB
String uploadPath = "C:\\hje\\수업자료\\30_팀프로젝트\\05.통합구현\\Ego\\Ego_v.0.2\\WebContent\\testlist";
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxPostSize, "euc-kr");

Enumeration formNames = multi.getFileNames();  // 폼의 이름 반환

String title  = multi.getParameter("title");
String cate   = multi.getParameter("cate");
String[] hash = multi.getParameterValues("hash");
String folder = multi.getParameter("folder");
String tab = multi.getParameter("tab");

String fileInput = "";
String fileName = "";
File fileObj = null;
String file = "";
String originFileName = "";
String fileExtend = "";

String sql = "";
String srcName = "";
if (formNames != null) //첨부파일이 있다면 
{
	String filename = (String) multi.getFilesystemName("file");
	fileInput = (String)formNames.nextElement();                          // 파일인풋 이름
    fileName = multi.getFilesystemName(fileInput);                        // 파일명
    
	if (filename != null) //file 값이 있다면
	{
		System.out.println("파일명 : " + filename);
		srcName = uploadPath + "\\\\" + filename; //다운로드한 파일 경로
		
    	fileObj = multi.getFile(fileInput);                              //파일객체
    	file = fileObj.getAbsolutePath();
        fileExtend = fileName.substring(fileName.lastIndexOf(".")+1);    // 파일 확장자
	}
}


TestVO vo = new TestVO();
vo.setWriterNumber(login.getNo());
vo.setCategoryNumber(cate);
vo.setTestTitle(title);
vo.setFoldername(folder);
vo.setHashtag(hash);

out.print("테스트이름:"+title+"<br>");
out.print("카테고리번호:"+cate+"<br>");
out.print("해쉬값:"+hash+"<br>");
out.print("폴더명:"+folder+"<br>");
out.print("=========================="+"<br>");
out.print("파일객체:"+fileObj+"<br>");
out.print("getName:"+file+"<br>");
out.print("인풋이름:"+fileInput+"<br>");
out.print("올린파일명:"+fileName+"<br>");
out.print("확장자:"+fileExtend+"<br>");
out.print("=========================="+"<br>");
out.print("확장자:"+srcName+"<br>");
out.print("=========================="+"<br>");
vo.PrintInfo();

TestDTO dto = new TestDTO();
dto.testInsert(vo,srcName);
/*
if(dto.testInsert(vo,srcName))
{
	out.println("테스트이름:"+title+"<br>");
	out.println("카테고리번호:"+cate+"<br>");
	out.println("해쉬값:"+hash+"<br>");
	out.println("폴더명:"+folder+"<br>");
	out.println("=========================="+"<br>");
	out.println("파일객체:"+fileObj+"<br>");
	out.println("getName:"+file+"<br>");
	out.println("인풋이름:"+fileInput+"<br>");
	out.println("올린파일명:"+fileName+"<br>");
	out.println("확장자:"+fileExtend+"<br>");
	out.println("=========================="+"<br>");
	out.println("확장자:"+srcName+"<br>");
} else
{
	out.println("error");
}
*/
response.sendRedirect("view.jsp?tab=2&no="+dto.setLastid("t_no"));
%>