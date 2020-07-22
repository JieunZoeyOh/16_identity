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
</head>
<body>
	<div id="container">
		<div id="content_box">
			<div class="title">TERMS OF SERVICE</div>
			<div class="content">
				<button class="button button_active">계정 약관</button>
				<button class="button">서비스 약관</button>
				<button class="button">개인정보처리방침</button>
				<!-- https://www.kakao.com/policy/terms?type=a&lang=ko 참고-->
				<!-- https://www.kakaocorp.com/policy/privacyPolicy/corporateSitePrivacyPolicy -->
				<div id="content_detail">
				<!-- 여기에 내용 넣으세유 -->
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../main/footer.jsp" />
</body>
</html>