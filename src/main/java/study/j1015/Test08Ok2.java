package study.j1015;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1015/Test08Ok2")
public class Test08Ok2 extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
//		String mid = request.getParameter("mid");
//		if(mid == null) mid = "";
//
//		String pwd = request.getParameter("pwd");
//		if(pwd == null) pwd = "";
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : " + pwd);
		
		if(mid.equals("admin") && pwd.equals("1234")) {
			response.sendRedirect("/javaGroup/study/1015/test08Admin.jsp");
		}
		else if(mid.equals("hkd1234") && pwd.equals("1234")) {
			response.sendRedirect("/javaGroup/study/1015/test08Member.jsp");
		}
		else {
			response.sendRedirect("/javaGroup/study/1015/test08.jsp?flag=no");
		}
	}
	
}
