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
<title>클래스팡 :: MyOnlineClass</title>

<!-- 폰트 스타일 시트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!-- 부트 스트랩 스타일 시트 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#nickname').on('keyup', function() {
		$('#nicknameCount').html("(" + $(this).val().length + " / 10)");
		
		if ($(this).val().length > 10) {
			$(this).val($(this).val().substring(0, 10));
			$('#nicknameCount').html("(10 / 10)");
		}
	});
	
	$('#introduce').on('keyup', function() {
		$('#introduceCount').html("(" + $(this).val().length + " / 30)");
		
		if ($(this).val().length > 30) {
			$(this).val($(this).val().substring(0, 30));
			$('#introduceCount').html("(0 / 30)");
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

<c:import url="header.jsp"></c:import>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<%
	if (id == null || id == "") {
		response.sendRedirect("login");
	}
	%>

	<!-- Move TOP Icon -->
	<a id="MOVE_TOP_BTN" href="#"> <img
		src="${contextPath}/resources/image/icon_move_top.png">
	</a>

<!-- 	필요 데이터: 현재 접속중인 유저의 member_id, 닉네임, 강사 소개, 프로필이미지 -->
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel" style="padding-top: 50px;">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active"
					style="height: 425px; background-image: url('${contextPath}/resources/image/background.png')">
					<div style="color: #fff; text-align: center; padding-top: 40px; padding-left: 60px;">
						<p style="display: inline-block; font-size: 29px; font-weight: 500; padding-left: 100px;">
							스타 강사로 데뷔하세요
						</p>
						<h3 style="display: inline-block; color: red; padding-bottom: 30px;">
							.
						</h3>
						  <input type="button" class="btn btn-primary" onclick="duplicationNickname();" style="width:10%; visibility:hidden; display: inline; margin-left: 10px; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
						<br>
						
						<form name="registerForm" id="register" method='POST' action="${contextPath}/registerAction" enctype="multipart/form-data" onsubmit="registerCheck(event)">
							<input type="hidden" value="${id}" name="id">
							<input type="hidden" value="${name}" name="name"> 
							<input type="hidden" value="${email}" name="email"> 
							<input type="hidden" value="${phone}" name="phone"> 
							
							    <div class="form-group" style="width: 50%; margin: 0 auto; overflow: hidden; padding-left: 10px;">
							    	<span style="position: relative; left: 40px; color: gray;">#</span>
								<input type="text" id="nickname" name="nickname" placeholder="원하시는 닉네임이 있으신가요?" 
									   maxlength="10" autocomplete="off" required="required"
									   style="width: 500px; height: 50px; border-radius: 30px; 
									   border: 0; outline: 0; padding-left: 40px;">
								<div id="nicknameCount" style="display: inline; padding-left: 10px;">(0 / 10)</div> 
								<input type="button" class="btn btn-primary" onclick="duplicationNickname();" style="display: inline; margin-left: 10px; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
          						</div>
								<!-- <div style="width: auto;"> -->
							
								<!-- </div> -->
							 <br>
							 <div class="form-group" style="width: 50%;margin: 0 auto; overflow: hidden;">
								<span style="position: relative; left: 40px; color: gray;">#</span>
								<input type="text" id="introduce" name="introduce" placeholder="자신을 한 줄로 표현하세요." 
									   maxlength="50" autocomplete="off" required="required"
									   style="width: 500px; height: 50px; border-radius: 30px; 
									   border: 0; outline: 0; padding-left: 40px;"> 
							    <div id="introduceCount" style="display: inline; padding-left: 10px;">(0 / 30)</div> 
							    <input type="button"  class="btn btn-primary" onclick="duplicationNickname();" style="width:10%; visibility:hidden; display: inline; margin-left: 10px; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
							    </div>
							<br>
							
							<div style="margin-left: 175px;">
								&nbsp; &nbsp; &nbsp; &nbsp;
								<span style="position: relative; left: 40px; color: gray;">#</span>
								<input type="text" placeholder="프로필 사진을 선택하세요." 
									   maxlength="25" autocomplete="off" 
									   style="width: 500px; height: 50px; border-radius: 30px; 
									   border: 0; outline: 0; padding-left: 40px;" readonly>
								<input type="file" accept="image/*" name="image" required="required"
									   style="padding-left: 10px;">
								 <input type="button"  class="btn btn-primary" onclick="duplicationNickname();" style="width:5px; visibility:hidden; display: inline; margin-left: 10px; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
							</div> <br> <br>
							<div style="padding-left: 80px;">
							<input type="submit" value="신청하기" 
								   style="width: 100px; border-radius: 30px; border: 0; outline: 0;">
							<input type="button"  class="btn btn-primary" onclick="duplicationNickname();" style="width:10%; visibility:hidden; display: inline; margin-left: 10px; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
	<c:import url="footer.jsp"></c:import>
	<script>
	var nicknameck = 0;
 	function duplicationNickname() {
 		var nickname = $("#nickname").val();
 		$.ajax({
				async: false,
				type: 'POST',
				data : {"nickname": nickname },
				url : '/online/check/nicknamecheck',
				success : function(data) {
					if(data > 0) {
						alert('실패', '이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요.', 'warning');
	  					$("#nickname").focus();
	  					nicknameck = 0;
	  				} else {
	  					alert('성공', '사용가능한 닉네임입니다.', 'success');
	  					$('#nickname').focus();
	  					nicknameck = 1;
	  				}
				},
				error : function(error) {
					alert('실패', 'error : ' + error, 'error');
				}
			});
 		
 	}
	$('#nickname').on('keyup', function() {
		nicknameck = 0;
	});
	function registerCheck(e) {
		var form = document.registerForm;
		e.preventDefault();	
 		if(nicknameck == 0) {
 			alert('실패', '닉네임 중복 여부를 확인해주세요.', 'warning');
 			return false;
 		} else {
 			swal({
				title : '강사등록',
				text : '강사로 등록하시겠습니까?',
				icon : 'info',
				buttons: {
				    yes: {
				    	text : "예",
				    	value : true,
						className : "swal-button"
				    },
				    no: {
				    	text : "아니오",
				    	value : false,
				    	className : "swal-button"
				    }
				  }
			}).then((value)=> {
				switch(value) {
				case true:
					swal({
						title : '성공',
						text : '강사로 등록되었습니다.',
						icon : 'success',
						buttons: {
							yes: {
						    	text : "예",
						    	value : true,
								className : "swal-button"
						    },
						}
					}).then((value) => {
						switch(value) {
						case true:
							form.submit();
							break;
						}
					});
					break;
				case false:
					break;
				}
			});
			return false;
 		}
	}
	</script>
</body>
</html>