<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/review_detail.js"></script>
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
.hangelfont { font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important; }
body {
	margin:0;
	padding:0;
	width:100%;
	height:auto;
	background-color:white;
	background-size:100% auto;
	overflow: auto;
	
}

#wrap{
	width: 80%;
    height: auto;
    margin: 0 auto;
    padding-left: 50px;
    padding-right: 50px;
}

#book_img{
	width:30%;
	height: 390px;
	display:inline-block;
	float: left;
}
#book_img img{
	width:300px;
	height:auto;
}
#book_info{
	display:inline-block;
	width:70%;
	float:right;
}
#book_info td {
	width: 380px;
}
h3, h2 {
	font-weight: 500;
	font-size: 18px;
	font-family: 'Roboto', Arial, Tahoma, sans-serif;
}

#each_comment{
font-size: 16px;
border-radius:8px
}

.m_p_o_zero {
    margin: 0;
    padding: 0;
    outline: 0;
}

.button_container {
   	float:left;
    border-radius: 20px;
}

.button_container i{
    font-size: 5rem;
    transition: .4s;
}

.button_container:hover i {
    color: #f50057;
}

.fa-heart {
    color: #f50057;
    transition: .4s;
}

#button_addcomment{
	width: 100px;
    height: 50px;
    border: 3px solid #303960;
    background-color: white !important;
    color: black;
    border-radius: 20px;
    font-size: 14px;
    position: relative;
   	left: 125px;
    top: -55px;
	margin:20;
	transition: .3s;
	box-shadow: none !important;
}
#button_addcomment:hover {
	background-color: #303960 !important;
	color:white;
}

.form-line{
	display:inline-block;
}

.form-group{
	width: 900px;
	display:inline-block;
	padding-left: 90px;
}

#main_sidebar #sidebar_list>li:nth-child(1) {
    padding: 20px 0px 5px 23px;
}

#main_sidebar #sidebar_list>li:nth-child(3) {
    padding: 18px 0px 5px 17px;
}
#main_sidebar #sidebar_list>li:nth-child(4) {
    padding: 10px 0px 0px 19px;
}
.form-group .form-line:after{
	border-bottom: 2px solid #303960 !important;
}
#each_comment {
    background-color: #fff !important;
    color: black !important;
}

.card {
    box-shadow: 4px 5px 10px rgba(0, 0, 0, 0.2) !important;
    height: 200px;
}
.card_header{
	font-size: 19px;
}

#review_remove{
	width:20px; height:20px;
}

.modal.on{
height: 200px;
}

.modal p {
    padding-top: 10px;
  }

#review_modify{
	width:20px; height:20px;
}

.cmt_content{
	height:70px;
}

.none_cmtno{
	display:none;
}

ul#subMenu {
    width:107px;
}
#chart{
	padding-left:140px;
}    
#chart > svg > g:nth-child(1) > g.brush-fullstackbar > g:nth-child(1) > text:nth-child(4){
	font-size:30px;	
}
#review_warn{
	width:20px; height:20px; float:right;
}
#comment_like{
	width:20px; height:20px;
}
#cmt_like{
	float:right;
}
#cmt_dm{
	float:right;
}

</style>
<jsp:include page="../main/header.jsp"/> 
</head>
<body>
<div id="wrap">
<p id=title class="hangelfont"></p>
<div id="book_img"></div>
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
<span id="book_contents" class="hangelfont"></span><br> 	
<div class="button_container">
        <i id="btn" class="fa fa-heart-o" onclick="likeaction()">&nbsp${bookvalue.like_count}</i>
</div>
<br><br><br><br><br><br><br>
<h2 class="hangelfont">통계</h2><hr>
 <div id="chart"></div>
<h2 class="hangelfont">리뷰 - 댓글</h2>
<span style="display:none" id="isbn_input">${isbn}</span>
<span style="display:none" id="m_id">${m_id}</span>
<span id="count" style="display:none" class="hangelfont">${count}</span>
	<div id="comment" class="hangelfont">
            <table class="table table_striped">
               <thead>
               </thead>
               <tbody>
               
               </tbody>
            </table>
            
           <div id="message" style="text-align: center;font-weight: bold;text-decoration: underline;"></div>
          <hr><h2 style="padding-left: 90px">리뷰 남기기</h2>
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
		before = $(t).parent().next().text();
		cmt_no= $(t).parent().next().next().text();
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
    	like_cmt_no= $(t).parent().prev().prev().prev().text();
    	console.log('댓글번호 '+like_cmt_no);
    }
    </script>

</body>
</html>