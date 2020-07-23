<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="theme-brown">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Please wait...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Overlay For Sidebars -->
    <div class="overlay"></div>
    <!-- #END# Overlay For Sidebars -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="main.net">ADMINBSB - IDENTIFY16</a>
            </div>

        </div>
    </nav>
    <!-- #Top Bar -->
    <section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="resources/images/user.png" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${m_nickname }</div>
                    <div class="email">${m_id }</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="logout.net"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="active">
                        <a href="main.net">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="comment.net">
                            <i class="material-icons">comment</i>
                            <span class="icon-name">댓글 관리</span>
                        </a>
                    </li>
                    <li>
                        <a href="report.net">
                            <i class="material-icons">gavel</i>
                            <span class="icon-name">신고 댓글 관리 &nbsp;
                            <c:if test="${warnCount != 0}">
                            <button type="button" class="btn btn-danger waves-effect" style="padding:3px 5px;">${warnCount }</button> </span>
                            </c:if>
                        </a>
                    </li>
                    <li>
                        <a href="member.net">
                            <i class="material-icons">people</i>
                            <span class="icon-name">회원 관리</span>
                        </a>
                    </li>
                    <li>
                        <a href="subscribe.net">
                            <i class="material-icons">subscriptions</i> 
                            <span class="icon-name">정기구독 관리</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">settings</i> 
                            <span class="icon-name">재고관리</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="order.net">발주</a>
                            </li>
                            <li>
                                <a href="delivery.net">배송</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="main.com">
                            <i class="material-icons">lightbulb_outline</i> 
                            <span class="icon-name">16Identity</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2016 - 2017 <a href="javascript:void(0);">AdminBSB - Material Design</a>.
                </div>
                <div class="version">
                    <b>Version: </b> 1.0.5
                </div>
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
    </section>
</body>
</html>