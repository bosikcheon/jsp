<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test09Admin.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    if('<%=mid%>' == '') {
    	alert("로그인후 사용하세요");
    	location.href = "<%=request.getContextPath()%>/study/1015/test09.jsp";
    }
    
    function logoutCheck() {
    	alert("로그아웃 합니다.");
    	location.href = "test09.jsp";
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 관리자 화면 입니다.(<font color="red"><b><%=mid%></b></font>)</h2>
  <hr/>
  <!-- <div><img src="../../images/11.jpg" width="500px" /></div> -->
  <!-- <div><img src="/javaGroup/images/11.jpg" width="500px" /></div> -->
  <div><img src="<%=request.getContextPath()%>/images/11.jpg" width="500px" /></div>
  <hr/>
  <div><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a></div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>