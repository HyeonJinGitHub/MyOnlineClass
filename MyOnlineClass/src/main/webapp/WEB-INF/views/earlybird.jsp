<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<c:import url="header.jsp"></c:import>
<meta charset="UTF-8">
<title>클래스팡 :: 기획전</title>

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
 		/* 타이머 */
 		var date = new Date();
 		var currentDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
		var countDownDate = new Date(currentDate).getTime() + (1000 * 60 * 60 * 24);

		var x = setInterval(function() {
			var now = new Date().getTime();
			distance = countDownDate - now;
			if (distance > 0) {
				var h = Math.floor(distance / (1000 * 60 * 60));
				var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
				var s = Math.floor((distance % (1000 * 60)) / 1000);

				
				if (String(h).length == 1) {
					h = "0" + h;
				}
				
				if (String(m).length == 1) {
					m = "0" + m;
				}
				
				if (String(s).length == 1) {
					s = "0" + s;
				}
				
				var hour = String(h).substring(0, 1);
				var hour2 = String(h).substring(1, 2);
				var minute = String(m).substring(0, 1);
				var minute2 = String(m).substring(1, 2);
				var second = String(s).substring(0, 1);
				var second2 = String(s).substring(1, 2);
				
				$('#d-day-hour').text(hour);
				$('#d-day-hour2').text(hour2);
				$('#d-day-min').text(minute);
				$('#d-day-min2').text(minute2);
				$('#d-day-sec').text(second);
				$('#d-day-sec2').text(second2);
				
				$('#d-day-hour').attr('class', 'timer');
				$('#d-day-hour2').attr('class', 'timer');
				$('#d-day-min').attr('class', 'timer');
				$('#d-day-min2').attr('class', 'timer');
				$('#d-day-sec').attr('class', 'timer');
				$('#d-day-sec2').attr('class', 'timer');
			} else {
				$('#d-day-hour').text(0);
				$('#d-day-min').text(0);
				$('#d-day-sec').text(0);
				clearTimeout(x);
			}
		});

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
				
				let pro = "location.href='${contextPath}/classdetail/";
				pro += data[key]['id'] +"'";
				
				html += "<div class='col-lg-4 mb-4 swiper-slide'>";
				html += "<div class='card h-auto' style='width: 250px; height: 130px; cursor: pointer;'";
				html += "onclick=";
				html += pro;
				html += ">";
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

<script>
	function enrollButton() {
		if ($("#button1").attr('class') === 'offClickedBox') {
			$('#button1').attr('class', 'onClickedBox');
			$('#text1').attr('class', 'enrollmentBoxInner');

			$('#button2').attr('class', 'offClickedBox');
			$('#text2').attr('class', 'deadlineBoxInner');
		}
		
		$.getJSON( "${contextPath}/cardJsonSortedByEnroll", function( data ) {
			var html = "";
			
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
				
				let pro = "location.href='classdetail/";
				pro += data[key]['id'] + "'";
				
				html += "<div class='col-lg-4 mb-4 swiper-slide'>";
				html += "<div class='card h-auto' style='width: 250px; height: 130px; cursor: pointer;'";
				html += "onclick=";
				html += pro;
				html += ">";
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
		});
	}
	
	function deadlineButton() {
		if ($("#button2").attr('class') === 'offClickedBox') {
			$('#button2').attr('class', 'onClickedBox');
			$('#text2').attr('class', 'enrollmentBoxInner');
			
			$('#button1').attr('class', 'offClickedBox');
			$('#text1').attr('class', 'deadlineBoxInner');
		}
		
		$.getJSON( "${contextPath}/cardJsonSortedByDeadline", function( data ) {
			var html = "";
			
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
				
				let pro = "location.href='classdetail/";
				pro += data[key]['id'] + "'";
				
				html += "<div class='col-lg-4 mb-4 swiper-slide'>";
				html += "<div class='card h-auto' style='width: 250px; height: 130px; cursor: pointer;'";
				html += "onclick=";
				html += pro;
				html += ">";
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
		});
	}
</script>

<style type="text/css">
.onClickedBox {
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

.timer {
	display: inline-block;
	color: white;
	background-color: black;
	width: 25px;
	height: 32px;
	line-height: 32px;
	font-size: 22px;
	font-weight: 700;
}

.colon {
	display: inline-block;
	font-size: 16px;
	font-weight: 700;
	margin-left: 5px;
	margin-right: 5px;
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
				<h2 style="font-weight: 600; display: inline-block">얼리버드 클래스</h2>
				<div style="display: inline-block; padding-left: 30px;">
					<img src="${contextPath}/resources/image/icon_earlybird_new.png" style="width: 120px; height: 76px;">
				</div>
				<p style="font-weight: 300;">매일 자정 새로운 클래스가 오픈됩니다.</p>
			</div>
			<ul style="width: 300px; height: 40px; line-height: 40px; border-radius: 30px; border: 0; outline: 0; background-color: #FFE3E4; list-style: none; font-size: 14px; font-weight:300; text-align: center; margin: 0 0 0 0; padding: 0 0 0 0;">
				<li style="display: inline-block; padding-right: 3px;">#단7일</li>
				<li style="display: inline-block; padding-right: 3px;">#아는것이힘</li>
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
						<p style="font-size: 14px;">이벤트 종료까지</p>
						<!-- 타이머 -->
						<div style="margin-bottom: 15px;">
							<div id="d-day-hour" align="center"></div>
							<div id="d-day-hour2" style="display: inline-block"></div>
							<div class="colon">:</div>
							<div id="d-day-min"  style="display: inline-block"></div>
							<div id="d-day-min2"  style="display: inline-block"></div>
							<div class="colon">:</div>
							<div id="d-day-sec"  style="display: inline-block"></div>
							<div id="d-day-sec2"  style="display: inline-block"></div>
							<div id="d-day-sec2"  style="display: inline-block"></div>
						</div>
					<div style="display: inline-block; border-bottom: 2px solid red; padding-bottom: 1px;">
						<div id="dataSize" style="font-size: 14px;"></div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class='container' style='padding-right: 70px; padding-bottom: 15px;' align="right">
		<ul id="button1" class='onClickedBox' style="margin-right: 5px; cursor: pointer;" onclick="enrollButton()">
			<li id="text1" class="enrollmentBoxInner">신규 등록</li>
		</ul>
		<ul id="button2" class='offClickedBox' style="cursor: pointer;" onclick="deadlineButton()">
			<li id="text2" class="deadlineBoxInner">마감임박</li>
		</ul>
	</div>
	<div id="detailList"></div>
		
	
	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>