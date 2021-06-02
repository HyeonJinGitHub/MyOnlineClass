<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<c:import url="header.jsp"></c:import>
<meta charset="UTF-8">
<title>클래스톡 :: 기획전</title>

<script type="text/javascript">
// 	alert('${keyword}');
</script>

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
	function categorySearch(category) {
		var url = '${contextPath}/search/';
		location.href = url + category;
	}
</script>

<script>
	$(document).ready(function() {
		$.getJSON( "${contextPath}/cardJsonWithKeyword", {keyword : '${keyword}'}, function( data ) {
			var html = "";

			var dataSizeInt = Object.keys(data).length;
			var dataSize = String(dataSizeInt) + "건"; 			
			
			html += "<div class='container'>";
			html += "<h5 style='display: inline-block; font-size: 20px; font-weight: 300;'>" + "검색결과" + "</h5>";
			html += "<h5 style='display: inline-block; margin-left: 5px; padding-bottom: 30px; font-size: 20px; font-weight: 500;'>" + dataSize + "</h5>";
			html += "</div>";
			
			if (dataSizeInt == 0) {
				html += "<section class='py-5'>";
				html += "<div class='container' align='center' style='margin-top: 50px;'>";
				html += "<p>검색하신 단어와 관련된 클래스를 찾지 못했어요.</p>";
				html += "<p>아래에 추천 드리는 클래스들은 어떠세요?</p>";
				html += "</div>";
				html += "<div class='container' style='margin-top: 50px;'>";
				html += "<h5 style='display: inline-block; padding-bottom: 30px; font-size: 20px; font-weight: 500px;'>";
				html += "다른 관심사에 도전해보세요.";
				html += "</h5>";
				html += "</div>";
				html += ""
				
				html += "<div class='container'>";
				html += "<div class='row' style='margin-left: 3px;'>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('운동')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/R1M0BHQbOWruXtgj.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>운동</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('라이프스타일')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/2EA29I1A3zshSlKX.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>라이프스타일</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('요리')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/vyoeoLhzJ4N1jQmd.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>요리</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('미술')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/ywzTGhQObpLfQ6lH.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>미술</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('커리어')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/p4m7pzeWxon33Ifn.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>커리어</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('공예')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/s8yShBULMq85PLiZ.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>공예</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('사진')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/T6BTV6lavBmdgR3g.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>사진</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('음악')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/E4CGKWC7PoNg1YyI.png' alt='Card image' style='width: 70px; height: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>음악</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('외국어')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/LXAYO1Hc4pXyYaOj.png' alt='Card image' style='width: 70px; height: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>외국어</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('교육')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/9A2UrIdMXHc2rLxM.png' alt='Card image' style='width: 70px; height: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>교육</p>";
				html += "</div>";
				html += "</div>";
				html += "<div class='col-lg-1 mb-4' style='border-radius: 15px; width: 70px; margin-left: 13px; margin-right: 13px;' onclick=categorySearch('')>";
				html += "<div class='card h-auto' align='center' style='border-radius: 15px; width: 70px; border-style: none; cursor: pointer;'>";
				html += "<img class='card-img-top' src='${contextPath}/resources/genre/icon_search_all.png' alt='Card image' style='width: 70px; border-radius: 15px;'>";
				html += "<p style='text-align: center; padding-top: 5px; font-weight: bold; font-size: 11.5px; margin-bottom: 0px; color: gray'>전체보기</p>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
				html += "</div>";
			}

			else {
			
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
					html += "<div class='card h-auto' style='width: 300px; height: 200px; box-shadow: 2.3px 2.3px lightgray; cursor: pointer;'";
					html += "onclick=";
					html += pro;
					html += ">";
					html += "<img class='card-img-top' style='height: 200px;' alt='Card image' src='" + link + "'>";
					html += "<div class='custom-card-body' style='width: 300px; height: 50px;'>";
					html += "<p style='text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;'>" + data[key]['lectureName'] + "</p>"; 
					html += "<p style='text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;'>" + data[key]['nickname'] + "</p>";
					html += "</div>";
					html += "<div class='custom-card-body' style='width: 300px; height: 40px; text-align: left;'>";
					html += "<p style='text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;'>" + data[key]['participants'] + "</p>";
					html += "</div>"
					html += "</div>"
					html += "</div>"
				});
			
				html += "</div>"
			}
			
			$("#detailList").html(html);
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
	list-style: none;
}

.custom-card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.3rem;
	font-size: 15px;
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
</style>

</head>

<body style="background-color: white;">
	<!-- Move TOP Icon -->
	<a id="MOVE_TOP_BTN" href="#"> 
		<img src="${contextPath}/resources/image/icon_move_top.png">
	</a>
	
	<!-- Content section -->
	<section class="py-5">
		<div id="detailList"></div>
	</section>
</body>
</html>