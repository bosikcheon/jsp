package study.j1016;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/1016/T03Ok")
public class T03Ok extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h + "/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
		}
		System.out.println("취미 : " + hobby);
		System.out.println("직업 : " + job);
		
		String mountain = "";
		if(mountains != null) {
			for(String m : mountains) {
				mountain += m + "/";
			}
			mountain = mountain.substring(0, mountain.length()-1);
		}
		System.out.println("다녀온산 : " + mountain);
		
		System.out.println("자기소개 : " + content);
		content = content.replace("\n", "<br/>");
		String fName = request.getParameter("fName")==null ? "" : request.getParameter("fName");
		System.out.println("첨부파일 : " + fName);
		
		String viewPage = "";
		switch (flag) {
			case 1:
				PrintWriter out = response.getWriter();
				out.println("<h2>기록한 내용들</h2>");
				out.println("<hr/>");
				out.println("<p>성명 : "+name+"</p>");
				out.println("<p>나이 : "+age+"</p>");
				out.println("<p>성별 : "+gender+"</p>");
				out.println("<p>취미 : "+hobby+"</p>");
				out.println("<p>직업 : "+job+"</p>");
				out.println("<p>가본산 : "+mountain+"</p>");
				out.println("<p>자기소개 : <br/>"+content+"</p>");
				out.println("<p>첨부파일 : "+fName+"</p>");
				out.println("<hr/>");
				out.println("<p><a href='"+request.getContextPath()+"/study/1016/t03_Form.jsp'>돌아가기</a></p>");
				break;
			case 2:
				//viewPage = request.getContextPath()+"/study/1016/t03_res.jsp";
				viewPage = request.getContextPath()+"/study/1016/t03_res2.jsp";
				viewPage += "?name=" + URLEncoder.encode(name, "utf-8");
				viewPage += "&age=" + age;
				viewPage += "&gender=" + URLEncoder.encode(gender, "utf-8");
				viewPage += "&hobby=" + URLEncoder.encode(hobby, "utf-8");
				viewPage += "&job=" + URLEncoder.encode(job, "utf-8");
				viewPage += "&mountain=" + URLEncoder.encode(mountain, "utf-8");
				viewPage += "&content=" + URLEncoder.encode(content, "utf-8");
				viewPage += "&fName=" + URLEncoder.encode(fName, "utf-8");
				viewPage += "&title=" + "sendRedirect";
				response.sendRedirect(viewPage);
				break;
			case 3:
				request.setAttribute("name", name);
				request.setAttribute("age", age);
				request.setAttribute("gender", gender);
				request.setAttribute("hobby", hobby);
				request.setAttribute("job", job);
				request.setAttribute("mountain", mountain);
				request.setAttribute("content", content);
				request.setAttribute("fName", fName);
				request.setAttribute("title", "forword");
				//viewPage = "/study/1016/t03_res.jsp";
				viewPage = "/study/1016/t03_res2.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
				break;
		}
	}
	
}
