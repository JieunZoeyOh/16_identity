<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
	body{background-color:#1f0d0d; color:white;}
	form{margin: 50px;}
	fieldset{border-radius: 15px; border:1px solid white;}
	.body{margin: 0 auto; text-align: center;}
	button{background-color: #f8b24f; width: 60%; height: 50px; border: none;
			border-radius: 30px; color:white;margin: 20px 0; cursor: pointer;}
	input{width: 80%; height: 40px; border-radius: 15px; border: none; text-align: center;}
</style>
</head>
<body>
<div class="body">
	<img src="resources/image/logo.png" style="width: 258px">
	<form method="post" action="drop.com">
		<fieldset>
			<legend>정기구독 해지</legend>
			<input name="m_id" type="hidden" value="${m_id }">
			
			<div style="margin-top: 50px;">
			<input type="password" name="m_password" placeholder="비밀번호를 입력하세요...">
			</div>
			<br>
			<button class="btn_pay btn_pay_hover" type="submit" style="color:#1f0d0d">
			<i class="fa fa-comment"></i>&nbsp;구독해지</button>
		</fieldset>
	</form>
</div>
</body>
</html>