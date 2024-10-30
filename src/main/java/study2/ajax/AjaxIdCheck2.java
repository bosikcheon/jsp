package study2.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;

@SuppressWarnings("serial")
@WebServlet("/AjaxIdCheck2")
public class AjaxIdCheck2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		
		if(name.equals("")) {
			name = "찾는 아이디가 없습니다.";
		}
		response.getWriter().write(name);
	}
}
