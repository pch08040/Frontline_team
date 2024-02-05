<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	let msg = "<c:out value='${msg}'/>";
	let url = "<c:out value='${url}'/>";
	alert(msg);
	location.href = url;
</script>
</head>
<body>

</body>
</html>