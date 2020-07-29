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
<title>16 Identity</title>
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
<script>
	$(function() {
		$("#DataTables_Table_0_filter > label > input").val("2020Y").trigger(
				'keyup');
	})
</script>
</head>

<body class="theme-brown">
	<jsp:include page="top.jsp"></jsp:include>
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>
					JQUERY DATATABLES <small>Taken from <a
						href="https://datatables.net/" target="_blank">datatables.net</a></small>
				</h2>
			</div>
			<!-- Exportable Table -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>정기 구독 목록</h2>
						</div>
						<div class="body">
							<div class="table-responsive">
								<table
									class="table table-bordered table-striped table-hover dataTable js-exportable">
									<thead>
										<tr>
											<th>회원ID</th>
											<th>1월</th>
											<th>2월</th>
											<th>3월</th>
											<th>4월</th>
											<th>5월</th>
											<th>6월</th>
											<th>7월</th>
											<th>8월</th>
											<th>9월</th>
											<th>10월</th>
											<th>11월</th>
											<th>12월</th>
											<th>년도</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="m" items="${list }">
											<tr>
												<td>${m.m_id }</td>
												<c:forEach var="a" items="${m.month}">
													<td>${a}</td>
												</c:forEach>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #END# Exportable Table -->
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
