<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adProductReg.jsp</title>
<%@ include file="/include/bs4.jsp"%>
<script>
	var sw = 0;

	// 대분류에 따라 소분류의 이름들이 달라지게 만들기
	function classCheck(){
		document.getElementById("middleCategory").innerHTML = "";
		var mainCategory= document.getElementById("mainCategory");
		var cl = mainCategory.options[mainCategory.selectedIndex].text;
		
		if(cl == '외투'){
			document.getElementById("middleCategory").innerHTML = "<option>재킷</option><option>점퍼</option><option>패딩</option><option>코트</option>";
		}
		else if(cl == '상의'){
			document.getElementById("middleCategory").innerHTML = "<option>반팔티</option><option>긴팔티</option><option>맨투맨</option><option>후드티</option>";
		}
		else {
			document.getElementById("middleCategory").innerHTML = "<option>슬랙스</option><option>청바지</option><option>반바지</option>";
		}
	}
	
	// 상품등록 폼 체크
	function fCheck(){
		var name = myform.name.value;
		var price = myform.price.value;
		var cnts = myform.cnts.value;
		
		// 상품 사진 업로드
  	var fName = myform.fName.value;
  	var ext = fName.substring(fName.lastIndexOf(".")+1);	// 파일 확장자 발췌
  	var uExt = ext.toUpperCase();
  	var maxSize = 1024 * 1024 * 5;	// 업로드할 파일의 최대 용량은 5MByte로 한다.
	  	
		if(name == ""){
			alert("상품이름을 입력하세요");
			myform.name.focus();
		}
		else if(price == ""){
			alert("상품가격을 입력하세요");
			myform.price.focus();
		}
		else if(cnts == ""){
			alert("상품갯수를 입력하세요");
			myform.name.focus();
		}
		else if(sw == 0){
			alert("상품 중복체크를 하세요.");
		}
		else{
			if(fName.trim() == ""){
				myform.photo.value = "noimage";
			}
			else{
				var fileSize = document.getEleById("file").files[0].size;
				
				if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
		    		alert("업로드 가능한 파일은 'JPG/GIF/PNG");
		    		return false;
		    	}
		    	else if(fName.indexOf(" ") != -1) {
		    		alert("업로드할 파일명에는 공백을 포함하실수 없습니다.");
		    		return false;
		    	}
		    	else if(fileSize > maxSize) {
		    		alert("업로드할 파일의 크기는 5MByte 이하여야 합니다.");
		    		return false;
		    	}
 				}
		    	myform.submit();
			}
		}
	// 현재 등록중인 상품이 동일한 분류로 이미 등록되어있는지 검사
	function productCheck() {
		var mainCategory= document.getElementById("mainCategory");
		var mainValue = mainCategory.options[mainCategory.selectedIndex].text;
		
		var middleCategory = document.getElementById("middleCategory");
		var middleValue = middleCategory.options[middleCategory.selectedIndex].text;
		
 		var name = myform.name.value;
 		var url = "${ctp}/duplicationCheck.ad?mainValue="+mainValue+
 					"&middleValue="+middleValue+"&name="+name;
 		
 		if(name==""){
 			alert("상품이름을 입력하세요");
 			myform.name.focus();
 			return;
 		}
 		else {
 			sw = 1;
    	window.open(url,"상품 중복체크","width=500px,height=250px");
 		}
 	}
	
	function productSW(){
		sw = 0;
	}
	
</script>
</head>
<body>
	<p><br></p>
	<div class="container" style="padding:30px">
		<form name="myform" method="post" enctype="Multipart/form-data" action="${ctp}/adProductRegOk.ad">
			<h2>상품 등록</h2>
			<br>
			<div class="form-group">
				<label for="mainCategory">상품 대분류 : </label>
				<select name="mainCategory" id="mainCategory" class="form-control" onchange="classCheck()">
					<option selected>외투</option>
					<option>상의</option>
					<option>하의</option>
				</select>
			</div>
			<div class="form-group">
				<label for="middleCategory">상품 중분류 : </label>
				<select name="middleCategory" id="middleCategory" class="form-control">
					<option>재킷</option>
					<option>점퍼</option>
					<option>패딩</option>
					<option>코트</option>
				</select>
			</div>
			<div class="form-group">
				<label for="name">상품 이름 : &nbsp;&nbsp;<input type="button" value="상품 중복체크" class="btn btn-secondary" onclick="productCheck()"/></label>
				<input type="text" class="form-control" name="name" id="name" placeholder="상품 이름" required onchange="productSW()">
				
			</div>
			<div class="form-group">
				<label for="price">상품 가격 : </label>
				<input type="number" class="form-control" name="price" id="price" min="100" step="100" placeholder="상품 가격" required>
			</div>
			<div class="form-group">
	      <div class="form-check-inline">
	        <span class="input-group-text">색상</span> &nbsp; &nbsp;
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="빨강" name="color"/>빨강
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="주황" name="color"/>주황
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="노랑" name="color"/>노랑
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="초록" name="color"/>초록
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="파랑" name="color"/>파랑
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="남색" name="color"/>남색
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="보라" name="color"/>보라
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="검정" name="color" checked/>검정
				  </label>
				</div>
				<div class="form-check-inline">
				  <label class="form-check-label">
				    <input type="checkbox" class="form-check-input" value="흰색" name="color" checked/>흰색
				  </label>
				</div>
    	</div>
			<div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">사이즈</span> &nbsp; &nbsp;
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="XS" name="size"/>XS
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="S" name="size"/>S
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="M" name="size"/>M
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="L" name="size"/>L
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="XL" name="size"/>XL
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="XXL" name="size"/>XXL
			  </label>
			</div>
    </div>
			<div class="form-group">
				<label for="cnts">상품 갯수</label>
				<input type="number" class="form-control" name="cnts" id="cnts" min="1" placeholder="상품 갯수" required>
			</div>
			<div class="form-group">
      <label for="content">상품 소개</label>
      <textarea rows="5" class="form-control" id="content" name="content"></textarea>
    </div>
			<div  class="form-group">
      	<label for="fName">상품 사진(파일용량:5MByte이내) : </label>
     	 <input type="file" name="fName" id="file" multiple class="form-control-file border"/>
	    </div>
	    <button type="button" class="btn btn-secondary" onclick="fCheck()">상품 등록</button>
	    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/adContent.ad';">돌아가기</button>
	    <input type="hidden" name="photo"/>
		</form>
	</div>
	<br>
</body>
</html>