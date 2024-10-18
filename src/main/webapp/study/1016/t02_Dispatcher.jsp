<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t02_Dispatcher.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    if('<%=flag%>' == 'no') alert("회원정보를 확인하세요");
    
    function fCheck() {
    	let mid = document.getElementById("mid").value;
    	let pwd = document.getElementById("pwd").value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요");
    		document.getElementById("mid").focus();
    		return false;
    	}
    	else if(pwd.trim() == "") {
    		alert("비밀번호를 입력하세요");
    		document.getElementById("pwd").focus();
    		return false;
    	}
    	else {
    		myform.action = "<%=request.getContextPath()%>/1016/T01Ok2";
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>RequestDispatcher객체를 통한 값의 전달/이동</h2>
  <hr/>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/1016/T01Ok1">
    <div>아이디를 입력하시요
      <input type="text" name="mid" id="mid" value="hkd1234" class="form-control mb-2" autofocus required /> 
    </div>
    <div>비밀번호를 입력하시요
      <input type="password" name="pwd" id="pwd" value="1234" class="form-control mb-2" required />
    </div>
    <div>
      <button type="submit" class="form-control btn-success mb-2">로그인1</button>
      <button type="button" onclick="fCheck()" class="form-control btn-info mb-2">로그인2</button>
      <button type="reset" class="form-control btn-warning mb-2">다시입력</button>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>