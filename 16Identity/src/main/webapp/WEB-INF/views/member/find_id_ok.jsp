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
* {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;}

#tip{margin-bottom: 15px; font-size: 14px;}

#test{
	font-weight: bold;
    font-size: 19px;
}

a { text-decoration:none } 

a:hover{color:#fff}

.login{
  background: #303960;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  font-size:20px;
}
.login:hover{
  background:#fff;
  color:#f8b24f;
}
.login:before,.login:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f8b24f;
  transition:400ms ease all;
}
.login:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.login:hover:before,.login:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
<div id="opacityBox">
</div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form class="login100-form validate-form">
				<img alt="16 Identity" src="resources/image/smallLogo1.PNG" id="smallLogo">
					<span class="login100-form-title" id="logo"> 아이디 찾기 검색결과 </span>
					<div style="margin-left: 13px;">
					<input id="test" type="text" class="inputbox" size="20" />
					</div>
					<div class="container-login100-form-btn p-t-25">
						<a href="login.net" class="login100-form-btn login" style="text-decoration: none;">로그인 이동</a>
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
		/*var id = "${id}";
		var idFind [] = id.split('@');
		var star = '';
		for(int i=0; i<id.lentgh-3; i++){
		   star +="*"; 
		}
		var temp = id.subString(0,2);
		var find = temp + star + idFInd[1];
		*/
	
	$(function() {
		var id = "${id}";
		split = id.split("@");
		var star =""; 
		var idEmail = id.substring(0,3);
		for(var i=0; i<split[0].length-3; i++){
			   star +="*"; 
		}
		var find = idEmail+star+"@"+split[1];
		$(document).ready(function() {
	        $('#test').val(find);
	    });
		console.log(find);
		
		$("#logo2").click(function() {
			location.href = "main.net";
		});
		//$(".login").click(function() {
		//	location.href = "login.net";
		//});
	})
</script>
</body>
</html>