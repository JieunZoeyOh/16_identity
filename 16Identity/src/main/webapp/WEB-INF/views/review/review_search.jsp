<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header.jsp" />
<link rel="stylesheet" href="resources/css/reviewBoard.css">
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/reviewBoard.js"></script>
</head>
<body class="m_p_zero">
	
		<div class="wrapper">
		    <div class="search_box">
		        <div class="dropdown">
		            <div class="default_option">전체</div>  
		            <ul>
		              <li>전체</li>
		              <li>도서명</li>
		              <li>저자</li>
		              <li>ISBN</li>
		            </ul>
		        </div>
		        <div class="search_field">
		          <input type="text" class="input" id="searchBook" placeholder="16 Identity">
		          <i class="fa fa-search"></i>
		      </div>
		    </div>
		</div>
		<div id="image_part">
			<div id="review_main_image" >
				<img src="resources/image/reviewPageMainImg.jpg" />
			</div>
		</div>
		<div id="book_total_count_part">
			<div id="book_total_count">
				<span>검색 결과 : 총  <span id="book_count"></span>권</span>			
			</div>
		</div>
	<div class="board_container">
		<section class="board_wrap">
			
		</section>
		<section id="board_more_action">
			<span id="message"></span>
			<button class="more_button">더 보 기</button>
		</section>
	</div>
    <footer></footer>
</body>
</html>