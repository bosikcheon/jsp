<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t05_imageTest.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function imgView() {
    	let img = myform.img.value;
    	let str = '<img src="<%=request.getContextPath()%>/images/'+img+'.jpg" width="300px" />';
    	demo.innerHTML = str;
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <pre>
    콤보상자에 출력할 그림파일명을 보여주고, 그 그림파일명을 선택하면
		demo레이어에 선택된 그림파일을 출력해 주시오.
  </pre>
  <hr/>
  <form name="myform">
	  <div>그림선택
	    <select name="img" onchange="imgView()">
	      <option>11</option>
	      <option>12</option>
	      <option>13</option>
	      <option>14</option>
	      <option>15</option>
	    </select>
	  </div>
	  <hr/>
	  <div id="demo"></div>
  </form>
</div>
<p><br/></p>
</body>
</html>