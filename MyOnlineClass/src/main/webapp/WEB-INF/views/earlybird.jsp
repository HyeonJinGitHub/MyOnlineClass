<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<c:import url="header.jsp"></c:import>
<meta charset="UTF-8">
<title>클래스톡 :: 기획전</title>

<!-- Swiper API -->
<link rel="stylesheet"
	  href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- jquery 를 이용하여 화면 맨위로 자연스럽게 올라가는 TOP 버튼 만들기 -->
<script>
    $(function() {
    	$('#MOVE_TOP_BTN').show();
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
//                 $('#MOVE_TOP_BTN').fadeIn();
            } else {
//                 $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        }); 
    });
</script>

<script>
	$(document).ready(function() {
		$.getJSON( "${contextPath}/cardJsonWithKeyword", {keyword : 'all'}, function( data ) {
			var html = "";

			var dataSizeInt = Object.keys(data).length;
			var dataSize = String(dataSizeInt) + "개 클래스";
			
			html += "<div class='container'>";
			html += "<div class='row'>";
			
			$.each( data, function( key, val ) {
				id = data[key]['id'];
				thumbnail = data[key]['thumbnail'];
				lectureName = data[key]['lectureName'];
				$.ajax({
					type: "GET",
					url: "thumbnailDownload",
					data: {fileName : thumbnail, lectureName : lectureName},
					success : function(data) {
					},
					error : function() {
					}
				});
				
				let link = '/online/thumbnailDownload?fileName=';
				link += thumbnail;
				link += '&';
				link += 'lectureName=';
				link += lectureName;
				
				let pro = "location.href='classDetail/";
				pro += data[key]['id'] + "'";
				
				html += "<div class='col-lg-4 mb-4 swiper-slide'>";
				html += "<div class='card h-auto' style='width: 250px; height: 130px; cursor: pointer;'>";
				html += "<img class='card-img-top' style='height: 200px;' alt='Card image' src='" + link + "'>";
				html += "<div class='custom-card-body' style='width: 300px; height: 70px;'>";
				html += "<p style='text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;'>" + data[key]['lectureName'] + "</p>"; 
				html += "<p style='text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;'>" + data[key]['nickname'] + "</p>";
				html += "</div>"
				html += "</div>"
				html += "</div>"
			});
			
			html += "</div>"
			
			$("#detailList").html(html);
			$("#dataSize").html(dataSize);
		});
	});
</script>

<style>
.onClikedBox {
	width: 74px; 
	height: 34px; 
	line-height: 34px; 
	border-radius: 30px; 
	font-size: 12px; 
	font-weight:300; 
	text-align: center; 
	margin: 0 0 0 0; 
	padding: 0 0 0 0; 
	border: 1px solid #FF5A5F;
	display: inline-block; 
	list-style: none;
}

.offClickedBox {
	width: 74px; 
	height: 34px; 
	line-height: 34px; 
	background-color:#EAEAEA; 
	border-radius: 30px; 
	font-size: 12px; 
	font-weight:300; 
	text-align: center; 
	margin: 0 0 0 0; 
	padding: 0 0 0 0; 
	border: 1px solid #EAEAEA;
	display: inline-block; 
	list-style: none;
}

.enrollmentBoxInner {
	color: #FF5A5F;
}

.deadlineBoxInner {
	color: #767676;
}
</style>

</head>
<body>
	<!-- Move TOP Icon -->
	<a id="MOVE_TOP_BTN" href="#">
		<img src="${contextPath}/resources/image/icon_move_top.png">
	</a>
	
	<div class="container" style="padding-top: 50px; padding-bottom: 30px; padding-left: 100px;">
		<div style="padding-right: 28px; float: left;">
			<div>
				<h2 style="font-weight: 600; display: inline-block">얼리버드 특가</h2>
				<div style="display: inline-block; padding-left: 30px;">
					<img src="${contextPath}/resources/image/icon_earlybird_new.png" style="width: 120px; height: 76px;">
				</div>
				<p style="font-weight: 300;">매일 자정 새로운 클래스가 오픈됩니다.</p>
			</div>
			<ul style="width: 300px; height: 40px; line-height: 40px; border-radius: 30px; border: 0; outline: 0; background-color: #FFE3E4; list-style: none; font-size: 14px; font-weight:300; text-align: center; margin: 0 0 0 0; padding: 0 0 0 0;">
				<li style="display: inline-block; padding-right: 3px;">#단7일</li>
				<li style="display: inline-block; padding-right: 3px;">#최저가혜택</li>
				<li style="display: inline-block; padding-right: 3px;">#리뷰는필수</li>
				<li style="display: inline-block; padding-right: 3px;">#배움의시작</li>
			</ul>
		</div>
		<div id="imageList" style="float: right; padding-top: 55px; padding-right: 120px;"></div>
	</div>
		<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active"
					style="height: 250px; background-color: white;">
					<div style="text-align: center; padding-top: 40px;">
						<p
							style="display: inline-block; font-size: 29px; font-weight: 500;">
							이벤트 종료까지</p>
						<h3
							style="display: inline-block; color: red; padding-bottom: 30px;">
							.</h3>
						<div>
							<p>타이머</p>
						</div>
						<div id="dataSize"></div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class='container' style='padding-right: 70px; padding-bottom: 15px;' align="right">
		<ul class="onClikedBox" style="margin-right: 5px;">
			<li class="enrollmentBoxInner">신규등록</li>
		</ul>
		<ul class="offClickedBox">
			<li class="deadlineBoxInner">마감임박</li>
		</ul>
	</div>
		<div id="detailList"></div>
		
	
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>