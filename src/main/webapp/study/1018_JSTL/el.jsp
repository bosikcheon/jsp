<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>el.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>EL(Expression Language)</h2>
  <p>저장소(서버 저장소 : ServletContext컨테이너)에 기록되어 있는 자료에 대한 처리를 담당</p>
  <hr/>
  <pre>
    용도 : 사용자가 '변수/값/수식/객체'등을 서버에 전송받은후에 저장(request/session/application) 또는 처리한후 Client로 전송된 자료를 화면에 표시한다.
    표기법 : $ {변수/값/객체/수식}
  </pre>
  <hr/>
<%
	String atom = "Seoul";
  String name = "홍길동";
  int su1 = 100, su2 = 200;
  int res = su1 * su2;
  String su3 = "300", su4 = "400";
%>
  <h2>스크립틀릿을이용한 출력</h2>
  <div>
    <%="안녕!!" %><br/>
    atom = <%=atom %><br/>
    name = <%=name %><br/>
    su1 = <%=su1 %><br/>
    su2 = <%=su2 %><br/>
    res = <%=res %><br/>
    su1 * su2 = <%=(su1 * su2) %><br/>
    su3 + su4 = <%=(su3 + su4) %><br/>
    <%-- su3 * su4 = <%=(su3 * su4) %><br/> --%>
  </div>
  <hr/>
<%
  pageContext.setAttribute("atom", atom);
  pageContext.setAttribute("name", name);
  pageContext.setAttribute("su1", su1);
  pageContext.setAttribute("su2", su2);
  pageContext.setAttribute("su3", su3);
  pageContext.setAttribute("su4", su4);
  pageContext.setAttribute("res", res);
  
%>
  <h2>EL 을 이용한 출력</h2>
  <div>
    ${"안녕"}<br/>
    atom = ${atom}<br/>
    name = ${name}<br/>
    su1 = ${su1}<br/>
    su2 = ${su2}<br/>
    res = ${res}<br/>
    su1 * su2 = ${su1 * su2}<br/>
    su3 + su4 = ${(su3 + su4)}<br/>
    su3 * su4 = ${(su3 * su4)}<br/>
  </div>
  <hr/>
  <h4>파라메터(parameter)를 통해서 넘어온 값의 처리(?변수1=값1&변수2=값2 == QueryString형식)</h4>	   <!-- PathVariable형식(경로로처리) -->
  <div>주소창에 현재주소 뒤에 '?mbc=200&kbs=50' 을 입력후 확인하시오<br/>
<%
    String mbc = request.getParameter("mbc");
    String kbs = request.getParameter("kbs");
    //pageContext.setAttribute("mbc", mbc);
    //pageContext.setAttribute("kbs", kbs);
%>
    mbc = <%=mbc %><br/>
    kbs = <%=kbs %><br/>
    
    mbc = ${param.mbc}<br/>
    kbs = ${param.kbs}<br/>
    mbc - kbs = ${param.mbc - param.kbs}<br/>
  </div>
  <hr/>
  <div>
    <form name="myform" method="post" action="<%=request.getContextPath()%>/1018/ElOk">
    	<h3 class="text-center mb-5">Form 자료 전송 연습</h3>
    	<div>성명 :
    	  <input type="text" name="name" value="홍길동" class="form-control mb-3">
    	</div>
    	<div class="mb-3">취미 : &nbsp;&nbsp;
    	  <input type="checkbox" name="hobby" value="등산" checked />등산 &nbsp;
    	  <input type="checkbox" name="hobby" value="낚시" />낚시 &nbsp;
    	  <input type="checkbox" name="hobby" value="바둑" />바둑 &nbsp;
    	  <input type="checkbox" name="hobby" value="수영" />수영 &nbsp;
    	  <input type="checkbox" name="hobby" value="승마" />승마 &nbsp;
    	  <input type="checkbox" name="hobby" value="바이크" />바이크
    	</div>
    	<div>
    	  <input type="submit" value="전송" class="form-control btn-success"/>
    	</div>
    </form>
  </div>
  <hr/>
<%
  String name2 = request.getParameter("name")==null ? "" : request.getParameter("name");
  String hobby = request.getParameter("hobby")==null ? "" : request.getParameter("hobby");
  System.out.println("hobby2 : " + hobby);
  
	if(!name2.equals("") && !hobby.equals("")) {
%>
		<p>성명 : <%=name2 %> (X) - getAttribute("변수")</p>
		<p>취미 : <%=hobby %> (X)</p>
		<p>성명 : ${name2} (O)</p>
		<p>취미 : ${hobby} (O)</p>
		<p>성명(param) : ${param.name2} (O)</p>
		<p>취미(param) : ${param.hobby} (O)</p>
<%} %>
  <div><b>작업끝.............</b></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>