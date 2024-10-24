<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t1_CookiesCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>저장된 쿠키 확인하기</h2>
  <hr/>
  <p>
<%
  Cookie[] cookies = request.getCookies();

  out.println("저장된 쿠키는?<br/>");
  for(int i=0; i<cookies.length; i++) {
  	out.println("쿠키명 : " + cookies[i].getName() + " , ");
  	out.println("쿠키값 : " + cookies[i].getValue() + " , ");
  	out.println("만료시간 : " + cookies[i].getMaxAge() + "<br/><br/>");
  }
%>
  </p>
  <hr/>
  <p><a href="t1_Cookies.jsp" class="btn btn-info">돌아가기</a></p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>