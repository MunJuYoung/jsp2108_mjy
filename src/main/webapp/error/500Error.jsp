<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러 페이지</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp"%>
<!-- 네비 -->
	<%@ include file="/include/nav.jsp"%>
	<p><br></p>
	<div class="container">
		<h2>서비스 사용에 불편을 끼쳐드려 죄송합니다.</h2>
		<h3>빠른시간내에 문제를 해결하겠습니다.</h3>
	</div>
	<br>
<!-- footer -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>