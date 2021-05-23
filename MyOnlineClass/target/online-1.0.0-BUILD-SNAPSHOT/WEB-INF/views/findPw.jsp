<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
	</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>비밀번호 찾기 | Hyundai Cosmetic</title>


     <link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
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

<div class="table-content">
	<div class="item"></div>
	
</div>
  <!-- Content section -->
  <div class="container">
   
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Find Password
      <small>Join us!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
      </li>
      <li class="breadcrumb-item active">비밀번호 찾기</li>
    </ol>

   <div class="jumbotron" style="height: 100%">
      <h1 class="display-3" style="text-align: center;margin-top: -30px;margin-bottom: 50px;">비밀번호 찾기</h1>
      <form action="${pageContext.request.contextPath}/member/findPwAction" class="was-validated" method="post">
          <div class="form-group" style="width: 50%;margin: 0 auto; overflow: hidden;">
            <input type="text" class="form-control" id="uid" style="width:78%; float: left;" placeholder="아이디 입력" name="uid" required>
            <input type="submit" class="btn btn-primary" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="다음단계"/>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 20px auto 0px;text-align: center;">
             아이디를 모르신다면?&nbsp;<a href="${pageContext.request.contextPath}/move/findId">아이디 찾기</a>
          </div>
      </form>
   </div>
  </div>
	<div class="table-content">
	<div class="item"></div>
	
</div>
	<div class="table-content">
	<div class="item"></div>
	
</div>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Hyundai Cosmetic</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	
</body>
</html>