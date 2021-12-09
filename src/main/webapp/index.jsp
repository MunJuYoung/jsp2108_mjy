<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="/include/bs4.jsp" %>
  <title>Miber</title>
<script>
    $(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
    
    $("#MOVE_TOP_BTN").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
  });
</script>
</head>
<body>
<!-- 헤더 -->
  <%@ include file="/include/header.jsp" %>  
<!-- 네비 -->
  <%@ include file="/include/nav.jsp" %>

  <div id="demo" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- The slideshow -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://image.brandi.me/home/banner/bannerImage_538001_1634175598.jpg" width="100%" height="500px">
      </div>
      <div class="carousel-item">
        <img src="https://image.brandi.me/home/banner/bannerImage_555521_1635494528.jpg" width="100%" height="500px">
      </div>
      <div class="carousel-item">
        <img src="https://image.brandi.me/home/banner/bannerImage_0_1634884735.jpg" width="100%" height="500px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon"></span></a> 
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon"></span></a>
  </div>
  
  <div class="mainDiv">
    <h2 class="h2"><span class="h2span">TODAY 랭킹</span></h2>
    <hr>

    <div class="row">
      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/1.PNG" width="300px;"></a>
        <br>UNISEX LAUREL OVERSIZED HOODIE (4COL)
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">32%</font> 46,900</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/2.PNG" width="300px;"></a>
        <br>[11/02 예약발송][기모선택/2장] 에센셜 조거 스웨트팬츠 (3color)
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">71%</font> 38,500</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/3.PNG" width="300px;"></a>
        <br>[1+1] CREW NECK LOOSE FIT SWEATER [10COLOR]
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">53%</font> 32,900</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/4.PNG" width="300px;"></a>
        <br>베이지 덕 다운 리얼 라쿤 퍼 포켓 패딩 (FYDJX6508)
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">84%</font> 89,000</div>
      </div>
    </div>
    <div>
      <p><br></p>
      <button type="button" class="btn btn-primary btn-lg btnPlus">랭킹 더보기 &nbsp;>&nbsp; </button>
      <p><br></p>
    </div>
  
    <h2 class="h2"><span class="h2span">신상 모아보기</span></h2>
    <hr>

    <div class="row">
      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/11.PNG" width="300px;"></a>
        <br>[써지컬스틸] 블랙 메탈 라인 반지
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">7%</font> 15,300</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/22.PNG" width="300px;"></a>
        <br>[써지컬스틸] 터키석 깃털 반지
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">7%</font> 15,800</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/33.PNG" width="300px;"></a>
        <br>헤비웨이트 시그니처 로고 오버핏 두꺼운 후드티 (3COLOR)
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">30%</font> 52,900</div>
      </div>

      <div class="col-3" style="text-align: center;">
        <a href="#"><img src="${ctp}/images/home/44.PNG" width="300px;"></a>
        <br>헤비웨이트 시그니처 로고 오버핏 두꺼운 맨투맨 (3COLOR)
        <div><font style="color: rgb(199, 199, 11); font-weight: bolder;">30%</font> 39,400</div>
      </div>
    </div>
    <div>
      <p><br></p>
      <button type="button" class="btn btn-primary btn-lg btnPlus">신상 더보기 &nbsp;>&nbsp; </button>
      <p><br></p>
    </div>

  </div>
<!-- footer -->
<%@ include file="/include/footer.jsp" %>
</body>
</html>