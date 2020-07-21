$(function() {
	var checkpass = false;
	var checkemail = false;
	var checknick = false;
	$('form').submit(function() {

		if (!checkemail) {
			alert("email 형식을 확인하세요");
			$("input:eq(1)").focus();
			return false;
		}
		
		if (!checkpass) {
			alert("비밀번호가 맞지않습니다");
			$("input:eq(3)").focus();
			return false;
		}
		
		if (!checknick) {
			alert("닉네임을 확인해주세요");
			$("input:eq(5)").focus();
			return false;
		}
		
	}); // submit

	$("input:eq(1)").on('keyup',
			function() {
				$("email_message").empty();
				// [A-Za-z0-9_]와 동일한 것이 \w
				// +는 1회 이상 반복을 의미합니다. {1,}와 동일합니다.
				// \w+ 는 [A-Za-z0-9_]를 1개이상 사용하라는 의미입니다.
				var pattern = /^\w+@\w+[.]\w{3}$/;
				var email = $("input:eq(1)").val();
				
				split = email.split("@");
				
				if (split[0].length < 4){
					$("#email_message").css('color', 'red').html(
					"아이디를 4글자 이상으로 해주세요.");
					checkemail = false;
					return;
				}
				
				if (!pattern.test(email)) {
					$("#email_message").css('color', 'red').html(
							"이메일 형식이 맞지 않습니다.");
					checkemail = false;
					return;
				}

				$.ajax({
					url : "idcheck.net",
					data : {
						"id" : email
					},
					success : function(resp) {
						if (resp == -1) {// db에 해당 id가 없는 경우
							$("#email_message").css('color', 'green').html(
									"사용 가능한 아이디 입니다.");
							checkemail = true;
						} else {// db에 해당 id가 있는경우
							$("#email_message").css('color', 'blue').html(
									"사용중인 아이디 입니다.");
							checkemail = false;
						}
					}
				}); // ajax end
			}); // email keyup 이벤트 처리 끝

	/*
	 * $("input:eq(0)").on( 'keyup', function() { $("#message").empty(); // 처음에
	 * pattern에 적합하지 않은 경우 메시지 출력 후 적합한 // [A-Za-z0-9_]와 동일한 것이 \w var pattern =
	 * /^\w{5,12}$/; var id = $("input:eq(0)").val(); if (!pattern.test(id)) {
	 * console.log(id); $("#message").css('color', 'red').html( "영문자 숫자 _로 5~12자
	 * 가능합니다."); checkid = false; return; }
	 * 
	 * $.ajax({ url : "idcheck.net", data : { "id" : id }, success :
	 * function(resp) { console.log(resp); if (resp == -1) {//db에 해당 id가 없는 경우
	 * $("#message").css('color', 'green').html( "사용 가능한 아이디 입니다."); checkid =
	 * true; } else {//db에 해당 id가 있는경우 $("#message").css('color', 'blue').html(
	 * "사용중인 아이디 입니다."); checkid = false; } } }); // ajax end }) // id keyup end
	 */

	$('#Password').keyup(function() {
		$('#passmessage').html('');
	});

	$('#passcheck').keyup(function() {

		if ($('#password').val() != $('#passcheck').val()) {
			$("#passmessage").css('color', 'red').html("비밀번호가 일치하지 않습니다.");
			checkpass = false;
		} else {
			$("#passmessage").css('color', 'green').html("비밀번호가 일치 합니다.");
			checkpass = true;
		}

	});
	
	$("#nickcheck").click(function() {
		var nick = $("#m_nickname").val();
		
				$.ajax({
					url : "nickcheck.net",
					data : {
						"nick" : nick
					},
					success : function(resp) {
						console.log(resp);
						if (resp == -1) {// db에 해당 id가 없는 경우
							
							alert("사용 가능한 닉네임 입니다.")
							//$("#email_message").css('color', 'green').html(
							//		"사용 가능한 아이디 입니다.");
							//checkemail = true;
							checknick = true;
						} else {// db에 해당 id가 있는경우
							alert("사용중인 닉네임 입니다.")
							checknick = true;
							//$("#email_message").css('color', 'blue').html(
							//		"사용중인 아이디 입니다.");
							//checkemail = false;
						}
					}
				}); // ajax end
			});

	$("#postcode").click(function() {
		Postcode();
		// window.open("post.html","post","width=400,height=500,scrollbars=yes");
	});

	function Postcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$(post1).val(data.zonecode); // 5자리 새우편번호 사용
				$(address).val(fullRoadAddr); // 주소

			}
		}).open();

	}

	$("#upfile").change(function() {
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	})

	$("#upfile").on("change", handelImgFileSelect);

	function handelImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	$("#upfile").hide();

	$("#filevalue").hide();

	$('#mbti_check').one('click',function(){
		document.querySelector('.container').style.width = "1400px";
		document.querySelector('.signup-form').style.width = "50%";
		input= `<iframe name="mbti" id="mbti" sandbox="allow-forms allow-scripts allow-same-origin allow-popups allow-top-navigation allow-pointer-lock allow-modals"
					src="https://testharo.com/16personalities/" width="924px" height="1300px" style="border: 0; overflow: auto; margin-top: 50px;"> 
				</iframe>`;
		$('div.signup-content').append(input);
	})
})