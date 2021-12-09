<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck.jsp</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
	<p><br></p>
	<div class="container">
		<h2>아이디 중복체크</h2>
		<c:if test="${res == 1}" >
			<h4><font color="red">${mid}</font>(은)는 사용가능한 아이디 입니다.</h4>
			<p><input type="button" value="사용하기" onclick="sendCheck()"/></p>
		</c:if>
		<c:if test="${res != 1}" >
			<h4><font color="red">${mid}</font>(은)는 이미 사용중인 아이디입니다.</h4>
		</c:if>
		<form name="childForm" method="post" action="${ctp}/idCheck.mem">
			<input type="text" name="mid">
			<input type="button" value="아이디검색" onclick="idCheck()">
		</form>
	</div>
	<br>
</body>
<script>
	function sendCheck(){
		opener.window.document.myform.mid.value = "${mid}";
		opener.window.document.myform.pwd.focus();
		window.close();
	}
	
	function idCheck(){
		var mid = childForm.mid.value;
		
		if(mid == ""){
			alert("아이디를 입력하세요!");
			childForm.mid.focus();
		}
		else{
			childForm.submit();
		}
	}
</script>
</html>