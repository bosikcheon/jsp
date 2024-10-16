<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
  지시자(directive) 		- < % @    	% > : 현 페이지의 환경설정에 관계된 사항처리
  스크립틀릿(scriptlet) 	- < %    		% > : jsp코드안에서 java코드를 사용할때 처리
  선언문(declaration) 	- < % !    	% >	: Jsp코드안에서 java코드나 메소등의 선언문을 선언할때 기술
  표현식(expression)  	- < % =    	% >	: Jsp코드안에서 값(변수값)을 출력할때 기술
-->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test01.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 학습</h2>
  <%
    System.out.println("1.이곳은 test1.jsp 입니다.");
  %>
  <div>앞의 문장을 표현식으로 표시하면?</div>
  <div><%="2.이곳은 test1.jsp 입니다." %></div>
  <%
    int i = 100;
  	out.println("i = " + i);
  %>
  <div>선언문을 이용한 j변수 선언</div>
  <%!
    int j = 200;
  %>
  <%
  	out.println("j = " + j);
  %>
  <div><%="j = " + j %></div>
</div>
<p><br/></p>
</body>
</html>