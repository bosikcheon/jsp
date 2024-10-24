<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t08_param.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>세션 연습 메인 메뉴</h2>
  <hr/>
	<form name="myform" method="post" action="t2_SessionSave.jsp">
    <div>아이디를 입력하시요
      <input type="text" name="mid" value="${sMid}" class="form-control mb-2" autofocus required /> 
    </div>
    <div>닉네임을 입력하시요
      <input type="text" name="nickName" id="nickName" value="${sNickName}" class="form-control mb-2" required>
    </div>
    <div>성명을 입력하시요
      <input type="text" name="name" id="name" value="${sName}" class="form-control mb-2" required>
    </div>
    <div class="row">
      <div class="col"><button type="submit" class="form-control btn-info mb-2">세션저장</button></div>
	    <div class="col"><a href="t2_SessionCheck.jsp" class="btn btn-primary">세션확인</a></div>
	    <div class="col"><a href="t2_SessionAllDelete.jsp" class="btn btn-danger">전체세션삭제</a></div>
	    <div class="col"><a href="t2_SessionDelete.jsp" class="btn btn-warning">부분세션삭제</a></div>
    </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>