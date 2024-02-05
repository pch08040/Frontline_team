<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.frontline.dto.UserDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<body>
	<header>
		<div class="header_logo">
			<a href="/frontline"><img src="resources/images/logo_yellow_white.png"></a>
		</div>
		
		<div class="main_menu">
			<button type="button" class="openmenu">회원관리</button>
			<button type="button" class="openmenu">게시물관리</button>
			<button type="button" class="openmenu">예약내역관리</button>
		</div>
		

		<div class="side_menu">
			<ul>
				<li><img class="header_img" src="resources/images/menu_yellow.png"></li>
				
					<ul class="menu">
						<%
						if(session.getAttribute("userDTO") == null){
						%>
							<li class="menu_login"><a href="goLogin">로그인</a></li>
							<li class="menu_join"><a href="goJoin_1">회원가입</a></li>
							<%
							} else {
							%>
							<li>${sessionScope.userDTO.userName}님 환영합니다.</li>
							<%
							if(0 == ((UserDTO)session.getAttribute("userDTO")).getGradeSeq()){
							%>
							<li class="menu_logout"><a href="doLogout">로그아웃</a></li>
							<li class="menu_my"><a href="goInfo">내 정보</a></li>
							<li class="menu_reser"><a href="my-예약내역.html">예약내역</a></li>
							<%					
							} else if(1 == ((UserDTO)session.getAttribute("userDTO")).getGradeSeq()){
							%>
							<li class="menu_logout"><a href="doLogout">로그아웃</a></li>
							<li class="menu_my"><a href="goInfo">내 정보</a></li>
							<li class="menu_admin"><a href="goAdmin">관리자 페이지</a></li>
							<%	
							}
						}
						%>
					</ul>
			</ul>
		</div>
	</header>
			
<div class="nav_warp">
<div class="nav">
    <a href="goAdminUser">회원정보관리</a>
</div>

<div class="nav">
    <a href="goAdminComment">댓글관리</a>
</div>

<div class="nav">
    <a href="travelList">여행지 등록 관리</a>
</div>

<div class="nav">
    <a href="goAdmin_room_management">숙소 등록 관리</a>
</div>

<div class="nav">
    <a href="eatResultGo">맛집 등록 관리</a>
</div>

<div class="nav">
    <a href="eatResultGo">놀거리 등록 관리</a>
</div>
</div>
		
<script>
$(document).ready(function () {
    $(".openmenu").click(function (e) {
        e.preventDefault();
        $(".nav").slideToggle();
        $(".openmenu").toggleClass("open");

    });
    
    $(document).click(function (e) {
        if (!$(".nav, .openmenu").is(e.target) && $(".nav").has(e.target).length === 0) {
            // 네비게이션 바와 토글 버튼 외부를 클릭했을 때 네비게이션을 닫습니다.
            $(".nav").slideUp();
            $(".openmenu").removeClass("open");
        }
    })
    
    $(window).resize(function () {
        var wWidth = $(window).width();
        if (wWidth > 600) {
            $(".nav").removeAttr("style");
        }
    });
	
});
	

</script>		
				
</body>	
</html>
	
