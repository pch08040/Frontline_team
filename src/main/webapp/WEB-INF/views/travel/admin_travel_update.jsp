<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- <script>
	$("document").ready(function(){
		// 수정버튼
		$("input[value=수정]").click(function(){
			$("#updateText").text($(this).parent().text())
			$("#updateTarget").attr("name", $(this).attr("id"))
			if($(this).attr("id") == "gradeSeq"){
				$("#updateText").text($(this).parent().text() + "(0 = user / 1 = admin)")
			}
			if($(this).attr("id") == "genderSeq"){
				$("#updateText").text($(this).parent().text() + "(0 = 남자 / 1 = 여자)")
			}
			$(".popup").css("display", "flex")
		})
		
		$("input[value=취소하기]").click(function(){
			$(".popup").css("display", "none")
			$("#updateText").text("")
		})
	})
</script> -->
<style>
	main {
	max-width: 1240px;
    margin: 0 auto;
}
</style>

</head>
<body>
	<jsp:include page="../header.jsp"/>
	<main>
		<jsp:include page="../admin_aside.jsp"/>
		<form action="travelBoardUpdate">
		<section>
			<div class="section_title">
				<h1>게시글 정보</h1>
			</div>
			<p>글번호 : ${beforeUpdate.boardSeq}<input type="hidden" name="boardSeq" value="${beforeUpdate.boardSeq }"> <!--  <input type="button" value="수정" id="userId"></p>-->
			<p>카테고리 : ${beforeUpdate.regionSeq} <!-- <input type="button" value="수정" id="userPw"></p> -->
			<p>지역 : ${beforeUpdate.typeSeq} <!-- <input type="button" value="수정" id="userName"></p> -->
			<p>상호명 : <input type="text" name="boardTitle" value="${beforeUpdate.boardTitle }"></p><!--  <input type="button" value="수정" id="gradeSeq">-->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${updateUserDTO.gradeSeq == 0}">user</c:when> --%>
<%-- 					<c:when test="${updateUserDTO.gradeSeq == 1}">owner</c:when> --%>
<%-- 					<c:when test="${updateUserDTO.gradeSeq == 2}">admin</c:when> --%>
<%-- 				</c:choose> --%>
			 
			<p>주소 : <input type="text" name="boardAddress" value="${beforeUpdate.boardAddress}"></p><!-- <input type="button" value="수정" id="genderSeq"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${updateUserDTO.genderSeq == 0}">남자</c:when> --%>
<%-- 					<c:when test="${updateUserDTO.genderSeq == 1}">여자</c:when> --%>
<%-- 				</c:choose> --%>
			 
			<p>오픈시간 : <input type="text" name="boardOpen" value="${beforeUpdate.boardOpen}"></p><!-- <input type="button" value="수정" id="userBirth"> -->
			<p>상세글 : <input type="textarea" name="boardDetail" value="${beforeUpdate.boardDetail}"></p><!-- <input type="button" value="수정" id="userEmail"> -->
			<p>작성일 : ${beforeUpdate.boardRegDate}<!--  <input type="button" value="수정" id="userPhone">--></p>
			<p>브레이크 : <input type="text" name="boardBreak" value="${beforeUpdate.boardBreak}"></p><!-- <input type="button" value="수정" id="userPhone"> -->
			<p>전화번호 : <input type="text" name="boardPhone" value="${beforeUpdate.boardPhone}"></p><!-- <input type="button" value="수정" id="userPhone"> -->
			<p>이미지 : <input type="textarea" name="boardImage" value="${beforeUpdate.boardImage}"></p><!-- <input type="button" value="수정" id="userPhone"> -->
			<p>사용자번호 : ${beforeUpdate.userSeq}</p>
		</section>
		<input type="submit" value="수정">
		</form>
<!-- 		<div class="popup"> -->
<!-- 			<form action="updateAdminUser"> -->
<!-- 				<p id="updateText"></p> -->
<!-- 				<p><input id="updateTarget" type="text"></p> -->
<!-- 				<p> -->
<!-- 				<input type="submit" value="수정하기"> -->
<!-- 				<input type="button" value="취소하기"> -->
<!-- 				</p> -->
<!-- 			</form> -->
<!-- 		</div> -->
	</main>
</body>
</html>