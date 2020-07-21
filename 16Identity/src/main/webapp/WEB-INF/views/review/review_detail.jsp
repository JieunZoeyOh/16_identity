<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/review_detail2.js"></script>
<title>메인페이지</title>
<link rel="icon" href="resources/favicon.ico" type="image/x-icon">  
<!-- Waves Effect Plugin Js -->
    <script src="resources/plugins/node-waves/waves.js"></script>
	
    <!-- Bootstrap Core Css -->
    <link href="resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="resources/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="resources/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- JQuery DataTable Css -->
    <link href="resources/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom Css -->
    <link href="resources/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="resources/css/themes/all-themes.css" rel="stylesheet" />
    <style>
    
    </style>
	<link href="resources/css/test.css" rel="stylesheet">
<jsp:include page="../main/header.jsp"/> 
</head>
<body>
<div id="wrap">
<hr>
<div id="book_img"></div>
<div id="title" class="hangelfont title"></div>
 <table id="book_info" class="hangelfont">
      <tbody>
        <tr>
           <td id="authors"></td>
           <td id="publisher"></td>
        </tr>
        <tr>
           <td id="book_price"></td>
           <td id="book_isbn"></td>
        </tr>
        <tr>
        	<td id="book_date"></td>
        	<td id="translators"></td>
        </tr>
	  </tbody>
	</table>
<div id="book_contents" class="hangelfont"></div>	
<div class="button_container">
	<c:if test="${like_check==0}">
        <i id="btn" class="fa fa-heart-o" onclick="likeaction()">&nbsp${bookvalue.like_count}</i>
	</c:if>
	<c:if test="${like_check==1}">
        <i id="btn" class="fa fa-heart" onclick="likeaction()">&nbsp${bookvalue.like_count}</i>
	</c:if>
</div>
<div class="title hangelfont">
	<span style="line-height: 145px;">통계</span>
</div><hr>
 <div id="chart"></div>
<div class="title hangelfont">
	<span style="line-height: 145px;">리뷰 댓글</span>
</div><hr>
<div id="comment_align"><select id="comment_align2">
    <option value="1" selected>최신순</option>
    <option value="2">인기순</option>
    <option value="3">내 댓글 보기</option>
