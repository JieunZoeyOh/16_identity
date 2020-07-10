
window.onload = function(){

	$(".loader-wrapper").fadeOut(1000);

	$(".info").on("click", function(){
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
    /*header js 부분*/
    const mypageMenu = document.querySelector("#mypageMenu");
    const mypageMenuList = mypageMenu.children;
    for(var i=0; i<mypageMenuList.length; i++){
        mypageMenuList[i].addEventListener("mouseover", menulist_over);
        mypageMenuList[i].addEventListener("mouseout", menulist_out);
    }
    
    /*search js 부분*/
    $(".dropdown").click(function(){
        if($(".dropdown ul").hasClass('active')){
            closeDrop();
        } else {
            onenDrop();
        }
    });

    $(".dropdown ul li").click(function(){
        onenDrop();
        var text = $(this).text();
        $(".default_option").text(text);
    });
    
    /* 도서 검색 api 부분 */
    /*처음 로딩 되었을 때 hide 할 부분*/
    $('#book_total_count_part').hide();	//총 권수 
    $(".board_container").hide();	//검색 결과 + 더보기 나오는 곳
    
    let searchWord;

    
    var page=1;
    var count = 0;
    var category;
    /*input 검색했을 때*/
    /*Enter 칠 경우*/
    $('#searchBook').keyup(function(e){
    	if(e.keyCode == 13) {
    		if($('#searchBook').val() != ''){
    			page=1;
    			$('.board_wrap').empty();
    			category = categoryFunc($(".default_option").text());
    			searchWord = $('#searchBook').val();
    			searchBookFunc(searchWord, page, category);
    		} 
    	}	
    });
		/*click 할 경우*/    
    $('.fa-search').on('click',function(){
    	if($('#searchBook').val() != ''){
    		page=1;
    		$('.board_wrap').empty();
    		category = categoryFunc($(".default_option").text());
    		searchWord = $('#searchBook').val();
			searchBookFunc(searchWord, page, category);
		} 
    });  

    function categoryFunc(cate){
    	switch(cate) {
    		case "전체": 
    			return ""; break;
    		case "도서명": 
    			return "?target=title"; break;
    		case "저자": 
    			return "?target=person"; break;
    		case "ISBN": 
    			return "?target=isbn"; break;
    	}
    	
    }
    
    function searchBookFunc(searchWord, page, cate){
    	getPageList(searchWord, page, cate);
    	console.log("여기는 searchbook" + searchWord);
    }
    
    $('.more_button').on('click', function(){
    	getPageList(searchWord, page, category);
    });

    
    function getPageList(searchWord, input_page, input_cate){
    	var urlAddress ="https://dapi.kakao.com/v3/search/book"+input_cate;
    	console.log("주소:"+urlAddress);
    	$.ajax({
    		method: "GET",
    		url : urlAddress,
    		data : {
    			query : searchWord,
    			size : 6,
    			page : input_page
    		},
    		headers: {Authorization: "KakaoAK 49748a98d393f2ca2642a0b78bc9b99f"},
    		success : function(result){ 
    			if(!result.meta.is_end){
    				$(".more_button").show();
    			} else {
    				$(".more_button").hide();
    			}
    			count = result.meta.total_count;
    			maxPage = parseInt((result.meta.total_count + 6 - 1)/6)
    			$('#image_part').hide();
    			$(".board_wrap").show();
    	        if(count != 0) {	
		        	$('#book_total_count_part').show();	
		        	$(".board_container").show();
		        	$('#book_count').text(count);
		        	$("#message").text("");
		        	
		        	//결과 화면 뿌리는 곳
		        	output = '';
		        	$(result).each(function(){
		        		for(var i=0; i<result.documents.length; i++){
		        			var isbn_original = result.documents[i].isbn.slice(-13);
		        			var isbn_short= isbn_original.slice(-3);
		        			imgerror = 'resources/image/bookerror.PNG'
		        			img = "http://image.kyobobook.co.kr/images/book/xlarge/"+isbn_short+"/x"+isbn_original+".jpg";
		        			output += '<article class="book_article">'
		        					+ '<div class="book_img_box">'
		        					+ '<a href="reviewpost.minji?isbn='+result.documents[i].isbn +'">'
		        					+ `<img class="bookImgSrc" src="${img}" alt="`+result.documents[i].title+`"/></a>`
		        					//+ `<img class="bookImgSrc" src="${img}" alt="`+result.documents[i].title+`" onError="this.src='${imgerror}'"/></a>`
		        					+ '</div><dl>'
		        					+ '<dt>'+ result.documents[i].title +'</dt>'
		        					+ '<dd>'+ result.documents[i].authors +'</dd>';
		        			if(result.documents[i].translators.length > 0){
		        				output += '<dd>'+ result.documents[i].translators +'</dd>';
		        			}
		        			output += '</dl>';
		        			
		        			output += '</article>';		
		        		}
		        		$('section.board_wrap').append(output);
		        	    $('.bookImgSrc').on('error', function(){
		        	        $(this).prop('src', imgerror);
		        	    })
		        		page += 1;
		        	})

		        } else {
		        	$('#book_total_count_part').hide();	
		        	$('.board_container').show();
		        	$(".board_wrap").hide();
		        	$(".more_button").hide();
		        	$("#message").text("검색 결과가 존재하지 않습니다.");
		        }		
		    }
    	})
    }//
    

}
/*header js 부분*/
function menulist_over(){
    this.children[0].style.visibility = "visible";
}

function menulist_out(){
    this.children[0].style.visibility = "hidden";
}

function closeDrop(){
	$(".dropdown > ul").removeClass("active");
}

function onenDrop(){
	$(".dropdown > ul").addClass("active");
} 
