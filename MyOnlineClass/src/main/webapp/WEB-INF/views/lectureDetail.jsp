<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String user = (String) session.getAttribute("id");
%>
<c:set var="lecture" value="${lectureDTO}" />
<c:set var="instructor" value="${instructorDTO}" />
<c:set var="comment" value="${commentDTO}" />
<!DOCTYPE html>
<html>
<head>
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

	function getCommentList() {
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
								html += "<p>" + data[i].content + "</p>";
								html += "<ul>";
								html += "<li><i class='fa fa-hand-o-right'></i> Like</li>";
								html += "<li><i class='fa fa-share-square-o'></i> Reply</li>";
								html += "</ul>" + "</div>" + "</div>";
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
	
	$(#commentbtn).on("click",function() {
		var content_text = $("#newReplyText");
		var content_textVal = content_text.val();
		$.ajax({ 
			type : "post", 
			url : "${path}/replies", 
			headers : { "Content-type" : "application/json", "X-HTTP-Method-Override" : "POST" }, 
			dataType : "text", 
			data : JSON.stringify({ article_no : article_no, reply_text : reply_textVal, reply_writer : reply_writerrVal }), 
			success : function (result) { 
				// 성공적인 댓글 등록 처리 알림 
				if (result == "regSuccess") {
					alert("댓글 등록 완료!"); 
				}
				getReplies(); // 댓글 목록 출력 함수 호출 
				reply_text.val(""); // 댓글 내용 초기화 
				reply_writer.val(""); // 댓글 작성자 초기화 
			} 
		});
	});
</script>

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<div>
		<!-- Header Section Begin -->

		<!-- Header Section End -->
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
									<span class="icon_star-half_alt"></span>
								</div>
							</div>
							<div>${lecture.duration}일 과정</div>
							<p>${lecture.genre}</p>
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
								<input type="text" placeholder="name">
								<textarea placeholder="content"></textarea>
								<button type="button" id="commentbtn" class="site-btn">댓글쓰기</button>
							</form>
						</div>
					</div>
				</div>

				<!-- Instructor Section Begin -->
				<div class="col-lg-4">
					<div class="listing__sidebar">
						<div class="listing__sidebar__contact">
							<div style="width: 100%; height: 100%; text-align: center;">
								<img
									src="${pageContext.request.contextPath}/imageDownload?fileName=${instructor.image}"
									alt="Profile"
									style="width: 100%; max-width: 300px; margin: 2px auto 0; border: 1px solid #efefef; border-radius: 70%; background-repeat: no-repeat; background-size: cover; background-position: center; vertical-align: middle;">
							</div>
							<div class="listing__sidebar__contact__text">
								<h6>강사</h6>
								<h4>${instructor.nickname}</h4>
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