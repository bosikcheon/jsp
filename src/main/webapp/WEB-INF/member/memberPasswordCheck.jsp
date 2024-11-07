<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberPasswordCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    $(function(){
    	$("#pwdDemo").hide();
    });
    
    function pwdReCheck() {
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
    			if(res != 0) $("#pwdDemo").show();
    			else alert("비밀번호가 틀립니다. 확인하세요");
    		},
    		error : function() { alert("전송오류!");	}
    	});
    }
    
    // 비밀번호 변경처리
    function pwdChangCheck() {
    	let pwdCheck = $("#pwdCheck").val();
    	let pwdCheckRe = $("#pwdCheckRe").val();
    	
    	if(pwdCheck.trim() == "" || pwdCheckRe.trim() == "" || pwdCheck.length < 2 || pwdCheckRe.length < 2 ) {
    		alert("변경할 비밀번호를 입력하세요");
    		$("#pwdCheck").focus();
    		return false;
    	}
    	else if(pwdCheck.trim() != pwdCheckRe.trim()) {
    		alert("새로 입력한 비밀번호가 서로 틀립니다. 확인하세요");
    		$("#pwdCheck").focus();
    		return false;
    	}
    	else pwdForm.submit();
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="MemberPwdCheckOk.mem">
    <table class="table table-bordered">
      <tr>
        <td colspan="2" class="text-center">
          <h4>비밀번호 확인</h4>
          <div>(회원 정보 수정을 하기위해 현재 비밀번호를 확인합니다.)</div>
        </td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" class="form-control mb-3" autofocus required></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
		      <button type="button" class="btn btn-success mr-2" onclick="pwdReCheck()">비밀번호변경</button>
		      <button type="submit" class="btn btn-primary mr-2">회원정보변경</button>
		      <button type="reset" class="btn btn-warning mr-2">다시입력</button>
		      <button type="button" onclick="location.href='MemberMain.mem'" class="btn btn-info mr-3">돌아가기</button>
		    </td>
		  </tr>
		</table>
  </form>
	<div class="text-center" id="pwdDemo">
	  <h4>비밀번호 변경</h4>
	  <form name="pwdForm" method="post" action="MemberPwdCheckAjaxOk.mem">
	    <table class="table table-bordered">
	      <tr>
	  			<th>변경할 비밀번호</th>
	    	  <td><input type="password" name="pwdCheck" id="pwdCheck" placeholder="새비밀번호를 입력하세요" class="form-control mb-3" required></td>
	    	</tr>
	    	<tr> 
	  			<th>비밀번호 확인</th>
	    		<td><input type="password" name="pwdCheckRe" id="pwdCheckRe" placeholder="비밀번호를 다시한번더 입력하세요" class="form-control mb-3" required></td>
	    	</tr>
	    	<tr>
			    <td colspan="2">
			      <input type="button" value="비밀번호변경" onclick="pwdChangCheck()" class="btn btn-secondary"/>
			    </td>
			  </tr>
	    </table>
	  </form>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>