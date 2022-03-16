package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.GetImageCaptchaCommand;
import command.InputKeyCheckCommand;
import common.PathNRedirect;
/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    public Controller()
    {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=UTF-8");

        String requestUri = request.getRequestURI(); // requestUri 요청 주소 전체를 의미        // /18_CAPCHA/*.do
        String contextPath = request.getContextPath(); // ContextPath: 프로젝트 이름 18_CAPCHA// /18_CAPCHA
        String cmd = requestUri.substring(contextPath.length()); // /*.do

        PathNRedirect pathNRedirect = null;
        Command command = null;

        switch(cmd)
        {
        case "/getImageCaptcha.do":
            command = new GetImageCaptchaCommand();
            pathNRedirect = command.execute(request, response);
            break;
        case "/loginPage.do":
        command = new InputKeyCheckCommand();
        pathNRedirect = command.execute(request, response);
        break;
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
