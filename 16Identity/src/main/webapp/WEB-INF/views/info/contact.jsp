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
			<div class="title">CONTACT</div>
			<div class="content">
				<div id="detailSection">
				
				</div>
				<div id="mapSection">
					<div id="map" style="width:100%;height:330px;"></div>

				</div>
			</div>
		</div>
	</div>
<jsp:include page="../main/footer.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84875ca5a15a6a4aa7220de12f18240f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.567919, 126.983034), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.567919, 126.983034); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">16 Identity<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="font-size: 14px;color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="font-size: 14px;color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>
</html>