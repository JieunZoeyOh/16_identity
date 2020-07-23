
go(1, 'book');
$(document).on('click','.likeReview',function(){
	go(1, 'review');
})
$(document).on('click','.likeBook',function(){
	go(1, 'book');
})
$(document).on('click', '.book-heart', function(){
	if(confirm('좋아요 취소하시겠습니까?') == true){
		book_like_cancle($(this)[0].id);
		alert('좋아요 취소되었습니다.');
	}else{
		return;
	}
	go(1, 'book');
})

$(document).on('click', '.review-heart', function(){
	if(confirm('좋아요 취소하시겠습니까?') == true){
		review_like_cancle($(this)[0].id);
		alert('좋아요 취소되었습니다.');
	}else{
		return;
	}
	go(1, 'review');
})
function review_like_cancle(input_cmt_like_no){
	$.ajax({
		method: "POST",
		url : "reviewLikeCancle.net",
		data : {
			cmt_like_no : input_cmt_like_no
		},
		success : function(data){
			return data;
		}
	})
}
function book_like_cancle(input_isbn){
	$.ajax({
		method: "POST",
		url : "bookLikeCancle.net",
		data : {
			isbn : input_isbn
		},
		success : function(data){
			return data;
		}
	})
}
function go(page, search) {
	if(search == 'book'){
		bookajax(page);
	} else {
		reviewajax(page);
	}
}

function bookajax(inputpage){
	$.ajax({
		method: "POST",
		url : "myBookAjax.net",
        data : {
        	page: inputpage
        },
        dataType : "json",
        success : function(data){
        	$('#content').empty();
        	$('#right_Container').children().eq(0).addClass('like_focus');
        	$('#right_Container').children().eq(1).removeClass('like_focus');
        	output ='';
        	if(data.listcount > 0){
        		$(data).each(function(){
        			var num = data.listcount - (data.page - 1) * data.limit;
        			output ='<table class="content_table"><thead><tr>'
        				+ '<td td colspan="2">NO.</td><td>책 제목</td><td>저자</td><td>날짜</td><td>좋아요 수</td>'
        				+ '</tr></thead><tbody>';
        			$(data.bookLikelist).each(function(index, item){
        				output += '<tr><td>'+ (num--) + '</td>'
        					   + '<td><img src="'+item.b_thumbnail+'" /></td>'
        					   + '<td><a href="./reviewpost.minji?isbn='+item.isbn+'">'+item.b_title+'</a></td>';
        				output += '<td>'+ item.b_authors +'</td>';
        				output += '<td>'+ item.like_date +'</td>';
        				output += '<td><i class="fa fa-heart book-heart" aria-hidden="true" id="'+item.isbn+'"><span class="heart_tooltip">좋아요 취소</span></i>'+ item.like_count +'</td>';
        				output += '</tr>'
        			})
        			output += '</tbody></table>';
        		})
        		output += '<div class="section"><div class="demo"><nav class="pagination">';
        		
        		if (data.page <= 1){
        			output += '<a class="r-link pagination__control pagination__control_prev" style="color:#cbccd278 !important;">prev</a>';
        		}
        		if (data.page > 1){
        			output += '<a href="javascript:go('+(data.page -1)+', '+"'"+'book'+"'"+');" class="r-link pagination__control pagination__control_prev">prev</a>';
        		}
        		
        		output += '<ol class="r-list pagination__list">';
        		for(var pagecount = data.startpage; pagecount<= data.endpage; pagecount++) {
        			if(pagecount == data.page){
        				output += '<li class="pagination__group"><span class="pagination__point">'+pagecount+'</span></li>';
        			}
        			if(pagecount != data.page){
        				output += '<li class="pagination__group"><a href="javascript:go('+pagecount+', '+"'"+'book'+"'"+');" class="r-link pagination__point">'+pagecount+'</a></li>';
        			}
        		}
        		output += '</ol>'
        		if(data.page >= data.maxpage) {
        			output += '<a class="r-link pagination__control pagination__control_next" style="color:#cbccd278 !important;">next</a>';
        		}           		
        		if(data.page < data.maxpage) {
        			output += '<a href="javascript:go('+(data.page + 1)+', '+"'"+'book'+"'"+');" class="r-link pagination__control pagination__control_next">next</a>';
        		}
        		output += '</nav></div></div>'
        	} else {
        		output = '<font size=5>좋아요 한 책이 없습니다.</font>';
        	}
        	
        	$('#content').append(output);
        }
	})
}

