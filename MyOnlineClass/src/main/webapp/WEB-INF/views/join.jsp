<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원가입 | Hyundai Cosmetic</title>

     <link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--  Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">

</head>

<body>
 
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/move/home">Hyundai Cosmetic</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/popular">인기
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/new">신규</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/event">이벤트/혜택</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/exhibition">기획전</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/freeboard">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/move/login">로그인</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	

  <!-- Page Content -->
  <div class="container">
   
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Join Page
      <small>Join us!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
      </li>
      <li class="breadcrumb-item active">회원가입</li>
    </ol>

   <div class="jumbotron" style="height: 100%">
      <h1 class="display-3" style="text-align: center;margin-top: -30px;margin-bottom: 50px;">회원가입</h1>
      <form action="${pageContext.request.contextPath}/member/joinAction" class="was-validated" method="post" onsubmit="return validate()">
          <div class="form-group" style="width: 50%;margin: 0 auto; overflow: hidden;">
            <input type="text" class="form-control" id="uid" style="width:78%; float: left;" placeholder="아이디 입력" name="uid" required>
            <input id="idck" type="button"  onclick="duplicationId();" class="btn btn-primary" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
              <div class="invalid-feedback" style="float:left;">아이디를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 0 auto;">
            <input type="email" class="form-control" id="uemail" style="width:78%; float: left;" placeholder="이메일 입력(ex aaaa@naver.com)" name="uemail" required>
            <input type="button" class="btn btn-primary" onclick="duplicationEmail();" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
            <div class="invalid-feedback" style="float:left; margin-bottom: 20px;clear: both;">이메일을 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 0 auto; margin-top: 40px;">
            <input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control" id="uphone" style="width:78%; float: left;" placeholder="전화번호 입력(ex 010-1234-5678)" name="uphone" required>
            <input type="button" class="btn btn-primary" onclick="duplicationPhone();"  style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
            <div class="invalid-feedback" style="float:left; margin-bottom: 20px;clear: both;">전화번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 0 auto; margin-top: 40px;">
            <input type="password" class="form-control" id="pwd" placeholder="비밀번호 입력" name="pwd" required>
            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 0 auto;">
            <input type="password" class="form-control" id="pwdChk" placeholder="비밀번호 확인" name="pwdChk" required>
            <div class="pwd-1" style="color:red; font-size:80%;">비밀번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 20px auto;">
             <button type="submit" class="btn btn-primary" style="width: 100%; border-color: #343a40; background-color: #343a40;" id="registerButton" >가입하기</button>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 20px auto 0px;text-align: center;">
             이미 가입하셨다면?&nbsp;<a href="${pageContext.request.contextPath}/move/login">로그인</a>
          </div>
      </form>
   </div>
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
  <script>
  	$("#pwd").keyup(function(){
  		$("#registerButton").attr("disabled", true);
  		$(".pwd-1").text("");
  	});
  	$("#pwdChk").keyup(function(){
  		if($(this).val()===$("#pwd").val()){
  			$(".pwd-1").text("비밀번호와 일치합니다.").css("color", "green");
  			$("#registerButton").attr("disabled", false);
  			
  		}else{
  			$(".pwd-1").text("비밀번호와 일치하지 않습니다.").css("color", "red");
	  		$("#registerButton").attr("disabled", true);
  		}
  	});
  </script>
  
  <script type="text/javascript">
  	var idck = 0;
 	function duplicationId() {
 		var userid = $("#uid").val();
 		$.ajax({
				async: false,
				type: 'POST',
				data : {"id": userid },
				url : '/springproject/check/idcheck',
				success : function(data) {
					if(data > 0) {
	  					alert('아이디가 존재합니다. 다른 아이디를 입력해주세요.');
	  					$("#uid").focus();
	  				} else {
	  					alert('사용가능한 아이디입니다.');
	  					$('#uid').focus();
	  					idck = 1;
	  				}
				},
				error : function(error) {
					alert('error : ' + error);
				}
			});
 	}
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