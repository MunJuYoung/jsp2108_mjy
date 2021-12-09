<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeContent.jsp</title>
<%@ include file="/include/bs4.jsp"%>
<script>
    function delCheck() {
    	var ans = confirm("게시글을 삭제하시겠습니까?");
    	if(ans) location.href="${ctp}/noticeDelete.no?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}";
    }
</script>
<style>
    th {
      background-color:#ddd;
      text-align: center;
    }
</style>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp"%>
<!-- 네비 -->
	<%@ include file="/include/nav.jsp"%>
	<p><br></p>
	<div class="container">
		<h2 style="text-align:center">공 지 사 항 내 용</h2>
		<br>
		<table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.wDate,0,19)}</td>
    </tr>
    <tr>
      <th>조회수</th>
      <td colspan="3">${vo.readNum}</td>
    </tr>
    <tr>
      <th>접속IP</th>
      <td colspan="3">${vo.hostIp}</td>
    </tr>
    <tr>
      <th>공지사항 제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>공지사항 내용</th>
      <td colspan="3" style="height:200px">${fn:replace(vo.content,newLine,'<br/>')}</td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
        <c:if test="${sw != 'search'}">
	        <input type="button" value="돌아가기" onclick="location.href='${ctp}/noticeList.no?pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
	        <c:if test="${sLevel == 5}">
	          <input type="button" value="수정하기" onclick="location.href='${ctp}/noticeUpdate.no?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
	          <input type="button" value="삭제하기" onclick="delCheck()"/>
	        </c:if>
        </c:if>
        <c:if test="${sw == 'search'}">
        	<input type="button" value="돌아가기" onclick="history.back()"/>
        </c:if>
      </td>
    </tr>
  </table>
  
  <c:if test="${sw != 'search'}">
  <!-- 이전글/다음글 처리 -->
	  <table class="table table-borderless">
	    <tr>
	      <td>
	        <c:if test="${nextVO.nextIdx != 0}">
		        👆 <a href="${ctp}/noticeContent.no?idx=${nextVO.nextIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">다음글 : ${nextVO.nextTitle}</a><br/>
	        </c:if>
	        <c:if test="${preVO.preIdx != 0}">
		        👇 <a href="${ctp}/noticeContent.no?idx=${preVO.preIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">이전글 : ${preVO.preTitle}</a><br/>
	        </c:if>
	      </td>
	    </tr>
	  </table>
  </c:if>
  <br/>
  </div>
	<br>
<!-- footer -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>