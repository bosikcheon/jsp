<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationClear.jsp -->
<%
	application.removeAttribute("aCount");
%>

<script>
  alert("어플리케이션이 삭제 되었습니다.");
  location.href = "t4_StorageTest.jsp";
</script>