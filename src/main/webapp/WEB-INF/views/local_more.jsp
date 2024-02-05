<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="com.javabeans.userDto" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 헤더 자바스크립트 -->
<script src="resources/js/header.js"></script>
<!-- 헤더 스타일 -->
<link rel="stylesheet" href="resources/css/header.css">
<!-- 푸터 스타일 -->
<link rel="stylesheet" href="resources/css/footer.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&family=Roboto&display=swap"
rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
</script>
<style>
main{
	display: flex;
	flex-direction: column;
	
	max-width: 1240px;
    margin: 0 auto;
}
.board_wrap {
	display: flex;
	justify-content: space-evenly;
}
.board_section {
	border: 1px solid black;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	text-align: center;
	
	width: 230px;
	height: 200px;
}
.board_image {
	width: 230px;
    height: 160px;
    object-fit: cover;

	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
.page {
	text-align: center;
	
	padding: 30px;
}
.board_title {
	height: 50px;
	display: flex;
	
	align-items: center;
	justify-content: center;
}
a {	
	text-decoration-line: none;
    color: black;
}

.board_wrap {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>

<body>
	<jsp:include page="header.jsp"/>
	<main>
	
		<c:set var="i" value="0" />
		<c:set var="j" value="5" />
		
      	<c:forEach var="item" items="${map.list}">
           	<c:if test="${i%j == 0}">
			<div class="board_wrap">
			</c:if>
           		<a href="getBoardDetail?boardSeq=${item.boardSeq}">
           		<div class="board_section">
           			<div><img class="board_image" src="${item.boardImage}"></div>
           			<div class="board_title">${item.boardTitle}</div>
           		</div>
           		</a>
           	<c:if test="${i%j == j-1 || i == map.list.size()-1}">
        	</div>
        	</c:if>
     	<c:set var="i" value="${i+1}" />
      	</c:forEach>
      	
		<div class="page">
			<c:if test = "${map.get('beginPaging') != 1}">
				<a href="localMore?pageNum=${map.get('beginPaging')-1}&regionSeq=${regionSeq}&typeSeq=${typeSeq}"">이전</a>
			</c:if>
			
			<c:forEach var="page" begin="${map.get('beginPaging')}" end="${map.get('endPaging')}">
				<c:if test = "${pageNum == page}">
					<a style="font-size:2em" href="localMore?pageNum=${page}&regionSeq=${regionSeq}&typeSeq=${typeSeq}">${page}</a>
				</c:if>
				<c:if test = "${pageNum != page}">
					<a href="localMore?pageNum=${page}&regionSeq=${regionSeq}&typeSeq=${typeSeq}">${page}</a>
				</c:if>
			</c:forEach>
			
			<c:if test = "${map.get('endPaging') != map.get('totalPaging')}">
				<a href="localMore?pageNum=${map.get('endPaging')+1}&regionSeq=${regionSeq}&typeSeq=${typeSeq}"">다음</a>
			</c:if>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>