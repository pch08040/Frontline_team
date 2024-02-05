<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 자바스크립트 -->
<script src="resources/js/header.js"></script>
<!-- 헤더 스타일 -->
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<!-- 푸터 스타일 -->
<link rel="stylesheet" href="resources/css/footer.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&family=Roboto&display=swap" rel="stylesheet">
<script>
$(function(){
	
	$("#end").click(function(){
		console.log($("#start").val())
		
		let day = new Date($("#start").val())
		day.setDate(day.getDate()+1)
		
		let year = day.getFullYear()
		let month = day.getMonth()+1
		let date = day.getDate()
		
		month = ("0"+month).slice(-2)
		date = ("0"+date).slice(-2)
		
		let result = year+"-"+month+"-"+date
		
		$(this).attr("min", result)
	})
	
	
	
	
})
</script>
<style>
main {
display: flex;
flex-direction: column;
height: 100vh;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<main>
		<div class="title_wrap"><h1 class="title">롯데 시그니엘</h1></div>
		<div class="image_wrap"><img class="image" src="https://img.freepik.com/free-photo/room-interior-of-hotel-bedroom_23-2150683419.jpg?size=626&ext=jpg&ga=GA1.1.1656829523.1691644910&semt=sph"></div>
		<div class="detail_wrap"><a class="detail">좋음</a></div>
		<div class="reser_wrap">
			<form action="/frontLine/Reservation">
			<%
			long time = System.currentTimeMillis();
			Date date = new Date(time);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String result = sdf.format(date);
			%>
				<input id="start" type="date" min="<%=result%>" name="startDate">
				<input id="end" type="date" min="" name="endDate">
				<input type="submit" value="예약하기">
			</form>
		</div>
		<div class="map_wrap"></div>
		<div class="comment_wrap"></div>
	</main>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>