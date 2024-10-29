<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberNickNameCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    $(function(){
	    let nickName = '${vo.tempMid}';
	    let str = "<font color='red'><b>";
	    if(nickName == "") {
	    	str += "${vo.nickName}</b></font>는 사용 가능합니다.";
	    }
	    else {
	    	str += nickName + "</b></font>는 이미 사용중입니다. 다시 검색하세요.";
	    	str += '<form name="childForm" method="post" action="MemberNickNameCheck.mem">';
	    	str += '닉네임:';
	    	str += '<input type="text" name="nickName" autofocus required />';
	    	str += '<input type="submit" value="닉네임검색" class="btn btn-secondary btn-sm ml-1" />';
	    	str += '</form>';
	    }
	    demo.innerHTML = str;
    });
    
    function winClose() {
    	//alert("mid : ${vo.mid}");
    	opener.window.myform.nickName.value = '${vo.nickName}';
    	//opener.window.myform.pwd.focus();
    	window.close()
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h3>아이디 검색결과</h3>
  <hr/>
  <div id="demo"></div>
  <hr/>
  <p class="text-center"><input type="button" value="창닫기" onclick="winClose()" /></p>
</div>
</body>
</html>