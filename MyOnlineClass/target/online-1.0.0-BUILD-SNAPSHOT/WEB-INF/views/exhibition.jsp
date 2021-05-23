<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>기획전 | Hyundai Cosmetic</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

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

</style>


<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--  Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/move/home">Hyundai Cosmetic</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/move/popular">인기
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/new">신규</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/event">이벤트/혜택</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/exhibition">기획전</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/freeboard">커뮤니티</a></li>
					<li class="nav-item"><c:if test="${id==null }">
							<a class="nav-link" href="${pageContext.request.contextPath}/move/login">로그인</a>
						</c:if> <%-- <c:if test="${id!=null }">
							<a class="nav-link" href="../member/update">${id }님 </a>
						</c:if> --%>
						</li>
					<c:if test="${id!=null }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/move/mypage">마이페이지 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/logout">로그아웃 </a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>

		<div class="py-5 bg-image-full"
		style="background-image: url('https://static.mynunc.com/web/fo/static/images/common/img-page-introduction-sale.png');">
		<!-- Put anything you want here! There is just a spacer below for demo purposes! -->
		<div style="height: 100px;">
		</div>
	</div>
	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h3>안보면 후회! 놓칠 수 없는 혜택</h3>
			<p class="lead">#하나모여 #둘이되고</p>
		
		<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/marketing/event/20/4/26/17/0000222070.png"
								style="width: 100%;">
							<p class="lead">[어퓨] 새로운 뮤즈 탄생기념! UP TO 50% </p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/marketing/event/20/3/30/16/0000210173.png"
								style="width: 100%;">
							<p class="lead">어퓨 3월 새학기 굿즈 </p>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>

	<!-- Content section -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Hyundai
				Cosmetic</p>
		</div>
		<!-- /.container -->
	</footer>

	<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

</body>
</html>