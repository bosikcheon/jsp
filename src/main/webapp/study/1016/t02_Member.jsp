<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t02_Member.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/member.js"></script>
</head>
<body>
<%-- <%@ include file="../../include/testHeader.jsp" %> --%>
<%-- <jsp:include page="/<%=request.getContextPath()%>/include/testHeader.jsp" /> --%>
<jsp:include page="/include/testHeader.jsp" />
<p><br/></p>
<div class="container">
  <h2>이곳은 회원 전용방 입니다.</h2>
  <hr/>
  <div><img src="<%=request.getContextPath()%>/images/12.jpg" width="500px" /></div>
  <hr/>
  <div><a href="javascript:logoutCheck('<%=request.getContextPath()%>/study/1016/t02_Dispatcher.jsp')" class="btn btn-success">로그아웃</a></div>
  <hr/>
</div>
<p><br/></p>
<jsp:include page="/include/testFooter.jsp" />
</body>
</html>