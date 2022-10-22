<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="refresh" content="2, /main">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="shortcut icon"
	href="${path}/resources/image/siteLogopavi.ico">
<link href="${path}/resources/css/pausePage.css" rel="stylesheet" />
</head>

<body>
	<img src="${path}/resources/image/accessDenied.jpg" alt=""
		class="denied_img" width="600px">
</body>
<script src="<c:url value="/resources/js/deniedPage.js"/>"></script>
</html>