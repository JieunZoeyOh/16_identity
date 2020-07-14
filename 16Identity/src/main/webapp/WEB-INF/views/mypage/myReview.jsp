<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<script src="resources/js/jquery-3.5.0.js"></script>
<link href="resources/css/myReview.css" type="text/css" rel="stylesheet">
<html>
<head>
<meta charset="UTF-8">
<title>16 identity MY_REVIEW PAGE</title>

</head>
<body>
	<c:set var="m" value ="${memberinfo}"/>
	<form id="myreview" action="myReview.net">
	<div class="hero">
		<div class="diagonal-hero-bg">
		<img src = "resources/image/logo.png" class = "logoimg" >
		
			<div class="stars">
			</div>
		</div>
	</div>

	<div class="imgcontainer">
		<label for="image"> 
			<img src = 'resources/upload/${m.m_file}' class = "uploadimg">
		</label>
	</div>

	<div class="menu">
		<select class="menu-control" onchange="location = this.value;">
			<option value="updateForm.net">My Info</option>
			<option value="myReview.net">My Review</option>
			<option value="myBooks.net">My Books</option>
			<option value="notice.net">Notice</option>
		</select>
	</div>

      <div class="flip-card">
        <div class="flip-card-inner">

          <div class="flip-card-front">
           <p>카드 앞면</p>
          </div>

          <div class="flip-card-back">
           <p>카드 뒷면</p>
          </div>

        </div>
      </div>
    </form>
    
    <footer><h3>footer</h3></footer>
    <script>
		$(window).on("load",function(){
			$(".loader-wrapper").fadeOut(1000);
			$('#mypage').on('click', function(){
				$('#mypageMenu').toggle();
			})
			$('#subscribe').on('click', function(){
				$('#subMenu').toggle();
			})
		})
		/*header js 부분*/
	    const mypageMenu = document.querySelector("#mypageMenu");
	    const mypageMenuList = mypageMenu.children;
	    for(var i=0; i<mypageMenuList.length; i++){
	        mypageMenuList[i].addEventListener("mouseover", menulist_over);
	        mypageMenuList[i].addEventListener("mouseout", menulist_out);
	    }
	    const subMenu = document.querySelector("#subMenu");
	    const subMenuList = subMenu.children;
		subMenuList[0].addEventListener("mouseover", menulist_over);
		subMenuList[0].addEventListener("mouseout", menulist_out);
		
		/*header js 부분*/
		function menulist_over(){
		    this.children[0].style.visibility = "visible";
		}

		function menulist_out(){
		    this.children[0].style.visibility = "hidden";
		}
	</script>
   </body>
</html>