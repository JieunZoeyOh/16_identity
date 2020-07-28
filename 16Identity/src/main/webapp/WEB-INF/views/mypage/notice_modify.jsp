<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link href="resources/css/notice.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/notice.js"></script>
<script src="resources/js/Modify.js"></script>
<script>
$(function() {
$("#upfile").change(function() {
	var inputfile = $(this).val().split('\\');
	$('#filevalue').text(inputfile[inputfile.length -1]);
});

$("#upfile").hide();
});

$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            var filename = $(this)[0].files[0].name;
	        } else {
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        }

	        $(this).siblings('.upload-name').val(filename);
	    });
	    $(".detail").click(function(){
			  location.href="Detail.net";
	 })
	 $("#list").click(function(){
			  location.href="list.net";
	 })
	$("#modify").click(function(){
			  location.href="modify.net";
	})
	}); 

</script>
<style>
.demo {
	width: 81%;
	padding-left: 192px;
}

.btn {
	   border-radius: 3px;
    font-size: 15px;
    background: #303960;
    height: 40px;
}

.form-group {
	margin-top: 15px;
}

.form-control {
	height: 40px;
	width: 100%;
}

#right_Container{
	margin-left: 31%;
    width: 40%;
}

.filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

.filebox.bs3-primary label {
  color: #fff;
    background-color: #337ab7;
    border-color:#303960;
}

</style>
</head>
<body>
	<c:set var="n" value="${notice}" />

	<div class="hero">
		<div class="diagonal-hero-bg">
			<img src="resources/image/logo.png" class="logoimg" />
			<div class="stars"></div>
		</div>
	</div>
	<div id="main_Container">
		<div id="left_Container">
			
		</div>
		<div id="right_Container">
			<div class="container">
				<form action="NoticeModifyAction.net" method="post"
			  enctype="multipart/form-data" name="noticeform" id="form">
					<fieldset>
					<input type="hidden" name="no" value="${n.no}">
			<input type="hidden" name="n_file" value="${n.n_file}"> <!-- 이부분을 FILE로바꿀때 사용가능하게 -->
			<input type="hidden" name="before_file" value="${n.n_file}">
						<div class="form-group">
							<label for="subject">제목</label> <br> <input
								name="subject" id="subject" type="text" size="10"
								maxlength="30" class="form-control"
								value="${n.subject}">
						</div>
						<div class="form-group">
							<label for="board_subject">파일첨부</label>
							<div class="filebox bs3-primary">
                            <label for="upfile" 
                            style="height: 30px;padding-bottom: 0px;padding-top: 0px;background: #303960">업로드</label>
					<input type="file" id="upfile" name="uploadfile"> <span
						id="filevalue">${n.n_original}</span> 
						<img src="resources/image/remove.png" alt="파일삭제" width="10px" class="remove">
                          <input type="file" id="upfile" class="upload-hidden"> 
                        </div>
						</div>
						<div class="form-group">
							<label for="content">내용</label> <br>
							<textarea name="content" id="content" cols="67"
								rows="10" class="form-control"
								style="resize: none; height: 300px;">${n.content}</textarea>
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <br> <input name="password"
					id="password" type="password" size="10" maxlength="30"
					class="form-control" placeholder="글 비밀번호를 입력해주세요" value="" required>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="reset" class="btn btn-danger" 
				onClick="history.go(-1)">취소</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>