<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<link href='${pageContext.request.contextPath}/resources/css/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/main.js'></script>
  <title>수강정보 | Hyundai ClassTok</title>
<c:import url="header.jsp"></c:import>
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
    	    initialView: 'dayGridMonth',
    	    initialDate: '2021-06-01',
    	    headerToolbar: {
    	      left: 'prev,next today',
    	      center: 'title',
    	      right: 'dayGridMonth'
    	    },
    	    events: [
    	    	<c:forEach items="${data}" var="dataMap" >
    	      {
    	    	    title : "${dataMap.key}",
    	    	    start: "${dataMap.value[0]}",
    	    	    end: "${dataMap.value[1]}",
    	    	    url: "/online/vodStreaming?no=${dataMap.value[2]}"
    	      },
    	      </c:forEach>
    	    ]
    	  });
    	  calendar.render();
    	});
    </script>
    <script>
	$(document).ready(function() {
		var id = "${id}";
		$.ajax({
			type: "POST",
			url: "getInstFlag",
			data: {id : id},
			success: function(data) {
				nickname = data['nickname'];
				if (nickname) {
					$('#management').show();
				} 
				
			},
			error: function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log("실패");
			}
		});
	});
</script>
    <script>
    function goPage() {
      var f = document.paging;
      f.id.value = "${id}"
      f.action = "${pageContext.request.contextPath}/profile"
      f.method = "post"
      f.submit();
    };
    </script>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
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
          <a href="${pageContext.request.contextPath}/mylecture" class="list-group-item">수강정보</a>
             <form name="paging">
    	<input type="hidden" name="id"/>
    </form>
          	<a id="management" style="display:none" href="javascript:goPage();" class="list-group-item">강좌관리</a>
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
 <div id='calendar'></div>
      </div>
    </div>
    <!-- /.row -->

  </div>
   <c:import url="footer.jsp"></c:import>
  <!-- /.container -->
  	<!--  Bootstrap core JavaScript-->
	<%-- <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> --%>
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
	function logoutAction() {
		var result = confirm('로그아웃 하시겠습니까?');
		if (result) {
			return true;
		} else {
			return false;
		}
	}
   </script>
</body>
</html>