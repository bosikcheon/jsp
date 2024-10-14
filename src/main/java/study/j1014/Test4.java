package study.j1014;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({ "/Test4", "/T4", "/T04"})
public class Test4 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		System.out.println("이곳은 Test4 서블릿 파일 입니다.(Get)");
		//response.getWriter().append("Served at4: ").append(request.getContextPath()).append("<br/>: Hello~~~");
		
		PrintWriter out = response.getWriter();
		out.println("<p><a href='/javaGroup/study/1014/test2.jsp'>test2.jsp로 복귀</a></p>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4 서블릿 파일 입니다.(Post)");
		doGet(request, response);
	}

}
