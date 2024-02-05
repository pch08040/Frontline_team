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
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script>
		// 페이지 이동
		$("a[id=page_num_button]").click(function(){
			$("#page_num").val($(this).attr("value"))
			$("#page_num_submit").click()
		})
		
		// prev 버튼
		$("input[id=prevPage]").click(function(){
			$("input[id=pageNumber]").val(${pageNumber}-1);
		})
		
		// next 버튼
		$("input[id=nextPage]").click(function(){
			$("input[id=pageNumber]").val(${pageNumber}+1);
		})
	})
</script>
<style>
main {
		max-width: 1240px;
    	margin: 0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<jsp:include page="admin_aside.jsp"/>
		<section>
			<div class="section_title">
				<h1>맛집 등록 > 신규 등록</h1>
			</div>
			
			<form action="eatResult" method="post">
		<!--private int boardSeq = -1; 게시글 번호
			private int userSeq = -1; 회원 번호
			private int regionSeq = -1; 지역 번호 
			private int typeSeq = -1; 게시물 카테고리 --> 
			
				<!--<input type="hidden" name="userSeq" value="${dto.userSeq }">  -->
				
				지역: <select name="regionSeq">
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
				<input type="hidden" name="typeSeq" value="2">
				<input type="hidden" name="userSeq" value="${userDTO.userSeq}">
				주소: <input type="text" name="boardAddress">
				전화번호: <input type="text" name="boardPhone">
				오픈시간: <input type="text" name="boardOpen"><br>
				상호명: <input type="text" name="boardTitle">
				상세 내용: <input type="textarea" name="boardDetail">
				이미지: <input type="textarea" name="boardImage"><br>
				<input type="submit" value="등록">
			</form>
		</section>
	</main>
</body>
</html>