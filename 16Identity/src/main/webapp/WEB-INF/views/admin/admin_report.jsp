<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>Jquery DataTable | Bootstrap Based Admin Template -
	Material Design</title>
<!-- Favicon-->
<link rel="icon" href="resources/favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link href="resources/plugins/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- Waves Effect Css -->
<link href="resources/plugins/node-waves/waves.css" rel="stylesheet" />

<!-- Animation Css -->
<link href="resources/plugins/animate-css/animate.css" rel="stylesheet" />

<!-- JQuery DataTable Css -->
<link
	href="resources/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- Custom Css -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="resources/css/themes/all-themes.css" rel="stylesheet" />
<script src="resources/js/jquery-3.5.0.js"></script>
<style>
	td{text-align: center;}
	td>ul{list-style-type: none; width: 100%; height: 43px;}
	td>ul>li{float:left;}
	li>span{float: left;}
</style>
</head>

<body class="theme-brown">
	<jsp:include page="top.jsp"></jsp:include>

	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>
					신고 댓글 관리 <small>관리자 <b>신고</b>페이지 입니다.
					</small>
				</h2>
			</div>
			<!-- Basic Examples -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>신고 댓글 목록</h2>
						</div>
						<div class="body">
							<div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
									<thead>
										<tr>
											<th>신고글</th>
											<th>작성자</th>
											<th>총 신고수</th>
											<th style="text-align: center;"><span>신고일시</span>
												<span>신고자</span>
												<span>신고사유</span>
												<span>처리상태</span></th>
											<th>처리상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="warn" items="${data}">
										<tr>
											<td><a href="reviewpost.minji?isbn=${warn.comments.isbn }">${warn.comments.cmt_content }</a></td>
											<td>${warn.m_id }</td>
											<td>${warn.w_count }</td>
											<td>
												<c:forEach var="wc" items="${warn.warn_check}">
												<ul>
												<li style="width: 30%"><p>${wc.wc_date }</p></li>
												<li style="width: 30%"><p>${wc.m_id }</p></li>
												<li style="width: 40%"><p>${wc.wc_reason }</p></li>
												</ul>
												</c:forEach>
											</td>
											<td>
												<button class="btn bg-brown waves-effect" onClick="javascript:location.href='reportDelete.net?cmt_no=${warn.cmt_no}';">반려</button>
												<button class="btn bg-red waves-effect" onClick="javascript:location.href='reportAccept.net?cmt_no=${warn.cmt_no}&m_id=${warn.m_id }';">접수</button>
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
	<script
		src="resources/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
	<script
		src="resources/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>

	<!-- Custom Js -->
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/pages/tables/jquery-datatable.js"></script>

	<!-- Demo Js -->
	<script src="resources/js/demo.js"></script>
</body>

</html>
