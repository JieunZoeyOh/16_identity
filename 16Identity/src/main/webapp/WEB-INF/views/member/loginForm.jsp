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
* {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';}
#logo {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;}
a {text-decoration: none; font-size: 20px;}
a:link {text-decoration: none;}
a:visited {text-decoration: none;}
a:hover {color: #f8b24f;}
</style>
</head>
<body>
<div id="opacityBox">
</div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-45 p-b-30">
				<form class="login100-form validate-form" action="loginProcess.net" method="post">
					
					<img alt="16 Identity" src="resources/image/smallLogo1.PNG" id="smallLogo">
					<div class="wrap-input100 validate-input m-b-16" data-validate="이메일을 적어주세요: ex@abc.xyz">
						<input class="input100" type="text" name="m_id" id="id" placeholder="Email"> <span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
						<c:if test="${!empty saveid}">
							value="${saveid}"
						</c:if>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate="패스워드를 입력해주세요">
						<input class="input100" type="password" name="m_password" placeholder="Password"> 
							<span class="focus-input100"></span>
							<span class="symbol-input100"> 
								<span class="lnr lnr-lock">
							</span>
						</span>
					</div>

					<div class="contact100-form-checkbox m-l-4">
						<input id="ckb1" type="checkbox" name="remember-me"> 
						<label for="ckb1"> 로그인 상태 유지</label>
						<c:if test="${!empty saveid}">
							checked
						</c:if>
					</div>

					<div class="container-login100-form-btn p-t-25">
						<button type="Submit" class="login100-form-btn">로그인</button>
						<button class="join100-form-btn join">회원가입</button>
					</div>
					<div class="text-center w-full p-t-44">
						<a class="txt1 bo1 hov1" style="font-size: 13px" href="find_id.net"> 아이디를 잊어버리셨나요 ? </a> <br> <br> 
						<a class="txt1 bo1 hov1" style="font-size: 13px" href="find_pass.net"> 비밀번호를 잊어버리셨나요 ? </a>
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

			$(".join").click(function() {
				location.href = "join.net";
			});

		})
	</script>
</body>
</html>