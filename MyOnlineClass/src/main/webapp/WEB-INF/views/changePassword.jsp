<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
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

  <title>비밀번호 변경 | Hyundai Cosmetic</title>


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
          <a href="${pageContext.request.contextPath}/move/mypage" class="list-group-item">정보수정</a>
          <a href="${pageContext.request.contextPath}/move/changePassword" class="list-group-item">비밀번호 변경</a>
          <a href="${pageContext.request.contextPath}/move/delete" class="list-group-item">회원 탈퇴</a>

        </div>
      </div>
      <!-- Content Column -->
      <div class="col-lg-9 mb-4">
        <h2>정보수정</h2>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="${pageContext.request.contextPath}/move/home">홈</a>
     </li>
      <li class="breadcrumb-item active">비밀번호 변경</li>
    </ol>

    <div class="jumbotron" style="height: 70%;overflow: hidden;">
      <form action="${pageContext.request.contextPath}/member/changePasswordAction" class="was-validated" method="post">
          <div class="form-group" style="width: 80%;margin: 0 auto; overflow: hidden;">
            <label for="uname" style="float: left;width: 30%;">아이디&nbsp;&nbsp;</label>
            <input type="text" class="form-control" id="uid" style="width:70%; float: right;" name="uid" disabled="disabled" value="${id}">
          </div>
          <br/>
          <div class="form-group" style="width: 80%;margin: 0 auto;">
            <label for="uname" style="float: left;width: 30%;">현재 비밀번호&nbsp;&nbsp;</label>
            <input type="password" style="float: right;width: 70%;" class="form-control" id="pwd" placeholder="현재 비밀번호" name="pwd" required>
          </div>
          <br/>
         	<div class="form-group" style="width: 80%;margin: 0 auto; margin-top: 40px;">
         	 <label for="uname" style="float: left;width: 30%;">새로운 비밀번호&nbsp;&nbsp;</label>
            <input type="password" style="float: right;width: 70%;" class="form-control" id="newpwd" placeholder="새로운 비밀번호" name="newpwd" required>
            <div class="invalid-feedback" style="float: right;width: 70%;">비밀번호를 입력해주세요.</div>
            
          </div>
          <br/>
          <div class="form-group" style="width: 80%;margin: 0 auto; margin-top: 40px;">
            <label for="uname" style="float: left;width: 30%;">새로운 비밀번호(확인)&nbsp;&nbsp;</label>
           <input type="password" style="float: right;width: 70%;" class="form-control" id="newpwdChk" placeholder="새로운 비밀번호(확인)" name="newpwdChk" required>
            <div class="newpwd-1" style="color:red; font-size:80%; float: right;width: 70%;">비밀번호를 입력해주세요.</div>
          </div>
          <br/>
          <div class="form-group" style="width: 50%;margin: 80px auto;">
             <button type="submit" class="btn btn-primary" style="width: 100%; border-color: #343a40; background-color: #343a40;" id="updateButton">수정</button>
          </div>
          <br/>
      </form>
   </div>
  </div>
  </div>
  
  </div>
  <!-- /.container -->
<!-- 	<div class="table-content">
	<div class="item"></div>
	</div> -->
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
  <script>
  	$("#newpwd").keyup(function(){
  		$("#updateButton").attr("disabled", true);
  		$(".newpwd-1").text("");
  	});
  	$("#newpwdChk").keyup(function(){
  		if($(this).val()===$("#newpwd").val()){
  			$(".newpwd-1").text("비밀번호와 일치합니다.").css("color", "green");
  			$("#updateButton").attr("disabled", false);
  			
  		}else{
  			$(".newpwd-1").text("비밀번호와 일치하지 않습니다.").css("color", "red");
	  		$("#updateButton").attr("disabled", true);
  		}
  	});
  </script>
</body>
</html>