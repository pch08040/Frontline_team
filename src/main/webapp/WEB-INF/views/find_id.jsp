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
<script>
  
  function characterCheck(obj){
	  var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
	  // 허용할 특수문자는 여기서 삭제하면 됨
	  // 지금은 띄어쓰기도 특수문자 처리됨
	  if( regExp.test(obj.value) ){
	  	alert("특수문자는 입력할 수 없습니다.");
	  	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	  	}
	  }
  
  function inputNumberOnly(el) {
	    var regExp = /[^0-9]/g;
	    if (regExp.test(el.value)) {
	        alert("숫자만 입력해주세요.");
	        el.value = el.value.replace(regExp, ''); 
	    }
	}
</script>
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

#title{
 font-size: 1.5em;
  font-weight: bold;
}

.box > div {
  margin: 10px 0;
}

form {
  margin-top: 20px;
}

form > div {
  margin-bottom: 10px;
}

input[type="text"] {
  padding: 5px;
  box-sizing: border-box;
}

input[type="submit"] {
  padding: 10px;
  background-color: #5498FF;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

#goid:hover {
  background-color: #3a7bd5;
}
#phonenum{
margin-right:50px;
}

</style>
<body>
	<jsp:include page="header.jsp"/>
	<main>
		<div class="box">
			<span id="title">아이디 찾기</span>
			<div>회원 정보에 등록된 정보로 아이디를 찾을수 있습니다.</div>
			<form action="findId">
			<div>이름 &nbsp<input type="text" oninput="characterCheck(this)" name="userName"></div>
			<div id="phonenum">휴대폰 번호 &nbsp<input type="text" oninput="inputNumberOnly(this)" name="userPhone" placeholder="숫자만 입력"></div>
			<input type="submit" id="goid" value="아이디 찾기">
			</form>
		</div>
	</main>
	<jsp:include page="footer.jsp"/>
</body>
</html>