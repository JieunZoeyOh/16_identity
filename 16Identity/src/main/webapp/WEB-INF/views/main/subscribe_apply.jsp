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
	.tooltip {
		position: relative;
		display: inline-block;
		margin: auto;
	}
	.tooltip .tooltip-content {
		visibility: hidden;
		width: 220px;
		background-color: #ffdeaf;
		padding: 0;
		color: black;
		text-align: center;
		position: absolute;
		z-index: 1;
		bottom: 180%;
		left: 50%;
		margin-left: -110px;
		border-radius: 15px;
	}
	.tooltip .tooltip-content::after {
		content: " ";
		position: absolute;
		top: 100%;
		left: 50%;
		margin-left: -10px;
		border-width: 10px;
		border-style: solid;
		border-color: #ffdeaf transparent transparent transparent;
	}
	.tooltip:hover .tooltip-content { visibility: visible; }
	.tooltip-content > p{padding: 0 20px;}
	button{background-color: #f8b24f; width: 60%; height: 50px; border: none;
			border-radius: 30px; color:white;margin: 20px 0; cursor: pointer;}
	input[type='radio']:after {
        width: 15px;
        height: 15px;
        border-radius: 15px;
        top: -2px;
        left: -1px;
        position: relative;
        background-color: #d1d3d1;
        content: '';
        display: inline-block;
        visibility: visible;
        border: 2px solid white;
    }

    input[type='radio']:checked:after {
        width: 15px;
        height: 15px;
        border-radius: 15px;
        top: -2px;
        left: -1px;
        position: relative;
        background-color: #ffa500;
        content: '';
        display: inline-block;
        visibility: visible;
        border: 2px solid white;
    }
</style>
</head>
<body>
<div class="body">
	<img src="resources/image/logo.png" style="width: 258px">
	<form method="post" action="kakaoPay.com">
		<fieldset>
			<legend>정기구독 신청</legend>
			<p>정기구독은 매월 1일에 출고합니다.</p>
			<p style="color:lightpink">※ 본 정기권은 해지가 불가하니 신중하게 선택하시길 바랍니다. ※</p>
			<input name="m_id" type="hidden" value="${m_id }">
			<input name="mbti" type="hidden" value="${mbti }">
			<label for="price"><input type="radio" name="price" value="9900" id="mbti"> 1개월 </label>
			<label for="price"><input type="radio" name="price" value="29000" id="mbti"> 3개월</label>
			<label for="price"><input type="radio" name="price" value="55000" id="mbti"> 6개월</label>
			<label for="price"><input type="radio" name="price" value="100000" id="mbti"> 1년</label>
			<div style="margin-top: 50px;">
			<div class="tooltip">
				<label for="mbti"><input type="radio" name="substate" value="MBTI 구독중" id="mbti"> MBTI 구독 </label>&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="tooltip-content">
					<p>회원님의 MBTI에 맞는 책 중에서 랜덤으로 배송해드립니다.</p>
				</div>
			</div>
			<div class="tooltip">
				<label for="random"><input type="radio" name="substate" value="RANDOM 구독중" id="random"> RANDOM 구독</label>
				<div class="tooltip-content">
					<p>모든 MBTI의 책 중에서 랜덤으로 배송해드립니다.</p>
				</div>
			</div>
			</div>
			<br>
			<button class="btn_pay btn_pay_hover" type="submit" style="color:#1f0d0d">
			<i class="fa fa-comment"></i>&nbsp;Pay</button>
		</fieldset>
	</form>
</div>
</body>
</html>