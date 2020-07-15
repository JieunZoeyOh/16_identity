
window.onload = function(){

	$(".loader-wrapper").fadeOut(1000);
	$('#mypage').on('click', function(){
		$('#mypageMenu').toggle();
	})
	$('#subscribe').on('click', function(){
		$('#subMenu').toggle();
	})
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
    const subMenu = document.querySelector("#subMenu");
    const subMenuList = subMenu.children;
	subMenuList[0].addEventListener("mouseover", menulist_over);
	subMenuList[0].addEventListener("mouseout", menulist_out);
    
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
    $('#autoComplete_box').hide();
    /*input 검색했을 때*/
    /*Enter 칠 경우*/
   
    var text;
    var focus = -1;
    $('#searchBook').keyup(function(e){
    	
    	if(e.keyCode == 8) focus=-1;	//backSpace 누를 경우 
    	if($('#searchBook').val().length>=2){//2글자 이상 입력했을 경우
    		if(e.keyCode == 13) {//엔터 입력
        		if($('#searchBook').val() != ''){
        			$('#autoComplete_box').hide();
            		$('#autoComplete_box').empty();
        			page=1;
        			$('.board_wrap').empty();
        			category = categoryFunc($(".default_option").text());
        			searchWord = $('#searchBook').val();
        			searchBookFunc(searchWord, page, category);
        		} 
    		}else if(e.keyCode != 40 && e.keyCode != 38){
    			searchAuto($('#searchBook').val());//searchAuto 함수 호출
        		$('#autoComplete_box').show();//자동완성창 켜짐
    		} else {
    			if(focus == -1 && e.keyCode == 40){
	    			text = $('#autoComplete_box').children().eq(0).text();
	    			$('#searchBook').val(text);
	    			focus = 0;
	    		}else if(focus >= 0 && focus <= 3){
	    			if(e.keyCode == 40) 
	    				++focus;//키보드 아래 방향 키 눌렀을 경우
	    			if(e.keyCode == 38) 
	    				--focus;//키보드 윗 방향 키 눌렀을 경우
	    		} else if(focus == -1){
	    			if(e.keyCode == 40) 
	    				focus = 0;
	    			if(e.keyCode == 38) 
	    				focus = -1;
	    		} else if(focus == 4){
	    			if(e.keyCode == 40) 
	    				focus = 4;
	    			if(e.keyCode == 38) 
	    				focus = 3;
	    		}
	    		console.log('focus:'+focus);
	    		text = $('#autoComplete_box').children().eq(focus).text();
    			$('#searchBook').val(text);
    		}
    	}else{
    		$('#autoComplete_box').hide();
    		$('#autoComplete_box').empty();
    	}
    	
    	
    });
    //$('.auto_result').eq(1).addClass('auto_result_focus');
		/*click 할 경우*/    
    $('.fa-search').on('click',function(){
    	if($('#searchBook').val() != ''){
    		$('#autoComplete_box').hide();
    		$('#autoComplete_box').empty();
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
		        			//imgerror = 'resources/image/bookerror.PNG';
		        			img = "http://image.kyobobook.co.kr/images/book/xlarge/"+isbn_short+"/x"+isbn_original+".jpg";
		        			img2 = "http://image.kyobobook.co.kr/images/book/large/"+isbn_short+"/l"+isbn_original+".jpg";
		        			output += '<article class="book_article">'
		        					+ '<div class="book_img_box">'
		        					+ '<a href="reviewpost.minji?isbn='+result.documents[i].isbn +'">'
		        					+ `<img class="bookImgSrc" src="${img}" alt="`+result.documents[i].title+`"/><input type="hidden" value="${img2}"></a>`
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
		        	    $('.bookImgSrc').on('error', function(){//img src 없는 경우 xlarge->lagre로 대체
		        	        $(this).prop('src', $(this).next().val());//input type=hidden의 value => img2
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

    /*자동 완성 검색창 부분*/
    function searchAuto(autoQuery){
    	$.ajax({
    		method: "GET",
    		url : "https://dapi.kakao.com/v3/search/book",
    		data : {
    			query : autoQuery,
    			size : 5,
    			page : 1
    		},
    		headers: {Authorization: "KakaoAK 49748a98d393f2ca2642a0b78bc9b99f"},
    		success : function(result){ 
    			autoOutput = '';
    			if(result.meta.total_count>0){
    				$('#autoComplete_box').empty();
    				$(result).each(function(){
    					for(var i=0; i<result.documents.length; i++){
    						var original_title = result.documents[i].title;
    						var shortTitle = result.documents[i].title.slice(0,30)+'...';
    						var isbn = result.documents[i].isbn;
    						var isbn0 = result.documents[0].isbn;
    						if(original_title.length<30){ //글자수 제한
    							autoOutput += `<div class="auto_result"><a href="reviewpost.minji?isbn='${isbn}'">${original_title}</a>`;
    						}else{
    							autoOutput += `<div class="auto_result"><a href="reviewpost.minji?isbn='${isbn}'">${shortTitle}</a>`;
    						}
    						autoOutput += `<input type="hidden" class="thumImg" value='${result.documents[i].thumbnail}'>`;
    						autoOutput += `<input type="hidden" class="isbnNo" value='${isbn}'>`;
    						autoOutput += `</div>`;
    					}
    					autoOutput += `<a href="reviewpost.minji?isbn='${isbn0}'"><img src="${result.documents[0].thumbnail}"></a>`;
    					$('#autoComplete_box').append(autoOutput);
    					
    				})
    			} else {
    				$('#autoComplete_box').empty();
    				
    			}
		    }
    	})
    }
    $(document).on('mouseover','.auto_result',function(){	//마우스 오버할 때 이벤트
    	$('#autoComplete_box').find('img').prop("src", $(this).find('.thumImg').val());
    	var address_isbn = 'reviewpost.minji?isbn='+$(this).find('.isbnNo').val();	//디테일 페이지 링크
    	$('#autoComplete_box').find('a').prop("href", address_isbn);
    });
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
