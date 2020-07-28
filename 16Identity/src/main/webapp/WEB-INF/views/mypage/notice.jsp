<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>16 Identity</title>
<jsp:include page="../main/header_mypageVersion.jsp" />
<link href="resources/css/noticelist.css" type="text/css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="resources/js/jquery-3.5.0.js"></script>
<script src="resources/js/notice.js"></script>
<script>
$(function() {
	$("#viewcount").change(function() {
		go(1);//보여줄 페이지를 1페이지로 설정합니다.
	});// change end

   	  $("#write").click(function(){
   		  location.href="NoticeWrite.net";
     })
})
</script>
<style>
a{
text-decoration: none;
color:black
}

.demo{
    width: 81%;
    padding-left: 192px;
}
.btn{
    margin-top: 19px;
    border-radius: 3px;
    font-size: 17px;
    background: #303960;
}
li{
   list-style:none;
   padding-left:0px;
   }
#write{
    width: 95px;
    height: 40px;
    border: none;
    background: #303960;
    color: white;
}
</style>
</head>
<body>
	<c:set var="m" value="${profile}" />

	<div class="hero">
		<div class="diagonal-hero-bg">
			<img src="resources/image/logo.png" class="logoimg" />
			<div class="stars"></div>
		</div>
	</div>
	<div id="main_Container">
		<div id="left_Container">
			<div class="imgcontainer">
				<label for="image"> <img src='resources/upload/${m.m_file}'
					class="uploadimg">
				</label>
			</div>
			<div class="menu">
				<select class="menu-control" onchange="location = this.value;">
					<option value="updateForm.net">My Info</option>
					<c:if test="${m_id != 'admin@naver.com' }">
						<option value="myReview.net">My Review</option>
						<option value="myBook.net">My Books</option>
					</c:if>
					<option value="notice.net" selected>Notice</option>
				</select>
			</div>
		</div>
		<div id="right_Container">
			<c:if test="${listcount > 0 }">
				<div id="content">
					<table>
						<thead>
							<tr>
								<td>NO.</td>
								<td>제목</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
						</thead>
						<tbody>
							<c:set var="num" value="${listcount-(page-1)*limit}" />
							<c:forEach var="n" items="${noticelist}">
								<tr>
									<td>
										<%--번호 --%> <c:out value="${num}" />
										<%-- num 출력 --%> <c:set var="num" value="${num-1}" /> <%-- num=num-1; 의미--%>
									</td>
									<td>
										<%--제목 --%>
										<div>
											<a href="./NoticeDetailAction.net?num=${n.no}">
												${n.subject} </a>
										</div>
									</td>
									<td><div>${n.m_id}</div></td>
									<td><div>${n.viewcount}</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${m.m_id=='admin@naver.com'}">
				<button type="button" id="write" class="btn btn-info float-right" style="float: right;">글 쓰 기</button>
			</c:if>
					<div class="section">
							<div class="demo">
								<nav class="pagination">
									<c:if test="${page <= 1 }">
									<a class="r-link pagination__control pagination__control_prev" style="color:gray">prev</a>
									</c:if>
									<c:if test="${page > 1 }">
									<a href="./notice.net?page=${page-1}" class="r-link pagination__control pagination__control_prev">prev</a>
									</c:if>
									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<c:if test="${a == page }">
											<li class="pagination__group">
							<span class="pagination__point">${a}</span>
						</li>
										</c:if>
										<c:if test="${a != page }">
											<li class="pagination__group">
								<a href="./notice.net?page=${a}" class="r-link pagination__point">${a}</a>
											</li>
										</c:if>
									</c:forEach>

									<c:if test="${page >= maxpage }">
										<a href="#" class="r-link pagination__control pagination__control_next" style="color:gray">next</a>
										
									</c:if>
									<c:if test="${page < maxpage }">
										<a href="./notice.net?page=${page+1}" class="r-link pagination__control pagination__control_next">next</a>
										
									</c:if>
								</nav>
							</div>
						</div>
					</div>
					</c:if>
				

			<c:if test="${listcount == 0 }">
				<h1>공지사항</h1>
				<br>
				<br>
				<font size=5>등록된 글이 없습니다.</font>
				<c:if test="${m.m_id=='admin@naver.com'}">
				<br>
				<button type="button" id="write" class="btn btn-info float-right">글 쓰 기</button>
			</c:if>
			</c:if>
			</div>
		</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>