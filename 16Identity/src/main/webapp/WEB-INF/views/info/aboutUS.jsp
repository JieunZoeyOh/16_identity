<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header.jsp" />
<link href="resources/css/info.css" type="text/css" rel="stylesheet">
<script src="resources/js/jquery-3.5.0.js"></script>
<script src ="resources/js/info.js"></script>
<style>
#AboutUS_1{
	float:left;
	width: 35%;
	padding-right:10px;
	height: 350px;
	
}
#AboutUS_2{
	width:25px;
	height:25px;
}
</style>
</head>
<body>
	<div id="container">
		<div id="content_box">
			<div class="title">ABOUT US</div><hr><br><br>
			<div class="content">
			<img id = 'AboutUS_1' src="resources/image/AboutUS_1.png"/>
			<span style="display:inline-block; font-size:40px;">16 Identity</span>
			<p style="line-height: 32px;">사람들은 MBTI를 통해 공감대를 형성하며 ‘관계’를 맺습니다. 같은 유형의 사람과는 동질감을 형성하기도 하고, 자신과 잘 맞는 유형의 사람이 누구인지 찾아내기도 합니다.<br>
			도서를 읽고 난 후에 느끼는 바를 MBTI와 함께 공유하게 된다면 자신과 비슷한 성향과 다른 성향의 리뷰를 통해 보다 넓은 시각을 얻을 수 있을 것이라고 생각하였습니다.<br><br>
			기존의 도서 리뷰 사이트와는 달리 MBTI별 다양화된 리뷰를 제공하며 데이터를 기반으로 한 정기구독 서비스를 제공하는 16 Identity를 이용해보세요.</p><br>
			<div style="float:right;"><a href="main.com"><p style="display:inline-block; font-size:20px">16 Identity 이용하러가기&nbsp&nbsp </p><img id = 'AboutUS_2' src="resources/image/AboutUS_2.png"/></a></div>
			<br><br><br><br><br><br>
			<img id = 'AboutUS_3' src="resources/image/team.svg"/>
			</div>
		</div>
	</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>