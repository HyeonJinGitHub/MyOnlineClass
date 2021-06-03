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
  <title>아이디 찾기 | Hyundai ClassTok</title>

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
    <h1 class="mt-4 mb-3">Find ID
      <small>Join us!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <li class="breadcrumb-item active">아이디 찾기</li>
    </ol>

   <div class="jumbotron" style="height: 100%">
      <h1 class="display-3" style="text-align: center;margin-top: -30px;margin-bottom: 50px;">아이디 찾기</h1>
      <form action="${pageContext.request.contextPath}/findIdAction" class="was-validated" method="post">
          <div class="form-group" style="width: 50%;margin: 0 auto; overflow: hidden;">
            <input type="email" class="form-control" id="uemail" style="width:78%; float: left;" placeholder="이메일 입력" name="uemail" required>
            <input type="submit" class="btn btn-primary" style="width:20%; margin-left:10px; float:left; border-color: #343a40; background-color: #343a40;" value="다음단계"/>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 20px auto 0px;text-align: center;">
             비밀번호를 모르신다면?&nbsp;<a href="${pageContext.request.contextPath}/findPw">비밀번호 찾기</a>
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
<%-- 	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
</body>
</html>