<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	//String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
%>
<!-- t01Ok.jsp -->

<!-- 
<script>
  location.href = "t01Res.jsp";
</script>
 -->

<jsp:forward page="t01Res.jsp">
	<jsp:param name="member" value="memberOk"/>
</jsp:forward>