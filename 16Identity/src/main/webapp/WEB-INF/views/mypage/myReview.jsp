<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 identity MY_INFO PAGE</title>
<link href="resources/css/slick.css" type="text/css" rel="stylesheet">
<link href="resources/css/myReview.css" type="text/css" rel="stylesheet">
<jsp:include page="../main/header_mypageVersion.jsp" />
<script src="resources/js/jquery-3.5.0.js"></script>
<script type="text/javascript" src="resources/js/slick.min.js"></script>

<style>
#sidebar_list {
	margin-top: 16px !important;
}

.modal > p {margin:16px 0px !important;}
.form_wrap > form { margin-bottom : 16px !important;} 
</style>
</head>
<body>
	<c:set var="m" value="${profile}" />

	<div class="hero">
		<div class="diagonal-hero-bg">
			<img src="resources/image/logo.png" class="logoimg">
			<div class="stars"></div>
		</div>
	</div>

	<div id="container" class="clearfix">
		<div class="info">
			<div class="imgcontainer">
				<label for="image"> <!-- 이미지 파일 불러오는 경로 다시 확인 
                        (현재 테스트이미지 profile.jpg 임의 지정)--> <img
					src='resources/upload/${m.m_file}' class="uploadimg">
				</label>
			</div>
			<div class="menu">
				<select class="menu-control" onchange="location = this.value;">
					<option value="updateForm.net">My Info</option>
					<option value="myReivew.net" selected>My Review</option>
					<option value="myBooks.net">My Books</option>
					<option value="notice.net">Notice</option>
				</select>
			</div>
		</div>

		<div class="card_wrap">
			<%--게시글 있는 경우  --%>
			<c:if test="${listcount > 0}">

				<div class="slider">
				
				<c:forEach var ="v"  begin = "0" end = "${listcount - 1}" step= "6"> 
						
					<div class="flip-card-wrap clearfix">
						<c:forEach var="m" items="${commentlist}" begin ="${v}" end="${v+5}">
							<c:set var="length" value="${fn:length(m.isbn)}" />
							<c:set var="isbn_original"
								value="${fn:substring(m.isbn, length -13, length)}" />
							<c:set var="isbn_short"
								value="${fn:substring(isbn_original, length -3, length)}" />
								
							<div class='flip-card'>
								<a href='reviewpost.minji?isbn=${m.isbn}'
									class='flip-card-inner'>

									<div class='flip-card-front'>
										<img src="${m.book.b_thumbnail }">
									</div>
									<div class='flip-card-back'>
									<br><br><br><br>
										<p>${m.cmt_date}</p>
										<p>${m.cmt_mbti}</p><br>
										
										<p>${m.cmt_content }</p>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
		</c:forEach>
				</div>
			</c:if>

			<c:if test="${listcount == 0}">
				<div class="empty">
					<p>등록된 글이 없습니다.</p>
				</div>
			</c:if>
		</div>
		<!-- card_wrap -->
	</div>
	<!-- #container -->
	<footer>
		<h3>footer</h3>
	</footer>
</body>

<script>
	$(function() {
		$('.slider').slick({
			infinite : true,
			slidesToShow : 1,
			slidesToScroll : 1
		});

		$(".info1").on("click", function() {
			$(".overlay").addClass("on");
			$(".modal").addClass("on");
		})
		$(".btn_submit").on("click", function() {
			$('#passchk').submit();

		})
		$(".btn_cancel").on("click", function() {
			$(".overlay").removeClass("on");
			$(".modal").removeClass("on");

		})
	});

	$(window).on("load", function() {
		$(".loader-wrapper").fadeOut(1000);
		$('#mypage').on('click', function() {
			$('#mypageMenu').toggle();
		})
		$('#subscribe').on('click', function() {
			$('#subMenu').toggle();
		})
	})
	/*header js 부분*/
	const mypageMenu = document.querySelector("#mypageMenu");
	const mypageMenuList = mypageMenu.children;
	for (var i = 0; i < mypageMenuList.length; i++) {
		mypageMenuList[i].addEventListener("mouseover", menulist_over);
		mypageMenuList[i].addEventListener("mouseout", menulist_out);
	}
	const subMenu = document.querySelector("#subMenu");
	const subMenuList = subMenu.children;
	subMenuList[0].addEventListener("mouseover", menulist_over);
	subMenuList[0].addEventListener("mouseout", menulist_out);

	/*header js 부분*/
	function menulist_over() {
		this.children[0].style.visibility = "visible";
	}

	function menulist_out() {
		this.children[0].style.visibility = "hidden";
	}
</script>
</html>