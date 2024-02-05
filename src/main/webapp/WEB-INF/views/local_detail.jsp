<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a550ab36f8fa23b9d230a1ee3036c93f&libraries=services"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- 헤더 자바스크립트 -->
<script src="resources/js/header.js"></script>
<!-- 헤더 스타일 -->
<link rel="stylesheet" href="resources/css/header.css">
<!-- 푸터 스타일 -->
<link rel="stylesheet" href="resources/css/footer.css">
<%-- 상세페이지 스크립트 --%>
<script src="resources/js/detail_page.js"></script>
<%-- 상세페이지 css --%>
<link rel="stylesheet" href="resources/css/detail_page.css">
<script>
	
<%-- 댓글기능 관련 스크립트 --%>
	$(function() {
		$(".comment_view_button")
				.click(
						function() {
							let num = $(this).parent().parent().attr("id")
							console.log(num)
							if ($(".coComment_write[id=" + num + "]").css(
									"display") == "none") {
								$(".coComment_write[id=" + num + "]").css(
										"display", "block")
								$(this).attr("value", "답글접기")
							} else {
								$(".coComment_write[id=" + num + "]").css(
										"display", "none")
								$(this).attr("value", "답글달기")
							}

						})
	})
</script>
<style>
	.wrap {
		max-width: 1240px;
    	margin: 0 auto;
	}
	
	.comments_section {
		max-width: 1240px;
    	margin: 0 auto;
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div class="div1">
			<div class="div1 area">
				<img class="area1"
					src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Location_icon.png?raw=true">
				<div class="area2">
					<c:choose>
                			<c:when test="${boardDTO.regionSeq == 0}">
               					천안시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 1}">
                				아산시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 2}">
              					 당진시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 3}">
              					  서산시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 4}">
              					 태안군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 5}">
              					 예산군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 6}">
              					 공주시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 7}">
              					 홍성군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 8}">
              					 보령시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 9}">
              					 청양군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 10}">
              					 부여군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 11}">
              					 서천군
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 12}">
              					 논산시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 13}">
              					 계룡시
            				</c:when>
            		<c:when test="${boardDTO.regionSeq == 14}">
              					 금산군
            				</c:when>
            		
        			</c:choose>
				</div>
			</div>

			<div class="div1 place">
				<h2 class="title">${boardDTO.boardTitle}</h2>
			</div>
			<h4 class="address">${boardDTO.boardAddress}</h4>
			<h5>전화번호 : ${boardDTO.boardPhone}</h5>
			<div class="best_food">

				<div class="food_item">
					<img src="${boardDTO.boardImage}">
				</div>

			</div>
			<br>

			<div class="div2">
				<span class="div2 img"><img
					src="https://raw.githubusercontent.com/Jominsang1/FrontLine_Project/abd4804f1a43745a0ff936a8ba1c64227c0618d0/images/quotation_marks.png"></span>
				<span class="div2 title">${boardDTO.boardDetail}</span> <span
					class="div2 img"><img
					src="https://raw.githubusercontent.com/Jominsang1/FrontLine_Project/7da459fdc0919fd19c1b2f1517354f19d0c0c86a/images/quotation_marks2.png"></span>
				<span class="div2 text"></span>
			</div>




			<div class="findWay">
				<p class="btnText">READY?</p>
				<div class="btnTwo">
					<p class="btnText2">GO!</p>
				</div>
			</div>

			<div id="map"></div>

		</div>

		<div class="list">

			<ul class="ul4 info">

			</ul>

		</div>
	</div>

	

	<div class="comments_section" id="commentSection">
	<hr>
		<h1>
			댓글<img class="image_comment" src="resources/images/icon_comment.png">
		</h1>

		<div class="line"></div>

		<div class="comment_write">
			<form class="comment_write_form" action="addComment">
				<textarea class="comment_write_text" name="commentText"></textarea>
				<input type="hidden" name="userSeq" value="${userDTO.userSeq}">
				<input type="hidden" name="userId" value="${userDTO.userId}">
				<input type="hidden" name="gradeSeq" value="${userDTO.gradeSeq}">
				<input type="hidden" name="boardSeq" value="${boardDTO.boardSeq}">
				<input class="comment_write_submit" type="submit" value="등록">
			</form>
		</div>

		<div class="line"></div>

		<div class="comments_list">
			<c:if test="${not empty commentList}">
		 				<c:forEach var="item" items="${commentList}" varStatus="i">
		 				<!-- depth 값에 따라 padding-left 값 변경하여 댓글 답글 표시 -->
		 				<div class="comment_view" id="${i.index}" style="padding-left:${item.depth * 50}px">
		 					<!-- 사용자 등급에 따라 댓글 이미지 변경 -->
		 					<div>
		 						<c:if test="${item.gradeSeq != 1}">
		 							<img class="image_user" src="resources/images/icon_user.png">
		 						</c:if>
		 						<c:if test="${item.gradeSeq == 1}">
		 							<img class="image_user" src="resources/images/icon_admin.png">
		 						</c:if>
		 					</div>
		 					<div class="comment_view_main">
		 						<div class="comment_view_title">${item.userId}</div>
		 						<div class="comment_view_text">${item.commentText}</div>
		 						<div>작성날짜 : ${item.commentRegDate}</div>
		 					</div>
		 					<div>
		 						<input class="comment_view_button" type="submit" value="답글달기">
		 					</div>
		 				</div>

		 				<hr>

		 				<div class="coComment_write"  id="${i.index}" >
		 					<form class="coComment_write_form" action="addComment">
		 						<textarea class="coComment_write_text" name="commentText"></textarea>
		 						<input class="coComment_write_target" type="text" value="${item.commentSeq}" name="parentSeq">
		 						<input type="hidden" name="userSeq" value="${userDTO.userSeq}">
		 						<input type="hidden" name="userId" value="${userDTO.userId}">
								<input type="hidden" name="gradeSeq" value="${userDTO.gradeSeq}">
		 						<input type="hidden" name="boardSeq" value="${boardDTO.boardSeq}">
		 						<input class="coComment_write_submit" type="submit" value="등록">
		 					</form>
		 					<div class="line"></div>
		 				</div>

		 				</c:forEach>
		 				
		 			</c:if>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>