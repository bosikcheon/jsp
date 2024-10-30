package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.ajax.AjaxPointCheckCommand;
import study2.password.PassCheckOkCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증처리.....(spring에서는 aop의 개념)
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", "/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(level == 1) {
			request.setAttribute("message", "정회원부터 사용하실수 있습니다.");
			request.setAttribute("url", "/MemberMain.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/PassCheckForm")) {
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/PassCheckOk")) {
			command = new PassCheckOkCommand();
			command.execute(request, response);
			viewPage += "/password/passCheck.jsp";
		}
		else if(com.equals("/AjaxTest")) {
			viewPage += "/ajax/ajaxTest.jsp";
		}
		else if(com.equals("/AjaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AjaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AjaxPointCheck")) {
			command = new AjaxPointCheckCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
