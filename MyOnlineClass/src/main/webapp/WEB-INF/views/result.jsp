<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="16x16" href="/xciweb01/img/favicon16.png" > 
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.swal-button {
  padding: 7px 19px;
  border-radius: 2px;
  background-color: #4962B3;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
.swal-button:focus {
  box-shadow: none;
}
</style>
</head>
<body>
<script type="text/javascript">
	var alert = function(title, msg, type) {
		swal({
			title : title,
			text : msg,
			icon : type,
			button: '확인'
		}).then((YES) => {
			if(YES) {
				location.href='${url}';
			}
		});
	}
</script>

<script type="text/javascript">
alert('${title}', '${msg}', '${type}');
//location.href='${url}';
</script>
</body>
</html>