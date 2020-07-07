<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원관리 시스템 회원가입 페이지</title>
    <link href="resources/css/join.css" type="text/css" rel="stylesheet">
	<script src="resources/js/jquery-3.5.0.js"></script>
	<script>
		$(function(){
			var checkid=false;
			var checkemail=false;
			$('form').submit(function(){
				
				if(!checkid){
					alert("사용 가능한 id로 입력하세요.");
					$("input:eq(1)").val('').focus();
					return false;
				}
				
				if(!checkemail){
					alert("id 형식을 확인하세요");
					$("input:eq(1)").focus();
					return false;
				}
			}); //submit
			
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
					$('img').attr("src", e.target.result);
				}
					
			}
			
			$("input:eq(1)").on('keyup',
					function(){
					  $("#e-check_result").empty(); //처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한
					  $("#check_result").empty();
					  //[A-Za-z0-9_]의 의미가 \w
					  var pattern=/\w+@\w+[.]\w{3}/;
					  var m_id = $("input:eq(1)").val();
					  if(!pattern.test(m_id)){
						  $("#e-check_result").css('color','red').text("이메일 형식이 맞지 않습니다.");
						  checkemail=false;
					  } else {
						  $("#e-check_result").css('color','green').text("이메일 형식에 맞습니다.");
						  checkemail=true;
					  }
					  
					  $.ajax({
						url : "idcheck.net",
						data : {"m_id" : m_id},
						success : function(resp){
							if(resp == -1){
								$('#check_result').css('color', 'green').text("사용 가능한 아이디 입니다.");
								checkid=true;
							} else{
								$('#check_result').css('color', 'blue').text("사용 중인 아이디 입니다.");
								checkid=false;
							}
						}
					  });//ajax end
			});//id keyup end
		})
	</script>
</head>
<body>
  <form class="modal-content animate" action="joinProcess.net" method="post" enctype="multipart/form-data">
    <div class="imgcontainer">
	    <label>
	    	<input type="file" name="uploadfile" accept="image/gif, image/jpeg, image/png" style="display:none"/>
	    	<img src="resources/image/img_avatar2.png" alt="Avatar" class="avatar">
	    </label>
    </div>

    <div class="container">
      <label for="id"><b>UserID</b></label><span id="e-check_result" style="margin-left:30px; font-size:11px"></span><span id="check_result" style="margin-left:30px; font-size:11px"></span>
        <input type="text" placeholder="Enter Email" id="id" name="m_id" required>

      <label for="m_password"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="m_password" required>
      <label for="m_name"><b>Name</b></label>
	    <input type="text" name="m_name" placeholder="Enter name" maxlength=15 required>
	  <label for="m_nickname"><b>Nickname</b></label>
		<input type="text" name="m_nickname" placeholder="Enter nickname" maxlength=15 required>	
		
	  <label for="m_phone"><b>Phone</b></label>
		<input type="number" name="m_phone" placeholder="010-1234-5678" maxlength=13 required>	
		
	  <label for="m_mbti"><b>MBTI</b></label>
		<input type="text" name="m_mbti" placeholder="INFP" maxlength=4 required>
	  
	  <label for="m_address_no"><b>Address_no</b></label>
		<input type="number" name="m_address_no" placeholder="12345" maxlength=5 required>
	  
	  <label for="m_address"><b>Address</b></label>
		<input type="text" name="m_address" placeholder="Enter address" required>
	  
	  
	  
	  
      <button type="submit">회원가입</button>
    </div>

  </form>
</body>
</html>