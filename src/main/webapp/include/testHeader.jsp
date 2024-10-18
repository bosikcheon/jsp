<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- testHeader.jsp -->
<%
  //String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
  String mid = (String) request.getAttribute("mid");
%>

<script>
  'use strict';
  
  if('<%=mid%>' == '') {
  	alert("로그인후 사용하세요");
  	location.href = "<%=request.getContextPath()%>/study/1015/test10.jsp";
  }
</script>
  
<div style="width:100%; height:100px; background-color:skyblue">
	<div>접속자 : <font color="red"><b><%=mid%></b></font></div>
	<nav style="text-align:center; padding-top:17px;">
	  | <a href="test10Member.jsp?mid=<%=mid%>">홈으로</a> | <a href="test10Board.jsp?mid=<%=mid%>">게시판</a> | <a href="test10Guest.jsp?mid=<%=mid%>">방명록</a> | <a href="test10Pds.jsp?mid=<%=mid%>">자료실</a>| <a href="javascript:logoutCheck()">로그아웃</a> |
	</nav>
</div>