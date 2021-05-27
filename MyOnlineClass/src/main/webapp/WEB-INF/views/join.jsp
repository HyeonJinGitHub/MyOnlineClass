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

  <title>회원가입 | Hyundai ClassTok</title>

 <c:import url="header.jsp"></c:import>
</head>
<body>
  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Join Page
      <small>Join us!</small>
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item active">회원가입</li>
    </ol>
   <div class="jumbotron" style="height: 100%">
      <h1 class="display-3" style="text-align: center;margin-top: -30px;margin-bottom: 50px;">회원가입</h1>
      <form action="${pageContext.request.contextPath}/joinAction" class="was-validated" method="post" onsubmit="return validate()">
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
            <input type="text"  class="form-control" id="uname" style="width:78%; float: left;" placeholder="이름 입력" name="uname" required>
            <div class="invalid-feedback" style="float:left; margin-bottom: 20px;clear: both;">이름을 입력해주세요.</div>
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
             이미 가입하셨다면?&nbsp;<a href="${pageContext.request.contextPath}/login">로그인</a>
          </div>
      </form>
   </div>
  </div>
  <!-- /.container -->
  <!-- Footer -->
 <c:import url="footer.jsp"></c:import>
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
				url : '/online/check/idcheck',
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
				url : '/online/check/emailcheck',
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
				url : '/online/check/phonecheck',
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