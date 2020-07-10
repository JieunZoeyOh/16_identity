<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Basic Form Elements | Bootstrap Based Admin Template -
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
    <link href="resources/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Bootstrap Material Datetime Picker Css -->
<link
	href="resources/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet" />

<!-- Bootstrap DatePicker Css -->
<link
	href="resources/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css"
	rel="stylesheet" />

<!-- Wait Me Css -->
<link href="resources/plugins/waitme/waitMe.css" rel="stylesheet" />

<!-- Bootstrap Select Css -->
<link href="resources/plugins/bootstrap-select/css/bootstrap-select.css"
	rel="stylesheet" />

<!-- Custom Css -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
<link href="resources/css/themes/all-themes.css" rel="stylesheet" />

<script src="resources/js/jquery-3.5.0.js"></script>
<script>
	$(function() {
		$("#success").click(function() {
			$.ajax({
				type : "post",
				url : "deliverSucess.net",
				success : function(result) {
					$(".state").text("배송 완료");
				}
			});
		})
		
		$("#DataTables_Table_0_filter > label > input").val("2020-07").trigger('keyup');
	});
</script>
<style type="text/css">
	#order{list-style: none; margin: 0 auto; width: 100%}
	#order>li{float: left; height: 20px; width: 50%;}
	#date{font-size: 40px;width: 160px;}
</style>
</head>

<body class="theme-brown">
	<jsp:include page="top.jsp"></jsp:include>
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>
					재고관리 - 배송<small>관리자 <b>배송</b> 페이지 입니다.
					</small>
				</h2>
			</div>
			<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header" style="height: 70px">
                            <ul id="order">
								<li><h2 style="line-height: 30px;">배송 목록</h2></li>
								<li style="text-align: right;"><button id="success" type="button"
								class="btn bg-brown waves-effect">배송 완료</button></li>
							</ul>
							<input type="text" value="2020-07" hidden="" >
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
										<tr>
	                                        <th>회원ID</th>
	                                        <th>주소</th>
	                                        <th>핸드폰</th>
	                                        <th>ISBN</th>
	                                        <th>책제목</th>
	                                        <th>출판사</th>
	                                        <th>저자</th>
	                                        <th>정가</th>
	                                        <th>상태</th>
	                                        <th hidden="">배송일</th>
	                                    </tr>
									</thead>
									<tbody>
										<c:forEach var="d" items="${ list}">
											<tr>
												<td>${d.m_id }</td>
		                                        <td>${d.member.m_address }</td>
		                                        <td>${d.member.m_phone }</td>
		                                        <td>${d.isbn }</td>
		                                        <td>${d.book.b_title }</td>
		                                        <td>${d.book.b_publisher }</td>
		                                        <td>${d.book.b_authors }</td>
		                                        <td>${d.book.b_saleprice}</td>
		                                        <td class="state">${d.state }</td>
		                                        <td hidden="">${d.deliver_date }</td>
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
