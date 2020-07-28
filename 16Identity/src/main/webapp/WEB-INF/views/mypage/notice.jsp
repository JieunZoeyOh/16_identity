<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link href="resources/css/notice.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src ="resources/js/notice.js"></script>
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
				<option value="notice.net" selected>Notice</option>
			</select>
		</div>
	</div>
	<div id="right_Container">
		<div id="content">
			<table>
				<thead>
					<tr>
						<td>NO.</td><td>제목</td><td>작성일</td><td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>2</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>3</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>4</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>5</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>6</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>7</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>8</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>9</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					<tr>
						<td>10</td><td>제목입니다</td><td>2020-07-22</td><td>10</td>
					</tr>
					
				</tbody>
			</table>
			<div class="section">
				<div class="demo">
					<nav class="pagination">
					<a class="r-link pagination__control pagination__control_prev">prev</a>
					<ol class="r-list pagination__list">
						<li class="pagination__group">
							<span class="pagination__point">1</span>
						</li>
						<li class="pagination__group">
							<a href="#" class="r-link pagination__point">2</a>
						</li>
						<li class="pagination__group">
							<a href="#" class="r-link pagination__point">3</a>
						</li>
						<li class="pagination__group">
							<a href="#" class="r-link pagination__point">4</a>
						</li>
						<li class="pagination__group">
							<a href="#" class="r-link pagination__point">5</a>
						</li>
					</ol>
					<a href="#" class="r-link pagination__control pagination__control_next">next</a>
					</nav>
				</div>
			</div>	
		</div>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>