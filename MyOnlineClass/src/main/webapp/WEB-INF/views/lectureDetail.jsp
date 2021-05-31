<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
String user_name;
if(session.getAttribute("id") == null){
	user_name = "로그인후이용해주세요.";
}
else {
	user_name = (String) session.getAttribute("name");
}
%>
<c:set var="lecture" value="${lectureDTO}" />
<c:set var="instructor" value="${instructorDTO}" />
<c:set var="comment" value="${commentDTO}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64" href="${pageContext.request.contextPath}/resources/image/classtok_favi4fa9.png" />
<meta charset="UTF-8">
<meta name="description" content="MyOnlineClassDetail">
<meta name="keywords" content="html, comment">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Online Class</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/barfiller.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/style.css"
	type="text/css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	$(function() {
		getCommentList();
	});

	$(document).on("click", "#commentbtn", function() {
		var content_text = $("#comment_text");
		var content_textVal = content_text.val();
		var user = '<%=(String)session.getAttribute("id")%>';
		if (user == 'null'){
			alert('로그인 후 이용해주세요.');
			location.href='/online/login';
			return;
		}
		
		// 댓글 내용이 있는지 검사
		if(content_textVal == ""){
			alert("댓글을 작성해주세요.");
			$("#comment_text").focus();
			return;
		}
		
		// 버튼 2번 클릭 인식 방지
		$("#commentbtn").attr('disabled', 'disabled');
		
		$.ajax({ 
			type : "post", 
			url : "<c:url value='/classdetail/${lecture.id}/insert'/>", 
			headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
			data : JSON.stringify({ content_textVal : content_textVal, user : user }), 
			success : function (result) { 
				if (result == "Success") {
					alert("댓글이 등록되었습니다."); 
				}
				else if(result == "False"){
					alert("수강생만 댓글 작성이 가능합니다.");
					$("#comment_text").val("");
					$("#commentbtn").attr('disabled', false);
					return;
				}
				getCommentList(); // 댓글 목록 출력 함수 호출 
				$("#comment_text").val(""); // 댓글 내용 초기화 
				$("#commentbtn").attr('disabled', false);
			},
			dataType: "text",
			contentType: "application/json"
		});
	});
	
	
	$(document).on("click", "#deletecmt", function() {
		var cno = $(this).val();
		var user_check = $(this).attr('name');
		// 버튼 2번 클릭 인식 방지
		$("#deletecmt").attr('disabled', 'disabled');
		
		var user = '<%=(String)session.getAttribute("id")%>';
		if (user == 'null'){
			alert('로그인 후 이용해주세요.');
			location.href='/online/login';
			return;
		}
		
		// 재확인
		if (confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({ 
				type : "post", 
				url : "<c:url value='/classdetail/${lecture.id}/delete'/>", 
				headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
				data : JSON.stringify({ cno : cno, user_check : user_check }), 
				success : function (result) { 
					if (result == "Success") {
						alert("정상적으로 삭제되었습니다."); 
					}
					else if(result == "False"){
						alert("나의 게시글만 삭제가 가능합니다."); 
					}
					getCommentList(); // 댓글 목록 출력 함수 호출 
					$("#commentbtn").attr('disabled', false);
				},
				dataType: "text",
				contentType: "application/json"
			});
		}
		else{
			$("#deletecmt").attr('disabled', false);
			return;
		}
		
	});
	
	$(document).on("click", "#updatecmt", function() {
		var user = '<%=(String)session.getAttribute("id")%>';
		if (user == 'null'){
			alert('로그인 후 이용해주세요.');
			location.href='/online/login';
			return;
		}
	});

	$(document).on("click", "#updatecmt_do", function() {
		//댓글 수정
		var cno = $(this).val();
		var comment_user = $(this).attr('name');
		var content_fix = $("#comment_text_fix").val();
		// 버튼 2번 클릭 인식 방지
		$("#updatecmt").attr('disabled', 'disabled');
		
		// 재확인
		if (confirm("댓글을 수정하시겠습니까?")){
			$.ajax({ 
				type : "post", 
				url : "<c:url value='/classdetail/${lecture.id}/update'/>", 
				headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
				data : JSON.stringify({ cno : cno, comment_user : comment_user, content_fix : content_fix }), 
				success : function (result) { 
					if (result == "Success") {
						alert("수정되었습니다."); 
					}
					else if(result == "False"){
						alert("나의 게시글만 수정이 가능합니다."); 
					}
					getCommentList(); // 댓글 목록 출력 함수 호출 
					$("#updatecmt").attr('disabled', false);
				},
				dataType: "text",
				contentType: "application/json"
			});
		}
		else{
			$("#updatecmt").attr('disabled', false);
			return;
		}
		
	});
	
	
	function getCommentList() {
		var user = '<%=(String)session.getAttribute("id")%>';
		$.ajax({
					type : 'GET',
					url : "<c:url value='/classdetail/${lecture.id}/1'/>",
					dataType : "json",
					data : $("#commentlist").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						var html = "";

						if (data.length > 0) {

							for (i = 0; i < data.length; i++) {
								var member = data[i].member_id;
								html += "<div class='listing__details__comment__item'>";
								html += "<div class='listing__details__comment__item__pic'>";
								html += "<img src='${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/comment_icon.png' alt=''>";
								html += "</div>";
								html += "<div class='listing__details__comment__item__text'>";
								html +=	"<div class='listing__details__comment__item__rating'>";
								html +=	"<i class='fa fa-star'></i> ";
								html +=	"<i class='fa fa-star'></i> ";
								html +=	"<i class='fa fa-star'></i> ";
								html +=	"<i class='fa fa-star'></i> ";
								html +=	"<i class='fa fa-star'></i> ";
								html += "</div>";
								html += "<span>" + data[i].regdate + "</span>";
								html += "<h5>" + data[i].name + " (" + member.substring(0,3) + "**) </h5>";
								html += "<p class='collapse multi-collapse-" + data[i].no + " show'>" + data[i].content + "</p>"; // 일반
								html += "<form class='collapse multi-collapse-" + data[i].no + " '>"; // 수정모드
							    html += "<div class='form-group'>";
								html += "<textarea class='form-control' id='comment_text_fix' rows='3'style='resize: none;'>" + data[i].content + "</textarea>";
							    html += "</div>";
							    html += "<button type='button' id='updatecmt_do' class='cmtfixbtn' value = " + data[i].no + " name =" + data[i].name + ">수정 완료</button>";
								html += "</form>";
								if(user==member){
									html += "<ul>";
									html += "<li><button id='updatecmt' class='cmtbtn collapse multi-collapse-" + data[i].no + " show' value = " + data[i].no + " name =" + data[i].name + " data-toggle='collapse' data-target='.multi-collapse-" + data[i].no + " '><i class='fa fa-hand-o-right'></i> 수정하기</button></li>";
									html += "<li><button id='deletecmt' class='cmtbtn collapse multi-collapse-" + data[i].no + " show' value = " + data[i].no + " name =" + data[i].name + "><i class='fa fa-share-square-o'></i> 삭제하기</button></li>";
									html += "</ul>";
								}
								html +="</div>" + "</div>";
							}
						} else {
							html += "<div class='listing__details__comment__item'>";
							html += "<div class='listing__details__comment__item__pic'>";
							html += "<img src='${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/comment_icon.png' alt=''>";
							html += "</div>";
							html += "<div class='listing__details__comment__item__text'>";
							html += "<h6></h6>";
							html += "<p>등록된 댓글이 없습니다.</p>";
							html += "</div>";
						}
						$("#commentList").html(html);
					},
					error : function(request, status, error) {
					}
				});
	}
	
