$(document).ready(function() {
	
	$(".info1").on("click", function(){
	    console.log("click")
	    $(".overlay").addClass("on");
	    $(".modal").addClass("on");
	})
	$(".btn_submit").on("click", function(){
		$('#passchk').submit();
	    
	})
	$(".btn_cancel").on("click", function(){
		$(".overlay").removeClass("on");
	    $(".modal").removeClass("on");
	    
	})
	
	var check = 0;
	$("#updateform").submit(function() {

		if (check == 0) {
			value = $('#filevalue').text();
			html = "<input type='text' value='" + value + "' name='check'>";
			$(this).append(html);
		}
	});
	
	$("#image").change(function() {
		check++;
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	
	});
	
	$(window).on("load",function(){
		$(".loader-wrapper").fadeOut(1000);
		$('#mypage').on('click', function(){
			$('#mypageMenu').toggle();
		})
		$('#subscribe').on('click', function(){
			$('#subMenu').toggle();
		})
		/* $(document).mouseup(function(e){
			if($('#mypageMenu').has(e.target).length==0){
				$('#mypageMenu').hide();
			}	
		}) */
	});
	
	//파일
	$('input[type=file]').on('change', preview);

	function preview(e) {
		//선택한 그림의 file 객체 취득 
		//file 객체 리스트에서 첫번째 file 객체 가져온다. 

		var file = e.target.files[0]

		//file.type : 파일의 형식(MIME 타입 -예 text/html)
		if (!file.type.match("image.*")) { //파일 타입이 image 인지 확인
			alert('확장자는 이미지만 가능합니다.');
			return;
		}

		//파일 읽기 위한 객체 생성
		var reader = new FileReader();

		//dataURL 형식으로 파일을 읽어온다.
		//읽어온 결과는 reader 객체의 result 속성에 저장 
		reader.readAsDataURL(file);

		//읽기 성공 시 실행 되는 이벤트 핸들러 
		reader.onload = function(e) {

			//result : 읽기 결과가 저장됩니다.
			//reader.result 또는 e.targer.result
			$('.uploadimg').attr("src", e.target.result);
		}//reader.onload.end
	}//function end
	
	/*header js 부분*/
    const mypageMenu = document.querySelector("#mypageMenu");
    const mypageMenuList = mypageMenu.children;
    for(var i=0; i<mypageMenuList.length; i++){
        mypageMenuList[i].addEventListener("mouseover", menulist_over);
        mypageMenuList[i].addEventListener("mouseout", menulist_out);
    }
    const subMenu = document.querySelector("#subMenu");
    const subMenuList = subMenu.children;
	subMenuList[0].addEventListener("mouseover", menulist_over);
	subMenuList[0].addEventListener("mouseout", menulist_out);
	
	/*header js 부분*/
	function menulist_over(){
	    this.children[0].style.visibility = "visible";
	}

	function menulist_out(){
	    this.children[0].style.visibility = "hidden";
	}
});