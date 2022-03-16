<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<%@ include file="../../config/config.jsp" %>
<%
UserVO login = (UserVO)session.getAttribute("login");
//request.setCharacterEncoding("euc-kr");

int maxPostSize = 10 * 1024 * 1024; // 10MB
String uploadPath = "C:\\hje\\�����ڷ�\\30_��������Ʈ\\05.���ձ���\\Ego\\Ego_v.0.2\\WebContent\\testlist";
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxPostSize, "euc-kr");

Enumeration formNames = multi.getFileNames();  // ���� �̸� ��ȯ

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
if (formNames != null) //÷�������� �ִٸ� 
{
	String filename = (String) multi.getFilesystemName("file");
	fileInput = (String)formNames.nextElement();                          // ������ǲ �̸�
    fileName = multi.getFilesystemName(fileInput);                        // ���ϸ�
    
	if (filename != null) //file ���� �ִٸ�
	{
		System.out.println("���ϸ� : " + filename);
		srcName = uploadPath + "\\\\" + filename; //�ٿ�ε��� ���� ���
		
    	fileObj = multi.getFile(fileInput);                              //���ϰ�ü
    	file = fileObj.getAbsolutePath();
        fileExtend = fileName.substring(fileName.lastIndexOf(".")+1);    // ���� Ȯ����
	}
}


TestVO vo = new TestVO();
vo.setWriterNumber(login.getNo());
vo.setCategoryNumber(cate);
vo.setTestTitle(title);
vo.setFoldername(folder);
vo.setHashtag(hash);

out.print("�׽�Ʈ�̸�:"+title+"<br>");
out.print("ī�װ�����ȣ:"+cate+"<br>");
out.print("�ؽ���:"+hash+"<br>");
out.print("������:"+folder+"<br>");
out.print("=========================="+"<br>");
out.print("���ϰ�ü:"+fileObj+"<br>");
out.print("getName:"+file+"<br>");
out.print("��ǲ�̸�:"+fileInput+"<br>");
out.print("�ø����ϸ�:"+fileName+"<br>");
out.print("Ȯ����:"+fileExtend+"<br>");
out.print("=========================="+"<br>");
out.print("Ȯ����:"+srcName+"<br>");
out.print("=========================="+"<br>");
vo.PrintInfo();

TestDTO dto = new TestDTO();
dto.testInsert(vo,srcName);
/*
if(dto.testInsert(vo,srcName))
{
	out.println("�׽�Ʈ�̸�:"+title+"<br>");
	out.println("ī�װ�����ȣ:"+cate+"<br>");
	out.println("�ؽ���:"+hash+"<br>");
	out.println("������:"+folder+"<br>");
	out.println("=========================="+"<br>");
	out.println("���ϰ�ü:"+fileObj+"<br>");
	out.println("getName:"+file+"<br>");
	out.println("��ǲ�̸�:"+fileInput+"<br>");
	out.println("�ø����ϸ�:"+fileName+"<br>");
	out.println("Ȯ����:"+fileExtend+"<br>");
	out.println("=========================="+"<br>");
	out.println("Ȯ����:"+srcName+"<br>");
} else
{
	out.println("error");
}
*/
response.sendRedirect("view.jsp?tab=2&no="+dto.setLastid("t_no"));
%>