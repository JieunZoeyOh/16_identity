<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="resources/css/login.css" type="text/css">
  <script src="resources/js/jquery-3.5.0.js"></script><%-- index.jsp 기준으로 경로 잡기☆★☆★ --%>
  <title>회원관리 시스템 로그인 페이지</title>

<script>
	$(function(){
		$(".join").click(function(){
			location.href="join.net";
		});
	});
</script>
</head>
<body>
   <form name="loginform" action="loginProcess.net" method="post">
   <h1>로그인</h1>
      <b>아이디</b> 
      <input type="text" name="m_id" placeholder="Enter id" required
      	<c:if test="${!empty saveid}">value="${saveid}"
      	</c:if>
      > 
      <b>Password</b> 
      <input type="password" name="m_password" placeholder="Enter password" required>
      <label>
      <input type="checkbox" name="remember" style="margin-bottom:15px"
      	<c:if test="${!empty saveid}">
      		checked
      		</c:if>
      >remember
      </label>
      <div class="clearfix">
         <button type="submit" class="submitbtn submit">로그인</button>
         <button type="button" class="cancelbtn join">회원가입</button>
      </div>
   </form>
</body>
</html>