<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/bs4.jsp"%>
 <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color:rgb(59, 59, 153); padding:0;">
    <!-- <button class="navbar-toggler" type="button" id="expandbtn" data-toggle="collapse" style="border:1px solid white; margin:10px; background-color: rgb(19, 20, 20);"> -->
      <!-- <i class="xi-bars" style="color: white; font-size:1.5em;"></i> -->
    <!-- </button> -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav nav-main-ul">
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="#인사말">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">MIBER 소개</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="#인사말" class="nav-sub-li" >인사말</a></li>
            <li>&nbsp;</li>
            <li><a href="#브랜드소개" class="nav-sub-li">브랜드 소개</a></li>
            <li>&nbsp;</li>
            <li><a href="#회사 오시는길" class="nav-sub-li">회사 오시는길</a></li>
          </ul>  
        </li>
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="#아우터">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">아우터</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="#재킷" class="nav-sub-li">재킷</a></li>
            <li>&nbsp;</li>
            <li><a href="#점퍼" class="nav-sub-li">점퍼</a></li>
            <li>&nbsp;</li>
            <li><a href="#패딩" class="nav-sub-li">패딩</a></li>
            <li>&nbsp;</li>
            <li><a href="#코트" class="nav-sub-li">코트</a></li>
          </ul>  
        </li>
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="#상의">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">상의</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="#반팔티" class="nav-sub-li">반팔티</a></li>
            <li>&nbsp;</li>
            <li><a href="#긴팔티" class="nav-sub-li">긴팔티</a></li>
            <li>&nbsp;</li>
            <li><a href="#맨투맨" class="nav-sub-li">맨투맨</a></li>
            <li>&nbsp;</li>
            <li><a href="#후드티" class="nav-sub-li">후드티</a></li>
          </ul>  
        </li>
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="#바지">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">바지</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="#슬랙스" class="nav-sub-li">슬랙스</a></li>
            <li>&nbsp;</li>
            <li><a href="#청바지" class="nav-sub-li">청바지</a></li>
            <li>&nbsp;</li>
            <li><a href="#반바지" class="nav-sub-li">반바지</a></li>
          </ul>  
        </li>
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="${ctp}/noticeList.no">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">고객센터</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="${ctp}/noticeList.no" class="nav-sub-li">공지사항</a></li>
            <li>&nbsp;</li>
            <li><a href="${ctp}/boList.bo" class="nav-sub-li">자유 게시판</a></li>
            <li>&nbsp;</li>
            <li><a href="#Q & A" class="nav-sub-li">Q & A</a></li>
            <li>&nbsp;</li>
            <li><a href="#자주 묻는 질문" class="nav-sub-li">자주 묻는 질문</a></li>
          </ul>  
        </li>  
        <li class="nav-item nav-main-li" style="border-right:1px solid white; border-left:1px solid white;" style="padding: 20px;"><a class="nav-link" href="${ctp}/memInfo.mem">
          <b><span class="bigMenu" style="font-size:1.3em; color:white">MyPage</span></b></a>
          <ul class="nav-sub-ul">
            <hr>
            <li><a href="${ctp}/memMain.mem" class="nav-sub-li">회원방</a></li>
            <li>&nbsp;</li>
            <li><a href="${ctp}/memPwdConfirm.mem" class="nav-sub-li">회원정보변경</a></li>
            <li>&nbsp;</li>
            <li><a href="#" class="nav-sub-li">일정관리</a></li>
            <li>&nbsp;</li>
            <li><a href="${ctp}/" class="nav-sub-li">메세지관리</a></li>

          </ul>  
        </li>  
      </ul>
    </div>
  </nav>