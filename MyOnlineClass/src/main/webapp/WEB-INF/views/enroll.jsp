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

<c:import url="header2.jsp"></c:import>
<script type="text/javascript">
	$(document).ready(function() {
		$('#lecturename').on('keyup', function() {
			$('#lecturenameCount').html("(" + $(this).val().length + " / 50)");

			if ($(this).val().length > 50) {
				$(this).val($(this).val().substring(0, 25));
				$('#lecturenameCount').html("(0 / 50)");
			}
		});

	/* 	$('#genre').on('keyup', function() {
			$('#genreCount').html("(" + $(this).val().length + " / 50)");

			if ($(this).val().length > 50) {
				$(this).val($(this).val().substring(0, 25));
				$('#genreCount').html("(0 / 50)");
			}
		}); */

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


.table-content1 {
	display: flex;
	flex-direction: column;
	height: 700px;
	background-color: #ff0000;
}



</style>
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
	<section>
		<div class="carousel-item active"
			style="height: 100%; background-image: url('${contextPath}/resources/image/background.png')">
			<div style="color: #fff; text-align: center; padding-top: 40px;">
				<p style="display: inline-block; font-size: 29px; font-weight: 500;">
					강의를 등록해주세요.</p>
				<h3 style="display: inline-block; color: red; padding-bottom: 30px;">
					.</h3>
				<br>

				<form id="register" method='POST'
					action="${contextPath}/enrollAction" enctype="multipart/form-data" onsubmit="return registerAction()">
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
							<span id="lecturenameCount"
								style="display: inline; padding-left: 10px;">(0 / 50)</span>
							<span style="display: inline; visibility: hidden">0</span>
						</div>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<select name="genre" id="genre" required="required" style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
							<option selected>장르를 선택하세요.</option>
							<option>다이어트</option>
							<option>교육</option>
							<option>외국어</option>
							<option>음악</option>
							<option>커리어</option>
							<option>필라테스</option>
							<option>창업</option>
							<option>손글씨</option>
							<option>블로그</option>
							<option>육아</option>
							<option>IT</option>
							<option>기타</option>
						</select>
						<!-- <input type="text" id="genre" name="genre"
							placeholder="장르를 선택하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;"> -->
						<span id="genreCount" style="position: relative; display: inline; visibility: hidden; padding-left: 10px;">(0 / 300)</span>
						<!-- <div id="genreCount" style="display: inline; padding-left: 10px;">(0
							/ 50)</div> -->
					</div>
					<br>
					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="number" id="duration" name="duration"
							placeholder="수강기한일을 적어주세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<span id="durationCount"
							style="display: inline; padding-left: 10px;">(0 / 3)</span>
							<span style="display: inline; visibility: hidden">00</span>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" id="caution" name="caution"
							placeholder="주의사항을 입력하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<span id="cautionCount"
							style="display: inline; padding-left: 10px;">(0 / 300)</span>
					</div>
					<br>

					<div>
						<span style="position: relative; left: 40px; color: gray;">#</span>
						<input type="text" id="introduce" name="introduce"
							placeholder="강의 소개를 표현하세요." maxlength="50" autocomplete="off"
							required="required"
							style="width: 500px; height: 50px; border-radius: 30px; border: 0; outline: 0; padding-left: 40px;">
						<span id="introduceCount"
							style="display: inline; padding-left: 10px;">(0 / 300)</span>
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
					<br> 

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
		<br>
	
		</section>
	</div>
		<div class="table-content1">
		<div class="item"></div>
	</div>
	<c:import url="footer.jsp"></c:import>
		<!--  Bootstrap core JavaScript-->
<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<%-- <c:import url="footer.jsp"></c:import> --%>
	
	<script>
	function registerAction() {
		var name = $("#lecturename").val();
		var result = confirm("강의명 : " + name + "\n강의를 등록하시겠습니까?");
		if (result) {
			return true;
		} else {
			return false;
		}
	}
	</script>
	
</body>
</html>