<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test05Res.jsp -->
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	out.println("성명 : " + name);
	out.println("<br/>나이 : " + age);
	out.println("<br/><a href='test05.jsp'>돌아가기</a>");
	
	//out.println("<div><a href='test05Res.jsp?name="+name+"&age="+age+"'>값전송</a></div>");
%>
