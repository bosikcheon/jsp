package study.j1014;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({ "/Test3", "/T3", "/T03"})
public class Test03 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test3 서블릿 파일 입니다.(Get)");
		response.getWriter().append("Served at3: ").append(request.getContextPath()).append("<br/>: Hello~~~");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test3 서블릿 파일 입니다.(Post)");
		doGet(request, response);
	}

}
