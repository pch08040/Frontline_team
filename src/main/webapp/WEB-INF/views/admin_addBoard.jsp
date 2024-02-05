<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>

</script>
<style>
	main {
		max-width: 1240px;
    	margin: 0 auto;
	}
	.getUser {
		display:none;
	}
	
	#setPerPageSubmit {
		display:none;
	}
	
	.section_select {
		display:flex;
		
		width:85%;
		
		padding: 1%;
		
		justify-content: space-between
	}
	
a {	
	text-decoration-line: none;
    color: black;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<jsp:include page="admin_aside.jsp"/>
		<section>
		<h1> 게시물 등록 </h1>
		<form action="addBoard">
			
			<input type="hidden" name="userSeq" value="${userDTO.userSeq}">
			지역선택 : <select name="regionSeq">
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
					</select><br>
			타입선택 : <select name="typeSeq">
						<option value="0">여행지</option>
			            <option value="1">놀거리</option>
			            <option value="2">맛집</option>
			            <option value="3">숙소</option>
					</select><br>
			상호명 : <input type="text" name="boardTitle"><br>
			주소 : <input type="text" name="boardAddress"><br>
			영업시간 : <input type="text" name="boardOpen"><br>
			상세설명 : <textarea name="boardDetail"></textarea><br>
			브레이크타임 : <input type="text" name="boardBreak"><br>
			전화번호 : <input type="text" name="boardPhone"><br>
			이미지 : <input type="text" name="boardImage"><br>
			
			<input type="submit" value="등록">
		</form>
		</section>
	</main>
</body>
</html>