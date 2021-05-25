<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="lecture" value="${lectureDTO}" />
<c:set var="instructor" value="${instructorDTO}" />
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

<script type="text/javascript">
	<script>

	function selectComment() {
		$.ajax({
			method : 'GET',
			url : "1/",
		}).done(function(data) {
			displayCommentList(data);
		});
	}

	function myCommentEvent() {
		$('.btnDeleteOk').click(function() {
			if (confirm('댓글을 정말로 삭제 하시겠습니까?')) {
				let my_com_val = '1/' + $(this).attr('myval');
				$.ajax({
					method : 'DELETE',
					url : my_com_val,
				}).done(function(data) {
					displayCommentList(data);
				});
			}
		});

		$('.btnUpdateOk')
				.click(
						function() {
							$('.btnDeleteOk').off('click');
							$('.btnUpdateOk').off('click');

							let com_id = 'com_' + $(this).attr('myval');
							let com_id_content = $('#' + com_id).html();
							$('#' + com_id)
									.html(
											'<textarea rows="3" cols="40" id="' + 
				com_id + '_content">'
													+ com_id_content
													+ '</textarea><br/>'
													+ '<input type="button" id="goUpdate_'
													+ com_id
													+ '" value="수정완료" myval="'
													+ $(this).attr('myval')
													+ '" />'
													+ '<input type="button" id="cancleUpdate_' + com_id + '" value="수정취소" />');
							$('#goUpdate_' + com_id)
									.click(
											function() {
												if ($('#' + com_id + '_content')
														.val() == "") {
													alert('수정한 내용이 없습니다.');
													$('#' + com_id + '_content')
															.focus();
													return;
												}
												let my_com_val = '1/'
														+ $(this).attr('myval');
												$
														.ajax(
																{
																	method : 'POST', //PUT방식은 data를 전송 할 수 없음
																	url : my_com_val,
																	data : {
																		com_content : $(
																				'#'
																						+ com_id
																						+ '_content')
																				.val()
																	}
																})
														.done(
																function(data) {
																	displayCommentList(data);
																});
											});
							$('#cancleUpdate_' + com_id).click(function() {
								$('#' + com_id).html(com_id_content);
								myCommentEvent();
								$('.btnUpdateOk').attr('disabled', false);
							});
						});
	}

	function displayCommentList(data) {
		var mytable = "<table border='0'><tr><td>";
		$
				.each(
						data,
						function(key, val) {
							mytable += "<table border='0'><tr><td>"
									+ val['com_no'] + ","
									+ val['userDTO']['usr_id'];
							mytable += "(" + val['userDTO']['usr_name'] + ")"
									+ "</td></tr>";
							if (val['userDTO']['usr_id'] == '${sessionScope.userInfo.usr_id}') {
								mytable += "<tr><td><span class='ui-icon ui-icon-closethick btnDeleteOk' myval='" + val['com_no'] + "' style='cursor:pointer' /></td></tr>";
								mytable += "<tr><td><span class='ui-icon ui-icon-pencil     btnUpdateOk' myval='" + val['com_no'] + "' style='cursor:pointer' /></td></tr>";
							}
							mytable += "<tr><td><span id='com_" + val['com_no']+ "'>"
									+ val['com_content']
									+ "</span></td></tr></table><br/>";
						});
		mytable += "</td></tr></table>";

		$('#commentDisplay').html(mytable);
		myCommentEvent();
	}

	$(document).ready(function() {
		selectComment();

		$('#btnCommentOk').click(function() {
			let com_content = $('#com_content').val();
			if (com_content == "") {
				alert('먼저 댓글을 입력하세요');
				$('#com_content').focus();
				return;
			}
			$.ajax({
				method : 'POST',
				url : "1/",
				data : {
					com_content : $('#com_content').val()
				}
			}).done(function(data) {
				displayCommentList(data);
				$('#com_content').val('');
			});
		});
	});

	function confirm_delete() {
		if (confirm('정말로 삭제하시겠습니꺄?')) {
			location.href = 'delete';
		}
	}
</script>

