package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/FrontController")
public class FrontController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = request.getRequestURI();		
		String pj = request.getContextPath();
		String command = url.substring(pj.length());
		String[] str = command.split("/");
		
		System.out.println("구분:"+ str[1]);
		
		if(str[1].equals("member"))
		{
			System.out.println(url);
			MemberController mc = new MemberController();
			mc.doGet(request, response);
			
		}else if(str[1].equals("board"))
		{
			System.out.println(url);
			BoardController bc = new BoardController();
			bc.doGet(request, response);
			
		}else if(str[1].equals("culture"))
		{
			System.out.println(url);
			CultureController cc = new CultureController();
			cc.doGet(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
