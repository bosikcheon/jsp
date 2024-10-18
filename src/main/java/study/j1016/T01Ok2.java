package study.j1016;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T01Ok2")
public class T01Ok2 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		// 넘어온 아이디와 비밀번호가 DB에 저장된 회원정보와 같은지를 비교.....
		
		String viewPage = "";
		RequestDispatcher dispatcher = null;
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			viewPage = "/study/1016/t02_Member.jsp";
			request.setAttribute("mid", mid);
		}
		else {
			viewPage = "/study/1016/t02_Dispatcher.jsp";
			request.setAttribute("flag", "no");
		}
		dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