</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin 
    <header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="./index.html">Home</a></li>
                                <li class="active"><a href="./listing.html">Listing</a></li>
                                <li><a href="#">Categories</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./about.html">About</a></li>
                                        <li><a href="./listing-details.html">Listing Details</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="./contact.html">Contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">Blog</a></li>
                                <li><a href="#">Shop</a></li>
                            </ul>
                        </nav>
                        <div class="header__menu__right">
                            <a href="#" class="primary-btn"><i class="fa fa-plus"></i>Add Listing</a>
                            <a href="#" class="login-btn"><i class="fa fa-user"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->

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
							<div>수강 기간 : ${lecture.duration}</div>
							<p>${lecture.genre}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="listing__hero__btns">
						<a href="#" class="primary-btn share-btn"><i
							class="fa fa-mail-reply"></i> 뒤로가기</a> <a href="#"
							class="primary-btn"><i class="fa fa-bookmark"></i> 수강신청</a>
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
										src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/lecture/${lecture.image}.jpg"
										alt=""> <span><i class="fa fa-camera"></i>
										${lecture.image} </span>
								</div>
							</div>
						</div>
						<div class="listing__details__about">
							<h4>Information</h4>
							<p>강좌 소개</p>
							<p>${lecture.introduce}</p>
							<div class="listing__details__gallery">
								<div class="listing__details__gallery__pic">
									<div class="listing__details__gallery__item">
										<img class="listing__details__gallery__item__large"
											src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/lecture/${lecture.image}detail.jpg"
											alt=""> <span><i class="fa fa-camera"></i>
											${lecture.image}detail </span>
									</div>
								</div>
							</div>
						</div>
						<div class="listing__details__about">
							<h4>Caution</h4>
							<p>주의 사항 | 조건 | 준비물</p>
							<p>${lecture.caution}</p>
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
							<div class="listing__details__comment__item">
								<div class="listing__details__comment__item__pic">
									<img
										src="${pageContext.request.contextPath}/resources/vendor/bootstrap/img/listing/details/comment_icon.png"
										alt="">
								</div>
								<div class="listing__details__comment__item__text">
									<div class="listing__details__comment__item__rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<span>Comments.regdate(lecture_id 같을때)</span>
									<h5>Comments.member_Id.name</h5>
									<p>Comments.content</p>
									<ul>
										<li><i class="fa fa-hand-o-right"></i> Like</li>
										<li><i class="fa fa-share-square-o"></i> Reply</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="listing__details__review">
							<h4>Add Comment</h4>
							<form action="#">
								<input type="text" placeholder="name"> <input
									type="text" placeholder="password">
								<textarea placeholder="content"></textarea>
								<button type="submit" class="site-btn">댓글쓰기</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="listing__sidebar">
						<div class="listing__sidebar__contact">
							<div class="listing__sidebar__contact__map">
								<img
									src="https://media.istockphoto.com/vectors/vector-realistic-blank-photo-frame-vector-id1143475054?b=1&k=6&m=1143475054&s=170x170&h=UXtqQrMb3iqNNm1eOQevmWmN91uISK2ZImZvgLOzvlA="
									alt="" height="100px">
							</div>
							<div class="listing__sidebar__contact__text">
								<h6>담당 강사</h6>
								<h4>${instructor.name}</h4>
								<ul>
									<li><span class="icon_phone"></span>${instructor.phone}</li>
									<li><span class="icon_mail_alt"></span> ${instructor.name}
										@ gmail.com</li>
									<li><span class="icon_globe-2"></span> https://hyundai.com</li>
									<li>────────────</li>
									<li>${instructor.introduce}</li>
								</ul>
								<div class="listing__details__review">
									<button type="submit" class="site-btn">수강신청</button>
								</div>
							</div>
						</div>
						<div class="listing__sidebar__working__hours">
							<h4>Date</h4>
							<ul>
								<li>${lecture.duration}<span class="opening">Opening</span></li>
								<li>${lecture.duration}+1개월<span class="closed">Closed</span></li>
								<li>${lecture.duration}+3개월<span class="closed">Closed</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Listing Details Section End -->

	<!-- Footer Section Begin-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer__address">
						<ul>
							<li><span>Connect Us:</span>
								<div class="footer__social">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-skype"></i></a>
								</div></li>
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