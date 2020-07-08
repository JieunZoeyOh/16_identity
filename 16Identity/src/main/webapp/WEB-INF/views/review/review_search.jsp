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
		          <input type="text" class="input" placeholder="16 Identity">
		          <i class="fa fa-search"></i>
		      </div>
		    </div>
		</div>
	<div class="board_container">
		<section class="board_wrap">
			<article class="book_article">
				<div class="book_img_box">
					<img src="resources/image/book/book1.jpg" />
				</div>			
				<dl>
                    <dt>기억 1</dt>
                    <dd>베르나르 베르베르 저</dd>
                    <dd>전미연 역</dd>
                </dl>
				
			</article>
			<article class="book_article">
				<div class="book_img_box">
					<img src="resources/image/book/book2.jpg" />
				</div>
				<dl>
                    <dt>기억 1</dt>
                    <dd>베르나르 베르베르 저</dd>
                    <dd>전미연 역</dd>
                </dl>
			</article>
			<article class="book_article">
				<div class="book_img_box">
					<img src="resources/image/book/book3.jpg" />
				</div>
				<dl>
                    <dt>기억 1</dt>
                    <dd>베르나르 베르베르 저</dd>
                    <dd>전미연 역</dd>
                </dl>
				
			</article>
		</section>
		<section id="board_more_action">
			<button class="more_button">더 보 기</button>
		</section>
	</div>
    <footer></footer>
</body>
</html>