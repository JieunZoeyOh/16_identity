<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>16Identity 회원가입</title>
<!-- Main css -->
<link rel="stylesheet" href="resources/css/join2.css">
<link rel="stylesheet" href="resources/css/button.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
* {font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;}
#m_address_about{width:40%;}
</style>
</head>
<body>
<div id="opacityBox">
</div>
	<div class="main">
		<div class="container" style="border-radius: 5px;">
			<div class="signup-content">
				<div class="signup-form">
					<form method="post" action="joinProcess.net" class="register-form"
						id="register-form" enctype="multipart/form-data">
						<div class="imgcontainer">
							<label for="upfile"> 
								<img src="resources/images/profile2.png" alt="Avatar" class="avatar" id="img">
							</label> 
							<input type="file" id="upfile" name="uploadfile"> <span id="filevalue"></span> <span style="font-size:12px">프로필 사진을 저장해 보세요</span>
						</div>
						<br> <span>아이디</span> 
						<input type="text" name="m_id" placeholder="이메일형식으로 입력해주세요" required maxLength="50"> 
						<span id="email_message"></span> <br> 
						<span>비밀번호</span> 
						<input type="password" name="m_password" id="password" placeholder="숫자,특문,영문 각 1회 이상 사용하여 8자리 이상을 사용해서 입력해주세요" required>
						<span id="pass_message"></span> <br> 
						<span>비밀번호 확인</span> 
						<input type="password" name="passcheck" id="passcheck" placeholder="사용하실 비밀번호를 똑같이 입력해주세요" id="passcheck" required>
						<span id="passmessage"></span> <br> 
						<span>이름</span> 
						<input type="text" name="m_name" id="m_name" placeholder="이름을 입력해주세요" maxlength=15 required> <br> 
						<span>닉네임</span> <input type="button" value="중복검사" id="nickcheck"> 
						<input type="text" name="m_nickname" id="m_nickname" placeholder="닉네임을 입력해주세요" maxlength=15 required> <br>
						<span>휴대폰</span>  <input type="button" value="중복검사" id="phonecheck"> 
						<input type="text" name="m_phone" id="m_phone" placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요" required><br> 
						<span>우편번호</span> 
						<input type="button" value="우편검색" id="postcode"> 
						<input type="text" size="5" maxLength="5" name="m_address_no" id="post1" style="width: 20%"> <br>
						<span>주소</span> 
						<input type="text" size="50" name="m_address" id="address" placeholder="주소를 입력해주세요" required> <br>
						<input type="text" size="50" name="m_address_about" id="m_address_abuot" placeholder="상세주소를 입력해주세요""
						 required> <br>
						<span>성별</span>
						<div style="margin-bottom:25px">
							<input type="radio" name="m_gender" value="남" checked><span>남자</span>
							<input type="radio" name="m_gender" value="여"><span>여자</span>
						</div>
						<span>MBTI</span> <input type="button" value="MBTI 검사하기" id="mbti_check">
						<select class="form-control" id="m_mbti" name="m_mbti" style="width: 34%" onload="mbtiurl();">
							<option value="기본" selected>MBTI를 선택해주세요</option>
							<option value="enfj">ENFJ</option>
							<option value="enfp">ENFP</option>
							<option value="entj">ENTJ</option>
							<option value="entp">ENTP</option>
							<option value="esfj">ESFJ</option>
							<option value="esfp">ESFP</option>
							<option value="estj">ESTJ</option>
							<option value="estp">ESTP</option>
							<option value="infj">INFJ</option>
							<option value="infp">INFP</option>
							<option value="intj">INTJ</option>
							<option value="intp">INTP</option>
							<option value="isfj">ISFJ</option>
							<option value="isfp">ISFP</option>
							<option value="istj">ISTJ</option>
							<option value="istp">ISTP</option>
						</select> <br>
						<div class="clearfix">
							<button type="submit" class="submitbtn">회원가입</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="resources/js/jquery-3.5.0.js"></script>
	<script src="resources/js/join.js"></script>
	<script>
		document.querySelector('#opacityBox').style.height = document.body.scrollHeight+"px";
	</script>
</body>
</html>