  package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDao;
import model.BoardVo;
import model.FaqDao;
import model.FaqVo;
import model.MemberVo;
import model.ReplyDao;
import model.ReplyVo;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//예시url  /JspTest/board/boardWrite.do
		String uri  = request.getRequestURI();
		String pj = request.getContextPath();
		String command =  uri.substring(pj.length());
		
		//System.out.println("추출주소값"+command);
		
		if (command.equals("/board/boardwrite.do")) 
		{
			//HttpSession session = request.getSession();
			
			//MemberVo login = (MemberVo)session.getAttribute("login");
			//int mno = login.getMno();
			//String mno1 = "" + mno;
			//session.setAttribute("mno", mno1);
			
			//글쓰기 페이지로 이동한다			
			RequestDispatcher rd = request.getRequestDispatcher("/boardwrite.jsp");			
			rd.forward(request, response);	
		
		}else if(command.equals("/board/boardSearch.do"))
		{
			String key = request.getParameter("key");
			
			BoardDao bd = new BoardDao();
			
			RequestDispatcher rd =	request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		else if (command.equals("/board/boardWriteAction.do")) 
		{
			HttpSession session = request.getSession();
			
			request.setCharacterEncoding("UTF-8");

			MemberVo login = (MemberVo)session.getAttribute("login");
			int mno = login.getMno();
			String mno1 = "" + mno;
			
			//String mno    = (String)session.getAttribute("mno");
			String btitle = request.getParameter("btitle");
			String topic = request.getParameter("topic");
			String bnote  = request.getParameter("bnote");
			String bkind  = request.getParameter("bkind");
			
			System.out.println(mno);
			System.out.println(btitle);
			System.out.println(bnote);
			System.out.println(bkind);
			System.out.println(topic);
			
			//2. 넘어온 값을 DB에 입력한다 (처리)
			BoardDao  bd =  new BoardDao();
			BoardVo bv = new BoardVo();
			
			bv.setMno(mno1);
			bv.setBtitle(topic+"@@"+btitle);
			bv.setBnote(bnote);
			bv.setBkind(bkind);
			
			int exec = bd.insertBoard(bv);		
		
			if (exec !=0) {
			response.sendRedirect(request.getContextPath()+"/board/board.do");	
			}else 
			response.sendRedirect(request.getContextPath()+"/board/boardwrite.do");	
	
		}else if(command.equals("/board/boardmodify.do"))
		{
			String bno = request.getParameter("bno");
			int bno2 = Integer.parseInt(bno);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.selectOneBoard(bno2);
			System.out.println(bno2);
			
			request.setAttribute("boardmodi", bv);
			
			RequestDispatcher rd =	request.getRequestDispatcher("/boardmodify.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/board/boardModifyAction.do"))
		{
			request.setCharacterEncoding("UTF-8");
			
			String bno = request.getParameter("bno");
			String topic = request.getParameter("topic");
			String btitle = request.getParameter("btitle");
			String bnote = request.getParameter("bnote");
			String bkind = request.getParameter("bkind");
			
			int bno2 = Integer.parseInt(bno);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = new BoardVo();
			System.out.println(bno);
			System.out.println(topic);
			System.out.println(btitle);
			System.out.println(bnote);
			System.out.println(bkind);
			
			bv.setBtitle(topic+"@@"+btitle);
			bv.setBkind(bkind);
			bv.setBnote(bnote);
			bv.setBno(bno2);
			
			int exec = bd.updateBoard(bv);	
			if (exec !=0)
			{
				response.sendRedirect(request.getContextPath()+"/board/boardview.do?bno=" + bno2);	
			}else 
			response.sendRedirect(request.getContextPath()+"/board/boardmodify.do");
			
		}else if(command.equals("/board/boarddelete.do"))
		{
			String bno = request.getParameter("bno");
			int bno2 = Integer.parseInt(bno);
			
			System.out.println(bno);
			BoardDao bd = new BoardDao();
			bd.deleteBoard(bno2);
			
			response.sendRedirect(request.getContextPath()+"/board/board.do");
			
		}else if (command.equals("/board/board.do")) 
		{	
			request.setCharacterEncoding("UTF-8");
			
			BoardDao bd = new BoardDao();
			
			String page  = request.getParameter("page");
			if(page == null) page = "1";
			String bkind = request.getParameter("bkind");
			String key   = request.getParameter("key");
			if(key == null) key = "";
			if(bkind == null) bkind = "A";	
			
			System.out.println("구분 :" + bkind);
			System.out.println("검색값 :" + key);
			System.out.println("페이지 :" + page);
			//페이징을 위한 변수 선언
			int total = bd.boardTotal(bkind);
			int maxpage = 0;  //최대 페이지 갯수
			int curpage = 0;  //현재 페이지 번호

			int startno = 0;  //SQL limit 시작 번호
			int startBlock = 0; //페이징 시작 블럭 번호
			int endBlock   = 0; //페이징 끝 블럭 번호
			//(5)"index.jsp?page=1"에서 넘어온 page를 분석한다
			
			if( page != null)
			{
				//넘어온 page 값을 정수형 curpage로 변환한다.
				curpage = Integer.parseInt(page);
			}
			
			
			//(2)최대 페이지 갯수를 계산한다.
			maxpage = total / 10;
			if( total % 10 != 0) maxpage++;
			
			//(6) SQL의  limit 시작 번호를 계산한다.
			startno = (curpage - 1) * 10;
			
			//(9)페이징 시작블럭번호와 끝블럭 번호를 계산한다.
			startBlock = ( (curpage - 1)  / 10) * 10 + 1;
			endBlock   = startBlock + 10 - 1; 
			//(10)endBlock 이 최대 페이지 번호보다 크면 안됨.
			if( endBlock > maxpage)
			{
				//예: maxpage가 22인데, endBlock이 30이면 endBlock을 22로 변경
				endBlock = maxpage;
			}
			//처리하는 부분
			
			ArrayList<BoardVo> alist = bd.selectAllBoard(startno, bkind, key);
			
			request.setAttribute("alist", alist);	
			
			System.out.println(alist);
			
			request.setAttribute("page", page);
			request.setAttribute("bkind", bkind);
			request.setAttribute("key", key);
			
			RequestDispatcher rd =	request.getRequestDispatcher("/board.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/board/boardview.do")) {
			
			String bno = request.getParameter("bno");
	
			int bno2 = Integer.parseInt(bno);
			
			BoardDao bd = new BoardDao();
			bd.hitUp(bno2);
			BoardVo bv = bd.selectOneBoard(bno2);	
			
			ReplyDao rd = new ReplyDao();
			int total = rd.getListTotal(bno2);
			ArrayList<ReplyVo> alist = rd.selectAllReply(bno);
			
			request.setAttribute("total", total);
			request.setAttribute("alist", alist);
			request.setAttribute("boardview", bv);
		
			RequestDispatcher rd1 =	request.getRequestDispatcher("/boardview.jsp");
			rd1.forward(request, response);
		}else if (command.equals("/board/replyAction.do"))
		{
			String bno = request.getParameter("bno");
			String mno = request.getParameter("mno");
			String rnote = request.getParameter("rnote");
			
			System.out.println(bno);
			System.out.println(mno);
			System.out.println(rnote);
			
			ReplyVo rv = new ReplyVo();
			ReplyDao rd = new ReplyDao();
			
			rv.setBno(bno);
			rv.setMno(mno);
			rv.setRnote(rnote);
			
			int exec = rd.insertReply(rv);
			if (exec !=0)
			{
				response.sendRedirect(request.getContextPath()+"/board/boardview.do?bno=" + bno);	
			}
		}else if(command.equals("/board/replymodi.do"))
		{
			HttpSession session = request.getSession();
			
			MemberVo login = (MemberVo)session.getAttribute("login");
			
			System.out.println("login :" + login);

			String rno = request.getParameter("rno");

			ReplyDao rd = new ReplyDao();

			System.out.println("rno" +rno);
			int rno2 = Integer.parseInt(rno);

			ReplyVo rv = rd.selectOneReply(rno2);

			System.out.println("Mnumber"+ login.getMno());
			System.out.println("Rnote"+ rv.getRnote());
			
			request.setAttribute("rv", rv);
			
			RequestDispatcher rd1 = request.getRequestDispatcher("/replymodi.jsp");			
			rd1.forward(request, response);	
			
		}else if(command.equals("/board/replyModiAction.do"))
		{
			String bno  = request.getParameter("bno");
			String rnote = request.getParameter("rnote");
			String rno = request.getParameter("rno");

			System.out.println("bno:" + bno);
			System.out.println("rnote :" +rnote);
			System.out.println("rno :" + rno);

			int rno2 = Integer.parseInt(rno);
			ReplyVo rv = new ReplyVo();
			ReplyDao rd = new ReplyDao();

			rv.setBno(bno);
			rv.setRno(rno2);
			rv.setRnote(rnote);

			int exec = rd.updateReply(rv);
			
			if(exec > 0)
			{
				request.setAttribute("rv", rv);
			}
			
			
		    RequestDispatcher rd1 = request.getRequestDispatcher("/replymodiok.jsp");			
			rd1.forward(request, response);
		}else if(command.equals("/board/replyDelete.do"))
		{
			String bno = request.getParameter("bno");
			String rno = request.getParameter("rno");
			
			System.out.println(bno);
			System.out.println(rno);
			
			int rno2 = Integer.parseInt(rno);
			System.out.println("변환 " + rno2);
			
			ReplyDao rd = new ReplyDao();
			rd.deleteReply(rno2);
			
			response.sendRedirect(request.getContextPath()+"/board/boardview.do?bno=" + bno);
		}
		/**********************inquiry controller************************************/
		else if(command.equals("/board/inquiry.do"))
		{
			FaqDao fd = new FaqDao();
			ArrayList<FaqVo> alist = fd.selectAllFaq();
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd =	request.getRequestDispatcher("/inquiry.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
