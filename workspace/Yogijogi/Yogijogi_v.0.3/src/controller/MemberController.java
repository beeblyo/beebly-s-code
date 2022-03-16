package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.*;
import model.BookmarkDao;
import model.BookmarkVo;
import model.MemberDao;
import model.MemberVo;
import util.SHA256;

@WebServlet("/MemberController")
public class MemberController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = request.getRequestURI();		
		String pj = request.getContextPath();
		String command = url.substring(pj.length());
		String[] str = command.split("/");
		
		if(command.equals("/member/memberList.do"))
		{
			MemberDao md = new MemberDao();
			ArrayList<MemberVo> alist = md.selectAllMember();

			HttpSession session = request.getSession();
			session.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/memberList.jsp");
			rd.forward(request, response);
		}else if(command.equals("/member/login.do"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("/memberLogin.jsp");
			rd.forward(request, response);	
			
		}else if(command.equals("/member/loginAction.do"))
		{
			//파라미터로 값 넘겨받기
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");
			
			System.out.println(mid);
			System.out.println(mpw);
			
			//객체생성 후 로그인 메소드를 호출해서 값을 넘긴다.
			MemberDao md = new MemberDao();
			MemberVo mv = md.loginMember(mid, mpw);
			
			//리턴값 받은 회원 정보 값을 세션에 담는다.
			HttpSession session = request.getSession();
			session.setAttribute("login", mv);
			
			response.sendRedirect(request.getContextPath() + "/culture/list.do");
		
		}else if(command.equals("/member/logout.do"))
		{
			HttpSession session = request.getSession();
			session.removeAttribute("login");
			session.invalidate();

			response.sendRedirect(request.getContextPath()+"/");
		
		}else if(command.equals("/member/join.do"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("/join.jsp");
			rd.forward(request, response);	
		
		}else if(command.equals("/member/joinAction.do"))
		{
			
			
			String mid = request.getParameter("mid");
			String mpw = request.getParameter("mpw");
			String mname = request.getParameter("mname");

			String first = request.getParameter("first");
			String middle = request.getParameter("middle");
			String last = request.getParameter("last");

			String mpnum = first+"-"+middle+"-"+last;
			String memail = request.getParameter("memail");
			
			System.out.println(mid);
			System.out.println(mpw);
			System.out.println(mname);
			System.out.println(mpnum);
			System.out.println(memail);
			
			MemberDao md = new MemberDao();
			MemberVo mv  = new MemberVo();
			
			mv.setMid(mid);
			mv.setMname(mname);
			mv.setMpw(mpw);
			mv.setMpnum(mpnum);
			mv.setMemail(memail);
			
			int exec = md.insertMember(mv);
			if(exec != 0) {
				HttpSession session = request.getSession();
				session.setAttribute("mid", mid);
				session.setAttribute("memail", memail);
				response.sendRedirect(request.getContextPath() + "/member/memberEmailSend.do");
			}
			else response.sendRedirect(request.getContextPath() + "/member/join.do");
		
		}else if(command.equals("/member/memberEmailSend.do"))
		{
			HttpSession session = request.getSession();
			String mid = (String)session.getAttribute("mid");
			String memail = (String)session.getAttribute("memail");
					
			String host = "http://jjezen.cafe24.com"+request.getContextPath()+"/";
			System.out.println("host"+host);
			String from = "ego7302@naver.com";
			String to = memail;
			String subject = "요기조기 회원가입을 위한 이메일 확인 메일입니다.";
			String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
				"<a href='" + host + "mailcheck.jsp?mid=" + mid + "&code=" + to + "'>이메일 인증하기</a>";
			 
			Properties p = new Properties();
		    p.put("mail.smtp.user", from);
		    p.put("mail.smtp.host", "smtp.naver.com");
		    p.put("mail.smtp.port", "457");
		    p.put("mail.smtp.starttls.enable", "true");
		    p.put("mail.smtp.auth", "true");
		    p.put("mail.smtp.ssl.enable", "true");
		    p.put("mail.smtp.ssl.trust", "smtp.naver.com");
		    p.put("mail.smtp.debug", "true");
		    p.put("mail.smtp.socketFactory.port", "465");
		    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		    p.put("mail.smtp.socketFactory.fallback", "false");
			
		    try 
		    {
		 	   Authenticator auth = new NaverMail();
		 	   Session ses = Session.getInstance(p, auth);
		 	   ses.setDebug(true);
		 	   MimeMessage msg = new MimeMessage(ses);
		 	   msg.setSubject(subject);
		 	   Address fromAddr = new InternetAddress(from);
		 	   msg.setFrom(fromAddr);
		 	   Address toAddr = new InternetAddress(to);
		 	   msg.addRecipient(Message.RecipientType.TO, toAddr);
		 	   msg.setContent(content, "text/html;charset=UTF-8");
		 	   Transport.send(msg); 	   
		    } catch (Exception e) 
		    {
		 	   e.printStackTrace();
		 	   PrintWriter script = response.getWriter();
		 	   script.println("<script>");
		 	   script.println("alert('오류가 발생했습니다..');");
		 	   script.println("history.back();");
		 	   script.println("</script>");
		 	   script.close();
		 	   return;
		    }

			response.sendRedirect(request.getContextPath() + "/mailsend.jsp");
		
		}
		else if(command.contentEquals("/member/memberInfo.do"))
		{
			HttpSession session = request.getSession();
			
			MemberVo login = (MemberVo)session.getAttribute("login");
			System.out.println("로그인 확인");
			
			//MemberDao md = new MemberDao();
			//MemberVo  mv = md.selectOneMember(mno);
			if(login != null) {
				MemberDao md = new MemberDao();
				MemberVo  mv = md.selectOneMember(login.getMno());
				System.out.println("mv set");
				
				request.setAttribute("mv", mv);
				
				BookmarkDao bd = new BookmarkDao();
				ArrayList<BookmarkVo> bv = bd.bookmarkIndex(login.getMno());
				System.out.println(login.getMno());
				
				session.setAttribute("bookmark", bv);
				
				RequestDispatcher rd =	request.getRequestDispatcher("/memberInfo.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/member/login.do");
			}
			
		}else if(command.contentEquals("/member/memberModify.do"))
		{
			//비밀번호 비교 후 일치해서 회원정보 들어가고 싶으면 mpw로 받고 비교하기
			HttpSession session = request.getSession();
			
			MemberVo login = (MemberVo)session.getAttribute("login");
			
			//MemberDao md = new MemberDao();
			//MemberVo  mv = md.selectOneMember(mno);
			if(login != null) {
				MemberDao md = new MemberDao();
				MemberVo  mv = md.selectOneMember(login.getMno());
				if(mv != null) {
					request.setAttribute("mv", mv);
					
					RequestDispatcher rd =	request.getRequestDispatcher("/memberModify.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/member/memberModify.do");
				}
				
			} else {
				response.sendRedirect(request.getContextPath() + "/member/login.do");
			}
			
		}else if(command.contentEquals("/member/memberModiAction.do"))
		{
			request.setCharacterEncoding("UTF-8");

			String first = request.getParameter("first");
			String middle = request.getParameter("middle");
			String last = request.getParameter("last");

			String mpnum = first+"-"+middle+"-"+last;
			String mpw = request.getParameter("mpw");
			String mno = request.getParameter("mno");
			
			int mno2 = Integer.parseInt(mno);
//			System.out.println(memail);
//			System.out.println(mpw);
//			System.out.println(mno);
			
			MemberDao md = new MemberDao();
			MemberVo mv = new MemberVo();
			
			mv.setMpnum(mpnum);
			if(!(mpw == "" || mpw == null)) mv.setMpw(mpw);
			mv.setMno(mno2);
			
			int exec = md.modiInfo(mv);
			
			if (exec !=0) 
			{
				response.sendRedirect(request.getContextPath()+"/member/memberInfo.do");
			}else 
			{
				response.sendRedirect(request.getContextPath()+"/member/memberModify.do");
			}
			
		}else if(command.equals("/member/retire.do"))
		{
			HttpSession session = request.getSession();
			MemberVo login = (MemberVo)session.getAttribute("login");
			
			System.out.println(login.getMno());
			
			MemberDao md = new MemberDao();
			
			int exec = md.retireMember(login.getMno());
			if(exec != 0) {   
				response.sendRedirect(request.getContextPath()+"/member/login.do");
				session.removeAttribute("login");
				session.setAttribute("retire", "탈퇴 되었습니다.");
			} else          response.sendRedirect(request.getContextPath()+"/member/memberInfo.do");
			
			
		}
	}
}
