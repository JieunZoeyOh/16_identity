<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="resources/css/updateform.css" type="text/css"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script>

$(function(){
	    $('input[type=file]').on('change', preview);
		
		function preview(e) {
			//선택한 그림의 File 객체를 취득
			//File객체 리스트에서 첫번째 File객체를 가져옵니다.
			var file = e.target.files[0];
			
			//file.type : 파일의 형식(MIME타입 - 예) text/html
			if(!file.type.match("image.*")){ //파일 타입이 image인지 확인합니다.
				alert('확장자는 이미지만 가능합니다.');
				return;
			}
			
			//파일을 읽기 위한 객체 생성
			var reader = new FileReader();
			
			//DataURL 형식으로 파일을 읽어옵니다.
			//읽어온 결과는 reader객체의 result 속성에 저장됩니다.
			reader.readAsDataURL(file);
			
			//읽기에 성공했을 때 실행되는 이벤트 핸들러
			reader.onload = function(e){
				//result:읽기 결과가 저장됩니다.
				//reader.result 또는 e.target.result
				$('.uploadimg').attr("src", e.target.result);
			}
				
		}
});
</script>


</head>
<body>
	<c:set var="m" value ="${memberinfo}"/>

	<div class="hero">
		<div class="diagonal-hero-bg">
		<img src = "resources/image/logo.png" class = "logoimg" >
			<div class="stars">
			</div>
		</div>
	</div>
	<div class='loader'>
		<div class='article'>
			<div class='page'></div>
		</div>
	</div>

	<div class="imgcontainer">
		<label> 
			<input type="file" name="m_original" accept="image/gif, img/jpeg, image/png" style="display: none">
			<img src = 'resources/upload/${m.m_file}' class = "uploadimg">
		</label>
	</div>

	<div class="menu">
		<select class="menu-control" onchange="location = this.value;">
			<option value="updateForm.net">My Info</option>
			<option value="myReivew.net">My Review</option>
			<option value="myBooks.net">My Books</option>
			<option value="notice.net">Notice</option>
		</select>
	</div>

	<form name="updateform" action="updateProcess.net" method="post">
		<b>ID</b> 
		<input type="text" id="m_id" name="m_id" value="${m.m_id}" required readonly>
		<b>PASSWORD</b> 
		<input type="password" placeholder="change your password" name="m_password" id="m_password"  maxLength="13" required> 
		
		<b>CHECK</b> 
		<input type="password" placeholder="check your password" name="m_passwordcheck" value="${m_password}" maxLength="13" required>
		
		<b>NICK NAME</b> 
		<input type="text" placeholder="change your nick name" name="m_nickname" id="m_nickname" value="${m.m_nickname}" required> 
		<b style="display: inline-block; width: auto">MBTI</b>
		<button type="button" class="changembti" onclick="location.href='https://www.16personalities.com/ko'">변경</button>
		<input type="text" placeholder="change your MBTI" name="m_mbti" id="m_mbti" value="${m.m_mbti}" required>

		<hr>
		<div class="clearfix">
			<button type="button" class="dropbtn" onclick="location.href='delete.net?id=${m.m_id}'">탈퇴하기</button>
			<button type="submit" class="submitbtn">수정하기</button>
		</div>
		
	</form>
	
 <footer><h3>footer</h3></footer>
</body>
</html>