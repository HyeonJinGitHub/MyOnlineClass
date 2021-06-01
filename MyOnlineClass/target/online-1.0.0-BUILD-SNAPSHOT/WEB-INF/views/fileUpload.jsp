<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<!-- 폰트 스타일 시트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 부트 스트랩 스타일 시트 -->
<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	  crossorigin="anonymous">


  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
  
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  

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


    </script>
    
</head>
<body>
<!-- Content Column -->
   <!-- <div class="col-lg-9 mb-4"> -->
        

   <div class="jumbotron" style="height: 80%;overflow: hidden;">
      <form action="${pageContext.request.contextPath}/updateAction" class="was-validated" method="post">
          <div class="form-group" style="width: 70%;margin: 0 auto; overflow: hidden;">
            <label for="uname" style="float: left;">아이디&nbsp; &nbsp; &nbsp;</label>
            <input type="text" class="form-control" id="uid" style="width:58%; float: left;" name="uid" disabled="disabled" value="${id}">
            <input type="hidden" name="uname"  value="${id}">
          </div>
          <br/>
          <div class="form-group" style="width: 70%;margin: 0 auto; overflow: hidden;">
            <label for="uname" style="float: left;">이름&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
            <input type="text" class="form-control" id="uname" style="width:58%; float: left;" name="uname" disabled="disabled" value="${name}">
            <input type="hidden" name="uname"  value="${name}">
          </div>
          <br/>
          <div class="form-group" style="width: 70%;margin: 0 auto;" >
            <label for="uname" style="float: left; margin-top: 5px;">이메일&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label>
            <input type="email" class="form-control" id="uemail" style="width: 58%; float: left;" placeholder="이메일 입력" name="uemail" required value="${email }"/>
            <input type="button" class="btn btn-primary" onclick="duplicationEmail();" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
           <div class="invalid-feedback" style="float:left; margin-left: 70px; margin-bottom: 20px;clear: both;">이메일을 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 70%;margin: 0 auto; margin-top: 40px;">
            <label for="uname" style="float: left; margin-top: 5px;">전화번호&nbsp;&nbsp;</label>
            <input type="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control" id="uphone" style="width:58%; float: left;" placeholder="전화번호 입력(ex 010-1234-5678)" name="uphone" required value="${phone }">
             <input type="button" class="btn btn-primary" onclick="duplicationPhone();" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="중복확인"/>
            <div class="invalid-feedback" style="float:left; margin-left: 70px; margin-bottom: 20px; clear: both;">전화번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 70%;margin: 0 auto; margin-top: 40px;">
          <label for="uname" style="float: left; margin-top: 5px;">비밀번호&nbsp;&nbsp;</label>
            <input type="password" style="width:58%; float: left;" class="form-control" id="pwd" placeholder="비밀번호 입력" name="pwd" required>
            <div class="invalid-feedback" style="float:left; margin-left: 70px; margin-bottom: 20px; clear: both;">현재 비밀번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 10px auto; margin-top: 40px;">
             <button type="submit" class="btn btn-primary" style="width: 100%; border-color: #343a40; background-color: #343a40;" >수정</button>
          </div>
          <br/>
      </form>
   </div>
      </div>
    </div>
    <!-- /.row -->
</body>
</html>


 