<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <%-- <a class="navbar-brand" href="${ctp}/">Home</a> --%>
  <a class="navbar-brand" href="http://192.168.50.20:9090/javaGroup">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="GuestList.gu">Guest</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pds</a>
      </li>
      <li class="nav-item">
        <div class="dropdown">
			    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">
			      Study1
			    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/study2/mapping/Test1">mapping(Directory 패턴)</a>
			      <a class="dropdown-item" href="${ctp}/study2/mapping/Test2">mapping(확장자 패턴)</a>
			      <a class="dropdown-item" href="${ctp}/study2/test/StorageMenu">Storage 연습</a>
			      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/el.jsp">EL 연습</a>
			      <a class="dropdown-item" href="${ctp}/study/1018_JSTL/jstlMenu.jsp">JSTL 연습</a>
			      <a class="dropdown-item" href="${ctp}/study2/database/DbList">Database 연습</a>
			    </div>
			  </div>
      </li>    
    </ul>
  </div>
</nav>