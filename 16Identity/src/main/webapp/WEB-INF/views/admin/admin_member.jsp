<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Jquery DataTable | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="resources/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

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
</head>

<body class="theme-brown">
    <jsp:include page="top.jsp"></jsp:include>

    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    회원 관리
                    <small>관리자 <b>회원</b>페이지 입니다.</small>
                </h2>
            </div>
            <!-- Basic Examples -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                	회원 목록
                            </h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>MBTI</th>
                                            <th>핸드폰번호</th>
                                            <th>주소</th>
                                            <th>신고 횟수</th>
                                            <th>탈퇴</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="m" items="${list}">
	                                        <tr>
	                                            <td>${m.m_id }</td>
	                                            <td>${m.m_name }</td>
	                                            <td>${m.m_nickname }</td>
	                                            <td>${m.m_mbti }</td>
	                                            <td>${m.m_phone }</td>
	                                            <td>${m.m_address }</td>
	                                            <td>${m.warn_count }</td>
	                                            <td style="text-align: center">
	                                            <button type="button" class="btn bg-red waves-effect" style='display:none;'>
	                                            <i class="material-icons">content_cut</i><span>탈퇴</span>
	                                            </button>
	                                            </td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Basic Examples -->
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="resources/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="resources/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="resources/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="resources/plugins/node-waves/waves.js"></script>

    <!-- Jquery DataTable Plugin Js -->
    <script src="resources/plugins/jquery-datatable/jquery.dataTables.js"></script>
    <script src="resources/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
    <script src="resources/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

    <!-- Custom Js -->
    <script src="resources/js/admin.js"></script>
    <script src="resources/js/pages/tables/jquery-datatable.js"></script>

    <!-- Demo Js -->
    <script src="resources/js/demo.js"></script>
</body>

</html>
