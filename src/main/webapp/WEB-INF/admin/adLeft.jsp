<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adLeft.jsp</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h6><a href="${ctp}/adContent.ad" target="adContent">관리자메뉴</a></h6>
		<hr>
		<p><a href="${ctp}/adMemberList.ad" target="adContent">회원관리</a></p>
		<hr>
		<p><a href="${ctp}/adProductReg.ad" target="adContent">상품등록</a></p>
		<hr>
		<p><a href="${ctp}/" target="_top">홈으로</a>
	</div>
	<br>
</body>
</html>