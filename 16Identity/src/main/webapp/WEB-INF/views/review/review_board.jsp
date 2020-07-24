<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header.jsp" />
<link rel="stylesheet" href="resources/css/reviewSearch.css">
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
	    <div id="autoComplete_box">
    	</div>
	</div>
	<div class="board_container">
		<section id="filtering_wrap">
			<div id="filtering_box">
				<div class="filter" id="sort_text" style="padding: 6px 12px">최신순</div>
				<div class="filter" id="Rall">전체<i class="fa fa-times" aria-hidden="true"></i></div>
				<div class="filter" id="Iall" style="display:none">I 전체<i class="fa fa-times" aria-hidden="true"></i></div>
				<div class="filter" id="Eall" style="display:none">E 전체<i class="fa fa-times" aria-hidden="true"></i></div>
			</div>
			<i class="fa fa-filter" aria-hidden="true"></i>
			<div id="filtering_detail">
				<form id="filter_form">
					<span>정렬 기준</span><div class="filter_bar"></div>
					<input type="radio" id="recency" name="sort" value="recency" checked>
					<label for="recency">최신순</label>
					<input type="radio" id="popular" name="sort" value="popular">
					<label for="popular">인기순</label><br><br>
				
					<span style="padding-left: 29px;">MBTI</span><div class="filter_bar"></div>
					<input type="checkbox" id="all" name="mbti" value="all">
					<label for="all">전체</label>
	  				<input type="checkbox" id="all_i" name="mbti" value="all_i">
	  				<label for="all_i">I 전체</label>
	  				<input type="checkbox" id="all_e" name="mbti" value="all_e">
	  				<label for="all_e">E 전체</label><br><br>
	  				<input type="checkbox" id="istp" name="mbti" value="istp" style="margin-left: 98px;">
	  				<label for="istp">ISTP</label>
	  				<input type="checkbox" id="istj" name="mbti" value="istj">
	  				<label for="istj">ISTJ</label>
	  				<input type="checkbox" id="isfp" name="mbti" value="isfp">
	  				<label for="isfp">ISFP</label>
	  				<input type="checkbox" id="isfj" name="mbti" value="isfj">
	  				<label for="isfj">ISFJ</label>
	  				
	  				<input type="checkbox" id="intp" name="mbti" value="intp">
	  				<label for="intp">INTP</label>
	  				<input type="checkbox" id="intj" name="mbti" value="intj">
	  				<label for="intj">INTJ</label>
	  				<input type="checkbox" id="infp" name="mbti" value="infp">
	  				<label for="infp">INFP</label>
	  				<input type="checkbox" id="infj" name="mbti" value="infj">
	  				<label for="infj">INFJ</label><br><br>
	  				
	  				<input type="checkbox" id="estp" name="mbti" value="estp"  style="margin-left: 98px;">
	  				<label for="estp">ESTP</label>
	  				<input type="checkbox" id="estj" name="mbti" value="estj">
	  				<label for="estj">ESTJ</label>
	  				<input type="checkbox" id="esfp" name="mbti" value="esfp">
	  				<label for="esfp">ESFP</label>
	  				<input type="checkbox" id="esfj" name="mbti" value="esfj">
	  				<label for="esfj">ESFJ</label>
	  				
	  				<input type="checkbox" id="entp" name="mbti" value="entp">
	  				<label for="entp">ENTP</label>
	  				<input type="checkbox" id="entj" name="mbti" value="entj">
	  				<label for="entj">ENTJ</label>
	  				<input type="checkbox" id="enfp" name="mbti" value="enfp">
	  				<label for="enfp">ENFP</label>
	  				<input type="checkbox" id="enfj" name="mbti" value="enfj">
	  				<label for="enfj">ENFJ</label><br><br>
	  				
	  				<button id="filter_button">검색</button>
				</form>
			</div>
		</section>
		<section class="board_wrap">
			
		</section>
	</div>
	<form action="reviewSearch.net" method="post" style="display:none" id="searchForm">
		<input type="hidden" name="searchWord" id="searchWord">
		<input type="hidden" name="category" id="category">
	</form>
   <jsp:include page="../main/footer.jsp" />
   <script src="resources/js/reviewList.js"></script>
</body>
</html>