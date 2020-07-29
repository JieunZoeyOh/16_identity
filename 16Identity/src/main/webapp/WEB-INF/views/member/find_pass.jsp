<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>16Identity</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="resources/css/animate.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/select2.min.css">
<link rel="stylesheet" href="resources/css/login2.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/login3.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'}
.p-b-55{
	padding-bottom:0px;
	text-align:left;
}
#tip{margin-bottom: 15px; font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important; font-size:12px;}
</style>
</head>
<body>
<div id="opacityBox">
</div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form action="newPass.net" class="login100-form validate-form" method="post">
				<img alt="16 Identity" src="resources/image/smallLogo1.PNG" id="smallLogo">
					<span class="login100-form-title p-b-55" id="logo"> 비밀번호 찾기 </span>
					<a id="tip" class="p-l-15">입력하신 아이디의 비밀번호를 이메일로 전송 해드립니다.</a>
					<br>
					<div class="wrap-input100 validate-input m-b-16" data-validate="이메일을 적어주세요: ex@abc.xyz">
						<input class="input100" type="text" name="m_id" id="m_id" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100"> 
							<span class="lnr lnr-envelope"></span>
						</span>
						</div>
					<div class="container-login100-form-btn p-t-4">
						<button type="submit" class="login100-form-btn email">이메일 전송</button>
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
	})
</script>
</body>
</html>