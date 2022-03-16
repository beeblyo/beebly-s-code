package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.ApiDao;
import api.ApiVo;

@WebServlet("/CultureController")
public class CultureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CultureController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri  = request.getRequestURI();
		String pj = request.getContextPath();
		String command =  uri.substring(pj.length());
		System.out.println("command=> " + command);
		
		if (command.equals("/culture/list.do")) 
		{
			HttpSession session = request.getSession();
			
			String bkind = request.getParameter("bkind");
			String key   = request.getParameter("key");
			
			if(bkind == null) bkind = "S";
			if(key == null) key = "";
			
			String kindName = "공연";
			if(bkind.equals("E")) kindName = "전시"; 
			else if(bkind.equals("F")) kindName = "축제"; 
			
			System.out.println("bkind : " + bkind);
			System.out.println("key : " + key);
			
			session.setAttribute("key", key);
			session.setAttribute("bkind", bkind);
			session.setAttribute("kindName", kindName);
			

			ApiDao dao = new ApiDao();
			ArrayList<ApiVo> bestlist = dao.selectBestApi("22");
			session.setAttribute("bestlist", bestlist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/list.jsp?bkind="+ bkind +"&key="+key);
			rd.forward(request, response);
			
		}else if(command.equals("/culture/addlist.do"))
		{
			
			HttpSession session = request.getSession();
			
			String bkind = (String)session.getAttribute("bkind");
			String key   = (String)session.getAttribute("key");

			int paging = Integer.parseInt(request.getParameter("paging"));
			int limit = 8;
			int start_no = (paging - 1) * limit;

			ApiDao dao = new ApiDao();
			ArrayList<ApiVo> alist = dao.selectBestApi("전주");
			alist = dao.selectAllApi(bkind,start_no,limit,key);
			session.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/gallery.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/culture/view.do"))
		{
			HttpSession session = request.getSession();		
			
			String bkind = request.getParameter("bkind");
			System.out.println("bkind : " + bkind);
			
			String cno = request.getParameter("no");
			if(cno == null || cno.equals("")) cno = "1";

			ApiDao dao = new ApiDao();
			ApiVo vo = dao.selectOneApi(bkind, cno);
			session.setAttribute("vo", vo);
			
			RequestDispatcher rd = request.getRequestDispatcher("/view.jsp");			
			rd.forward(request, response);
		}
		
	}
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}