<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationClear.jsp -->
<%
	session.invalidate();
%>

<script>
  alert("세션이 삭제 되었습니다.");
  location.href = "t4_StorageTest.jsp";
</script>