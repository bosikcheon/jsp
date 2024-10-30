<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th, td {
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">회 원 리 스 트</h2>
  <table class="table table-hover">
    <tr class="table-secondary">
      <th>번호</th>
      <th>닉네임</th>
      <th>아이디</th>
      <th>성명</th>
      <th>성별</th>
      <th>생일</th>
      <th>이메일</th>
      <th>최종방문일</th>
    </tr>
	  <c:forEach var="vo" items="${vos}" varStatus="st">
	    <tr>
	      <td>${st.count}</td>
	      <td>${vo.nickName}</td>
	      <c:if test="${vo.userInfor == '공개'}">
		      <td>${vo.mid}</td>
		      <td>${vo.name}</td>
		      <td>${vo.gender}</td>
		      <td>${fn:substring(vo.birthday,0,10)}</td>
		      <td>${vo.email}</td>
		      <td>
		        <c:if test="${sMid == vo.mid}">${fn:substring(sLastDate,0,16)}</c:if>
		        <c:if test="${sMid != vo.mid}">${fn:substring(vo.lastDate,0,16)}</c:if>
		      </td>
	      </c:if>
	      <c:if test="${vo.userInfor != '공개'}">
	        <td colspan="6" class="text-center">비 공 개</td>
	      </c:if>
	    </tr>
  	</c:forEach>
  	<tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>