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

<title>신상품 | Hyundai Cosmetic</title>


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
		style="background-image: url('https://static.mynunc.com/web/fo/static/images/common/img-page-introduction-new.png');">
	<!-- 	Put anything you want here! There is just a spacer below for demo purposes! -->
		<div style="height: 100px;">
		</div>
	</div>
	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>신상품 모음</h1>
			<p class="lead">#따끈따끈 #뉴페이스</p>
		
		<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/big/202104/90d8a3b7f098b1c6bcf6412fb09b87fe.jpg"
								style="width: 100%;">
							<p class="lead">제로 벨벳 틴트</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/extra/big/202102/9ae073ba4dead0a0ed1d1187033aafe8.jpg"
								style="width: 100%;">
							<p class="lead">제로 매트 립스틱</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/big/202102/bff74d92f685501865f2652d40f28dba.jpg"
								style="width: 100%;">
							<p class="lead">한올 플랫/샤프 브로우</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/goods/top/21/04/19/04/BO00111973/0000219085.jpg"
								style="width: 100%;">

							<p class="lead">셀로니아 시그니처 바이오 아쿠아 카밍 젤 크림</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/goods/top/21/04/22/09/BO00112011/0000220732.jpg"
								style="width: 100%;">
							<p class="lead">원데이즈유 시카밍 앰플 세럼</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/extra/big/20200312/b3d5ff64c73201aa06526513884b25ce.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 베러 댄 치크</p>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>

	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>HOT 모음집</h1>
			<p class="lead">#품절임박 #효과보장</p>

			<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/extra/big/202011/67ae12e01d9e9ea13deda066e573fb25.jpg"
								style="width: 100%;">
							<p class="lead">SKIN TUNE VEGAN COVER CUSHION</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/big/202011/456fb6de6c9dd283539f11ffa4d8e8ab.jpg"
								style="width: 100%;">
							<p class="lead">BEAMBALM STICK 02 크림 빔밤</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/big/202011/abef1f213d32714cc3b1a2c3ba5b5030.jpg"
								style="width: 100%;">
							<p class="lead">HOLIDAY KIT 01 핑크</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/extra/big/202102/7b562863cc3afac664e2e7b2a5476067.jpg"
								style="width: 100%;">

							<p class="lead">아이 비건 클린 래쉬 마스카라</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/big/202101/30ebd67014aee85115f0ffcc8b350efc.jpg"
								style="width: 100%;">
							<p class="lead">어뮤즈 에코백 Vol.1 복숭아</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/big/202010/923169be102b0cfb6d844b0eac38656f.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 글래스팅 워터 틴트</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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