</script>

<style>
.cmtbtn {
  background: #ffffff;
  background-image: -webkit-linear-gradient(top, #ffffff, #ffffff);
  background-image: -moz-linear-gradient(top, #ffffff, #ffffff);
  background-image: -ms-linear-gradient(top, #ffffff, #ffffff);
  background-image: -o-linear-gradient(top, #ffffff, #ffffff);
  background-image: linear-gradient(to bottom, #ffffff, #ffffff);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #6e6e6e;
  font-size: 15px;
  padding: 5px 10px 5px 10px;
  border: solid #ffffff 0px;
  text-decoration: none;
}

.cmtbtn:hover {
  background: #b3d1e3;
  background-image: -webkit-linear-gradient(top, #b3d1e3, #bdddf2);
  background-image: -moz-linear-gradient(top, #b3d1e3, #bdddf2);
  background-image: -ms-linear-gradient(top, #b3d1e3, #bdddf2);
  background-image: -o-linear-gradient(top, #b3d1e3, #bdddf2);
  background-image: linear-gradient(to bottom, #b3d1e3, #bdddf2);
  text-decoration: none;
}

.cmtfixbtn {
 background: #d1d1d1;
  background-image: -webkit-linear-gradient(top, #d1d1d1, #cccccc);
  background-image: -moz-linear-gradient(top, #d1d1d1, #cccccc);
  background-image: -ms-linear-gradient(top, #d1d1d1, #cccccc);
  background-image: -o-linear-gradient(top, #d1d1d1, #cccccc);
  background-image: linear-gradient(to bottom, #d1d1d1, #cccccc);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  border-width: 0px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 5px 7px 5px 7px;
  text-decoration: none;
}

.cmtfixbtn:hover {
  background: #cfcfcf;
  background-image: -webkit-linear-gradient(top, #cfcfcf, #cccccc);
  background-image: -moz-linear-gradient(top, #cfcfcf, #cccccc);
  background-image: -ms-linear-gradient(top, #cfcfcf, #cccccc);
  background-image: -o-linear-gradient(top, #cfcfcf, #cccccc);
  background-image: linear-gradient(to bottom, #cfcfcf, #cccccc);
  text-decoration: none;
}

</style>

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Listing Section Begin -->
	<section class="listing-hero set-bg"
		data-setbg="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/listing-hero.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="listing__hero__option">
						<div class="listing__hero__icon">
							<img
								src="https://images-na.ssl-images-amazon.com/images/I/31lNc4JUW1L.png"
								alt="" width="80px">
						</div>
						<div class="listing__hero__text">
							<h2>${lecture.name}</h2>
							<div class="listing__hero__widget">
								<div class="listing__hero__widget__rating">
									<span class="icon_star"></span> <span class="icon_star"></span>
									<span class="icon_star"></span> <span class="icon_star"></span>
									<span class="icon_star"></span>
									<!-- <span class="icon_star-half_alt"></span> -->
								</div>
							</div>
							<p>${lecture.duration}일 과정</p>
							<p><h6># ${lecture.genre}</h6></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="listing__hero__btns">
						<a href="javascript:history.back()" class="primary-btn share-btn"><i
							class="fa fa-mail-reply"></i> 뒤로가기</a> <a
							href="/online/memberlecture/${lecture.id}" class="primary-btn"><i
							class="fa fa-bookmark"></i> 수강신청</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Listing Section End -->

	<!-- Listing Details Section Begin -->
	<section class="listing-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="listing__details__text">
						<div class="listing__details__gallery">
							<div class="listing__details__gallery__pic">
								<div class="listing__details__gallery__item">
									<img class="listing__details__gallery__item__large"
										src="${pageContext.request.contextPath}/lectureThumbnail?name=${lecture.name}&thumbnail=${lecture.thumbnail}"
										alt=""> <span><i class="fa fa-camera"></i>
										${lecture.name}</span>
								</div>
							</div>
						</div>
						<div class="listing__details__about">
							<h4>Information</h4>
							<p>${lecture.introduce}</p>
							<br>
							<div class="listing__details__gallery">
								<div class="listing__details__gallery__pic">
									<div class="listing__details__gallery__item">
										<img class="listing__details__gallery__item__large"
											src="${pageContext.request.contextPath}/lectureImage?name=${lecture.name}&image=${lecture.image}"
											alt=""> <span><i class="fa fa-camera"></i>
											${lecture.name}</span>
									</div>
								</div>
							</div>
						</div>
						<div class="listing__details__about">
							<h4>Caution</h4>
							<p>${lecture.caution}</p>
							<br>
						</div>
						<div class="listing__details__amenities">
							<h4>Amenities</h4>
							<div class="row">
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/amenities/ame-1.png"
											alt="">
										<h6>Free</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/amenities/ame-2.png"
											alt="">
										<h6>Online</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/amenities/ame-6.png"
											alt="">
										<h6>Coupons</h6>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-6">
									<div class="listing__details__amenities__item">
										<img
											src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/amenities/ame-8.png"
											alt="">
										<h6>Community</h6>
									</div>
								</div>
							</div>
						</div>

						<div class="listing__details__comment">
							<h4>Comment</h4>
							<div id="commentList"></div>
						</div>
						<div class="listing__details__review">
							<h4>Add Comment</h4>
							<form action="#">
								<input type="text" placeholder=<%=user_name%> id ="userName" readonly/>
								<textarea placeholder="댓글을 작성하세요." id = "comment_text"></textarea>
								<button type="button" name ="commentbtn" id="commentbtn" class="site-btn commentbtn">댓글쓰기</button>
							</form>
						</div>
					</div>
				</div>

				<!-- Instructor Section Begin -->
				<div class="col-lg-4">
					<div class="listing__sidebar">
						<div class="listing__sidebar__contact">
							<div style="position:absoulte; text-align: center; border-radius: 70%; overflow: hidden;">
								<form name="InstructorPageDo" action="${pageContext.request.contextPath}/instructorAction" method="POST">
								<input type="hidden" name="id" value="${instructor.member_id}" />
								</form>
								<a href="#" onclick="javascript:document.InstructorPageDo.submit();">
								<br>
								<img
									src="${pageContext.request.contextPath}/imageDownload?fileName=${instructor.image}"
									alt="Profile"
									style="width: 90%; max-width: 300px; height: 90%; margin: 2 auto 0; border: 1px solid #efefef; border-radius: 70%; background-repeat: no-repeat; background-size: cover; background-position: center; object-fit: cover; vertical-align: middle;">
								</a>
							</div>
							<div class="listing__sidebar__contact__text">
								<h6>강사</h6>
								<form name="InstructorPage" action="${pageContext.request.contextPath}/instructorAction" method="POST">
								<input type="hidden" name="id" value="${instructor.member_id}" />
								</form>
								<a href="#" onclick="javascript:document.InstructorPage.submit();">
								<h4>${instructor.nickname}</h4></a>
								<ul>
									<li><br></li>
									<li><span class="icon_phone"></span>${instructor.phone}</li>
									<li><span class="icon_mail_alt"></span>
										${instructor.email}</li>
									<li><span class="icon_globe-2"></span> https://hyundai.com</li>
									<li><br></li>
									<li>${instructor.introduce}</li>
								</ul>
								<div class="listing__details__review"
									style="text-align: center;">
									<button type="button" class="site-btn"
										onclick="location.href='/online/memberlecture/${lecture.id}'">
										<i class="fa fa-bookmark"></i> 수강신청
									</button>
								</div>
							</div>
						</div>
						<div class="listing__sidebar__working__hours">
							<h4>수강기간</h4>
							<ul>
								<li>NOW<span class="opening">Opening</span></li>
								<li>+ ${lecture.duration} Days<span class="closed">Closed</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Instructor Section End -->

	<!-- Footer Section Begin-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer__address">
						<ul>
							<li>
								<div class="footer__social">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-skype"></i></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">

						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved <a href="#" target="_blank">MyOnlineClass</a>
							</p>
						</div>

						<div class="footer__copyright__links">
							<a href="#">Terms</a> <a href="#">Privacy Policy</a> <a href="#">Cookie
								Policy</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.nicescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.barfiller.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/main.js"></script>
</body>

</html>