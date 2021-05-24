<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function getContextPath() {
			var hostIndex = location.href.indexOf(location.host)
					+ location.host.length;
			return location.href.substring(hostIndex, location.href.indexOf(
					'/', hostIndex + 1));

		}
		alert(getContextPath());
	</script>
</body>
</html>