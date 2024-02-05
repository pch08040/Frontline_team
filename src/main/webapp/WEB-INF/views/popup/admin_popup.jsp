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

<style>
main {
		max-width: 1240px;
    	margin: 0 auto;
	}
/*셀렉트*/
.members {
/* 	padding-left: 10%; */
	display: inline-block;
}
 .table { 
 	width: 70%; 
 } 

 .table textarea { 
 	width: 100px; 
 } 
.eat_image {
	width: 100px;
	height: 100px;
}

textarea {
	resize: none;
}
</style>
<style>
/*페이징*/
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 14px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .prev {
	background: #f8f8f8 url('') no-repeat center center;
	margin-right: 6px;
}

.page_nation .next {
	background: #f8f8f8 url('') no-repeat center center;
	margin-left: 6px;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.arrow.prev {
	margin-right: 10px;
}

.arrow.next {
	margin-left: 10px;
}

.travel_image {
	width:100px;
	heigth:100px;
}
#imageSize{
    background-size: cover;
    width: 95px;
}
.imageSize{
	pointer-events: none;
	
}
input{
	border: none;
	text-align: center;
	width: 95px;
}
td, th{
	border: 1px solid #aaa;
	margin: auto;
	width: 95px;
}

</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<main>
	<jsp:include page="../admin_aside.jsp"/>
	<section>
	<div class="members">
				<!--=========================== 팝업창 ================================== 
				<div class="menu_wrap viewBar menu_ul"
					style="position: absolute; top: 90px; right: 70px;">
					<a><div>로그아웃</div></a> <a><div>내정보</div></a>
				</div>
				===================================================================== -->
<!-- 				<div class="head"> -->
			<h1>팝업 관리</h1>
<!-- 					<div id="hright"> -->
<!-- 						<form id="search" method="GET" action="boardPick"> -->
<!-- 							<select class="sb" name="boardPick"> -->
<!-- 								<option value="-1" selected="selected">전체</option> -->
<!-- 								<option value="0">글번호</option> -->
<!-- 								<option value="1">지역</option> -->
<!-- 								<option value="2">상호명</option> -->
<!-- 								<option value="3">사용자번호</option> -->
<!-- 							</select> -->
<!-- 							<input type="hidden" name="typeSeq" value="0"> -->
<!-- 							<input class="sinput" type="text" name="boardSearch" placeholder="검색어를 입력해주세요"> -->
<!-- 							<input class="sbtn" type="submit" value="검색"> -->
<!-- 						</form> -->
<!-- 					</div> -->
<!-- 				<br> -->
			<form action="travelDelete">
				<div class="table">
					<table id="tb" border="1">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>이미지</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
<%-- 									<td>${status.count}</td> --%>
<!-- 									<td><input type="checkbox"></td> -->
							<c:forEach var="popupDto" items="${popup}" varStatus="status"> 
								<tr>
									<td><input type="checkbox" name="boardDelete" value="${dto.boardSeq}" ></td>
									<td><input class="imageSize" value="${popupDto.POPUP_NUMBER}"></td>
									<td><img id="imageSize" src="${popupDto.POPUP_IMAGE}"></td>
									<td><a href="popupReadyUpdate?POPUP_NUMBER=${popupDto.POPUP_NUMBER}"	><input type="button" value="수정" name="${dto.boardSeq}"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<!-- 					<input type="submit" value="삭제"> -->
				</div>
			</form>
				<br>
				<div class="page_wrap">
					<a class="arrow prev" href="#"><button>
							<img
								src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202187.png?raw=true">
						</button></a>
					<div class="page_nation">
						<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a>
						<a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
						<a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
					</div>
					<a class="arrow next" href="#"><button>
							<img
								src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202188.png?raw=true">
						</button></a>
				</div>
<!-- 				</div> -->
			</div>
	</section>
	</main>	

</body>
</html>