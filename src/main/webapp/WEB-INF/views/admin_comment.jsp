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
<script>
	$("document").ready(function(){
		// 수정버튼
		$("input[class=editButton]").click(function(){
			$("input[name=commentSeq]").val($(this).parent().parent().find("input[type=checkbox]").attr("name"))
			$("input[id=getComment]").click()
		})
		
		// 페이지보기 셀렉트 클릭
		$("select[name=countPerPage]").change(function(){
			$("#setPerPageSubmit").click()
		})
	})
</script>
<style>
	main {
		max-width: 1240px;
    	margin: 0 auto;
	}
	.getComment {
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
			<div class="section_title">
				<h1>댓글 목록</h1>
			</div>
			
			<div class="section_select">
				<form action="commentSetPerPage">
					<select name="countPerPage">
					<c:choose>
						<c:when test="${countPerPage == 5}">
							<option value="5" selected="true">5개씩 보기</option>
							<option value="10">10개씩 보기</option>
						</c:when>
						<c:when test="${countPerPage == 10}">
							<option value="5">5개씩 보기</option>
							<option value="10" selected="true">10개씩 보기</option>
						</c:when>
						<c:otherwise>
							<option value="5" selected="true">5개씩 보기</option>
							<option value="10">10개씩 보기</option>
						</c:otherwise>
					</c:choose>		
					</select>
					<input id="setPerPageSubmit" type="submit">
				</form>
			</div>
			
			<form action="deleteComment">
			
			<table border=1>
			
				<thead>
					<tr>
						<th>선택</th>
						<th>댓글번호</th>
						<th>게시물번호</th>
						<th>사용자번호</th>
						<th>부모댓글번호</th>
						<th>사용자아이디</th>
						<th>사용자등급</th>
						<th>댓글내용</th>
						<th>등록일</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${map.get('list')}" varStatus="i">
						<tr>
							<td><input type="checkbox" name="${item.commentSeq}"></td>
							<td>${item.commentSeq}</td>
							<td>${item.boardSeq}</td>
							<td>${item.userSeq}</td>
							<td>${item.parentSeq}</td>
							<td>${item.userId}</td>
							<td>
								<c:choose>
									<c:when test="${item.gradeSeq == 0}">user</c:when>
									<c:when test="${item.gradeSeq == 1}">admin</c:when>
								</c:choose>
							</td>
							<td>${item.commentText}</td>
							<td>${item.commentRegDate}</td>
							<td><input type="button" value="수정" class="editButton">
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" value="삭제">
			</form>
			
			<form action="getComment">
				<select name="searchColumn">
					<option value="userId">아이디</option>
					<option value="commentText">내용</option>
				</select>
				<input type="text" name="searchText">
				<input type="submit" value="검색">
			</form>
			
			<div>
			<c:if test = "${map.get('beginPaging') != 1}">
				<a href="getComment?pageNum=${map.get('beginPaging')-1}">이전</a>
			</c:if>
			
			<c:forEach var="page" begin="${map.get('beginPaging')}" end="${map.get('endPaging')}">
				<c:if test = "${pageNum == page}">
					<a style="font-size:2em" href="getComment?pageNum=${page}">${page}</a>
				</c:if>
				<c:if test = "${pageNum != page}">
					<a href="getComment?pageNum=${page}">${page}</a>
				</c:if>
			</c:forEach>
			
			<c:if test = "${map.get('endPaging') != map.get('totalPaging')}">
				<a href="getComment?pageNum=${map.get('endPaging')+1}">다음</a>
			</c:if>
			</div>
			
			<%-- getComment 컨트롤러로 이동한 후 commentSeq 값이 있는지 판단한 후 리스트로 뽑을지 dto 하나만 돌려줄지 판단 --%>
			<form action="getComment" class="getComment">
				<input type="text" name="commentSeq">
				<input type="submit" id="getComment">
			</form>
			
		</section>
	</main>
</body>
</html>