<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>16Identity</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/animate.css">
<link rel="stylesheet" type="text/css" href="resources/css/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/select2.min.css">
<link rel="stylesheet" href="resources/css/login2.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/login3.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;}
.p-b-55 {
	padding-bottom: 0px;
	text-align: left;
}
#tip {
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;
	margin-bottom: 15px;
	font-size: 14px;
}
.login {background: #303960;}
#m_name, #m_phone {padding: 0 30px 0 20px;}
</style>
</head>
<body>
<div id="opacityBox">
</div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-50 p-b-65">
				<form action="find_id2.net" class="login100-form validate-form" method="get">
					<span class="login100-form-title p-b-55" id="logo"> 아이디 찾기 </span> 
					<br>
					<div class="wrap-input100 validate-input m-b-16" data-validate="이름을 입력해주세요">
						<input class="input100" type="text" name="m_name" id="m_name" placeholder="이름을 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16" data-validate="휴대폰번호를 입력해주세요">
						<input class="input100" type="text" name="m_phone" id="m_phone" placeholder="휴대폰 번호를 입력해주세요">
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn p-t-25">
						<button type="submit" class="login100-form-btn email">검색 결과</button>
						<br>
						<button class="login100-form-btn login">로그인 이동</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="resources/js/jquery-3.5.0.js"></script>
	<script src="resources/js/popper.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/select2.min.js"></script>
	<script src="resources/js/login.js"></script>
	<script>
		$(function() {
			$("#logo2").click(function() {
				location.href = "main.net";
			});

			$(".login").click(function() {
				location.href = "login.net";
			});
		})
	</script>
</body>
</html>