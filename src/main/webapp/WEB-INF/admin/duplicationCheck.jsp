<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productClassCheck.jsp</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>상품 중복체크</h2>
		<c:if test="${res == 0}" >
			<h4><font color="red">${name}</font>(은)는 등록가능한 상품 입니다.</h4>
			<p><input type="button" value="등록하기" onclick="sendCheck()"/></p>
		</c:if>
		<c:if test="${res != 0}" >
			<h4><font color="red">${name}</font>(은)는 이미 등록된 상품입니다. 상품 수정하기를 이용해주세요</h4>
		</c:if>
		<input type="button" value="닫기" onclick="wClose()">
	</div>
	<br>
</body>
<script>
	function sendCheck(){
		opener.window.document.myform.name.value = "${name}";
		opener.window.document.myform.price.focus();
		window.close();
	}
	
	function wClose(){
		window.close();
	}
</script>
</html>