<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<link href='${pageContext.request.contextPath}/resources/css/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/main.js'></script>
  <title>마이페이지 | Hyundai Cosmetic</title>

     <link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
  
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--  Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">

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
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
</head>
<body>
	<c:set var="up" value=".."/>
  <!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/move/home">Hyundai Cosmetic</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/move/popular">인기
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/new">신규</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/event">이벤트/혜택</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/exhibition">기획전</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/move/freeboard">커뮤니티</a></li>
					<li class="nav-item"><c:if test="${id==null }">
							<a class="nav-link" href="${pageContext.request.contextPath}/move/login">로그인</a>
						</c:if> <%-- <c:if test="${id!=null }">
							<a class="nav-link" href="../member/update">${id }님 </a>
						</c:if> --%>
						</li>
					<c:if test="${id!=null }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/move/mypage">마이페이지 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/logout">로그아웃 </a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">MyPage
      <small>마이페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
      </li>
      <li class="breadcrumb-item active">마이페이지</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="${pageContext.request.contextPath}/move/home" class="list-group-item">홈</a>
          <a href="${pageContext.request.contextPath}/move/mylecture" class="list-group-item">수강 정보</a>
          <a href="${pageContext.request.contextPath}/move/mypage" class="list-group-item">정보수정</a>
          <a href="${pageContext.request.contextPath}/move/changePassword" class="list-group-item">비밀번호 변경</a>
          <a href="${pageContext.request.contextPath}/move/delete" class="list-group-item">회원 탈퇴</a>

        </div>
      </div>
     
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>수강정보</h2>
        <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
      </li>
      <li class="breadcrumb-item active">수강정보</li>
    </ol>
 <div id='calendar'></div>
      </div>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Hyundai Cosmetic</p>
    </div>
    <!-- /.container -->
  </footer>

	<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	
  <script type="text/javascript">
  	var emailck = 0;
	function duplicationEmail() {
		var useremail = $("#uemail").val();
		$.ajax({
				async: false,
				type: 'POST',
				data : {"email": useremail },
				url : '/springproject/check/emailcheck',
				success : function(data) {
					if(data > 0) {
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
				async: false,
				type: 'POST',
				data : {"phone": userphone },
				url : '/springproject/check/phonecheck',
				success : function(data) {
					if(data > 0) {
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
   </script>
   
   
   
</body>
</html>