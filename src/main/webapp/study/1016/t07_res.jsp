<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t07_res.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>성적 처리 결과</h2>
  <hr/>
  <p>성명 : ${name} / ${param.name}</p>
  <p>학번 : ${hakbun} / ${param.hakbun}</p>
  <p>국어 : ${kor} / ${param.kor}</p>
  <p>영어 : ${eng} / ${param.eng}</p>
  <p>수학 : ${mat} / ${param.mat}</p>
  <p>사회 : ${soc} / ${param.soc}</p>
  <p>과학 : ${sci} / ${param.sci}</p>
  <p>총점 : ${tot} / ${param.tot} (X)</p>
  <p>평균 : ${avg} / ${param.avg} (X)</p>
  <p>학점 : ${grade} / ${param.grade} (X)</p>
  <hr/>
  <p><a href="<%=request.getContextPath()%>/study/1016/t07_sungjuk.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>