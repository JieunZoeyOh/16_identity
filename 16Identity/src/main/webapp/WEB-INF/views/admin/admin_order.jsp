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
<title>Normal Tables | Bootstrap Based Admin Template - Material
	Design</title>
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
					재고관리 - 발주 <small>관리자 <b>발주</b> 페이지 입니다.
					</small>
				</h2>
			</div>
			<!-- Exportable Table -->
			<div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                발주 목록
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <button type="button" class="btn bg-brown waves-effect">발주 완료</button>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
								<thead>
									<tr>
										<th>ISBN</th>
										<th>책 제목</th>
										<th>출판사</th>
										<th>저자</th>
										<th>정가</th>
										<th>총 권수</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="total" value="${total }" />
									<c:set var="price" value="${price }" />
									<c:forEach var="m" items="${ list}">
                                        <tr>
                                            <td>${ m.book.isbn}</td>
                                            <td>${ m.book.b_title}</td>
                                            <td>${ m.book.b_publisher}</td>
                                            <td>${ m.book.b_authors}</td>
                                            <td>${ m.book.b_saleprice}</td>
                                            <td>${ m.total}</td>
                                            <td>${ m.state}</td>
                                        </tr>
                                    </c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"></td>
										<th>총 권수</th>
										<td>${total }</td>
										<th>총 가격</th>
										<td>${price }</td>
										<td></td>
									</tr>
								</tfoot>
								</tbody>
							</table>
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
