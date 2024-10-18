<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t04_images.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>정적(static)파일 연습</h2>
  <p>예) html, css, js, image, 텔플릿... 등</p>
  <hr/>
  <div>
  	<p>1.<img src="11.jpg" width="200px" /> (X)</p>
  	<p>2.<img src="../../images/11.jpg" width="200px" /> (O)</p>
  	<p>3.<img src="/images/11.jpg" width="200px" /> (X)</p>
  	<p>4.<img src="/javaGroup/images/11.jpg" width="200px" /> (O)</p>
  	<p>5.<img src="<%=request.getContextPath()%>/images/11.jpg" width="200px" /> (O)</p>
  	<p>
  	  <%
  	    for(int i=11; i<=16; i++) {
  	  %>
  	  		<p><%=(i-5)%>.<img src="<%=request.getContextPath()%>/images/<%=i%>.jpg" width="200px" /></p>
  	  <%
  	    }
  	  %>
  	</p>
  	<p>
  		<%
  			for(int i=11; i<=16; i++) {
  				out.println("<p>"+(i+1)+".<img src='"+request.getContextPath()+"/images/"+i+".jpg' width='200px' /></p>");
  			}
  		%>
  	</p>
  </div>
</div>
<p><br/></p>
</body>
</html>