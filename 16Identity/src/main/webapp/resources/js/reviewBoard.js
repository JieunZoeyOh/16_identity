
window.onload = function(){
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
    
    var searchWord;

    

    var count = 0;
    var maxPage = 1;
    
    /*input 검색했을 때*/
    /*Enter 칠 경우*/
    $('#searchBook').keyup(function(e){
    	if(e.keyCode == 13) {
    		if($('#searchBook').val() != ''){
    			$('.board_wrap').empty();
    			searchWord = $('#searchBook').val();
    			searchBookFunc(searchWord);
    		} 
    	}	
    });
		/*click 할 경우*/    
    $('.fa-search').on('click',function(){
    	if($('#searchBook').val() != ''){
    		$('.board_wrap').empty();
			searchWord = $('#searchBook').val();
			searchBookFunc(searchWord);
		} 
    });  

    
    function searchBookFunc(searchWord){
    	getMaxPage(searchWord);
    	console.log("여기는 searchbook" + searchWord);
    }
    

    
    function getMaxPage(searchWord){
    	$.ajax({
    		method: "GET",
    		url : "https://dapi.kakao.com/v3/search/book",
    		data : {
    			query : searchWord,
    			size : 6
    		},
    		headers: {Authorization: "KakaoAK 49748a98d393f2ca2642a0b78bc9b99f"},
    		success : function(result){ 
    			
    			count = result.meta.total_count;
    			maxPage = parseInt((result.meta.total_count + 6 - 1)/6)
    			$('#image_part').hide();
    			$(".board_wrap").show();
    	        if(count != 0) {	
		        	$('#book_total_count_part').show();	
		        	$(".board_container").show();
		        	if(maxPage >= 2)
		        		$(".more_button").show();
		        	else
		        		$(".more_button").hide();
		        	$('#book_count').text(count);
		        	$("#message").text("");
		        	
		        	//결과 화면 뿌리는 곳
		        	output = '';
		        	$(result).each(function(){
		        		for(var i=0; i<result.documents.length; i++){
		        			var isbn_original = result.documents[i].isbn.slice(-13);
		        			var isbn_short= isbn_original.slice(-3);
		        			
		        			img = "http://image.kyobobook.co.kr/images/book/xlarge/"+isbn_short+"/x"+isbn_original+".jpg";
		        			output += '<article class="book_article">'
		        					+ '<div class="book_img_box">'
		        					+ '<a href="reviewpost.minji?isbn='+result.documents[i].isbn +'"><img src="'+img+'" alt="'+result.documents[i].title+'"/></a>'
		        					+ '</div><dl>'
		        					+ '<dt>'+ result.documents[i].title +'</dt>'
		        					+ '<dd>'+ result.documents[i].authors +'</dd>';
		        			if(result.documents[i].translators.length > 0){
		        				output += '<dd>'+ result.documents[i].translators +'</dd>';
		        			}
		        			output += '</dl></article>';		
		        		}
		        		$('section.board_wrap').append(output);
		        	})
		        	
		        } else {
		        	$('#book_total_count_part').hide();	
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
