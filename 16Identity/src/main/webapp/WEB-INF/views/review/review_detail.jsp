<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="resources/css/review_css.css" type="text/css">
<script>
$.ajax({
	method: "GET",
	url : "https://dapi.kakao.com/v3/search/book?target=title",
	data : {query: "미움받을 용기"},
	headers: {Authorization: "KakaoAK 49748a98d393f2ca2642a0b78bc9b99f"},
	
})
	.done(function(msg){
		console.log(msg);
		console.log(msg.documents[0].title);
		console.log(msg.documents[0].thumbnail);
		title=msg.documents[0].title;
		isbn = msg.documents[0].isbn;
		authors=msg.documents[0].authors;
		publisher =msg.documents[0].publisher;
		book_price=msg.documents[0].sale_price;
		book_date= msg.documents[0].datetime;
		book_date=book_date.substring(0,10);
		book_contents= msg.documents[0].contents;
		
		$("#title").append("<h1>"+msg.documents[0].title+"</h1><hr><br>");
		$("#book_img").append("<img id='book_image' src='"+msg.documents[0].thumbnail+"' style='width:200px;'/>");
		$("#authors").append("<h3> 저자 : "+msg.documents[0].authors+"</h3>");
		$("#publisher").append("<h3> 출판사: "+msg.documents[0].publisher+"</h3>");
		$("#book_price").append("<h3> 정가: "+msg.documents[0].sale_price+"</h3>");
		$("#book_isbn").append("<h3> ISBN: "+msg.documents[0].isbn+"</h3>");
		$("#book_date").append("<h3> 출판날짜: "+book_date.substring(0,10)+"</h3>");
		$("#book_contents").append("<h2> 책소개</h2><br><h4>"+msg.documents[0].contents+"</h4>");
		
	});
	
	
$(function() {	
	
$(".btn-like").click(function() {
	$(this).toggleClass("done");
});

$("#button_addcomment").click(function(){
	var id= "gi5442@naver.com";
	var content =document.getElementById('book_comment').value;
	var book_image= $("#book_image").attr("src");
	
	console.log(title);
	console.log(id);
	console.log(content);
	console.log(isbn);
	console.log(authors);
	console.log(publisher);
	console.log(book_price);
	console.log(book_date);
	console.log(book_contents);
	console.log(book_image);
	
	url = "review_commentsadd.minji";
	data = {
			"title":title,
			"content": content,
			"id" : id,
			"isbn" : isbn,
			"authors":authors,
			"publisher":publisher,
			"book_price":book_price,
			"book_date":book_date,
			"book_contents":book_contents,
			"book_image":book_image
			
	};
	
	$.ajax({
		type:"post",
		url: url,
		data: data,
		success: function(result){
			$("#book_comment").val('');
			console.log("result="+result);
		}
	});// ajax end
});

});	
</script>

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
<h2>리뷰 - 댓글</h2>
<hr>
<table >
	<tr>
			<td style="width:300px">댓글달기</td>
			<td id="comment_input" style="width:600px">
				 <textarea name="book_comment" id="book_comment" cols="89" rows="3" class="form-control"></textarea>
			</td>
			<td >
				<button type="button" class="btn btn-info" id="button_addcomment">댓글달기</button>
			</td>
	</tr>
</table>
</div>
</body>
</html>