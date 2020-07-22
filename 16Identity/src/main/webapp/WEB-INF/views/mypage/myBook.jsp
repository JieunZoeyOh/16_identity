<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link href="resources/css/myBook.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src ="resources/js/myBook.js"></script>
</head>
<body>
	<c:set var="m" value="${profile}" />

	<div class="hero">
		<div class="diagonal-hero-bg">
		<img src="resources/image/logo.png" class="logoimg" />
			<div class="stars">
			</div>
		</div>
	</div>
	<div id="main_Container">
	<div id="left_Container">
		<div class="imgcontainer">
			<label for="image"> 
				<img src='resources/upload/${m.m_file}' class="uploadimg">
			</label>
		</div>
		<div class="menu">
			<select class="menu-control" onchange="location = this.value;">
				<option value="updateForm.net">My Info</option>
				<option value="myReview.net">My Review</option>
				<option value="myBook.net">My Books</option>
				<option value="notice.net">Notice</option>
			</select>
		</div>
	</div>
	<div id="right_Container">
		<button class="likeBook like">좋아요 한 책</button>
		<button class="likeReview like">좋아요 한 리뷰</button>
		<div id="content">

		</div>
	</div>
	</div>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>