<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 identity MY_INFO PAGE</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link href="resources/css/updateform.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src ="resources/js/updateform.js"></script>
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
      <label for="image"> 
         <img src = 'resources/upload/${m.m_file}' class = "uploadimg">
      </label>
   </div>

   <div class="menu">
      <select class="menu-control" onchange="location = this.value;">
         <option value="updateForm.net">My Info</option>
         <option value="myReview.net">My Review</option>
         <option value="myBook.net">My Books</option>
         <option value="notice.net">Notice</option>
      </select>
   </div>

   <form id="updateform" action="updateProcess.net" method="post" enctype="multipart/form-data">
   <input type = "hidden" name = "m_file" value = "${m.m_file}"> <!-- 수정했는데 기존값들 그대로 쓸 경우오리지널 파일 넘겨주려고 -->
      <b>ID</b> 
      <input type="text" id="m_id" name="m_id" value="${m.m_id}" required readonly>
      <b>PASSWORD</b> 
      <input type="password" placeholder="change your password" name="m_password" id="m_password"  maxLength="13" required> 
      
      <b>CHECK</b> 
      <span id="success" style="display: none; font-size:12px; color : green; margin-top: -17px; margin-left: 60px;">비밀번호가 일치합니다.</span>
      <span id="fail" style="display: none;font-size:12px; color : red;  margin-top: -17px; margin-left: 60px;">비밀번호를 다시 확인해주세요.</span>
      <input type="password" placeholder="check your password" name="m_passwordcheck" id="m_passwordchk" value="${m_password}" maxLength="13" required>
      
      
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
      <input type="file" name="uploadfile" accept="image/gif, img/jpeg, image/png" style="display: none" id="image">
      <span id="filevalue" style="display:none;" >${m.m_original}</span>
   </form>
   
 <footer><h3>footer</h3></footer>
 
 <script>
 $('#m_passwordchk').keyup(function () {
     var pwd1 = $("#m_password").val();
     var pwd2 = $("#m_passwordchk").val();

     if ( pwd1 != '' && pwd2 == '' ) {
         null;
     } else if (pwd1 != "" || pwd2 != "") {
         if (pwd1 == pwd2) {
             $("#success").css('display', 'block');
             $("#fail").css('display', 'none');
         } else {
            $("#fail").css('display', 'block');
             $("#success").css('display', 'none');
         }
     }
 });
 </script>
</body>
</html>