function reviewajax(inputpage){
	$.ajax({
		method: "POST",
		url : "myLikeReview.net",
        data : {
        	page: inputpage
        },
        dataType : "json",
        success : function(data){
        	$('#content').empty();
        	$('#right_Container').children().eq(1).addClass('like_focus');
        	$('#right_Container').children().eq(0).removeClass('like_focus');
        	output ='';
        	if(data.listcount > 0){
        		$(data).each(function(){
        			var num = data.listcount - (data.page - 1) * data.limit;
        			output ='<table class="content_table review_list"><thead><tr>'
        				+ '<td td colspan="2" rowspan="2">NO.</td><td>책 제목</td><td>저자</td><td rowspan="2">날짜</td><td rowspan="2">작성자</td><td rowspan="2">좋아요 수</td>'
        				+ '</tr><tr>'
        				+ '<td colspan="2">리뷰 댓글</td> '
        				+'</tr></thead><tbody>';
        			$(data.reviewLikelist).each(function(index, item){
        				output += '<tr><td rowspan="2">'+ (num--) + '</td>'
        					   + '<td rowspan="2"><img src="'+item.b_thumbnail+'" /></td>'
        					   + '<td><a href="./reviewpost.minji?isbn='+item.isbn+'">'+item.b_title+'</a></td>';
        				output += '<td>'+ item.b_authors +'</td>';
        				output += '<td>'+ item.cmt_like_date +'</td>';
        				output += '<td>'+ item.m_nickname +'</td>';
        				output += '<td><i class="fa fa-heart review-heart" aria-hidden="true" id="'+item.cmt_like_no+'"><span class="heart_tooltip">좋아요 취소</span></i>'+ item.cmt_like +'</td>';
        				output += '</tr><tr><td colspan="5">'+item.cmt_content+'</td></tr>'
        			})
        			output += '</tbody></table>';
        		})
        		output += '<div class="section"><div class="demo"><nav class="pagination">';
        		
        		if (data.page <= 1){
        			output += '<a class="r-link pagination__control pagination__control_prev" style="color:#cbccd278 !important;">prev</a>';
        		}
        		if (data.page > 1){
        			output += '<a href="javascript:go('+(data.page -1)+', '+"'"+'review'+"'"+');" class="r-link pagination__control pagination__control_prev">prev</a>';
        		}
        		
        		output += '<ol class="r-list pagination__list">';
        		for(var pagecount = data.startpage; pagecount<= data.endpage; pagecount++) {
        			if(pagecount == data.page){
        				output += '<li class="pagination__group"><span class="pagination__point">'+pagecount+'</span></li>';
        			}
        			if(pagecount != data.page){
        				output += '<li class="pagination__group"><a href="javascript:go('+pagecount+', '+"'"+'review'+"'"+');" class="r-link pagination__point">'+pagecount+'</a></li>';
        			}
        		}
        		output += '</ol>'
        		if(data.page >= data.maxpage) {
        			output += '<a class="r-link pagination__control pagination__control_next" style="color:#cbccd278 !important;">next</a>';
        		}           		
        		if(data.page < data.maxpage) {
        			output += '<a href="javascript:go('+(data.page + 1)+','+"'"+'review'+"'"+');"class="r-link pagination__control pagination__control_next">next</a>';
        		}
        		output += '</nav></div></div>'
        	} else {
        		output = '<font size=5>좋아요 한 리뷰 댓글이 없습니다.</font>';
        	}
        	
        	$('#content').append(output);
        }
	})
}

$(document).ready(function() {
	
	$(".info1").on("click", function(){
	    console.log("click")
	    $(".overlay").addClass("on");
	    $(".modal").addClass("on");
	})
	$(".btn_submit").on("click", function(){
		$('#passchk').submit();
	    
	})
	$(".btn_cancel").on("click", function(){
		$(".overlay").removeClass("on");
	    $(".modal").removeClass("on");
	    
	})
	
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
	
	var heart_tooltip;
	window.onmousemove = function(e){
		x = e.clientX;
		y = e.clientY;
	}
	$(document).on('mouseover','.fa-heart',function(){
		$(this)[0].lastChild.style.display='inline-block';
		$(this)[0].lastChild.style.position='fixed';
		$(this)[0].lastChild.style.border='1px solid lightgrey';
		$(this)[0].lastChild.style.fontSize = '4px';
		$(this)[0].lastChild.style.top = (y + 20) + 'px';
		$(this)[0].lastChild.style.left = (x + 20) + 'px';
	})
	
	$(document).on('mouseout','.fa-heart',function(){
		$(this)[0].lastChild.style.display='none';
	})
	
	
});