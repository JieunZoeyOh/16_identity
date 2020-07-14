<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 identity MY_INFO PAGE</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<script src="resources/js/jquery-3.5.0.js"></script>
<link href="resources/css/slick.css" type="text/css" rel="stylesheet">
<link href="resources/css/myReview.css" type="text/css" rel="stylesheet">
</head>
<body>
 	<c:set var="m" value ="${profile}"/>

   <div class="hero">
        <div class="diagonal-hero-bg">
            <img src = "resources/image/logo.png" class = "logoimg" >
            <div class="stars"></div>
        </div>
   </div>

   <div id="container" class="clearfix">
       <div class="info">
            <div class="imgcontainer">
                <label for="image"> 
                    <!-- 이미지 파일 불러오는 경로 다시 확인 
                        (현재 테스트이미지 profile.jpg 임의 지정)-->
                    <img src = 'resources/upload/${m.m_file}' class = "uploadimg">
                </label>
            </div>
            <div class="menu">
                <select class="menu-control" onchange="location = this.value;">
                    <option value="updateForm.net">My Info</option>
                    <option value="myReivew.net">My Review</option>
                    <option value="myBooks.net">My Books</option>
                    <option value="notice.net">Notice</option>
                </select>
            </div>
        </div>  

        <div class="card_wrap">
            <div class="slider">
                <div class="flip-card-wrap clearfix">
                    <div class="flip-card" >
                        <a href="test.html"  class="flip-card-inner">
                            <div class="flip-card-front">
                                <p>카드 앞면1</p>
                            </div>
                            <div class="flip-card-back">
                                <p>카드 뒷면1</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>  <!-- slider -->
        </div>  <!-- card_wrap -->
    </div>  <!-- #container -->
    <footer><h3>footer</h3></footer>
</body>
<script type="text/javascript" src="resources/js/jquery-3.5.0.js"></script>
<script type="text/javascript" src="resources/js/slick.min.js"></script>
<script type="text/javascript" src="resources/js/myReview.js"></script>
<script>
    $(function(){
        $('.slider').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1
        });
      });
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
</html>