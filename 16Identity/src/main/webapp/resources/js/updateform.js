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
	})
	
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