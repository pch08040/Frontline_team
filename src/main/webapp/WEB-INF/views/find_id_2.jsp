<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</head>
<style>
main {
  display: flex;
  align-items: center;
  flex-direction: column;
}

.box {
  width: 700px;
  height: 300px;
  border-radius: 10px;
  border: 1px solid #dadce0;
  text-align: center;
  display: flex;
  justify-content: center;
  flex-direction: column;
  margin-bottom:150px;
 margin-top:100px;
}

#title {
  font-size: 1.5em;
  font-weight: bold;
}

.box > div {
  margin: 10px 0;
}

a {
  text-decoration: none;
}

.link-button {
  display: inline-block;
  width: 90.36px;
  height: 38px;
  line-height: 38px;
  padding: 10px 20px;
  background-color: #5498FF;
  color: #fff;
  border: none;
  border-radius: 14px;
  cursor: pointer;
  text-decoration: none;
  font-weight: bold;
  transition: background-color 0.3s ease;
  font-size: 14px;
}

.link-button:hover {
  background-color: #3a7bd5;
}
.line{
margin-top: 40px;
 display: flex;
 flex-direction: row;
justify-content: center;
}

#b1{
margin-right: 13px;
}

#b2{
margin-left: 13px;
}
</style>
<body>
<jsp:include page="header.jsp"/>
<main>
<div class="box">
	<span id="title">아이디 찾기</span>
	<div>회원님의 정보와 일치하는 아이디입니다.</div>
	ID:&nbsp${dto.userId}&nbsp&nbsp&nbsp&nbsp가입:&nbsp${dto.userRegDate }
	<span class="line">
		<a href="goLogin"  id="b1" class="link-button">로그인하기</a>
		<a href="goLogin"  id="b2" class="link-button">비밀번호 찾기</a>
	</span>	
<!--비밀번호 찾기의 a태그 링크에 비밀번호찾기 페이지로 가는 메소드로 연결부탁드려요!-->		
</div>
</main>
 <jsp:include page="footer.jsp"/>
</body>
</html>