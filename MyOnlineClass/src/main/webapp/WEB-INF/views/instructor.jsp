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
  <title>강사정보 | Hyundai ClassTok</title>

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
   
    <c:import url="header2.jsp"></c:import>
</head>
<body>
	<c:set var="up" value=".."/>
  <!-- Page Content -->
  <div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">MyPage
      <small>마이페이지</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item active">마이페이지</li>
    </ol>
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="${pageContext.request.contextPath}/" class="list-group-item">홈</a>
          <a href="${pageContext.request.contextPath}/mylecture" class="list-group-item">수강 정보</a>
          <a href="${pageContext.request.contextPath}/mypage" class="list-group-item">정보수정</a>
          <a href="${pageContext.request.contextPath}/changePassword" class="list-group-item">비밀번호 변경</a>
          <a href="${pageContext.request.contextPath}/delete" class="list-group-item">회원 탈퇴</a>
           <a onclick="return logoutAction()" href="${pageContext.request.contextPath}/logout" class="list-group-item">로그아웃</a>
        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>수강정보</h2>
        <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item active">수강정보</li>
    </ol>
      </div>
    </div>
    <!-- /.row -->

  </div>
   <c:import url="footer.jsp"></c:import>
  <!-- /.container -->
  	<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
  
 
</body>
</html>