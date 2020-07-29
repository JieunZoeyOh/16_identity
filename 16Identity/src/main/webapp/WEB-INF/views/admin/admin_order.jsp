<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
				url : "orderSucess.net",
				success : function(result) {
					$(".state").text("발주 완료");
				}
			});
		})
		
		$("#DataTables_Table_0_filter > label > input").val("2020-07").trigger('keyup');
		
		var sum =0;
		for(var i=0; i<$(".total").size();i++){
			sum+=parseInt($("td").eq(5+8*i).text());
		}
		
		var price =0;
		for(var i=0; i<$(".total").size();i++){
			price+=parseInt($("td").eq(4+8*i).text()) * parseInt($("td").eq(5+8*i).text());
		}
		$("#total").text(sum);
		$("#price").text(price);
		
		$("input").keyup(function() { 
			var sum =0;
			for(var i=0; i<$(".total").size();i++){
				sum+=parseInt($("td").eq(5+8*i).text());
			}
			
			var price =0;
			for(var i=0; i<$(".total").size();i++){
				price+=parseInt($("td").eq(4+8*i).text()) * parseInt($("td").eq(5+8*i).text());
			}
			$("#total").text(sum);
			$("#price").text(price);
		});
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
					재고관리 - 발주<small>관리자 <b>발주</b> 페이지 입니다.
					</small>
				</h2>
			</div>
			<!-- Exportable Table -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header" style="height: 70px">
                            <ul id="order">
								<li><h2 style="line-height: 30px;">발주 목록</h2></li>
								<li style="text-align: right;"><button id="success" type="button"
								class="btn bg-brown waves-effect">발주 완료</button></li>
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
										<th>권 수</th>
										<th>상태</th>
										<th hidden=""></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${ list}">
										<tr>
											<td>${ m.book.isbn}</td>
											<td>${ m.book.b_title}</td>
											<td>${ m.book.b_publisher}</td>
											<td>${ m.book.b_authors}</td>
											<td class="price">${ m.book.b_saleprice}</td>
											<td class="total">${ m.total}</td>
											<td class="state">${ m.state}</td>
											<td hidden="">${m.order_date }</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="3"></td>
										<th>총 권수</th>
										<th style="background-color: #795548; color:white" id="total"></th>
										<th>총 가격</th>
										<th style="background-color: #795548; color:white" id="price"></th>
									</tr>
								</tfoot>
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
