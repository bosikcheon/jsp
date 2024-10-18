package study.j1015;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1015/Test10Ok2")
public class Test10Ok2 extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : " + pwd);
		
		if(mid.equals("admin") && pwd.equals("1234")) {
			//response.sendRedirect("/javaGroup/study/1015/test09Admin.jsp");
			response.sendRedirect(request.getContextPath() + "/study/1015/test10Admin.jsp?mid="+mid);
		}
		else if((mid.equals("hkd1234") && pwd.equals("1234")) || (mid.equals("kms1234") && pwd.equals("1234"))) {
			response.sendRedirect(request.getContextPath() + "/study/1015/test10Member.jsp?mid="+mid);
		}
		else {
			response.sendRedirect(request.getContextPath() + "/study/1015/test10.jsp?flag=no");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
}
