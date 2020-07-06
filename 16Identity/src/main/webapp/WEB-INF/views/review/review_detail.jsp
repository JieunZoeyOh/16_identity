<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/review_detail.js"></script>
<link rel="stylesheet" href="resources/css/review_css.css" type="text/css">

<style>
#comment > table > tbody > tr > td:nth-child(2){width:60%}
#comment > table > tbody > tr > td{text-align: center;}
</style>
</head>
<body>
<div id="wrap">
<p id=title></p>
<p id="book_img"></p>
 <table id="book_info" >
      <tbody>
        <tr>
           <td id="authors" style="width:1000px;"></td>
           <td id="publisher" style="width:700px;"></td>
        </tr>
        <tr>
           <td id="book_price" style="width:700px;"></td>
           <td id="book_isbn" style="width:700px;"></td>
        </tr>
        <tr>
        	<td id="book_date" style="width:700px;"></td>
        </tr>
	  </tbody>
	</table>
<button class="btn-like">♥</button>
<span id="book_contents"></span>
<h2>통계</h2>
<br>
<hr>

<h2>리뷰 - 댓글:  ${count}개</h2>
<span id="count" style="display:none">${count}</span>
<hr>
	<div id="comment">
            <textarea rows="3" cols="150" class="form-control" id="book_comment" 
            style="resize:none"></textarea>
            <button id="button_addcomment" class="btn btn-info float-right">등록</button><hr>
            
            <table class="table table_striped">
               <thead>
                  <tr><td style="width:300px;">아이디</td><td style="width:300px;">내용</td><td style="width:300px;">날짜</td></tr>
               </thead>
               <tbody>
               
               </tbody>
            </table>
           <div id="message" style="text-align: center;font-weight: bold;text-decoration: underline;"></div>

     </div>
 </div>
</body>
</html>