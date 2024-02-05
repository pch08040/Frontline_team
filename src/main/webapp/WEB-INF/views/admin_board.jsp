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
			$("input[name=boardSeq]").val($(this).parent().parent().find("input[type=checkbox]").attr("name"))
			$("input[id=getAdminBoard]").click()
		})
		
		// 페이지개수선택 셀렉트 클릭
		$("select[name=countPerPage]").change(function(){
			$("#setPerPageSubmit").click()
		})
		
		// 타입선택 셀렉트 클릭
		$("select[name=typeSeq]").change(function(){
			$("#setBoardTypeSubmit").click()
		})
		
		// 지역선택 셀렉트 클릭
		$("select[name=regionSeq]").change(function(){
			$("#setBoardRegionSubmit").click()
		})
		
	})
</script>
<style>
	main {
		max-width: 1240px;
    	margin: 0 auto;
	}
	.getAdminBoard {
		display:none;
	}
	
	#setPerPageSubmit, #setBoardTypeSubmit, #setBoardRegionSubmit {
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
				<h1>게시글 목록</h1>
			</div>
			
			<div class="section_select">
				<form action="setBoardPerPage">
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
				
				<form action="setBaordType">
					<select name="typeSeq">
							<c:choose>
								<c:when test="${typeSeq == 1}">
									<option value="0">여행지</option>
									<option value="1" selected="true">놀거리</option>	
									<option value="2">맛집</option>	
									<option value="3">숙소</option>	
								</c:when>
								<c:when test="${typeSeq == 2}">
									<option value="0">여행지</option>
									<option value="1">놀거리</option>	
									<option value="2" selected="true">맛집</option>	
									<option value="3">숙소</option>	
								</c:when>
								<c:when test="${typeSeq == 3}">
									<option value="0">여행지</option>
									<option value="1">놀거리</option>	
									<option value="2">맛집</option>	
									<option value="3" selected="true">숙소</option>	
								</c:when>
								<c:otherwise>
									<option value="0" selected="true">여행지</option>
									<option value="1">놀거리</option>	
									<option value="2">맛집</option>	
									<option value="3">숙소</option>	
								</c:otherwise>
							</c:choose>	
					</select>
					<input id="setBoardTypeSubmit" type="submit">
				</form>
				<form action="setBoardRegion">
					<select name="regionSeq">
						<option>지역선택</option>
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
					<input id="setBoardRegionSubmit" type="submit">
				</form>
			</div>
			
			<form action="deleteBoard">
			
			<table border=1>
			
				<thead>
					<tr>
						<th>선택</th>
						<th>게시글번호</th>
						<th>사용자번호</th>
						<th>지역번호</th>
						<th>타입번호</th>
						<th>제목</th>
						<th>주소</th>
						<th>영업시간</th>
						<th>상세정보</th>
						<th>휴무</th>
						<th>전화번호</th>
						<th>이미지</th>
						<th>등록일</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${map.get('list')}" varStatus="i">
						<tr>
							<td><input type="checkbox" name="${item.boardSeq}"></td>
							<td>${item.boardSeq}</td>
							<td>${item.userSeq}</td>
							<td>${item.regionSeq}</td>
							<td>${item.typeSeq}</td>
							<td>${item.boardTitle}</td>
							<td>${item.boardAddress}</td>
							<td>${item.boardOpen}</td>
							<td>${item.boardDetail}</td>
							<td>${item.boardBreak}</td>
							<td>${item.boardPhone}</td>
							<td><img width="100px" src="${item.boardImage}"></td>
							<td>${item.boardRegDate}</td>
							<td><input type="button" value="수정" class="editButton">
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" value="삭제">
			</form>
			<form action="getAdminBoard">
				<select name="searchColumn">
					<option value="boardTitle">제목</option>
					<option value="boardAddress">주소</option>
				</select>
				<input type="text" name="searchText">
				<input type="submit" value="검색">
			</form>
			
			<div>
			<c:if test = "${map.get('beginPaging') != 1}">
				<a href="getAdminBoard?pageNum=${map.get('beginPaging')-1}">이전</a>
			</c:if>
			
			<c:forEach var="page" begin="${map.get('beginPaging')}" end="${map.get('endPaging')}">
				<c:if test = "${pageNum == page}">
					<a style="font-size:2em" href="getAdminBoard?pageNum=${page}">${page}</a>
				</c:if>
				<c:if test = "${pageNum != page}">
					<a href="getAdminBoard?pageNum=${page}">${page}</a>
				</c:if>
			</c:forEach>
			
			<c:if test = "${map.get('endPaging') != map.get('totalPaging')}">
				<a href="getAdminBoard?pageNum=${map.get('endPaging')+1}">다음</a>
			</c:if>
			</div>
			
			<%-- getComment 컨트롤러로 이동한 후 commentSeq 값이 있는지 판단한 후 리스트로 뽑을지 dto 하나만 돌려줄지 판단 --%>
			<form action="getAdminBoard" class="getAdminBoard">
				<input type="text" name="boardSeq">
				<input type="submit" id="getAdminBoard">
			</form>
			
		</section>
	</main>
</body>
</html>