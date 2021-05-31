<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String phone = (String) session.getAttribute("phone");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="64x64"
	href="${contextPath}/resources/image/classtok_favi4fa9.png" />
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>클래스톡 :: 함께 배우는 온라인 클래스 강의, 수업, 강좌 - 클래스톡</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#lecturename').on('keyup', function() {
			$('#lecturenameCount').html("(" + $(this).val().length + " / 50)");

			if ($(this).val().length > 50) {
				$(this).val($(this).val().substring(0, 25));
				$('#lecturenameCount').html("(0 / 50)");
			}
		});

		$('#genre').on('keyup', function() {
			$('#genreCount').html("(" + $(this).val().length + " / 50)");

			if ($(this).val().length > 50) {
				$(this).val($(this).val().substring(0, 25));
				$('#genreCount').html("(0 / 50)");
			}
		});

		$('#caution').on('keyup', function() {
			$('#cautionCount').html("(" + $(this).val().length + " / 300)");

			if ($(this).val().length > 300) {
				$(this).val($(this).val().substring(0, 150));
				$('#cautionCount').html("(0 / 300)");
			}
		});

		$('#introduce').on('keyup', function() {
			$('#introduceCount').html("(" + $(this).val().length + " / 300)");

			if ($(this).val().length > 300) {
				$(this).val($(this).val().substring(0, 150));
				$('#introduceCount').html("(0 / 300)");
			}
		});

		$('#duration').on('keyup', function() {
			$('#durationCount').html("(" + $(this).val().length + " / 3)");

			if ($(this).val().length > 3) {
				$(this).val($(this).val().substring(0, 3));
				$('#durationCount').html("(0 / 3)");
			}
		});
	});
</script>

<style>
body {
	padding-top: 56px;
}

.table-content {
	display: flex;
	flex-direction: column;
	height: 80px;
	background-color: #ff0000;
}

.item {
	flex: 1;
	background-color: #ffffff;
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
}
</style>

<c:import url="header2.jsp"></c:import>
</head>
<body>
	<%
	if (id == null || id == "") {
		response.sendRedirect("login");
	}
	%>

	<div class="table-content">
		<div class="item"></div>
	</div>
	<div class="container">
		<div class="carousel-item active"
			style="height: 100%; background-image: url('${contextPath}/resources/image/background.png')">
			<div style="color: #fff; text-align: center; padding-top: 40px;">
				<p style="display: inline-block; font-size: 29px; font-weight: 500;">
					강의를 등록해주세요.</p>
				<h3 style="display: inline-block; color: red; padding-bottom: 30px;">
					.</h3>
				<br>

				<form id="register" method='POST'
					action="${contextPath}/enrollAction" enctype="multipart/form-data">
					<input type="hidden" value="${id}" name="id"> <input
						type="hidden" value="${name}" name="name"> <input
						type="hidden" value="${email}" name="email"> <input
						type="hidden" value="${phone}" name="phone">

					<div>
						<div style="width: auto;">
							<span style="position: relative; left: 40px; color: gray;">#</span>
							<input type="text" id="lecturename" name="lecturename"
								placeholder="강의명을 적어주세요." maxlength="10" autocomplete="off"
								required="required"
								style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
							<div id="lecturenameCount"
								style="display: inline; padding-left: 10px;">(0 / 50)</div>
						</div>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" id="genre" name="genre"
							placeholder="장르를 입력하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<div id="genreCount" style="display: inline; padding-left: 10px;">(0
							/ 50)</div>
					</div>
					<br>
					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="number" id="duration" name="duration"
							placeholder="수강기한일을 적어주세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<div id="durationCount"
							style="display: inline; padding-left: 10px;">(0 / 3)</div>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" id="caution" name="caution"
							placeholder="주의사항을 입력하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<div id="cautionCount"
							style="display: inline; padding-left: 10px;">(0 / 300)</div>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" id="introduce" name="introduce"
							placeholder="강의 소개를 표현하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<div id="introduceCount"
							style="display: inline; padding-left: 10px;">(0 / 300)</div>
					</div>
					<br>

					<div style="margin-left: 250px;">
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" placeholder="썸네일을 선택하세요." maxlength="25"
							autocomplete="off"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;"
							readonly> <input type="file" accept="image/*"
							name="thumbnail" required="required" style="padding-left: 10px;">
					</div>
					<br> <br>

					<div style="margin-left: 250px;">
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" placeholder="강의 사진을 선택하세요." maxlength="25"
							autocomplete="off"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;"
							readonly> <input type="file" accept="image/*"
							name="image" required="required" style="padding-left: 10px;">
					</div>
					<br> <br> <input type="submit" value="신청하기"
						style="width: 100px; border-radius: 30px; border: 0; outline: 0;">
					<br> <br>
				</form>
			</div>
		</div>
	</div>
	
		<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>