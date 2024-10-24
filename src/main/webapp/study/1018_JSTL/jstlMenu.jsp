<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstlMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>JSTL 응용연습</h2>
  <hr/>
  <div><a href="${ctp}/study/1018_JSTL/jstl1.jsp" class="form-control btn-success mb-2">JSTL이란</a></div>
  <div><a href="" class="form-control btn-primary mb-2">반복문(forEach)</a></div>
  <div><a href="" class="form-control btn-info mb-2">JSTL이란??</a></div>
  <div><a href="" class="form-control btn-warning mb-2">function</a></div>
  <div><a href="" class="form-control btn-secondary mb-2">format</a></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>