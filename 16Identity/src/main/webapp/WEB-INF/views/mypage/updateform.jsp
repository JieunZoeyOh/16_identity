<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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

    $(".dropbtn").on('click', function(){
    	
    	
	    	
        swal({
            title: "탈퇴 하시겠습니까?",
            text: "탈퇴하시면 모든 정보가 삭제됩니다.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
            	
            
            	$.ajax({
        	    	url : "delete.net" ,
        	    	data : {"m_id" : $('#m_id').val()},
        	    	success : function(result){
        	    
        	    		if(result == 1){
        	    			swal("탈퇴가 완료되었습니다.!", {
        	                    icon: "success"
        	                    }); 
        	    			
    	                    return "login.net";
        	    		}
        	    	} else {
                		swal("탈퇴가 취소되었습니다.");
            }
        });
    });

    $(".submitbtn").on('click',function(){
    	
    	  $.ajax({
    	    	url : "updateProcess.net" ,
    	    	data : {"m_id" : $('#m_id').val() , 
    	    		  	"m_password" : $('#m_password').val() ,
    	    		  	"m_nickname" : $('#m_nickname').val() , 
    	    		  	 "m_mbiti" : $('#m_mbti').val()
    	    		   },
    	    		   
    	    	success : function(result){
    	    		
    	    		if(result == 1){
    	    			
    	    			  swal("수정이 완료되었습니다", "thank you", "success");
    	    		        return false;
    	    		}
    	    	}	   
    	    })
    });
});
</script>


</head>
<body>

	<div class='loader'>
		<div class='article'>
			<div class='page'></div>
		</div>
	</div>


	<div class="hero">
		<div class="diagonal-hero-bg">
			<div class="stars">
				<div class="small"></div>
				<div class="medium"></div>
				<div class="big"></div>
			</div>
		</div>
	</div>

	<div class="imgcontainer">
		<label> <input type="file" name="m_original"
			accept="image/gif, img/jpeg, image/png" style="display: none">
			<img src="resources/image/avatar.png" alt="Avatar" class="avatar">
		</label>
	</div>

	<div class="menu">
		<select class="menu-control">
			<option value="1"><a href="#">My Info</a></option>
			<option value="2"><a href="#">My Review</a></option>
			<option value="3"><a href="#">My Books</a></option>
			<option value="4"><a href="#">Notice</a></option>
		</select>
	</div>

	<form name="updateform" action="updateProcess.net" method="post">
		<b>ID</b> <input type="text" name="m_id" value="${m_id}" required
			readonly> <b>PASSWORD</b> <input type="password"
			placeholder="change your password" name="m_password"
			value="${m_password}" maxLength="13" required> <b>CHECK</b> <input
			type="password" placeholder="check your password"
			name="m_passwordcheck" value="${m_password}" maxLength="13" required>

		<b>NICK NAME</b> <input type="text"
			placeholder="change your nick name" name="m_nickname"
			value="${m_nickname}" required> <b
			style="display: inline-block; width: auto">MBTI</b>
		<button type="button" class="changembti"
			onclick="location.href='https://www.16personalities.com/ko'">변경</button>
		<input type="text" placeholder="change your MBTI" name="m_mbti"
			value="${m_mbti}" required>


		<hr>
		<div class="clearfix">
			<button type="button" class="dropbtn"
				onclick="delete.net?m_id=${m_id}">탈퇴하기</button>
			<button type="submit" class="submitbtn">수정하기</button>
		</div>

	</form>


</body>
</html>