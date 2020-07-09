window.onload = function(){
	alert("header.js");
    const mypageMenu = document.querySelector("#mypageMenu");
    const mypageMenuList = mypageMenu.children;
    for(var i=0; i<mypageMenuList.length; i++){
        mypageMenuList[i].addEventListener("mouseover", menulist_over);
        mypageMenuList[i].addEventListener("mouseout", menulist_out);
    }
    $(".info").on("click", function(){
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
}

function menulist_over(){
    this.children[0].style.visibility = "visible";
}

function menulist_out(){
    this.children[0].style.visibility = "hidden";
}