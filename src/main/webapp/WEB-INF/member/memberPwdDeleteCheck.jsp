<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberPwdDeleteCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<script>
  'use strict';
  
  function pwdCheck() {
	  let pwd = $("#pwd").val().trim();
  	if(pwd == "") {
  		alert("현재 비밀번호를 입력하세요");
  		$("#pwd").focus();
  		return false;
  	}
  	
  	$.ajax({
  		type  : "get",
  		url   : "MemberPwdCheckAjax.mem",
  		data  : {pwd : pwd},
  		success:function(res) {
  			if(res != 0) {
  				let ans = confirm("회원 탈퇴 신청을 하시겠습니까?");
  				if(ans) {
  					ans = confirm("회원 탈퇴를 하시면 1개월간 같은 아이디로는 가입하실수 없습니다.\n계속 진행하시겠습니까?");
  					if(ans) myform.submit();
  				}
  			}
  			else alert("비밀번호가 틀립니다. 확인하세요");
  		},
  		error : function() { alert("전송오류!");	}
  	});
  }
</script>
<p><br/></p>
<div class="container">
  <h3>비밀번호 확인</h3>
  <form name="myform" method="post" action="MemberDeleteCheckOk.mem">
    <table class="table table-bordered">
      <tr>
        <td colspan="2" class="text-center">
          <h4>비밀번호 확인</h4>
          <div>(회원 탈퇴를 하기위해 현재 비밀번호를 확인합니다.)</div>
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control mb-3" autofocus required></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
		      <button type="button" onclick="pwdCheck()" class="btn btn-primary mr-2">회원탈퇴</button>
		      <button type="reset" class="btn btn-warning mr-2">다시입력</button>
		      <button type="button" onclick="location.href='MemberMain.mem'" class="btn btn-info mr-3">돌아가기</button>
		    </td>
		  </tr>
		</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>