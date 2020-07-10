<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{background-color: #1f0d0d}
	form{margin: 50px;}
	fieldset{border-radius: 5px;}
	.body{margin: 0 auto; text-align: center; color:white;}
	.tooltip {
		position: relative;
		display: inline-block;
		margin: auto;
	}
	.tooltip .tooltip-content {
		visibility: hidden;
		width: 220px;
		background-color: white;
		padding: 0;
		color: white;
		text-align: center;
		position: absolute;
		z-index: 1;
		bottom: 180%;
		left: 50%;
		margin-left: -110px;
		border-radius: 5px;
	}
	.tooltip .tooltip-content::after {
		content: " ";
		position: absolute;
		top: 100%;
		left: 50%;
		margin-left: -10px;
		border-width: 10px;
		border-style: solid;
		border-color: white transparent transparent transparent;
	}
	.tooltip:hover .tooltip-content { visibility: visible; }
	.tooltip-content > p{padding: 0 20px;}
</style>

</head>
<body>
<div class="body">
	<img src="resources/image/logo.png" style="width: 258px">
	<form action="">
		<fieldset>
			<legend>정기구독 신청</legend>
			<p>정기구독은 매월 10일에 출고합니다.</p>
			<input type="hidden" value="${m_id }">
			<input type="hidden" value="${mbti }">
			
			<div style="margin-top: 50px;">
			<div class="tooltip">
				<label for="mbti"><input type="radio" name="substate" value="MBTI 구독중" id="mbti"> MBTI 구독 </label>&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="tooltip-content">
					<p style="color:black">회원님의 MBTI에 맞는 책 중에서 랜덤으로 배송해드립니다.</p>
				</div>
			</div>
			<div class="tooltip">
				<label for="random"><input type="radio" name="substate" value="RANDOM 구독중" id="random"> RANDOM 구독</label>
				<div class="tooltip-content">
					<p style="color:black">모든 MBTI의 책 중에서 랜덤으로 배송해드립니다.</p>
				</div>
			</div>
			</div>
			<br>
			<a href=""><img src="resources/image/payment_icon_yellow_small.png" style="margin: 30px 0px;"></a>
		</fieldset>
	</form>
</div>
</body>
</html>