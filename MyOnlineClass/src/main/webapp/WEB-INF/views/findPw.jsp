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

  <title>비밀번호 찾기 :: MyOnlineClass</title>

  <c:import url="header.jsp"></c:import>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
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
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item active">비밀번호 찾기</li>
    </ol>

   <div class="jumbotron" style="height: 100%">
      <h1 class="display-3" style="text-align: center;margin-top: -30px;margin-bottom: 50px;">비밀번호 찾기</h1>
      <form action="${pageContext.request.contextPath}/findPwAction" class="was-validated" method="post">
          <div class="form-group" style="width: 50%;margin: 0 auto; overflow: hidden;">
            <input type="text" class="form-control" id="uid" style="width:78%; float: left;" placeholder="아이디 입력" name="uid" required>
            <input type="submit" class="btn btn-primary" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="다음단계"/>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 20px auto 0px;text-align: center;">
             아이디를 모르신다면?&nbsp;<a href="${pageContext.request.contextPath}/findId">아이디 찾기</a>
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
  <c:import url="footer.jsp"></c:import>
  	<!--  Bootstrap core JavaScript-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>