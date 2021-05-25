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
	height: 50px;
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

  <title>로그인 | Hyundai Cosmetic</title>

</head>

<body>

  <!-- Navigation -->
  <c:import url="header.jsp"></c:import>

<div class="table-content">
	<div class="item"></div>
	
</div>
  <!-- Content section -->
 <div class="container">
   
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Login Page
      <small>Join us!</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
      </li>
      <li class="breadcrumb-item active">로그인</li>
    </ol>

   <div class="jumbotron">

      <h1 class="display-3" style="text-align: center;margin-top: -30px; ">로그인</h1>
      <form action="${pageContext.request.contextPath}/loginAction" class="was-validated" method="post">
          <div class="form-group" style="width: 50%;margin: 0 auto;">
            <label for="uname">아이디</label>
            <input type="text" class="form-control" id="id" placeholder="아이디 입력" name="id" required>
            <div class="invalid-feedback">아이디를 입력해주세요.</div>
          </div>
          <div class="form-group" style="width: 50%;margin: 0 auto;">
            <label for="pwd">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호 입력" name="password" required>
            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
          </div>
          <div class="form-group" style="width: 50%;margin: 20px auto;">
                <c:if test="${errorMsg!=null }">
   				<div class="form-group"style="color:red">${requestScope.errorMsg }</div>
   				<div class="form-group"style="color:red">${pageContext.request.servletPath }</div>
   			</c:if>
             <button type="submit" class="btn btn-primary" style="width: 100%; border-color: #343a40; background-color: #343a40;">로그인</button>
          </div>
            <div class="form-group" style="width: 50%;margin: 20px auto;text-align: center;">
             <a href="${pageContext.request.contextPath}/join">회원가입</a>
          </div>
          <div class="form-group" style="width: 50%;margin: 0 auto;text-align: center;">
             <a href="${pageContext.request.contextPath}/findId">아이디/비밀번호 찾기</a>
          </div>
      </form>
   </div>
  </div>
	<div class="table-content">
	<div class="item"></div>
	
</div>
  <!-- Footer -->
  <c:import url="footer.jsp"></c:import>
	

</body>
</html>