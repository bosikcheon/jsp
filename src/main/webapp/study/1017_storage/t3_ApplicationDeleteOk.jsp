<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationDeleteOk -->
<%
	String applicationFlag = request.getParameter("applicationFlag");
	application.removeAttribute(applicationFlag);
%>

<script>
  alert("<%=applicationFlag%> 어플리케이션이 삭제 되었습니다.");
  location.href = "t3_Application.jsp";
</script>