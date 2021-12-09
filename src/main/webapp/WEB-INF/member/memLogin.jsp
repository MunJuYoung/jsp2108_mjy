<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memLogin.jsp</title>
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
					<h2>로그인</h2>
						<p>아이디와 비밀번호를 입력해주십시오.</p>
						<form name="myform"	method="post" action="${ctp}/memLoginOk.mem" class="was-validated">
							<div class="form-group">
								<label for="mid">아이디: </label>
								<input type="text" class="form-control" id="mid" placeholder="아이디를 입력하세요." 
									name="mid" value="${mid}" required autofocus >
								<div class="invalid-feedback">아이디를 입력하십시오.</div>
							</div>
							<div class="form-group">
								<label for="pwd">비밀번호 : </label>
								<input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요."
									name="pwd" maxlength="12" required >
								<div class="invalid-feedback">비밀번호를 입력하십시오.</div>
							</div>
							<button type="submit" class="btn btn-primary">로그인</button>
							<button type="reset" class="btn btn-primary">다시 입력</button>
							<button type="button" onclick="location.href='${ctp}/';" class="btn btn-primary">돌아가기</button>
							<button type="button" onclick="location.href='${ctp}/memJoin.mem';" class="btn btn-warning">회원가입</button>
							<div class="row" style="font-size:16px;">
								<span class="col mt-3 mb-3">
									<label for="idCheck" style="cursor:pointer">
										<input type="checkbox" name="idCheck" id="idCheck" checked> 아이디 저장
									</label>
								</span>
								<p><br></p>
							</div>
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