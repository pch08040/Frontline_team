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
    td img {
      width: 200px;
      height: 150px;
      object-fit: cover; 
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<jsp:include page="admin_aside.jsp"/>
		<section>
			<div class="section_title">
				<h1>맛집 관리</h1>
			</div>
		<form action="adminEatDelete">
			<table border=1>
				<thead>
					<tr>
						<th>선택</th>
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
					<c:forEach var="dto" items="${list }">
						<tr>
							<td><input type="checkbox" name="ck" value="${dto.boardSeq}"></td>
							<td>${dto.userSeq}</td>
							<td>${dto.regionSeq }</td>
							<td>${dto.boardTitle }</td>
							<td>${dto.boardAddress }</td>
							<td>${dto.boardPhone }</td>
							<td>${dto.boardOpen }</td>
							<td>${dto.boardDetail }</td>
							<td><img style="width: 200px; height:150px;" src="${dto.boardImage }"></td>
							<td>${dto.boardRegDate }</td>
							<td><a href="adminEatDetail?boardSeq=${dto.boardSeq}">수정하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" value="삭제">
		</form>		
	
	</section>
</main>
</body>
</html>