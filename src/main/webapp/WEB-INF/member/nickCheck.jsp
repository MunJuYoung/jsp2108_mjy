<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nickCheck.jsp</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>닉네임 중복체크</h2>
		<c:if test="${res == 1}" >
			<h4><font color="red">${nickName}</font>(은)는 사용가능한 닉네임 입니다.</h4>
			<p><input type="button" value="사용하기" onclick="sendCheck()"/></p>
		</c:if>
		<c:if test="${res != 1}" >
			<h4><font color="red">${nickName}</font>(은)는 이미 사용중인 닉네임입니다.</h4>
		</c:if>
		<form name="childForm" method="post" action="${ctp}/nickCheck.mem">
			<input type="text" name="nickName">
			<input type="button" value="닉네임검색" onclick="nickCheck()">
		</form>
	</div>
	<br>
</body>
<script>
	function sendCheck(){
		opener.window.document.myform.nickName.value = "${nickName}";
		opener.window.document.myform.name.focus();
		window.close();
	}
	
	function nickCheck(){
		var nickName = childForm.nickName.value;
		
		if(nickName == ""){
			alert("닉네임을 입력하세요!");
			childForm.mid.focus();
		}
		else{
			childForm.submit();
		}
	}
</script>
</html>