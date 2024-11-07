<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 사용자 페이지 설정
    function pageSizeChange() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "BoardList.ad?pageSize="+pageSize+"&pag=1";
    }
    
    function contentView(content) {
    	$("#myModal #modalContent").html(content);
    	/* 
    	$("#myModal").modal({
        fadeDuration: 1000,
        fadeDelay: 0.5,
      });
    	*/
    }
    
    function cursorMove() {
    	document.getElementById("searchString").focus();
    }
    
    // 전체 선택
    function allCheck() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = true;
    	}
    }
    
    // 전체 해제
    function allReset() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = false;
    	}
    }
    
    // 선택반전
    function reverseCheck() {
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		myform.idxFlag[i].checked = !myform.idxFlag[i].checked;
    	}
    }
    
    // 선택항목 삭제
    function selectDeleteCheck() {
    	let idxSelectArray = "";
    	
    	for(let i=0; i<myform.idxFlag.length; i++) {
    		if(myform.idxFlag[i].checked) idxSelectArray += myform.idxFlag[i].value + "/";
    	}
    	idxSelectArray = idxSelectArray.substring(0,idxSelectArray.length-1);
    	
    	if(idxSelectArray == "") {
    		alert("삭제할 항목을 선택하세요");
    		return false;
    	}
    	let ans = confirm("선택항목을 모두 삭제 처리 하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type : "post",
    		url  : "BoardSelectDelete.ad",
    		data : {idxSelectArray : idxSelectArray},
    		success:function(res) {
    			if(res != "0") {
    				alert("선택된 게시물들을 모두 삭제처리 했습니다.");
    				location.reload();
    			}
    			else alert("게시물 삭제 실패~~");
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">게 시 판 리 스 트</h2>
  <table class="table table-borderless mt-3 mb-0 p-0">
    <tr>
      <td class="text-left">
        <input type="button" value="전체선택" onclick="allCheck()" class="btn btn-success btn-sm mr-1"/>
        <input type="button" value="전체취소" onclick="allReset()" class="btn btn-warning btn-sm mr-1"/>
        <input type="button" value="선택반전" onclick="reverseCheck()" class="btn btn-info btn-sm mr-1"/>
        <input type="button" value="선택항목삭제" onclick="selectDeleteCheck()" class="btn btn-danger btn-sm mr-1"/>
      </td>
      <td class="text-right">한페이지 분량 :
        <select name="pageSize" id="pageSize" onchange="pageSizeChange()">
          <option value="5"  <c:if test="${pageSize == 5}"  >selected</c:if>>5건</option>
          <option value="10" <c:if test="${pageSize == 10}" >selected</c:if>>10건</option>
          <option value="15" <c:if test="${pageSize == 15}" >selected</c:if>>15건</option>
          <option value="20" <c:if test="${pageSize == 20}" >selected</c:if>>20건</option>
          <option value="30" <c:if test="${pageSize == 30}" >selected</c:if>>30건</option>
          <option value="30" <c:if test="${pageSize == 50}" >selected</c:if>>50건</option>
        </select>
      </td>
    </tr>
  </table>
  <form name="myform">
	  <table class="table table-hover text-center">
	    <tr class="table-secondary">
	      <th>글번호</th>
	      <th>글제목</th>
	      <th>글쓴이</th>
	      <th>글쓴날짜</th>
	      <th>조회수(좋아요)</th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}" />
	    <c:forEach var="vo" items="${vos}" varStatus="st">
		    <tr>
		      <td><input type="checkbox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}" /> ${curScrStartNo}</td>
		      <td class="text-left">
		        <c:if test="${vo.claim == 'NO' || sMid == vo.mid || sLevel == 0}"><a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a></c:if> 
		        <c:if test="${vo.claim != 'NO' && sMid != vo.mid && sLevel != 0}"><a href="javascript:alert('현재글은 신고된 글입니다.')">${vo.title}</a></c:if> 
		        <c:if test="${vo.time_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if>
		        <c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
		      </td>
		      <td><a href="#" onclick='contentView("${vo.content}")' data-toggle="modal" data-target="#myModal">${vo.nickName}</a></td>
		      <td>
		        ${vo.time_diff > 24 ? fn:substring(vo.wDate,0,10) : vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,19)}
		      </td>
		      <td>${vo.readNum}(${vo.good})</td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
	    </c:forEach>
	    <tr><td colspan="5" class="m-0 p-0"></td></tr>
	  </table>
  </form>
  <br/>
</div>
<!-- 블록페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${(curBlock+1)*blockSize+1}">다음블록</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="BoardList.ad?level=${level}&pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->
<br/>
<!-- 검색기 시작 -->
<div class="container text-center">
  <form name="searchForm" method="post" action="BoardSearchList.bo">
    <b>검색 : </b>
    <select name="search" id="search" onchange="cursorMove()">
      <option value="title">글제목</option>
      <option value="nickName">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" id="searchString" required />
    <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
  </form>
</div>
<!-- 검색기 끝 -->

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">글내용</h3>
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <div class="modal-body">
        <span id="modalContent"></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>