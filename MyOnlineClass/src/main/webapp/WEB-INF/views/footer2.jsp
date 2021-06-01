<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


.footer {
	padding-top: 70px;
	padding-bottom: 0;
	background-color: #121212;
}

.footer__about {
	margin-bottom: 30px;
}

.footer__about p {
	font-size: 15px;
	line-height: 25px;
}

.footer__about__logo {
	margin-bottom: 20px;
}

.footer__about__logo a {
	display: inline-block;
}

.footer__address ul li {
	list-style: none;
	width: 50%;
	float: left;
	margin-bottom: 25px;
}

.footer__address ul li span {
	font-size: 15px;
	color: #707070;
	display: block;
	margin-bottom: 5px;
}

.footer__address ul li p {
	font-size: 15px;
	color: #323232;
	margin-bottom: 0;
	font-weight: 600;
}

.footer__address ul li .footer__social a {
	display: inline-block;
	font-size: 15px;
	color: #707070;
	margin-right: 18px;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.footer__address ul li .footer__social a:hover {
	color: #f03250;
}

.footer__address ul li .footer__social a:last-child {
	margin-right: 0;
}

.footer__widget {
	overflow: hidden;
	margin-bottom: 30px;
}

.footer__widget ul {
	width: 50%;
	float: left;
}

.footer__widget ul li {
	list-style: none;
}

.footer__widget ul li a {
	font-size: 15px;
	color: #707070;
	line-height: 32px;
}

.footer__copyright {
	background: #ffffff;
	border-top: 1px solid #e1e1e1;
	padding: 25px 0 20px;
	overflow: hidden;
	margin-top: 10px;
}

.footer__copyright__text {
	font-size: 15px;
	color: #707070;
	float: left;
}

.footer__copyright__text span,
.footer__copyright__text i,
.footer__copyright__text a {
	color: #f03250;
}

.footer__copyright__links {
	float: right;
}

.footer__copyright__links a {
	display: inline-block;
	font-size: 15px;
	color: #707070;
	margin-right: 20px;
	-webkit-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.footer__copyright__links a:hover {
	color: #f03250;
}

.footer__copyright__links a:last-child {
	margin-right: 0;
}
</style>

<!-- Google Font
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
	rel="stylesheet"> -->
<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
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
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/style.css"
	type="text/css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>

	<!-- Footer Section Begin-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">

						<div class="footer__copyright__text">
							<p>
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

</html>