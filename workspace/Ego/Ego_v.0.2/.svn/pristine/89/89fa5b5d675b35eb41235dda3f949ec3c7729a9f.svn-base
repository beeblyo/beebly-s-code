<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ego.dbms.*" %>
<%@ page import="ego.vo.*" %>
<%@ page import="ego.dto.*" %>
<%@ include file="../../include/ad_header.jsp" %>
<%

String btitle = request.getParameter("title");  //제목
String bkind  = request.getParameter("kind");   //구분
String bnote  = request.getParameter("note");   //내용
String uno    = login.getNo();

System.out.println("제목:" + btitle);
System.out.println("구분:" + bkind);
System.out.println("내용:" + bnote);
System.out.println("회원번호:" + uno);
tab    = request.getParameter("tab");    //텝번호

BoardVO vo   = new BoardVO();
BoardDTO dto = new BoardDTO();

vo.setUno(uno);
vo.setTitle(btitle);
vo.setKind(bkind);
vo.setNote(bnote);

dto.Insert(vo);


%>
<script>
	alert("글쓰기가 완료되었습니다.");
	document.location = "view.jsp?tab=4&kind=<%=bkind%>&no=<%= vo.getNo() %>";
</script>
<%@ include file="../../include/ad_footer.jsp" %>