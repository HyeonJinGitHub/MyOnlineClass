<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64" href="${contextPath}/resources/image/classtok_favi4fa9.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title> 클래스톡 :: 함께 배우는 온라인 클래스 강의, 수업, 강좌 - 클래스톡 </title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(function() {
	  $( "#searchKey" ).autocomplete({
	    source: '${contextPath}/move/popular',
	    delay: 200,
	    select: function(event, ui) {
	    	window.location.href = "detail?reserve=" + JSON.stringify(ui.item.value).replace(/\"/gi, "");
	    }
	  });
});
</script>

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

.logoImage {
	width: 120px;
	height: auto;
	object-fit: cover;		
}

.ul {
	list-style:none;	
}

}

</style>


<!-- Bootstrap core CSS -->
<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--  Custom styles for this template-->
<link href="${contextPath}/resources/css/full-width-pics.css" rel="stylesheet">


</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/move/home">
				<img src="${contextPath}/resources/image/ClassTok_logo.png" alt="클래스톡" class="logoImage">
			</a>
			<div class="ui-widget" style="padding-top: 15px;">
			<form id="searchClass" method='GET' action="${contextPath}/move/popular">
                    <label class="header__search-label" for="searchKey" >
                        <input id="searchKey" name="searchKey" type="search" name="searchKey" placeholder="클래스나 코치를 검색해보세요" autocomplete="off" onfocus="this.value=''" style="border:0; outline:0; width: 250px;">
						<button type="submit" style="border:0; outline:0; background-color: white;">
							<i class="fas fa-search" onclick="search"></i>
						</button>
                    </label>
            </form>
            </div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="${contextPath}/move/popular">클래스 개설
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item">
						<c:if test="${id==null }">
							<a class="nav-link" href="${contextPath}/move/login">로그인</a>
						</c:if>
					</li>
					<c:if test="${id!=null }">
						<li class="nav-item">
							<a class="nav-link" href="${contextPath}/move/mypage">마이페이지 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${contextPath}/member/logout">로그아웃 </a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" style="padding-top:50px; padding-bottom: 30px;">
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/move/popular/" style="color: black; text-decoration: none;">
				<i class="far fa-bell"></i>
					오픈알림
			</a>
		</div>
		
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/move/popular/" style="color: black; text-decoration: none;">
				<i class="far fa-gem"></i>
					기획전
			</a>
		</div>
		<div style="display: inline; padding-right: 28px;">
			<a href="${contextPath}/move/popular/" style="color: black; text-decoration: none;">
				<i class="fas fa-hand-holding-usd" style="display: inline-block;"></i>
				<div style="display: inline-block; border-bottom: 2px solid red; padding-bottom: 3px;">
					얼리버드 특가
				</div>
			</a>
		</div>
	</div>
	
	<header>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active" 
					style="height: 250px; background-image: url('${pageContext.request.contextPath}/resources/image/background.png')">
					<div style="color: #fff; text-align: center; padding-top: 65px;">
						<h3 style="display: inline-block;">
							원하시는 클래스를 찾아보세요
						</h3>
						<h3 style="display: inline-block; color: red; padding-bottom: 30px;">
							.
						</h3>
						<br>
						<div>
						<form method='GET' id="moveToSearch" class="search-form">
							<span style="position: relative; left: 40px; color: gray;">#</span>
							<input type="text" placeholder="무엇을 배우고 싶나요?" maxlength="20" autocomplete="off" style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						</form>
						</div>
					</div>
				</div>
			</div>
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
<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>