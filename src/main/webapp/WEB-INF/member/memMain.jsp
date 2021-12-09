<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage.jsp</title>
<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp" %>    
<!-- 네비 -->
	<%@ include file="/include/nav.jsp" %>
	<p><br></p>
	<div class="container">
		<h2>정규 회원방</h2>
	  <hr/>
	  <p><font color="blue">${sNickName}</font>님 로그인 중이십니다.</p>
	  <p>현재 <font color="red">${strLevel}</font> 이십니다.</p>
	  <p>최종 접속일 : <font color="blue">${sLastDate}</font></p>
	  <p>총 방문횟수 : <font color="blue">${visitCnt}</font> 회</p>
	  <p>오늘 방문횟수 : <font color="blue">${todayCnt}</font> 회</p>
	  <p>총 포인트 : <font color="blue">${point}</font> : 1일 1회 방문시 포인트 적립은 10포인트이고, 최대 50포인트까지 적립됩니다.</p>
	  <p>새 메세지 : <a href="${ctp}/wmMessage.wm?mSw=2"><font color="blue">${newMessageCnt}</font></a>건</p>
	  <hr/>
	  <a href="${ctp}/memList.mem" class="btn btn-danger">회원 구경하기</a>
	  <hr/>
  </div>
<!-- footer -->
	<%@ include file="/include/footer.jsp" %>
</body>
</html>