<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<%@ include file="/include/bs4.jsp"%>

</head>
<body>
<!-- 헤더 -->
	<%@ include file="/include/header.jsp"%>
<!-- 네비 -->
	<%@ include file="/include/nav.jsp"%>
	<p><br></p>
	<div class="container">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="container" >
					<h4>회원 정보를 수정하려면 비밀번호를 입력해주십시오.</h4>
						<form name="myform"	method="post" action="${ctp}/memPwdOk.mem" class="was-validated">
							<div class="form-group">
								<label for="mid">아이디: </label>
								<input type="text" class="form-control" id="mid" value="${sMid}" disabled
									name="mid" required autofocus >
							</div>
							<div class="form-group">
								<label for="pwd">비밀번호 : </label>
								<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요."
									name="pwd" maxlength="12" required >
								<div class="invalid-feedback">비밀번호를 입력하십시오.</div>
							</div>
							<button type="submit" class="btn btn-primary m-3 p-2" style="float:right" >정보 수정하러 가기</button>
							<p><br></p>
						</form>
				</div>
			</div>
		</div>
	</div>
	<br>
<!-- footer -->
	<%@ include file="/include/footer.jsp"%>
</body>
</html>