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

<title>인기제품 | Hyundai Cosmetic</title>


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
		style="background-image: url('https://static.mynunc.com/web/fo/static/images/common/img-page-introduction-ranking.png');">
	<!-- 	Put anything you want here! There is just a spacer below for demo purposes! -->
		<div style="height: 100px;">
		</div>
	</div>
	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>MD's PICK</h1>
			<p class="lead">#찐추천 #꿀템모음</p>

			
			<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://img.clubclio.co.kr/uploadFolder/WT_PRODUCT/500/QPX2C3URVYSAQ8HNEK6H.jpg"
								style="width: 100%;">
							<p class="lead">프로 아이 팔레트</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/goods/top/20/11/20/02/BO00107303/0000163204.jpg"
								style="width: 100%;">
							<p class="lead">풀샷 풀스톤 글리터</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://img.clubclio.co.kr/uploadFolder/WT_PRODUCT/500/MSNMNSC891IO7MT7TNYZ.gif"
								style="width: 100%;">
							<p class="lead">매드 벨벳 틴트</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/goods/top/20/09/07/11/BO00103107/0000044993.jpg"
								style="width: 100%;">

							<p class="lead">본투비 매드프루프 메이크업 픽서</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/big/202011/c095191216c6763250bd3c6577046e46.jpg"
								style="width: 100%;">
							<p class="lead">듀 왓 유 러브</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//amusemakeup.com/web/product/big/202104/9fad364148b67a33c341a7f9aae41a70.jpg"
								style="width: 100%;">
							<p class="lead">피톤시카 에코 세라마이드 크림</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>인기 랭킹 상품</h1>
			<p class="lead"># TOP 100 #진리</p>
		
		<div class="row">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="https://static.mynunc.com/ext/images/goods/top/20/12/21/02/BO00078512/0000170695.jpg"
								style="width: 100%;">
							<p class="lead">과즙팡 워터 블러셔</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/extra/big/20200622/73161119d26d0686779ba0b0e11c670e.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 데일리 선 필터</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/extra/big/202007/379a64f52608d78b057de63a34364a0c.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 제로 벨벳 틴트</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/big/201907/f6de31a5b48211a07a18f7f4bbdba30f.jpg"
								style="width: 100%;">

							<p class="lead">롬앤 쥬시 래스팅 틴트</p>

						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/extra/big/20200220/4ab847b48e0cd028bc3b0ea6fe7e54b1.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 베스트 틴트 에디션</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<div class="card-body">
							<img
								src="//romand.co.kr/web/product/big/202104/5cceab959c233a0efa879e75f4da2fc8.jpg"
								style="width: 100%;">
							<p class="lead">롬앤 베러 댄 팔레트</p>
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