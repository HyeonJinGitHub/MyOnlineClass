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

<title>현대 | Hyundai Cosmetic</title>


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
							href="${pageContext.request.contextPath}/move/mylecture">마이페이지 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/logout">로그아웃 </a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('${pageContext.request.contextPath}/resources/resources/photo1.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>색다른 화장품</h3>
						<p>당신이 더욱 빛나도록</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/resources/resources/photo2.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>강한 지속력</h3>
						<p>당신을 더욱 화려하게</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/resources/resources/photo3.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>생활의 필수품</h3>
						<p>당신을 더욱 생기있게</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>MD's PICK</h1>
			<p class="lead">#찐추천 #꿀템모음</p>
			<p>Si lloras pro no poder ver el sol, tus lagrimas te impediran
				ver las estrellas</p>
			
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

	<!-- Image element - set the background image for the header in the line below -->
	<div class="py-5 bg-image-full"
		style="background-image: url('https://unsplash.it/1900/1080?image=1081');">
		<!-- Put anything you want here! There is just a spacer below for demo purposes! -->
		<div style="height: 200px;"></div>
	</div>

	<!-- Content section -->
	<section class="py-5">
		<div class="container" align="center">
			<h1>NEW & HOT</h1>
			<p class="lead">#HOT모음 #이유 있는 HOT</p>
			<p>Todo lo que puedes imaginar es real</p>
		
		
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