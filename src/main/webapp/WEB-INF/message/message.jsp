<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
<%@ include file="/include/bs4.jsp"%>
<script>
	var msg = "${msg}";
	var url = "${url}";
	var nickName = "${nickName}";
	
	if(msg == "memberJoinOk") msg = "회원 가입되었습니다.";
	else if(msg == "memberJoinNo") msg = "회원 가입에 실패하셨습니다.";
	else if(msg == "memberLoginOk") msg = nickName + "님 로그인 되었습니다.";
  else if(msg == "memberLoginNo") msg = "로그인에 실패하셨습니다.";
  else if(msg == "memberLoginPwdNo") msg = "비밀번호를 확인하세요.";
  else if(msg == "memberLogoutOk") msg = nickName + "님 로그아웃 되었습니다.";
  else if(msg == "pwdConfirmOk") msg = "회원정보 수정으로 이동합니다";
  else if(msg == "pwdConfirmNo") msg = "비밀번호가 틀립니다.";
  else if(msg == "memberUpdateOk") msg = "회원정보 수정이 완료되었습니다.";
  else if(msg == "memberUpdateNo") msg = "회원 정보 수정 에러!";
  else if(msg == "memberDeleteOk") msg = "탈퇴가 정상처리되었습니다.";
  else if(msg == "memberLevelChangeOk") msg = "등급이 변경되었습니다.";
  else if(msg == "NoLogin") msg = "로그인시에만 이용할 수 있습니다.";
  else if(msg == "boInputOk") msg = "게시글이 등록 되었습니다.";
	else if(msg == "boInputNo") msg = "게시글 등록 실패ㅠ";
	else if(msg == "boDeleteOk") msg = "게시글이 삭제 되었습니다.";
	else if(msg == "boDeleteNo") msg = "게시글 삭제 실패ㅠ";
	else if(msg == "boUpdateOk") msg = "게시글이 수정되었습니다.";
	else if(msg == "boUpdateNo") msg = "게시글 수정실패ㅠ";
  else if(msg == "noticeInputOk") msg = "공지사항이 등록 되었습니다.";
	else if(msg == "noticeInputNo") msg = "공지사항 등록 실패ㅠ";
	else if(msg == "noticeDeleteOk") msg = "공지사항이 삭제 되었습니다.";
	else if(msg == "noticeDeleteNo") msg = "공지사항 삭제 실패ㅠ";
	else if(msg == "noticeUpdateOk") msg = "공지사항이 수정되었습니다.";
	else if(msg == "noticeUpdateNo") msg = "공지사항 수정실패ㅠ";
	else if(msg == "replyBoardInputOk") msg = "댓글이 등록되었습니다.";
  else if(msg == "productRegOk") msg = "상품 등록이 완료되었습니다.";
  else if(msg == "productRegNo") msg = "상품 등록에 실패하였습니다.";
	
	alert(msg);
	if(url != "") location.href=url;

</script>
</head>
<body>

</body>
</html>