<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="resources/css/notice.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/notice.js"></script>
<script>
$(function() {
$("#upfile").change(function() {
	var inputfile = $(this).val().split('\\');
	$('#filevalue').text(inputfile[inputfile.length -1]);
});

$("#upfile").hide();
});

$("form").submit(function() {
	if ($("#pass").val() == '') {
		// 삭제를 누를 시 비밀번호가 필요해서 
		alert("비밀번호를 입력하세요");
		$("#pass").focus();
		return false;
	}
})

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
    color: #fff;
    border: none;
    position: relative;
    padding: 0 2em;
    cursor: pointer;
    transition: 800ms ease all;
    outline: none;
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

.modal{
top: 28%;
left:50%;
padding: 17px;
height: 295px;
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
	<input type="hidden" id="loginid" value="${n.m_id}" name="loginid">
	<div id="main_Container">
		<div id="left_Container">
			
		</div>
		<div id="right_Container">
			<div class="container">
				<form enctype="multipart/form-data" name="boardform" onSubmit="return false;">
					<fieldset style="border: 1px solid gray;
    border-radius: 3px;">
						<div class="form-group">
							<label for="board_subject">제목</label> <br> <input
								name="BOARD_SUBJECT" id="board_subject" type="text" size="10"
								maxlength="30" class="form-control" readOnly
								value="${n.subject}">
						</div>
						<div class="form-group">
							<div>파일첨부</div>
					<c:if test="${!empty n.n_file}">
						<%-- 파일첨부한 경우 --%>
						<td><!-- <img src= "resources/image/down.png"  width="10px"> -->
						 <a href="NoticeFileDown.net?filename=${n.n_file}&original=${n.n_original}">
								${n.n_original}</a></td>
					</c:if>
					<c:if test="${empty n.n_file}">
						<%-- 파일첨부 하지 않은 경우  --%>
						
					</c:if>
						</div>
						<div class="form-group">
							<label for="board_content">내용</label> <br>
							<textarea name="BOARD_CONTENT" id="board_content" cols="67"
								rows="10" class="form-control"
								style="resize: none; height: 300px;" readOnly>${n.content}</textarea>
						</div>
						</fieldset>
						</form>
						</div>
						<div class="form-group" style="margin-left:30%">
				<c:if test="${n.m_id == m_id}">
						<a href="NoticeModify.net?num=${n.no}">
							<button class="btn">수정</button>
						</a>
						<%-- href의 주소를 #으로 설정합니다. --%>
						<a href="#">
							<button class="btn" data-toggle="modal"
								data-target="#myModal">삭제</button>
						</a>
					</c:if> <a href="notice.net">
						<button class="btn">목록</button>
				</a>
				</div>
				<%-- modal 시작 --%>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<form name="deleteForm" action="NoticeDelete.net"
							method="post">
							<%-- http://localhost:8088/Board_Ajax_bootstrap/BoardDetatilAction.bo?num 
                      주소를 보면 num 을 파라미터로 넘기고 있습니다.
                      이 값을 가져와서 ${param.num} 를 사용
                      또는 ${boarddata.BOARD_NUM}
                 --%>
							<input type="hidden" name="no" value="${n.no}" id ="no">
							<div class="form-group">
								<label for="pwd">비밀번호</label> <input type="password"
									class="form-control" placeholder="Enter password"
									name="password" id="password">
							</div>
							<button type="submit" class="btn">전송</button>
							<button type="button" class="btn" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>