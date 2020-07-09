<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/main_header.css">
<header class="m_p_zero">
    <img src="resources/image/logo.png">
    <div id="user_info">
        <span>
        <b>열정적인 중재자</b>, 지은님 환영합니다. <!-- 닉네임 불러오기 -->
        </span>
        <span>
        <a href="logout.net">LOGOUT</a>
        </span>
    </div>
    <nav id="main_sidebar">
        <ul id="sidebar_list">
            
            <li id="mypage">
                <a href="#">
                    <img src="resources/image/mypage.png" style="width:63px"/>
                </a>
                <ul id="mypageMenu">
                    <li><div class="square"></div><a href="updateForm.net">My Info</a></li>
                    <li><div class="square"></div><a href="#">My Review</a></li>
                    <li><div class="square"></div><a href="#">My Books</a></li>
                    <li><div class="square"></div><a href="#">Notice</a></li>
                </ul>
            </li>
            <li id="review_board">
                <a href="review.net" class="img_tooltip">
                    <img src="resources/image/review_board.png" style="width:75px"/>
                    <span class="tooltipcontent"><b>리뷰 검색</b></span>
                </a>
            </li>
            <li id="subscribe">
                <a href="#" class="img_tooltip">
                    <img src="resources/image/subscribe.png" style="width:63px" />
                    <span class="tooltipcontent"><b>정기 구독</b></span>
                </a>
            </li>
            <li id="homepage">
                <a href="#" class="img_tooltip">
                    <img src="resources/image/homepage.png" style="width:63px" />
                    <span class="tooltipcontent"><b>메인으로 이동</b></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
