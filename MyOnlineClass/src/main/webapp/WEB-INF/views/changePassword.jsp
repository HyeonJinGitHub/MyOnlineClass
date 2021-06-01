<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
.table-content {
	display: flex;
	flex-direction: column;
	height: 100px;
	background-color: #ff0000;
}

.item {
	flex: 1;
	background-color: #ffffff;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>비밀번호 변경 | Hyundai ClassTok</title>
<c:import url="header.jsp"></c:import>
<script>
	$(document).ready(
			function() {
				var id = "${id}";
				$.ajax({
					type : "POST",
					url : "getInstFlag",
					data : {
						id : id
					},
					success : function(data) {
						nickname = data['nickname'];

						if (nickname) {
							$('#management').show();
						}

					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
						console.log("실패");
					}
				});
			});
</script>
<script>
	function goPage() {
		var f = document.paging;
		f.id.value = "${id}"
		f.action = "${pageContext.request.contextPath}/instructorAction"
		f.method = "post"
		f.submit();
	};
</script>
</head>

<body>
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
					<form name="paging">
						<input type="hidden" name="id" />
					</form>
					<a id="management" style="display: none"
						href="${pageContext.request.contextPath}/lectureManagement"
						class="list-group-item">강좌관리</a> <a
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
					<li class="breadcrumb-item active">비밀번호 변경</li>
				</ol>

				<div class="jumbotron" style="height: 70%; overflow: hidden;">
					<form
						action="${pageContext.request.contextPath}/changePasswordAction"
						class="was-validated" method="post">
						<div class="form-group"
							style="width: 80%; margin: 0 auto; overflow: hidden;">
							<label for="uname" style="float: left; width: 30%;">아이디&nbsp;&nbsp;</label>
							<input type="text" class="form-control" id="uid"
								style="width: 70%; float: right;" name="uid" disabled="disabled"
								value="${id}">
						</div>
						<br />
						<div class="form-group" style="width: 80%; margin: 0 auto;">
							<label for="uname" style="float: left; width: 30%;">현재
								비밀번호&nbsp;&nbsp;</label> <input type="password"
								style="float: right; width: 70%;" class="form-control" id="pwd"
								placeholder="현재 비밀번호" name="pwd" required>
						</div>
						<br />
						<div class="form-group"
							style="width: 80%; margin: 0 auto; margin-top: 40px;">
							<label for="uname" style="float: left; width: 30%;">새로운
								비밀번호&nbsp;&nbsp;</label> <input type="password"
								style="float: right; width: 70%;" class="form-control"
								id="newpwd" placeholder="새로운 비밀번호" name="newpwd" required>
							<div class="invalid-feedback" style="float: right; width: 70%;">비밀번호를
								입력해주세요.</div>

						</div>
						<br />
						<div class="form-group"
							style="width: 80%; margin: 0 auto; margin-top: 40px;">
							<label for="uname" style="float: left; width: 30%;">새로운
								비밀번호(확인)&nbsp;&nbsp;</label> <input type="password"
								style="float: right; width: 70%;" class="form-control"
								id="newpwdChk" placeholder="새로운 비밀번호(확인)" name="newpwdChk"
								required>
							<div class="newpwd-1"
								style="color: red; font-size: 80%; float: right; width: 70%;">비밀번호를
								입력해주세요.</div>
						</div>
						<br />
						<div class="form-group" style="width: 50%; margin: 80px auto;">
							<button type="submit" class="btn btn-primary"
								style="width: 100%; border-color: #343a40; background-color: #343a40;"
								id="updateButton">수정</button>
						</div>
						<br />
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:import url="footer.jsp"></c:import>
	<script>
		$("#newpwd").keyup(function() {
			$("#updateButton").attr("disabled", true);
			$(".newpwd-1").text("");
		});
		$("#newpwdChk").keyup(function() {
			if ($(this).val() === $("#newpwd").val()) {
				$(".newpwd-1").text("비밀번호와 일치합니다.").css("color", "green");
				$("#updateButton").attr("disabled", false);

			} else {
				$(".newpwd-1").text("비밀번호와 일치하지 않습니다.").css("color", "red");
				$("#updateButton").attr("disabled", true);
			}
		});
		function logoutAction() {
			var result = confirm('로그아웃 하시겠습니까?');
			if (result) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	<!--  Bootstrap core JavaScript-->
	<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>