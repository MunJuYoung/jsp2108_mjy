<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("newLine","\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memInfo.jsp(자기 정보)</title>
<%@ include file="/include/bs4.jsp"%>
<script>
	function memDelete(){
		var ans = confirm("정말 탈퇴하시겠습니까?");
		if(ans) {
			location.href="${ctp}/memDelete.mem";
		}
	}
</script>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp"%>
<!-- 네비 -->
	<%@ include file="/include/nav.jsp"%>
	<p><br></p>
	<div class="container">
		<h2>회 원 정 보 상 세 보 기</h2>
		<br>
		<table class="table">
			<tr><td>아이디 : ${vo.mid}</td></tr>
	    <tr><td>별명 : ${vo.nickName}</td></tr>
	    <tr><td>성명 : ${vo.name}</td></tr>
	    <tr><td>성별 : ${vo.gender}</td></tr>
	    <tr><td>생일 : ${fn:substring(vo.birthday,0,10)}</td></tr>
	    <tr><td>전화번호 : ${vo.tel}</td></tr>
	    <tr><td>주소 : ${vo.address}</td></tr>
	    <tr><td>이메일 : ${vo.email}</td></tr>
	    <tr><td>직업 : ${vo.job}</td></tr>
	    <tr><td>취미 : ${vo.hobby}</td></tr>
	    <tr><td>사진 : <img src="images/${vo.photo}" width="100px"/></td></tr>
	    <tr><td>자기소개 : <br/>${fn:replace(vo.content,newLine,'<br/>')}</td></tr>
		</table>
    <hr>
    <a href="${ctp}/" class="btn btn-secondary">돌아가기</a>
    <c:if test="${sLevel != 5}">
    	<input type="button" class="btn btn-secondary" onclick="memDelete()" value="회원탈퇴">
    </c:if>
	</div>
	<br>
<!-- footer -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>