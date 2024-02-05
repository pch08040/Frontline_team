<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="com.frontline.db.RoomDB"%>
<%@ page import="com.frontline.db.CommentDB"%> --%>
<!DOCTYPE html>
<html>

<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a550ab36f8fa23b9d230a1ee3036c93f&libraries=services"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
    $(function(){
    	$(".comment_view_button").click(function(){
    		let num = $(this).parent().parent().attr("id")
    		console.log(num)
    		if($(".coComment_write[id="+num+"]").css("display") == "none"){
    			$(".coComment_write[id="+num+"]").css("display", "block")
    			$(this).attr("value", "답글접기")
    		} else {
    			$(".coComment_write[id="+num+"]").css("display", "none")
    			$(this).attr("value", "답글달기")
    		}
    		
    	})
    })
    	
    </script>
</head>

<body>
	<jsp:include page="../header.jsp"/>
    <div class="wrap">
        <div class="div1">
            <div class="div1 area">
                <img class="area1"
                    src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Location_icon.png?raw=true">
                <div class="area2">천안시</div>
            </div>
<%-- <%
	int pageNumber = Integer.parseInt(request.getParameter("page"));
%> --%>
            <div class="div1 place"><h2 class="title"></h2></div>
			<h4 class="address"></h4>
			<h5></h5>
            <div class="best_food">

                <div class="food_item">
					<img src="">
                </div>
			
            </div><br>
			<h4>1박 가격 : </h4>
            <div class="div2">
                <span class="div2 img"><img
                        src="https://raw.githubusercontent.com/Jominsang1/FrontLine_Project/abd4804f1a43745a0ff936a8ba1c64227c0618d0/images/quotation_marks.png"></span>
                <span class="div2 title"></span>
                <span class="div2 img"><img
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
	
	<hr>
	
	<div class="comments_section">
		<h1>댓글<img class="image_comment" src="resources/images/icon_comment.png"></h1>
		
		<div class="line"></div>
		
		<div class="comment_write">
			<form class="comment_write_form" action="Comment">
				<textarea class="comment_write_text" name="commentText"></textarea>
				<input class="comment_write_submit" type="submit" value="등록">
			</form>
		</div>
		
		<div class="line"></div>
		
		<div class="comments_list">
			<c:if test="">
				<c:forEach var="item" items="${CommentDB.getCommentList()}" varStatus="i">
				<div class="comment_view" id="${i.index}">
					<div>
						<c:if test="${CommentDB.getCommentList().get(i.index).getCommentGrade() == 'user'}">
							<img class="image_user" src="resources/images/icon_user.png">
						</c:if>
						<c:if test="${CommentDB.getCommentList().get(i.index).getCommentGrade() == 'admin'}">
							<img class="image_user" src="resources/images/icon_admin.png">
						</c:if>
					</div>
					<div class="comment_view_main">
						<div class="comment_view_title">${CommentDB.getCommentList().get(i.index).getCommentId()}</div>
						<div class="comment_view_text">${CommentDB.getCommentList().get(i.index).getCommentText()}</div>
						<div>작성날짜 : ${CommentDB.getCommentList().get(i.index).getCommentRegDate()}</div>
					</div>
					<div>
						<input class="comment_view_button" type="submit" value="답글달기">
					</div>
				</div>
				
				<hr>
				
				<div class="coComment_write"  id="${i.index}" >
					<form class="coComment_write_form" action="Comment">
						<textarea class="coComment_write_text" name="commentText"></textarea>
						<input class="coComment_write_target" type="text" value="${i.index}" name="commentTarget">
						<input class="coComment_write_submit" type="submit" value="등록">
					</form>
					<div class="line"></div>
				</div>
				
					<c:if test="${item.getCommentList().isEmpty() == false}">
						<c:forEach var="item" items="${item.getCommentList()}" varStatus="i">
							<div class="coComment_view">
								<div>
									<img class="image_comment_direction" src="resources/images/icon_comment_direction.png">
								</div>
								<div>
									<c:if test="${item.getCommentGrade() == 'user'}">
										<img class="image_user" src="resources/images/icon_user.png">
									</c:if>
									<c:if test="${item.getCommentGrade() == 'admin'}">
										<img class="image_user" src="resources/images/icon_admin.png">
									</c:if>
								</div>
								<div class="coComment_view_main">
									<div class="comment_view_title">${item.getCommentId()}</div>
									<div class="comment_view_text">${item.getCommentText()}</div>
									<div>작성날짜 : ${item.getCommentRegDate()}</div>
								</div>
							</div>
							<div class="line"></div>
						</c:forEach>
						
					</c:if>
					
				</c:forEach>
			</c:if>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>