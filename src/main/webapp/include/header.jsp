<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/bs4.jsp"%>

  <div style="width:90%; margin:0 10% 0 5%;">
    <button type="button" id="MOVE_TOP_BTN">↑</button>
    <div class="row" style="margin-top:10px; margin-bottom:10px;">
      <div class="col-4"> 
        <a href="${ctp}/" class="atag" style="color:rgb(59, 43, 43);">
          <img src="https://png.pngtree.com/png-vector/20200318/ourlarge/pngtree-alphabet-letter-m-with-ornaments-vintage-floral-png-image_2162406.jpg" width="90px">
          <span style="display: inline-block;"><font size="6px" style="vertical-align: middle;" class="toMain">MIBER</font></span>
        </a>
      </div>
      <!-- 검색창 -->
      <div class="col-4" style="margin-top: 30px;">
        <input type="text" id="keyword" style="width: 400px; border: 0px;"/>
        <button type="button"><i class="fas fa-search"></i></button>
        <hr style="width: 450px; border: 1px solid black;">
      </div>
      <div class="col-4 text-right" style="margin-bottom:0; padding-top:30px;">
      
      <c:if test="${sLevel >=1 && sLevel <= 5}" >
        <a class="btn btn-info" href="${ctp}/memLogOut.mem">로그아웃</a>
      </c:if>
      <c:if test="${!(sLevel >=1 && sLevel <= 5)}" >
        <a class="btn btn-info" href="${ctp}/memLogin.mem">로그인</a>
        <a class="btn btn-info" href="${ctp}/memJoin.mem">회원가입</a>
      </c:if>
      <c:if test="${sLevel == 5 }">
        <a href="${ctp}/adMenu.ad" class="btn btn-info">관리자메뉴</a>	
      </c:if>
      </div>
    </div>
  </div>