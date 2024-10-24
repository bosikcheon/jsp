package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("/study2/mapping/list.do")	// 디렉토리패턴
@WebServlet("*.do")		// 확장자 패턴(FrontController)
public class DoController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = request.getParameter("msg")==null ? "" : request.getParameter("msg");
		
		request.setAttribute("msg", msg);

		DoInterface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		System.out.println("uri : " + uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		System.out.println("com : " + com);
		
		if(com.equals("list")) {
			command = new DoListCommand();
			command.execute(request, response);
			viewPage += "doList.jsp";
		}
		else if(com.equals("search")) {
			command = new DoSearchCommand();
			command.execute(request, response);
			viewPage += "doSearch.jsp";
		}
		else if(com.equals("input")) {
			command = new DoInputCommand();
			command.execute(request, response);
			viewPage += "doInput.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new DoInputOkCommand();
			command.execute(request, response);
			viewPage += "test2.jsp";
		}
		else if(com.equals("update")) {
			command = new DoUpdateCommand();
			command.execute(request, response);
			viewPage += "doUpdate.jsp";
		}
		else if(com.equals("updateOk")) {
			command = new DoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("delete")) {
			command = new DoDeleteCommand();
			command.execute(request, response);
			viewPage += "doDelete.jsp";
		}
		else if(com.equals("deleteOk")) {
			command = new DoDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
