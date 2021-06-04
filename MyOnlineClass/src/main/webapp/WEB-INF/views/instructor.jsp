<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href='${pageContext.request.contextPath}/resources/css/main.css'
	rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/main.js'></script>
<title>강사정보 :: MyOnlineClass</title>

<style>
body {
	padding-top: 56px;
}

.carousel-item {
	height: 65vh;
	min-height: 300px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.portfolio-item {
	margin-bottom: 30px;
}

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
</style>

<c:import url="header2.jsp"></c:import>

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
	
	<script>
	function check_instructor(no) {
		var id = "${lectureVar.value[9]}";
		$.ajax({
				type: 'POST',
				data : {id: id,
					lecture_id: no	
				},
				url : "${contextPath}/getLectureInstructorInfo",
				success : function(data) {
					nickname = data['nickname'];
					if(nickname) {
						location.href="${contextPath}/vodStreaming?no=" + no;
	  				} else {
	  					location.href="${contextPath}/classdetail/" + no;
	  				}
				},
				error : function(error) {
					alert('실패', 'error : ' + error, 'error');
				}
			});
	}
	</script>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<c:set var="up" value=".." />
	<!-- Page Content -->
	<div class="container">
		<!-- Content Row -->
		<!-- Listing Details Section Begin -->
		<section class="listing-details spad">
			<div class="container">
				<div class="row">
					<!-- Instructor Section Begin -->
					<div class="col-lg-4">
						<div class="listing__sidebar">
							<div class="listing__sidebar__contact">
								<div
									style="position: absoulte; text-align: center; border-radius: 70%; overflow: hidden;">
									<br> <img
										src="${pageContext.request.contextPath}/imageDownload?fileName=${instructorimage}"
										alt="Profile"
										style="width: 90%; max-width: 300px; height: 90%; margin: 2 auto 0; border: 1px solid #efefef; border-radius: 70%; background-repeat: no-repeat; background-size: cover; background-position: center; object-fit: cover; vertical-align: middle;">
								</div>
								<div class="listing__sidebar__contact__text">
									<h6>강사</h6>
									<h4>${nickname}</h4>
									<ul>
										<li><br></li>
										<li><span class="icon_phone"></span>${phone}</li>
										<li><span class="icon_mail_alt"></span> ${email}</li>
										<li><span class="icon_globe-2"></span>
											https://hyundai.com</li>
										<li><br></li>
										<li>${introduce}</li>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div>
				
				<div class="container" align="center">
				<div class="row">
					<c:forEach items="${lecture}" var="lectureVar">
						<div class='col-lg-4 mb-4 swiper-slide'>
						<div class="card h-auto id"
							style="width: 300px; height: 200px; box-shadow: 2.3px 2.3px lightgray; cursor: pointer; margin:20px" onclick="return check_instructor(${lectureVar.value[0]})">
							<img class="card-img-top thumbnail"
								src="${contextPath}/lectureThumbnail?name=${lectureVar.value[1]}&thumbnail=${lectureVar.value[7]}"
								alt="Card image" style="height: 200px;">
							<div class="custom-card-body" style="width: 300px; height: 50px;">
								<p class="lecture"
									style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: 900; font-size: 16px; margin-bottom: 0px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									${lectureVar.value[1]}</p>
								<p class="nickname"
									style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">
									${nickname}</p>
							</div>
							<div class="custom-card-body"
								style="width: 300px; height: 40px; text-align: left;">
								<p class="participants"
									style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">
									참여 멤버 ${lectureVar.value[8]}</p>
							</div>
						</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</div>
		</section>
		<!-- Instructor Section End -->
	</div>
	<c:import url="footer.jsp"></c:import>

	<!-- /.row -->
	<!-- /.container -->
	<!--  Bootstrap core JavaScript-->
<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>