<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.5.0.js"></script>
<title>누군가의 리뷰페이지 </title>
<!-- Custom Css -->
<link href="resources/css/style.css" rel="stylesheet">
<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="resources/css/themes/all-themes.css" rel="stylesheet" />
<link href="resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
<style>
.col{
position: absolute;
    top: 90%;
    left: 45%;
}

.gray{color:gray}
</style>
<link href="resources/css/test.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
	<span id="my_review_count" style="display:none" class="hangelfont">${listcount}</span>
	<c:forEach var="com" items="${commentlist}">
	<div id="comment" class="hangelfont">
               	<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>
               		<div class='card'>
               			<div class='body bg-orange' id='each_comment'  onclick="closemethod(this);">
             			  	<div id='#comment_avatar' style='display:inline-block;'><img src='resources/image/avatar1.png' style='width: 90px;border-radius: 50%;'/></div>
             				  	<p class='card_header' class='hangelfont'>${nickname}</p>
             				  	<p class='cmt_content'>${com.cmt_content}</p>
           				    	<p class='none_cmtno'>${com.cmt_no}</p>
           				    	<p class='none_cmtno' id='getisbn'>${com.isbn}</p>
               					<br>
              				 	<br>
              				 	${com.cmt_date}
               		 </div></div><br><br>
           </div>     
           </div>
       </c:forEach> 
       </div><br>
     <div class="center-block">
	  <div class="row">
	    <div class="col">
	      <ul class="pagination">   
           <c:forEach var="a" begin="${startpage}" end="${endpage}">
	      		<c:if test="${a==page}">
	      			<li class="page-item">
	      				<a style="color:gray">${a}</a>
	      			</li>
	      		</c:if>
	      		<c:if test="${a!=page}">
	      			<li class="page-item">
	      			  <a href="./see_view.minji?page=${a}&id=${id}&nickname=${nickname}"
	      			  	class="page-link">${a}</a>
	      			</li>
	      		</c:if>
	      	</c:forEach>
           </ul>
	    </div>
	  </div>
	</div>
	
<script>
function closemethod(t){
	var isbn =$(t).children().next().next().next().next().text();
	console.log('isbn값'+isbn);
	opener.location.href="reviewpost.minji?isbn="+isbn; 
	window.close();
}
</script>
</body>
</html>