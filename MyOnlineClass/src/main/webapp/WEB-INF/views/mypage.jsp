<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지 | Hyundai ClassTok</title>
<c:import url="header.jsp"></c:import>
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
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth'
		});
		calendar.render();
	});
</script>
 <script>
	$(document).ready(function() {
		var id = "${id}";
		$.ajax({
			type: "POST",
			url: "getInstFlag",
			data: {id : id},
			success: function(data) {
				nickname = data['nickname'];
			
				if (nickname) {
					$('#management').show();
				} 
				
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log("실패");
			}
		});
	});
</script>
</head>
<body>
	<c:set var="up" value=".." />
	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			MyPage <small>마이페이지</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/">홈</a></li>
			<li class="breadcrumb-item active">마이페이지</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/"
						class="list-group-item">홈</a> <a
						href="${pageContext.request.contextPath}/mylecture"
						class="list-group-item">수강정보</a> 
						<a id="management" style="display:none" href="${pageContext.request.contextPath}/lectureManagement" class="list-group-item">강좌관리</a>
						<a
						href="${pageContext.request.contextPath}/mypage"
						class="list-group-item">정보수정</a> <a
						href="${pageContext.request.contextPath}/changePassword"
						class="list-group-item">비밀번호 변경</a> <a
						href="${pageContext.request.contextPath}/delete"
						class="list-group-item">회원 탈퇴</a> <a
						onclick="return logoutAction()"
						href="${pageContext.request.contextPath}/logout"
						class="list-group-item">로그아웃</a>
				</div>
			</div>

			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>정보수정</h2>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/">홈</a></li>
					<li class="breadcrumb-item active">정보수정</li>
				</ol>

				<div class="jumbotron" style="height: 80%; overflow: hidden;">
					<form action="${pageContext.request.contextPath}/updateAction"
						class="was-validated" method="post">
						<div class="form-group"
							style="width: 70%; margin: 0 auto; overflow: hidden;">
							<label for="uname" style="float: left;">아이디&nbsp; &nbsp;
								&nbsp;</label> <input type="text" class="form-control" id="uid"
								style="width: 58%; float: left;" name="uid" disabled="disabled"
								value="${id}"> <input type="hidden" name="uname"
								value="${id}">
						</div>
						<br />
						<div class="form-group"
							style="width: 70%; margin: 0 auto; overflow: hidden;">
							<label for="uname" style="float: left;">이름&nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp;</label> <input type="text" class="form-control"
								id="uname" style="width: 58%; float: left;" name="uname"
								disabled="disabled" value="${name}"> <input
								type="hidden" name="uname" value="${name}">
						</div>
						<br />
						<div class="form-group" style="width: 70%; margin: 0 auto;">
							<label for="uname" style="float: left; margin-top: 5px;">이메일&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;</label> <input type="email" class="form-control"
								id="uemail" style="width: 58%; float: left;"
								placeholder="이메일 입력" name="uemail" required value="${email }" />
							<input type="button" class="btn btn-primary"
								onclick="duplicationEmail();"
								style="width: 20%; margin-left: 10px; float: left; border-color: #343a40; background-color: #343a40;"
								value="중복확인" />
							<div class="invalid-feedback"
								style="float: left; margin-left: 70px; margin-bottom: 20px; clear: both;">이메일을
								입력해주세요.</div>
						</div>
						<br />
						<div class="form-group"
							style="width: 70%; margin: 0 auto; margin-top: 40px;">
							<label for="uname" style="float: left; margin-top: 5px;">전화번호&nbsp;&nbsp;</label>
							<input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
								class="form-control" id="uphone"
								style="width: 58%; float: left;"
								placeholder="전화번호 입력(ex 010-1234-5678)" name="uphone" required
								value="${phone }"> <input type="button"
								class="btn btn-primary" onclick="duplicationPhone();"
								style="width: 20%; margin-left: 10px; float: left; border-color: #343a40; background-color: #343a40;"
								value="중복확인" />
							<div class="invalid-feedback"
								style="float: left; margin-left: 70px; margin-bottom: 20px; clear: both;">전화번호를
								입력해주세요.</div>
						</div>
						<br />
						<div class="form-group"
							style="width: 70%; margin: 0 auto; margin-top: 40px;">
							<label for="uname" style="float: left; margin-top: 5px;">비밀번호&nbsp;&nbsp;</label>
							<input type="password" style="width: 58%; float: left;"
								class="form-control" id="pwd" placeholder="비밀번호 입력" name="pwd"
								required>
							<div class="invalid-feedback"
								style="float: left; margin-left: 70px; margin-bottom: 20px; clear: both;">현재
								비밀번호를 입력해주세요.</div>
						</div>
						<br />
						<div class="form-group"
							style="width: 50%; margin: 10px auto; margin-top: 40px;">
							<button type="submit" class="btn btn-primary"
								style="width: 100%; border-color: #343a40; background-color: #343a40;">수정</button>
						</div>
						<br />
					</form>
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div id='calendar'></div>
	</div>
	<c:import url="footer.jsp"></c:import>

	<!--  Bootstrap core JavaScript-->
<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<!-- /.container -->
	<script type="text/javascript">
		var emailck = 0;
		function duplicationEmail() {
			var useremail = $("#uemail").val();
			$.ajax({
				async : false,
				type : 'POST',
				data : {
					"email" : useremail
				},
				url : '/online/check/emailcheck',
				success : function(data) {
					if (data > 0) {
						alert('이미 사용 중인 이메일입니다. 다른 이메일을 입력해주세요.');
						$("#uemail").focus();
					} else {
						alert('사용가능한 이메일입니다.');
						$('#uemail').focus();
						emailck = 1;
					}
				},
				error : function(error) {
					alert('error : ' + error);
				}
			});
		}
		var phoneck = 0;
		function duplicationPhone() {
			var userphone = $("#uphone").val();
			$.ajax({
				async : false,
				type : 'POST',
				data : {
					"phone" : userphone
				},
				url : '/online/check/phonecheck',
				success : function(data) {
					if (data > 0) {
						alert('번호가 사용중입니다. 다른 번호를 입력해주세요.');
						$("#uphone").focus();
					} else {
						alert('사용가능한 번호입니다.');
						$('#uphone').focus();
						emailck = 1;
					}
				},
				error : function(error) {
					alert('error : ' + error);
				}
			});
		}
		function logoutAction() {
			var result = confirm('로그아웃 하시겠습니까?');
			if (result) {
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>