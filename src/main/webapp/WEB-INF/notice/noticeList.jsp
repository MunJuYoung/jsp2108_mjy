<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
<%@ include file="/include/bs4.jsp"%>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp"%>
<!-- 네비 -->
	<%@ include file="/include/nav.jsp"%>
	<p><br></p>
	<div class="container">
		<table class="table table-borderless">
    <tr>
      <td colspan="2" class="p-0"><h2>공 지 사 항</h2></td>
    </tr>
    <tr>
      <td class="text-left p-0">
      	<c:if test="${sLevel == 5}">
        	<a href="${ctp}/noticeInput.no" class="btn btn-secondary btn-sm">글쓰기</a> &nbsp;
        </c:if>
        <select name="lately" id="lately" onchange="latelyCheck()">
          <option value="0">최근자료순</option>
          <c:forEach var="i" begin="1" end="30">
	          <option value="${i}" ${lately==i ? 'selected' : ''}>${i}일전</option>
          </c:forEach>
        </select>
      </td>
      <td class="text-right p-0">
        <select name="pageSize" id="pageSize" onchange="pageCheck()" class="p-0 m-0">
          <option value="5"  ${pageSize==5 ? 'selected' : ''}>5건</option>
          <option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
          <option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
          <option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
        </select>
      </td>
    </tr>
  </table>
  <table class="table table-hover">
    <tr class="table-dark text-dark">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날짜</th>
      <th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${vos}">
	    <tr>
	      <td>${curScrStrarNo}</td>
	      <td>
	        <a href="${ctp}/noticeContent.no?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${vo.title}</a>
	        <c:if test="${vo.wNdate <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
	        <c:if test="${vo.replyCount != 0}">(${vo.replyCount})</c:if>
	      </td>
	      <td>${vo.nickName}</td>
	      <td>
	        <c:if test="${vo.wNdate <= 24}">${fn:substring(vo.wDate,11,19)}</c:if>
	        <c:if test="${vo.wNdate >  24}">${fn:substring(vo.wDate,0,10)}</c:if>
	      </td>
	      <td>${vo.readNum}</td>
	    </tr>
	    <c:set var="curScrStrarNo" value="${curScrStrarNo - 1}"/>
    </c:forEach>
  </table>
  
	<!-- 블록 페이징처리 시작(BS4 스타일적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${totPage != 0}">
			  <c:if test="${pag != 1}">
			    <li class="page-item"><a href="noticeList.no?pag=1&pageSize=${pageSize}&lately=${lately}" title="첫페이지" class="page-link text-secondary">◁◁</a></li>
			  </c:if>
			  <c:if test="${curBlock > 0}">
			    <li class="page-item"><a href="noticeList.no?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" title="이전블록" class="page-link text-secondary">◀</a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
			    <c:if test="${i == pag && i <= totPage}">
			      <li class="page-item active"><a href='noticeList.no?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-light bg-secondary border-secondary">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pag && i <= totPage}">
			      <li class="page-item"><a href='noticeList.no?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-secondary">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${curBlock < lastBlock}">
			    <li class="page-item"><a href="noticeList.no?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" title="다음블록" class="page-link text-secondary">▶</a>
			  </c:if>
			  <c:if test="${pag != totPage}">
			    <li class="page-item"><a href="noticeList.no?pag=${totPage}&pageSize=${pageSize}&lately=${lately}" title="마지막페이지" class="page-link" style="color:#555">▷▷</a>
			  </c:if>
			</c:if>
		</ul>
	</div>
</div>
<!-- 검색기 처리 시작 -->
<div class="container text-center">
  <form name="searchForm" method="post" action="${ctp}/noticeSearch.no">
    <b>검색 : </b>
    <select name="search" onchange="searchChange()">
      <option value="title">글제목</option>
      <option value="nickName">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString"/>
    <input type="button" value="검색" onclick="searchCheck()"/>
    <input type="hidden" name="pag" value="${pag}"/>
	  <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝 -->
	<br>
<!-- footer -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>