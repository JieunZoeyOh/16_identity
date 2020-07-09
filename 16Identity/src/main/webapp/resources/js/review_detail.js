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
		
		var isbn_original = msg.documents[0].isbn.slice(-13);
		var isbn_short= isbn_original.slice(-3);
		$("#title").append("<h1>"+msg.documents[0].title+"</h1><hr><br>");
		$("#book_img").append("<img id='book_image' src='http://image.kyobobook.co.kr/images/book/xlarge/"+isbn_short+"/x"+isbn_original+".jpg'>");
		$("#authors").append("<h3> 저자 : "+msg.documents[0].authors+"</h3>");
		$("#publisher").append("<h3> 출판사: "+msg.documents[0].publisher+"</h3>");
		$("#book_price").append("<h3> 정가: "+msg.documents[0].sale_price+"</h3>");
		$("#book_isbn").append("<h3> ISBN: "+msg.documents[0].isbn+"</h3>");
		$("#book_date").append("<h3> 출판날짜: "+book_date.substring(0,10)+"</h3><br>");
		$("#book_contents").append("<h2> 책소개</h2><h4>"+msg.documents[0].contents+"</h4>");
		
	});
	


$(function() {	
$("#comment table").hide(); //1
var page=1; //더 보기에서 보여줄 페이지를 기억할 변수
var count =0; //전체 댓글 갯수
var maxPage = getMaxPage(); //댓글의 총 페이지 수를 구합니다.
	

function getList(currentPage){
	$.ajax({
			type:"post",
			url:"CommentList.minji",
			data:{
				"isbn" : "8996991341 9788996991342",
				"page" : currentPage
			},
			dataType: "json",
			success: function(rdata){
				if(rdata.length > 0){
					$("#comment table").show(); //문서가 로딩될때 hide 했던 부분을 보이게 합니다. (1)
					$("#comment thead").show(); //글이 없을 때 hide() 부분을 보이게 합니다. (2)
					output= '';
					$(rdata).each(function(){
									output +="<div class='col-lg-4 col-md-4 col-sm-6 col-xs-12'>  <div class='card'>";
									output +="<div class='body bg-orange' id='each_comment'>";
									output +="<p id='card_header' class='hangelfont'><a href='reviewpost.minji'>"+this.cmt_nickname +"</a> - ";
									output +=this.cmt_mbti+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+this.cmt_date;
                                	output +="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href='comment_delete.minji?cmt_no="+this.cmt_no+"'><img src='resources/image/remove.png' id='review_remove'/></a></p>";
									output +=this.cmt_content+"<br>";
									output +="<br></div></div></div>";
								});//each end
					$("#comment tbody").append(output);
					
					console.log("현재:"+currentPage)
					console.log("max:"+maxPage)
					//현재 페이지가 마지막 페이지면 "더보기"는 나타나지 않습니다.
					if(currentPage==maxPage){
						$("#message").text("");
					}else{
						$("#message").text("더보기");
					}
					//더 보기를 클릭할 경우 현재 페이지에서 1증가된 페이지를 보여주기 위해 값을 설정합니다.
					page= currentPage+1;
				}else{
					$("#message").text("등록된 댓글이 없습니다.")
					$("#comment thead").hide(); //2
					$("#comment tbody").empty(); //데이터가 한 개인 경우 삭제하면서 tbody를 비웁니다.
				}
			}
	}); //ajax end		
  }


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
	
	var authors_list=authors.join();
	
	console.log(authors.join());
	
	url = "review_commentsadd.minji";
	data = {
			"title":title,
			"content": content,
			"id" : id,
			"isbn" : isbn,
			"authors":authors_list,
			"publisher":publisher,
			"book_price":book_price,
			"book_date":book_date,
			"book_contents":book_contents,
			"book_image":book_image,
			
	};
	
	$.ajax({
		type:"post",
		url: url,
		data: data,
		success: function(){
			$("#book_comment").val('');
			$("#comment tbody").empty();
			getList(1);
		}
	});// ajax end
});


$("#comment table").hide(); //1
var page=1; //더 보기에서 보여줄 페이지를 기억할 변수
var count =0; //전체 댓글 갯수
var maxPage = getMaxPage(); //댓글의 총 페이지 수를 구합니다.
if(count != 0) //댓글 갯수가 0이 아니면
	getList(1); //첫 페이지의 댓글을 구해 옵니다. (한 페이지에 3개씩 가져옵니다.)
else{ //댓글이 없는 경우
	$("#message").text("등록된 댓글이 없습니다.")
}

//최대 몇 페이지를 가질 수 있는지 계산합니다.
function getMaxPage(){
	//글의 총 갯수 - 등록 또는 삭제시 댓글의 총 갯수 변화가 있기 때문에 갯수를 구합니다.
	count = parseInt($("#count").text());
	
	//예) 총 리스트가 5개이면 최대 페이지는 2입니다.
	//int maxpage = (listcount + limit - 1) / limit;
	return parseInt((count + 3 - 1) / 3);
}



$("#message").click(function(){
	getList(page);
});


});

