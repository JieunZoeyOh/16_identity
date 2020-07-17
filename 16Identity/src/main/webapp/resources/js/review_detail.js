$(function() {
	$(".info").on("click", function() {
		console.log("click")
		$(".overlay").addClass("on");
		$(".modal").addClass("on");
	})
	$(".btn_submit").on("click", function() {
		$('#passchk').submit();

	})
	$(".btn_cancel").on("click", function() {
		$(".overlay").removeClass("on");
		$(".modal").removeClass("on");

	})

	$("#comment table").hide(); // 1
	var page = 1; // 더 보기에서 보여줄 페이지를 기억할 변수
	var count = 0; // 전체 댓글 갯수
	var maxPage = getMaxPage(); // 댓글의 총 페이지 수를 구합니다.

	function getList(currentPage, cm_align) {
		$.ajax({
			type : "post",
			url : "CommentList.minji",
			data : {
				"isbn" : $('#isbn_input').text(),
				"page" : currentPage,
				"cm_align": cm_align
			},
			dataType : "json",
			success : function(rdata) {
				if (rdata.length > 0) {
					$("#comment table").show(); // 문서가 로딩될때 hide 했던 부분을
					// 보이게 합니다. (1)
					$("#comment thead").show(); // 글이 없을 때 hide() 부분을
					// 보이게 합니다. (2)
					output = '';
					$(rdata).each(
						function() {
							var cmt_id= this.cmt_id;
							console.log(this.cmt_id);
							output += "<div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>  <div class='card'>";
							output += "<div class='body bg-orange' id='each_comment'>";
							output += "<div id='#comment_avatar' style='display:inline-block;'><img src='resources/image/avatar1.png' style='width: 90px;border-radius: 50%;'/></div>"
							output += "<p class='card_header' class='hangelfont'><a href='reviewpost.minji'>"
									+ this.cmt_nickname
									+ "</a> - ";
							output += this.cmt_mbti.toUpperCase();
							
							if($('#m_id').text()==this.cmt_id||$('#m_id').text()=='admin'){
							output +="<span id='cmt_dm'><a href='comment_delete.minji?cmt_no="+ this.cmt_no+ "'><img src='resources/image/remove.png' id='review_remove'/></a>"
								   + "&nbsp<img onclick='modify(this)' src='resources/image/comment_modify.png' id='review_modify'/></span>";
							}
							else{
							output +="<img onclick='review_warn(this)' src='resources/image/review_warn.png' id='review_warn'/>";
							}
							output += "</p><p class='cmt_content'>"+this.cmt_content+"</p>" +
									  "<p class='none_cmtno'>"+this.cmt_no+"</p>";
									+ "<br>";
							output += "<br>"+ this.cmt_date;
							output +="<div id='cmt_like'><img onclick='comment_like(this)' src='resources/image/comment_like.png' id='comment_like'/>&nbsp<span id='comment_like2'>"+this.cmt_like+"</span></div>";
							output +="</div></div></div>";
					});// each end
					$("#comment tbody").append(output);

					console.log("현재:" + currentPage)
					console.log("max:" + maxPage)
					// 현재 페이지가 마지막 페이지면 "더보기"는 나타나지 않습니다.
					if (currentPage == maxPage) {
						$("#message").text("");
					} else {
						$("#message").text("더보기");
					}
					// 더 보기를 클릭할 경우 현재 페이지에서 1증가된 페이지를 보여주기 위해 값을 설정합니다.
					page = currentPage + 1;
				} else {
					$("#message").text("등록된 댓글이 없습니다.")
					$("#comment thead").hide(); // 2
					$("#comment tbody").empty(); // 데이터가 한 개인 경우
					// 삭제하면서 tbody를
					// 비웁니다.
				}
			}
		}); // ajax end
	}

	$("#button_addcomment").click(function() {
		var id = $('#m_id').text();
		var content = document.getElementById('book_comment').value;
		var book_image = $("#book_image").attr("src");
		var button_text= $("#button_addcomment").text();
		
		
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
		console.log(translators)
		console.log("버튼 여부"+button_text);
		//console.log("댓글 번호"+cmt_no);
		
		
		console.log(authors.join());
		
		//여기서 if 시작
		if(button_text=='등록'){
			url = "review_commentsadd.minji";
			data = {
					"title" : title,
					"content" : content,
					"id" : id,
					"isbn" : isbn,
					"authors" : authors_list,
					"publisher" : publisher,
					"book_price" : book_price,
					"book_date" : book_date,
					"book_contents" : book_contents,
					"book_image" : book_image,
					"translators":translators_list,

			};
		}else{
			url = "review_commentsupdate.minji";
			data = {
					"content" : content,
					"cmt_no":cmt_no
			};
			$("#button_addcomment").text('등록');
		}
		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function() {
				$("#book_comment").val('');
				$("#comment tbody").empty();
				getList(1);
			}
		});// ajax end
	});

	$("#comment table").hide(); // 1
	var page = 1; // 더 보기에서 보여줄 페이지를 기억할 변수
	var count = 0; // 전체 댓글 갯수
	var maxPage = getMaxPage(); // 댓글의 총 페이지 수를 구합니다.
	if (count != 0) // 댓글 갯수가 0이 아니면
		getList(1); // 첫 페이지의 댓글을 구해 옵니다. (한 페이지에 3개씩 가져옵니다.)
	else { // 댓글이 없는 경우
		$("#message").text("등록된 댓글이 없습니다.")
	}

	// 최대 몇 페이지를 가질 수 있는지 계산합니다.
	function getMaxPage() {
		// 글의 총 갯수 - 등록 또는 삭제시 댓글의 총 갯수 변화가 있기 때문에 갯수를 구합니다.
		count = parseInt($("#count").text());

		// 예) 총 리스트가 5개이면 최대 페이지는 2입니다.
		// int maxpage = (listcount + limit - 1) / limit;
		return parseInt((count + 3 - 1) / 3);
	}

	$("#message").click(function() {
		getList(page);
	});

	isbn_input = $('#isbn_input').text().slice(-13);
	console.log(isbn_input)

	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=isbn",
		data : {
			query : isbn_input
		},
		headers : {Authorization : "KakaoAK 49748a98d393f2ca2642a0b78bc9b99f"},

	})
		.done(function(msg) {
			console.log(msg);
			console.log(msg.documents[0].title);
			console.log(msg.documents[0].thumbnail);
			title = msg.documents[0].title;
			isbn = msg.documents[0].isbn;
			authors = msg.documents[0].authors;
			publisher = msg.documents[0].publisher;
			book_price = msg.documents[0].sale_price;
			book_date = msg.documents[0].datetime;
			book_date = book_date.substring(0, 10);
			book_contents = msg.documents[0].contents;
			translators= msg.documents[0].translators;
			authors_list = authors.join();
			translators_list= translators.join();
			
			var isbn_original = msg.documents[0].isbn.slice(-13);
			var isbn_short = isbn_original.slice(-3);
			
			if(msg.documents[0].contents==""){
				book_contents = "책 소개가 없습니다.";
			}
			
			$("#book_img").append("<img id='book_image' src='http://image.kyobobook.co.kr/images/book/xlarge/"
							+ isbn_short + "/x" + isbn_original+ ".jpg'>");
			$("#book_img").append("<input type='hidden' value='http://image.kyobobook.co.kr/images/book/large/"
							+ isbn_short + "/l" + isbn_original+ ".jpg'>");
			$('#title').append('<img src="resources/image/quote.png" /><span>'+msg.documents[0].title+'</span><img src="resources/image/quote1.png" />');
			$("#authors").append("저자 : " + msg.documents[0].authors);
			$("#publisher").append("출판사: " + msg.documents[0].publisher);
			$("#book_price").append("정가: " + msg.documents[0].sale_price);
			$("#book_isbn").append("ISBN: " + msg.documents[0].isbn);
			$("#book_date").append("출판날짜: " + book_date.substring(0, 10));
			if(msg.documents[0].translators != ''){
				$("#translators").append("번역가: " + msg.documents[0].translators+"<br>");
			}
			
			$("#book_contents").append('<div class="title hangelfont"><span>책소개</span></div>');
			$("#book_contents").append("<div id='bookContents'>" + book_contents+ "</div>");
	
			$("#book_image").on('error', function(){
				$(this).prop('src', $(this).next().val());
			})
				});
	
});