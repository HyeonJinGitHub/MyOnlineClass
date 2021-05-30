<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% int numberOfReturnRows = (int)session.getAttribute("numberOfReturnRows"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<c:import url="header.jsp"></c:import>
<meta charset="UTF-8">
<title>클래스톡 :: 함께 배우는 온라인 클래스 강의, 수업, 강좌 - 클래스톡</title>

<script type="text/javascript">
// 	alert('${keyword}');
</script>

<!-- jquery 를 이용하여 화면 맨위로 자연스럽게 올라가는 TOP 버튼 만들기 -->
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
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
		$.getJSON( "${contextPath}/cardJsonWithKeyword", {keyword : '${keyword}'}, function( data ) {
			let refInt = 0;
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
				
				let idRef = 			'.id'.concat(refInt);
				let thumbnailRef = 		'.thumbnail'.concat(refInt);
				let lectureNameRef =	'.lecture'.concat(refInt);
				let nicknameRef = 		'.nickname'.concat(refInt);
				let participantsRef = 	'.participants'.concat(refInt);
				
				$(idRef).attr("onclick", pro);
				$(thumbnailRef).attr("src", link);
				$(lectureNameRef).text(data[key]['lectureName']);
				$(nicknameRef).text(data[key]['nickname']);
				$(participantsRef).text("참여 멤버 " + data[key]['participants']);
				
				refInt += 1;
			});
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
	<a id="MOVE_TOP_BTN" href="#"> <img
		src="${contextPath}/resources/image/icon_move_top.png">
	</a>
	
	<!-- Content section -->
	<section class="py-5">
		<div class="container">
			<h5
				style="display: inline-block; margin-top: 50px; font-size: 20px; font-weight: 300;">
				검색결과</h5>
			<h5
				style="display: inline-block; padding-bottom: 30px; font-size: 20px; font-weight: 500;">
				<%=numberOfReturnRows%>건</h5>
		</div>
		
		<div class="container">
			<div class="row">
				<%
 					for (int i = 0; i < numberOfReturnRows; i++) {
 				%> 
				<div class="col-lg-4 mb-4 swiper-slide">
					<div class="card h-auto id<%=i %>" style="width: 300px; height: 200px; box-shadow: 2.3px 2.3px lightgray; cursor: pointer;">
						<img class="card-img-top thumbnail<%=i %>" src="${contextPath}/resources/image/background2.png" alt="Card image" style="height: 200px;">
						<div class="custom-card-body" style="width: 300px; height: 50px;">
							<p class="lecture<%=i %>" style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis;">NO DATA</p>
							<p class="nickname<%=i %>" style="text-align: left; padding-left: 5px; padding-top: 5px; font-weight: bold; font-size: 13px; margin-bottom: 0px; color: gray;">NO DATA</p>
						</div>
						<div class="custom-card-body" style="width: 300px; height: 40px; text-align: left;">
 							<p class="participants<%=i %>" style="text-align: left; padding-left: 5px; padding-top: 8px; font-weight: bold; font-size: 10px; margin-bottom: 0px; color: gray;">NO DATA</p>
						</div>
					</div>
				</div>
				<%
 					} 
 				%> 
 			</div>
		</div>
	</section>
</body>
</html>