</select></div>
<span style="display:none" id="isbn_input">${isbn}</span>
<span style="display:none" id="m_id">${m_id}</span>
<span id="count" style="display:none" class="hangelfont">${count}</span>
<span id="my_review_count" style="display:none" class="hangelfont">${my_review_count}</span>
	<div id="comment" class="hangelfont">
            <table class="table table_striped">
               <thead>
               </thead>
               <tbody>
               
               </tbody>
            </table>
            
           <div id="message" style="text-align: center;font-weight: bold;text-decoration: underline;"></div>
          <hr>
		  <div class="title hangelfont" style="padding-left: 79px;">
		  	<span style="line-height: 145px;">리뷰 남기기</span>
		  </div>
          <div class="form-group">
              <div class="form-line" style="width: 900px;">
                   <textarea rows="4" id="book_comment" class="form-control no-resize auto-growth" placeholder="리뷰 댓글 남겨보세요 - 100자 제한" style="overflow: hidden; overflow-wrap: break-word; height: 92px;"></textarea>
              </div>
		  </div>
            <button type="button"  id="button_addcomment" class="btn bg-cyan btn-block btn-lg waves-effect">등록</button><br><br><br>
     </div>
 </div>
 
 <!-- Jquery Core Js -->
    <script src="resources/plugins/jquery/jquery.min.js"></script>
	
    <!-- Bootstrap Core Js -->
    <script src="resources/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="resources/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="resources/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

     <!-- Custom Js -->
    <script src="resources/js/admin.js"></script>

    <!-- Demo Js -->
    <script src="resources/js/demo.js"></script>
    <script src="resources/js/jui-chart.js"></script>
    <script>
	$(window).on("load",function(){
		$(".loader-wrapper").fadeOut(1000);
		$('#mypage').on('click', function(){
			$('#mypageMenu').toggle();
		})
		$('#subscribe').on('click', function(){
			$('#subMenu').toggle();
		})
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
        var btn = document.getElementById('btn');
		
        btn.addEventListener("click", likeaction);
		
        function likeaction(){
            if(btn.classList.contains('fa-heart-o')){
                btn.classList.remove('fa-heart-o');
                btn.classList.add('fa-heart');
            } else {
                btn.classList.add('fa-heart-o');
                btn.classList.remove('fa-heart');
            }
        }
        
        

        
         graph.ready([ "chart.builder" ], function(builder) {
            builder("#chart", {
                width: 800,
                height : 400,
                theme : "classic",
                axis : {
                    data : [
                    	    { quarter : "E/I", samsung : ${bookvalue.e_count}, lg : ${bookvalue.i_count}},
                    	    { quarter : "S/N", samsung : ${bookvalue.s_count}, lg : ${bookvalue.n_count}},
                    	    { quarter : "T/F", samsung : ${bookvalue.t_count}, lg : ${bookvalue.f_count}},
                    	    { quarter : "P/J", samsung : ${bookvalue.p_count}, lg : ${bookvalue.j_count}}
                    ],
                    y : {
                        type : "block",
                        domain : "quarter",
                        line : true,
                        orient : "right"
                    },
                    x : {
                        type : 'range',
                        domain : [0, 100],
                        format : function(value) { return value + "%" ;},
                        line : true
                    }
                    
                },
                brush : {
                    type : 'fullstackbar',
                    target : [ "samsung", "lg" ],
                    showText: true,
                  
                },
            });
        }); 
        
       
	})

    function menulist_over(){
        this.children[0].style.visibility = "visible";
    }

    function menulist_out(){
        this.children[0].style.visibility = "hidden";
    }

    function modify(t){
		console.log('수정합시다.');
		before = $(t).parent().parent().next().text();
		cmt_no= $(t).parent().parent().next().next().text();
		console.log("댓글내용= "+before);
		console.log("댓글번호= "+cmt_no);
		$("#book_comment").focus().val(before);
		$("#button_addcomment").text('수정');
	}
    
    function likeaction() {
		console.log('좋아요 추가해봅시다.');
		console.log(document.getElementById('m_id').innerText);
		console.log(document.getElementById('isbn_input').innerText);
		
		 $.ajax({
			type : "post",
			url : "like_action.minji",
			data : {
				"id" : document.getElementById('m_id').innerText,
			    "isbn" : document.getElementById('isbn_input').innerText,
			    "title" : title,
			    "authors" : authors_list,
			    "publisher" : publisher,
				"book_price" : book_price,
				"book_date" : book_date,
				"book_contents" : book_contents,
				"book_image" : $("#book_image").attr("src"),
				"translators":translators_list,
			},
			success : function(data) {
				document.getElementById('btn').innerText=data;
			}
		});// ajax end 
		
	}
    
    function review_warn(t){
    	console.log('신고합시다.');
    	warn_cmt_no=  $(t).parent().next().next().text();
    	console.log("댓글번호= "+warn_cmt_no);
    	
    	var input = prompt('신고사유를 작성해주세요');
    	
    	if(input !=null){
    	$.ajax({
 			type : "post",
 			url : "comment_warn.minji",
 			data : {
 				"cmt_no":warn_cmt_no,
 				"warn_reason":input
 			},
 			success : function(data) {
 				if(data==1){
					alert('신고 접수되었습니다.');
 				}
 				else{
 					alert('이미 신고하신 댓글입니다.')
 				}
			}
 			
    	 });// ajax end 
    	}
    }
    
    function comment_like(t){
    	
    	console.log('댓글 좋아요 합시당');
    	like_cmt_no= $(t).parent().prev().prev().text();
    	console.log('댓글번호 '+like_cmt_no);
    	console.log('이전 좋아요 수 '+$(t).next().text());
    	prior_likecount= $(t).next().text();
    	
    	$.ajax({
    		type : "post",
 			url : "comment_like.minji",
 			data : {
 				"cmt_no":like_cmt_no,
 			},
 			dataType : "json",
 			success : function(data){
 				if (prior_likecount>data){
 					alert('좋아요 취소되었습니다.');
 					$(t).next().text(data);
 				}
 				else if(prior_likecount<data){
 					alert('좋아요 되었습니다.');
 					$(t).next().text(data);
 				}
			}
    	});// ajax end 
    	
    }
    
    function see_view2(t){
    	var see_nickname=$(t).text();
    	window.screen.width
    	window.screen.height
    	var popupWidth = 750;
    	var popupHeight = 750;
    	var popupX = (window.screen.width/2) - (popupWidth/2);
    	var popupY= (window.screen.height/2) - (popupHeight/2);
    	window.open("see_view.minji?nickname="+see_nickname, see_nickname, 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	}
    
 	$('#book_comment').keyup(function(e){
 		var content = $(this).val();
 		
 		if(content.length>100){
 			alert('최대 100자까지 입력 가능합니다.');
 			$(this).val(content.substring(0,100));
 		}
 	})
    </script>

</body>
</html>