<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test10Member.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="testHeader.jsp" %>
<p><br/></p>
<div class="container" style="height:600px;">
  <h2>이곳은 회원 전용방 입니다.(<font color="red"><b><%=mid%></b></font>)</h2>
  <hr/>
  <!-- <div><img src="../../images/12.jpg" width="500px" /></div> -->
  <!-- <div><img src="/javaGroup/images/12.jpg" width="500px" /></div> -->
  <div><img src="<%=request.getContextPath()%>/images/12.jpg" width="500px" /></div>
  <hr/>
  <div><a href="javascript:logoutCheck()" class="btn btn-success">로그아웃</a></div>
  <hr/>
</div>
<p><br/></p>
<%@ include file="testFooter.jsp" %>
</body>
</html>