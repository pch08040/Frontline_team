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
function change() {
    var inputs = document.querySelectorAll('input[type="text"]');
    var textareas = document.querySelectorAll('textarea');
    
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].readOnly = false;
    }

    for (var i = 0; i < textareas.length; i++) {
        textareas[i].disabled = false;
    }
}
</script>
<style>
main {
		max-width: 1240px;
    	margin: 0 auto;
	}
input[type="text"], textarea {
  width: 100%;
  box-sizing: border-box;
  font-size: 14px; 
  padding: 5px; 
}

table {
  width: 100%;
  max-width: 100%;
  border-collapse: collapse; 
}

td, th {
  padding: 8px; 
}

form {
  margin-top: 20px; 
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<jsp:include page="admin_aside.jsp"/>
		<section>
		<div class="section_title">
				<h1>맛집 게시글 정보</h1>
			</div>
			<table border="1">
    <thead>
        <tr>
			<th>사용자 번호</th>
			<th>지역명</th>
			<th>상호명</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>오픈시간</th>
			<th>상세 내용</th>
			<th>이미지</th>
			<th>등록일</th>
			<th>수정</th>
		</tr>
    </thead>
    <tbody>
        <tr>
        	<form action="adminEatUpdate" method="post" >
        	<input type="hidden" name="boardSeq" value="${dto.boardSeq }">
            <td><input type="hidden" name="userSeq" value="${dto.userSeq }">${dto.userSeq }</td>
            <td><input type="text" name="regionSeq" value="${dto.regionSeq }" readonly></td>
            <td><input type="text" name="boardTitle" value="${dto.boardTitle }" readonly></td>
            <td><input type="text" name="boardAddress" value="${dto.boardAddress }" readonly></td>
            <td><input type="text" name="boardPhone" value="${dto.boardPhone }" readonly></td>
            <td><input type="text" name="boardOpen" value="${dto.boardOpen }" readonly></td>
           	<td><textarea name="boardDetail" disabled>${dto.boardDetail}</textarea></td>
           	<td><textarea name="boardImage" disabled>${dto.boardImage}</textarea></td>            
            <td><input type="hidden" name="boardRegDate" value="${dto.boardRegDate }">${dto.boardRegDate }</td>
        	<td><input type="button" value="수정" onclick="change()"></td>
        </tr>
    </tbody>
</table>
<input type="submit" value="등록">
</form>
		</section>
	</main>
</body>
</html>