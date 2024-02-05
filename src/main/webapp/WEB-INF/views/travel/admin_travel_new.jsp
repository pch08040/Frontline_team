<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 헤더 자바스크립트 -->
<!-- 어드민 헤더만 자바스크립트로 헤더 스타일 변경해줌 -->
<script src="resources/js/header_admin.js"></script>
<!-- 헤더 스타일 -->
<link rel="stylesheet" href="resources/css/header.css">
<!-- 관리자 메뉴 스타일 -->
<link rel="stylesheet" href="resources/css/admin_aside.css">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
  <style>
  main {
		max-width: 1240px;
    	margin: 0 auto;
	}
  </style>
<body>
<jsp:include page="../header.jsp"/>
	<main>
	<jsp:include page="../admin_aside.jsp"/>
	<section>
	<div class="hright">
						<div class="travelReg">
							<h2>여행지 등록 페이지</h2>
						</div>
						<form id="search" method="POST" action="/frontline/travelNew">
							<select class="sb" name="regionSeq">
								<option value="" disabled="disabled" selected="selected">지역선택</option>
								<option value="0">천안</option>
								<option value="1">아산</option>
								<option value="2">당진</option>
								<option value="3">서산</option>
								<option value="4">태안</option>
								<option value="5">예산</option>
								<option value="6">공주</option>
								<option value="7">홍성</option>
								<option value="8">보령</option>
								<option value="9">청양</option>
								<option value="10">부여</option>
								<option value="11">서천</option>
								<option value="12">논산</option>
								<option value="13">계룡</option>
								<option value="14">금산</option>
							</select>
							<div class="inputInform">
								<div>상호명</div>
								<input class="sinput" type="text" name="boardTitle">
								<div>주소</div>
								<input class="sinput" type="text" name="boardAddress">
								<div>오픈시간</div>
								<input class="sinput" type="text" name="boardOpen">
								<div>상세글</div>
								<input class="sinput" type="textarea" name="boardDetail">
								<div>브레이크</div>
								<input class="sinput" type="text" name="boardBreak">
								<div>전화번호</div>
								<input class="sinput" type="text" name="boardPhone">
								<div>이미지</div>
								<input class="sinput" type="textarea" name="boardImage">
								<input type="hidden" name="userSeq" value="${userDTO.userSeq}">
							</div>
							<input class="sbtn" type="submit" value="등록">
						</form>
					</div>
	</section>
	</main>	
</body>
</html>