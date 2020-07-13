<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">

<link rel="stylesheet" href="resources/css/main_header.css">
<script src="resources/js/jquery-3.5.0.js"></script>
<script>
window.screen.width
window.screen.height
var popupWidth = 500;
var popupHeight = 600;
var popupX = (window.screen.width/2) - (popupWidth/2);
var popupY= (window.screen.height/2) - (popupHeight/2);
function openWin(){  
    window.open("subscribe_apply.com?m_id=${m_id }", "정기구독", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}
</script>
<style>
    .blind{display:none;}
    .btn_cancel{background: pink;}
    .wrap{position:relative;width: 100%;height:100%;}
    .overlay{display: none;position: fixed;top: 0;left: 0;width: 100%;height: 100%;background: rgba(0,0,0,.5);z-index: 2;}
    .overlay.on{display: block;}
    .modal{display: none;position:fixed;top:50%;left:50%;z-index: 3;width: 500px;transform: translate(-50%, -50%);background-color: #fff;border-radius: 10px;}
    .modal.on{display: block;}

    .modal p{padding-left: 30px;;}
    .modal .form_wrap{padding: 10px 30px 70px;height:100%;}
    .modal .form_wrap form label{display: block;}
    .modal .form_wrap form input[type=password]{width: 100%;border-radius: 10px;border:1px solid gray;padding:10px 10px;}
    .modal .btn_wrap {position: absolute;bottom:10px;right:30px;}
    .modal .btn_wrap button{padding:5px 20px;border:none;border-radius: 5px;}
    .modal .btn_wrap .btn_submit{background-color: aqua;}
    input[type=submit], input[type=button]{width : 70px; height : 30px ;border :none; border-radius:5px;}
</style>
<div class="loader-wrapper">
	<span class="loader"><span class="loader-inner"></span></span>
</div>
<header class="m_p_zero">
    <img src="resources/image/logo.png">
    <div id="user_info">
        <span>
        <b>${mbti_nickname}</b>, ${m_nickname}님 환영합니다.
        </span>
        <span>
        <a href="logout.net">LOGOUT</a>
        </span>
    </div>
    
    
    <nav id="main_sidebar">
        <ul id="sidebar_list">
            
            <li id="mypage">
                <a class="img_tooltip">
                    <img src="resources/image/mypage.png" style="width:63px"/>
                    <span class="tooltipcontent"><b>마이페이지</b></span>
                </a>
                <ul id="mypageMenu">
                    <li class = "info"><div class="square"></div>My Info</li>
                    <li><div class="square"></div><a href="myReview.net">My Review</a></li>
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
                <a class="img_tooltip">
                    <img src="resources/image/subscribe.png" style="width:63px" />
                    <span class="tooltipcontent"><b>정기 구독</b></span>
                </a>
                <ul id="subMenu">
                <c:if test="${substate == 0}">
                    <li><div class="square"></div><a href="javascript:openWin();" >구독 신청</a></li>
                </c:if>
                <c:if test="${substate == 1}">
                    <li><div class="square"></div><a href="#">구독 해지</a></li>
                </c:if>
                </ul>
            </li>
            <li id="homepage">
                <a href="main.com" class="img_tooltip">
                    <img src="resources/image/homepage.png" style="width:63px" />
                    <span class="tooltipcontent"><b>메인으로 이동</b></span>
                </a>
            </li>
        </ul>
    </nav>         
        <div class="wrap">
        <div class="overlay"></div>
        <div class="modal">
            <p>비밀번호 확인</p>
            <div class="form_wrap">
                <form action = "passchk.net" method=post id="passchk">
                    <label>
                        <input type="password" name = "password" placeholder="비밀번호를 입력하세요"/>
                    </label>
                    <div class="btn_wrap">
                        <input type="submit" class="btn_submit" value="확인">
                        <input type="button" class="btn_cancel" value="취소">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
