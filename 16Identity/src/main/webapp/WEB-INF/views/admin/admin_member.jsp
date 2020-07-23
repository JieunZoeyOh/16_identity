<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
thead > tr > th {text-align : center;}
tbody > tr > td {text-align : center;}
</style>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>관리자 회원관리</title>
<link rel="icon" href="resources/favicon.ico" type="image/x-icon">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
<link href="resources/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/plugins/node-waves/waves.css" rel="stylesheet" />
<link href="resources/plugins/animate-css/animate.css" rel="stylesheet" />
<link href="resources/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/themes/all-themes.css" rel="stylesheet" />
</head>

<body class="theme-brown">
	<jsp:include page="top.jsp"></jsp:include>

	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>회원 관리 <small>관리자 <b>회원</b>페이지 입니다.</small></h2>
			</div>
			
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>회원 목록</h2>
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
											<th>구독여부</th>
											<th>구독기간</th>
											<th>신고 횟수</th>
											<th>탈퇴</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="m" items="${list}">
											<tr>
												<td class = "memberinfo" style = "cursor:pointer;">${m.m_id }</td>
												<td>${m.m_name }</td>
												<td>${m.m_nickname }</td>
												<td>${fn:toUpperCase(m.m_mbti)}</td>
												<td>${m.m_phone }</td>
												<td>${m.m_address }</td>
												<td>${m.substate }</td>
												<td>${fn:substring(m.subsdate, 0 , 10)} - ${fn:substring(m.subend, 0 , 10)}</td>
												<td id="cnt">${m.warn_count}</td>
												<td style="text-align: center">
												
												<c:if test="${m.warn_count > 3 }">
													<button type="button" class="btn bg-red waves-effect" onclick="location.href='member_delete.net?id=${m.m_id}'">
														<i class="material-icons">content_cut</i><span>탈퇴</span>
													</button>
												</c:if>	
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
		</div>
	</section>


	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/bootstrap/js/bootstrap.js"></script>
	<script src="resources/plugins/bootstrap-select/js/bootstrap-select.js"></script>
	<script src="resources/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="resources/plugins/node-waves/waves.js"></script>
	<script src="resources/plugins/jquery-datatable/jquery.dataTables.js"></script>
	<script src="resources/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/jszip.min.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/pdfmake.min.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/vfs_fonts.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"></script>
	<script src="resources/plugins/jquery-datatable/extensions/export/buttons.print.min.js"></script>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/pages/tables/jquery-datatable.js"></script>
	<script src="resources/js/demo.js"></script>
</body>

</html>
