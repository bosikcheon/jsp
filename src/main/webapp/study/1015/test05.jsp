<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test05.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
    'use strict'
        
    function fCheck() {
      let name = myform.name.value;
      let age = myform.age.value;
      
      if(name.trim() == "") {
        alert("이름을 입력하시오");
        myform.name.focus();
      }
      else if(age.trim() == "") {
        alert("나이를 입력하시오");
        myform.age.focus();
      }
      else {
    	  myform.submit();
      }
    }
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="get" action="test05Ok.jsp">
  <!-- <form name="myform" method="post" action="test05Ok.jsp"> -->
    <div>이름을 입력하시요
      <input type="text" name="name" value="홍길동" class="form-control mb-2" autofocus required /> 
    </div>
    <div>나이를 입력하시요
      <input type="number" name="age" id="age" value="25" class="form-control mb-2" required>
    </div>
    <div>
      <button type="button" onclick="fCheck()" class="form-control btn-info mb-2">전송</button>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>