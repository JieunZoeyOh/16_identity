<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="active">INFP</li><li>INFJ</li>
                    <li>INTP</li><li>INTJ</li>
                    <li>ISFP</li><li>ISFJ</li>
                    <li>ISTP</li><li>ISTJ</li>
                    <li>ENFP</li><li>ENFJ</li>
                    <li>ENTP</li><li>ENTJ</li>
                    <li>ESFP</li><li>ESFJ</li>
                    <li>ESTP</li><li>ESTJ</li>
                </ul>
            </div>
            <span id="nav_right_arrow"><i class="fa fa-chevron-right" aria-hidden="true"></i></span> 
        </nav>
        <section id="main_mbti_recommend_part" class="m_p_zero">
            <span class="mbti_recommend_arrow m_p_zero" id="mbti_left"><i class="fa fa-angle-double-left" aria-hidden="true"></i></span> 
            <div id="mbti_recommend_box" class="m_p_zero">
                <div id="mbti_recommend_list" class="m_p_zero">
                    <!-- INFP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFP1</dt>
                                    <dd>오래 준비해온 대답</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFP2</dt>
                                    <dd>나이듦에 관하여</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFP3</dt>
                                    <dd>기억 1</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFP4</dt>
                                    <dd>내가 원하는 것을 나도 모를 때</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- INFJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFJ1</dt>
                                    <dd>infj</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFJ2</dt>
                                    <dd>infj</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFJ3</dt>
                                    <dd>infj</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INFJ4</dt>
                                    <dd>infj</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- INTP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTP1</dt>
                                    <dd>INTP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTP2</dt>
                                    <dd>INTP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTP3</dt>
                                    <dd>INTP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTP4</dt>
                                    <dd>INTP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- INTJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTJ1</dt>
                                    <dd>INTJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTJ2</dt>
                                    <dd>INTJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTJ3</dt>
                                    <dd>INTJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>INTJ4</dt>
                                    <dd>INTJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ISFP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFP1</dt>
                                    <dd>ISFP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFP2</dt>
                                    <dd>ISFP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFP3</dt>
                                    <dd>ISFP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFP4</dt>
                                    <dd>ISFP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ISFJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFJ1</dt>
                                    <dd>ISFJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFJ2</dt>
                                    <dd>ISFJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFJ3</dt>
                                    <dd>ISFJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISFJ4</dt>
                                    <dd>ISFJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ISTP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTP1</dt>
                                    <dd>ISTP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTP2</dt>
                                    <dd>ISTP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTP3</dt>
                                    <dd>ISTP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTP4</dt>
                                    <dd>ISTP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ISTJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTJ1</dt>
                                    <dd>ISTJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTJ2</dt>
                                    <dd>ISTJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTJ3</dt>
                                    <dd>ISTJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ISTJ4</dt>
                                    <dd>ISTJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ENFP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFP1</dt>
                                    <dd>ENFP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFP2</dt>
                                    <dd>ENFP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFP3</dt>
                                    <dd>ENFP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFP4</dt>
                                    <dd>ENFP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ENFJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFJ1</dt>
                                    <dd>ENFJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFJ2</dt>
                                    <dd>ENFJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFJ3</dt>
                                    <dd>ENFJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENFJ4</dt>
                                    <dd>ENFJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ENTP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTP1</dt>
                                    <dd>ENTP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTP2</dt>
                                    <dd>ENTP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTP3</dt>
                                    <dd>ENTP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTP4</dt>
                                    <dd>ENTP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ENTJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTJ1</dt>
                                    <dd>ENTJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTJ2</dt>
                                    <dd>ENTJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTJ3</dt>
                                    <dd>ENTJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ENTJ4</dt>
                                    <dd>ENTJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ESFP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFP1</dt>
                                    <dd>ESFP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFP2</dt>
                                    <dd>ESFP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFP3</dt>
                                    <dd>ESFP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFP4</dt>
                                    <dd>ESFP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ESFJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFJ1</dt>
                                    <dd>ESFJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFJ2</dt>
                                    <dd>ESFJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFJ3</dt>
                                    <dd>ESFJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESFJ4</dt>
                                    <dd>ESFJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ESTP -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTP1</dt>
                                    <dd>ESTP</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTP2</dt>
                                    <dd>ESTP</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTP3</dt>
                                    <dd>ESTP</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTP4</dt>
                                    <dd>ESTP</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
                    <!-- ESTJ -->
                    <div id="mbti_recommend_section" class="m_p_zero">
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book1.jpg" alt="오래 준비해온 대답">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTJ1</dt>
                                    <dd>ESTJ</dd>
                                    <dd>김영하</dd>
                                </dl>
                            </div>
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book2.jpg" alt="나이듦에 관하여">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTJ2</dt>
                                    <dd>ESTJ</dd>
                                    <dd>루이즈 애런슨 저</dd>
                                    <dd>최가영 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book3.jpg" alt="기억 1">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTJ3</dt>
                                    <dd>ESTJ</dd>
                                    <dd>베르나르 베르베르 저</dd>
                                    <dd>전미연 역</dd>
                                </dl>
                            </div>    
                        </article>
                        <article class="mbti_recommend_book">
                            <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때">
                            <div class="mbti_recommend_book_description">
                                <dl>
                                    <dt>ESTJ4</dt>
                                    <dd>ESTJ</dd>
                                    <dd>전승환</dd>
                                </dl>
                            </div>    
                        </article>
                    </div>
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
                <article class="best_review_book" style="background-color:#303960; border-radius: 50px 0 0 0;">
                    <div class="best_review_book_box">
                        <img src="resources/image/book/book5.jpg" alt="직장 갑질에서 살아남기">
                    </div>
                </article>
                <article class="best_review_book" style="background-color: rgba(192, 121, 22, 0.31); border-radius: 0 50px 0 0;">
                    <div class="best_review_book_box">
                        <img src="resources/image/book/book11.jpg" alt="시선으로 부터">
                    </div>
                </article>
                <article class="best_review_book" style="background-color: rgba(192, 121, 22, 0.31); border-radius: 0 0 0 50px;">
                    <div class="best_review_book_box">
                        <img src="resources/image/book/book9.jpg" alt="귤의 맛">
                    </div>
                </article>
                <article class="best_review_book" style="background-color:#303960; border-radius: 0 0 50px 0;">
                    <div class="best_review_book_box">
                        <img src="resources/image/book/book10.jpg" alt="그릿">
                    </div>
                </article>
            </div>
        </section>
        <section id="main_best_recommend_part" class="m_p_zero">
            <div id="title_box">
                <div class="line"></div>
                <p style="background-color:#ea9a96">Best Recommend</p>
             </div>
            <div id="best_recommend_wrap">
                <article class="best_recommend_book">
                    <img src="resources/image/book/book8.jpg" alt="통찰과 역설" class="hvr-grow">
                    <div class="best_recommend_book_description">
                        <dl>
                            <dt>best1</dt>
                            <dd>통찰과 역설</dd>
                            <dd>천공</dd>
                        </dl>
                    </div> 
                </article>
                <article class="best_recommend_book">
                    <img src="resources/image/book/book12.jpg" alt="사랑의 역사" class="hvr-grow">
                    <div class="best_recommend_book_description">
                        <dl>
                            <dt>best2</dt>
                            <dd>사랑의 역사</dd>
                            <dd>니콜 크라우스 저</dd>
                            <dd>민은영 역</dd>
                        </dl>
                    </div> 
                </article>
                <article class="best_recommend_book">
                    <img src="resources/image/book/book10.jpg" alt="귤의 맛" class="hvr-grow">
                    <div class="best_recommend_book_description">
                        <dl>
                            <dt>best3</dt>
                            <dd>귤의 맛</dd>
                            <dd>조남주</dd>
                        </dl>
                    </div> 
                </article>
                <article class="best_recommend_book">
                    <img src="resources/image/book/book4.jpg" alt="내가 원하는 것을 나도 모를 때" class="hvr-grow">
                    <div class="best_recommend_book_description">
                        <dl>
                            <dt>best4</dt>
                            <dd>내가 원하는 것을 나도 모를 때</dd>
                            <dd>전승환</dd>
                        </dl>
                    </div> 
                </article>
            </div>
        </section>  
    </div>
    <footer></footer>

</body>
</html>