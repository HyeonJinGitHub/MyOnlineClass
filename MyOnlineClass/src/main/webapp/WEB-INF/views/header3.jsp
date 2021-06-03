<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64" href="${contextPath}/resources/image/favicon.png" />
<meta charset="UTF-8">
<title>클래스팡 :: MyOnlineClass</title>

<!-- 폰트 스타일 시트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트 스트랩 스타일 시트 -->
<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	  crossorigin="anonymous">


  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- Autocomplete -->
<script type="text/javascript">
/*   
   $(function() {
      $( "#searchKey" ).autocomplete({
        source: '${contextPath}/autoComplete',
        delay: 200,
        select: function(event, ui) {
        	var url = '${contextPath}/search/'
        	window.location.href = url + JSON.stringify(ui.item.value).replace(/\"/gi, "");
        }
      });
   }); 
*/
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

.custom-card-body {
	-ms-flex: 1 1 auto;
  	flex: 1 1 auto;
  	min-height: 1px;
  	padding: 0.3rem;
  	font-size: 15px;
}

}
</style>

<style>
html,
body {
	position: relative;
  	height: 100%;
}

body {
	background: #121212;
  	font-family: Noto Sans KR, sans-serif, Helvetica Neue, Helvetica, Arial !important;
  	font-size: 14px;
  	color: #000;
  	margin: 0;
  	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
  	font-size: 18px;
  	background: #fff;

  /* Center slide text vertically */
 	display: -webkit-box;
  	display: -ms-flexbox;
 	display: -webkit-flex;
 	display: flex;
  	-webkit-box-pack: center;
  	-ms-flex-pack: center;
  	-webkit-justify-content: center;
  	justify-content: center;
  	-webkit-box-align: center;
  	-ms-flex-align: center;
  	-webkit-align-items: center;
  	align-items: center;
}

.swiper-slide img {
	display: block;
  	width: 100%;
  	height: 100%;
  	object-fit: cover;
}

.swiper-button-prev {
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
	filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-next {
	background-repeat: no-repeat;
	background-size: 100% auto;
	background-position: center;
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
	filter: opacity(.5) dropshadow(0 0 0 gray);
}

.swiper-button-prev:hover {
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
	filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-next:hover {
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
	filter: opacity(.5) dropshadow(0 0 0 black);
}

.swiper-button-prev::after {
	display: none;
}

.swiper-button-next::after {
	display: none;
}
</style>

<style>
.my-box {
	border: 1px solid #ff5a5f;
	width: 80px;
	height: 25px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 5%;
    bottom: 80px;
    display: none;
    
/* 화면 레이어 최상단으로 MOVE_TOP_BTN을 표시 */
    z-index: 999;
}

::placeholder{
	color: white;

}
</style>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #121212;">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/">
				<img src="${contextPath}/resources/image/Classpang_logo_white.png" alt="클래스팡" class="logoImage">
			</a>
			
			<div class="ui-widget" style="padding-top: 15px;">
				<form id="searchClass" method='GET' action="${contextPath}/search">
            		<label class="header__search-label" for="searchKey" >
                		<input id="searchKeyNav" name="searchKey" type="text" placeholder="클래스나 코치를 검색해보세요" maxlength="20" autocomplete="off" onfocus="this.value=''" style="border:0; outline:0; width: 200px; padding-left:12px; color:white; font-size: 13px; background-color: hsla(0,0%,100%,.1); border-radius: 30px;">
						<button type="submit" style="border:0; outline:0; background-color: #121212;">
							<font color="white">
							<i class="fas fa-search" onclick="search"></i>
							</font>
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
						<a class="nav-link" href="${contextPath}/open" ><font color="white">클래스 개설</font>
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="${contextPath}/alarm"><font color="white">
							<i class="far fa-bell"></i>
							</font>
						</a>
					</li>
					<li class="nav-item active">
						<font color="white">
						<a class="nav-link" href="${contextPath}/login" style="padding-right: 40px;">
							<font color="white">
							<i class="fas fa-user"></i>
							</font>
						</a>
						</font>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
</head>
<!-- Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>

	<!-- Bootstrap core CSS -->
	<link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!--  Custom styles for this template-->
	<link href="${contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
	

</html>