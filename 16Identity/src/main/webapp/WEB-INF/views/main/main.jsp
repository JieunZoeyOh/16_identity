<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="resources/css/main.css">
<script src="resources/js/main.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
</head>
<body>
	<div class="wrap">
        <ul id="main_background" class="m_p_zero">
            <li id="main_mbti_recommend" class="m_p_zero">
                <div class="main_mbti_recommend_nav" class="m_p_zero"></div>
                <div id="main_mbti_recommend_opacity" class="m_p_zero"></div>
            </li>
            <li id="main_mbti_best_review" class="m_p_zero"></li>
            <li id="main_mbti_best_recommend" class="m_p_zero"></li>
        </ul> 
    </div>
    <div id="main_mbti_recommend_section" class="m_p_zero">
         <nav class="main_mbti_recommend_nav" class="m_p_zero">
            <span id="nav_left_arrow"><i class="fa fa-chevron-left" aria-hidden="true"></i></span> 
            <div id="recommend_mbti_list_box">
                <ul id="recommend_mbti_list" style="margin-left: 0px;">
                	<c:forEach var="mbti_list" items="${mbti_list}">
                    	<li><c:out value="${fn:toUpperCase(mbti_list)}" /></li> <%-- 대문자로 변환 --%>
                    </c:forEach>
                </ul>
            </div>
            <span id="nav_right_arrow"><i class="fa fa-chevron-right" aria-hidden="true"></i></span> 
        </nav>
        <section id="main_mbti_recommend_part" class="m_p_zero">
            <span class="mbti_recommend_arrow m_p_zero" id="mbti_left"><i class="fa fa-angle-double-left" aria-hidden="true"></i></span> 
            <div id="mbti_recommend_box" class="m_p_zero">
                <div id="mbti_recommend_list" class="m_p_zero">
                <c:forEach var="mbtiname" items="${mbti_list}"> <!-- mbti 유형 이름 -->
                	<div id="mbti_recommend_section" class="m_p_zero">
                    <c:forEach var="list" items="${mbtiRecommendList[mbtiname]}"> <!-- map 형식 -->
                    	<c:set var="full_isbn" value="${list.isbn}" />
                    	<c:set var="length" value="${fn:length(full_isbn)}"/>
                    	<c:set var="isbn_original" value="${fn:substring(full_isbn, length -13, length)}" />
                    	<c:set var="isbn_short" value="${fn:substring(full_isbn, length -3, length)}" />
                   		<article class="mbti_recommend_book">
                   			<a href="reviewpost.minji?isbn=${full_isbn}">
                   			<img class="recom_img_src" src="http://image.kyobobook.co.kr/images/book/xlarge/${isbn_short}/x${isbn_original}.jpg" alt="${list.b_title}">
							<input type="hidden" value="http://image.kyobobook.co.kr/images/book/large/${isbn_short}/l${isbn_original}.jpg">
							<div class="mbti_recommend_book_description">
								<dl>
									<dt>${mbtiname}</dt>
	                         		<dd>${list.b_title }</dd>
	                          		<dd>${list.b_authors } 저</dd>
	                          		<c:if test="${!empty list.b_translator }">
	                          			<dd>${list.b_translator } 역</dd>
	                          		</c:if>
	                   			</dl>
             				</div>
             				</a>
                   		</article>
                   	</c:forEach>
                   	</div>
                </c:forEach>
                </div>
            </div>
            <span class="mbti_recommend_arrow m_p_zero" id="mbti_right"><i class="fa fa-angle-double-right" aria-hidden="true"></i></span> 
        </section>
        <section id="main_best_review_part" class="m_p_zero">
            <div id="title_box">
                <div class="line"></div>    
                <p style="background-color:#f8b24f">Best Review</p>
            </div>
            <div id="best_review_wrap">
            	<c:forEach var="list" items="${bestReviewList}">
            		<c:set var="full_isbn" value="${list.isbn}" />
                    <c:set var="length" value="${fn:length(full_isbn)}"/>
                    <c:set var="isbn_original" value="${fn:substring(full_isbn, length -13, length)}" />
                    <c:set var="isbn_short" value="${fn:substring(full_isbn, length -3, length)}" />
	            	<div class="best_review_card">
	            	<a href="reviewpost.minji?isbn=${full_isbn}">
	                <article class="best_review_book">
	                    <div class="best_review_book_box"><%-- card front/thecard --%>
	                        <img class="recom_img_src" src="http://image.kyobobook.co.kr/images/book/xlarge/${isbn_short}/x${isbn_original}.jpg" alt="cmt_no:${list.cmt_no}">
	                    	<input type="hidden" value="http://image.kyobobook.co.kr/images/book/large/${isbn_short}/l${isbn_original}.jpg">
	                    </div>
	                    <%-- <div class="best_review_book_box_back"><img src="resources/image/quote.png"><img src="resources/image/quote1.png">${list.cmt_content }<div id="cmt_nickname">${list.cmt_nickname}<span id="cmt_mbti">${fn:toUpperCase(list.cmt_mbti)}</span></div></div> --%>
	                	<div class="best_review_book_box_back"><img src="resources/image/quote.png"><img src="resources/image/quote1.png">${list.cmt_content }<div id="cmt_nickname">${fn:toUpperCase(list.cmt_mbti)}, <span id="cmt_mbti">${list.cmt_nickname}</span></div></div>
	                </article>
	                </a>
	               </div>
               </c:forEach>
            </div>
        </section>
        <section id="main_best_recommend_part" class="m_p_zero">
            <div id="title_box">
                <div class="line"></div>
                <p style="background-color:#ea9a96">Best Recommend</p>
             </div>
            <div id="best_recommend_wrap">
            <c:forEach var="list" items="${bestRecommendList}" varStatus="status">
                <article class="best_recommend_book">
                	<c:set var="full_isbn" value="${list.isbn}" />
                    <c:set var="length" value="${fn:length(full_isbn)}"/>
                    <c:set var="isbn_original" value="${fn:substring(full_isbn, length -13, length)}" />
                    <c:set var="isbn_short" value="${fn:substring(full_isbn, length -3, length)}" />
                    <a href="reviewpost.minji?isbn=${full_isbn}">
	                    <img class="recom_img_src hvr-grow" src="http://image.kyobobook.co.kr/images/book/xlarge/${isbn_short}/x${isbn_original}.jpg" alt="${list.b_title}">
						<input type="hidden" value="http://image.kyobobook.co.kr/images/book/large/${isbn_short}/l${isbn_original}.jpg">
	                    <div class="best_recommend_book_description">
	                        <dl>
	                            <dt>best${status.count}</dt>
	                            <dd>${list.b_title}</dd>
	                            <dd>${list.b_authors } 저</dd>
	                       		<c:if test="${!empty list.b_translator }">
	                       			<dd>${list.b_translator } 역</dd>
	                       		</c:if>
	                        </dl>
	                    </div>
                    </a> 
                </article>
            </c:forEach>    
            </div>
        </section>  
    </div>
	<jsp:include page="footer.jsp" />
    <script>
		$(window).on("load",function(){
			$(".loader-wrapper").fadeOut(1000);
			$('#mypage').on('click', function(){
				$('#mypageMenu').toggle();
			})
			$('#subscribe').on('click', function(){
				$('#subMenu').toggle();
			})
			$('.best_review_wrap').find('article').hover();
		})
			$('.recom_img_src').on('error', function(){
				$(this).prop('src', $(this).next().val());
				$(this).on('error', function(){
               		$(this).prop('src', 'resources/image/bookerror.PNG');
                })
			})
	</script>
</body>
</html>