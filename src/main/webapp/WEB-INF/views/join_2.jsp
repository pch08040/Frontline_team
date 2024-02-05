<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
    <script>
    window.addEventListener("load", function(){
        eye()
        check_password()
        check_all()
        submit_block()
    })
    
    function submit_block(){
    	document.querySelector(".main_form").addEventListener("keydown", function(event){
    		if(event.keyCode == 13){
    			event.preventDefault();
    		}	
    	})
    }

    function eye(){
        let eye = document.querySelectorAll(".eye")
        let password = document.querySelectorAll(".input_password input")
        
        for(let i = 0; i<eye.length; i++){
            eye[i].addEventListener("click", function(){
            //eye_dark 면 eye_light으로 아니면 반대로
            if(eye[i].getAttribute("src") == "resources/images/eye_dark.png"){
                eye[i].setAttribute("src", "resources/images/eye_light.png")
                password[i].setAttribute("type", "text")
            } else {
                eye[i].setAttribute("src", "resources/images/eye_dark.png")
                password[i].setAttribute("type", "password")
            }
        })
    }}

    function check_password(){
        let password = document.querySelectorAll(".input_password input")

        for(let i = 0; i<password.length; i++){
            password[i].addEventListener("keyup", function(){
                if(password[0].value == password[1].value){
                    document.querySelector(".check_password").style.display = "none"
                } else {
                    document.querySelector(".check_password").style.display = "block"
                }
            })
        }
    }

    function check_all(){
        let count = 0
        let input_all = document.querySelectorAll(".input_text")
        let password = document.querySelectorAll(".input_password input")

        for(let i = 0; i<input_all.length; i++){
            input_all[i].addEventListener("keyup", function(){
                for(let j = 0; j<input_all.length; j++){
                    if (input_all[j].value !== ""){
                        count += 1
                    }
                }
                
                if(count == input_all.length && password[0].value == password[1].value){
                    document.querySelector(".button1").style.display = "none"
                    document.querySelector(".button2").style.display = "block"
                } else {
                    document.querySelector(".button2").style.display = "none"
                    document.querySelector(".button1").style.display = "block"
                }

                count = 0
            })
        }
    }
    
    $(function(){
    	
    	// 기본적인 형식 검사 후 통과하면 폼의 action 주소 바꿔서 중복체크 컨트롤러로 이동할 수 있도록 변경
    	$(".checkId").click(function(){
    		if($(this).parent().find(".input_text").val().length < 4){
    			alert("4글자 이상의 아이디 값을 입력하세요")
    		} else {
    			$(".main_form").attr("action", "checkJoin");
        		$("input[name=checkTarget]").val("checkId");
        		$(".button3").click()
    		}
    		
    	})
    	
    	$(".checkEmail").click(function(){
    		if($(this).parent().find(".input_text").val().length < 4){
    			alert("올바른 이메일 주소를 입력하세요")
    		} else {
	    		$(".main_form").attr("action", "checkJoin");
	    		$("input[name=checkTarget]").val("checkEmail");
	    		$(".button3").click()
    		}
    	})
    	
    	$(".checkPhone").click(function(){
    		if($(this).parent().find(".input_text").val().length < 4){
    			alert("올바른 전화번호를 입력하세요")
    		} else {
	    		$(".main_form").attr("action", "checkJoin");
	    		$("input[name=checkTarget]").val("checkPhone");
	    		$(".button3").click()
    		}
    	})
    	
    	// 가입버튼 눌렀을시 정규식에 맞는지 체크한 후 가입 진행
    	$(".button2").click(function(){
    		let count = 0;
    		
    		// 정규식 제한조건
    		const name = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    		const id = /^[a-z0-9]*$/;
    		const pw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
    		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    		const phone = /^[0-9]{11}$/;
    		const birth = /^[0-9]{8}$/;
    		
    		
    		// 이름 체크 
    		if(!name.test($("input[name=userName]").val())){
    			alert("이름은 한글로 입력해주세요.")
    			count += 1;
    		}
    		// 아이디 체크
    		else if(!id.test($("input[name=userId]").val())){
    			alert("아이디는 영어 소문자와 숫자만 입력해주세요.")
    			count += 1;
    		} 
    		// 비밀번호 체크
    		else if(!pw.test($("input[name=userPw]").val())){
    			alert("비밀번호는 영문,숫자,특수기호를 조합하여 8자리 이상 입력해주세요.")
    			count += 1;
    		}
    		// 이메일 체크
    		else if(!email.test($("input[name=userEmail]").val())){
    			alert("이메일이 형식에 맞지 않습니다.")
    			count += 1;
    		}
    		// 전화번호 체크
    		else if(!phone.test($("input[name=userPhone]").val())){
    			alert("전화번호는 숫자 11자리로 입력해주세요.")
    			count += 1;
    		}
    		// 생년월일 체크
    		else if(!birth.test($("input[name=userBirth]").val())){
    			alert("생년월일은 숫자 8자리로 입력해주세요.")
    			count += 1;
    		} else if(count == 0 && $("#checkedId").val() == 'true' && $("#checkedEmail").val() == 'true' && $("#checkedPhone").val() == 'true'){
    			$(".button3").click();
    		} else {
    			alert("중복체크가 필요합니다.")
    		}
    	})
    	
    })
    </script>
    
    <style>
        div {
            /* border: 1px solid red; */
        }
        .input_main {
            width: 300px;
        }

        .input_top {
            border: 2px solid lightgray;
            border-radius: 15px;
            padding-left: 5px;
            padding-right: 5px;
            margin-bottom: 20px;
        }

        .input_bottom {
            border: 2px solid lightgray;
            border-radius: 15px;
            padding-left: 5px;
            padding-right: 5px;
            margin-bottom: 30px;
        }
        .section {
            display: flex;
            align-items: center;
        }

        .top {
            border-top: 2px solid lightgray;
        }
        .button1 {
            height: 40px;
            width: 300px;

            color: white;
            font-weight: bolder;
            border-radius: 7px;
            background-color: lightgray;
            
            text-align: center;
            line-height: 40px;

        }
        .button2 {
            cursor: pointer;
            height: 40px;
            width: 300px;

            color: white;
            font-weight: bolder;
            border-radius: 7px;
            background-color: #5498FF;
            
            text-align: center;
            line-height: 40px;
            display: none;
        }
        
        .button3 {
        	display: none;
        }

        input {
            border: 1px solid white;
            border-radius: 15px;
            width: 95%;
            height: 30px;
            outline: none;
        }

        .wrap img {
            height: 20px;
        }

        .eye {
            cursor: pointer;
        }

        .check_password {
            display: none;
            color: red;
            font-size: 12px;
            padding-left: 3px;
            margin-bottom: 6px;
        }

        .wrap {
            display: flex;
            flex-direction: column;
            align-items: center;

            margin-top: 5%;
            margin-bottom: 20%; 
        }

        h1 {
            margin-bottom: 60px;
        }
        
        .checkId, .checkEmail, .checkPhone {
        	width: 100px;
        }
        
        .checkPass {
        	color: green;
        	font-size: 12px;
        }
        
        .checkError {
        	color: red;
        	font-size: 12px;
        }
    </style>

</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="wrap">
        <h1>회원가입 및 이용약관</h1>
        <div class="input_main">
        	<form class="main_form" action="doJoin">
            	<div class="input_top">
                	<div class="section input_name"><img src="resources/images/icon_human.png"><input class="input_text" type="text" placeholder="이름" name="userName" maxlength="6" value="${joinMap.joinDTO.userName}"></div>
                	<div class="section top input_id">
                		<img src="resources/images/icon_check.png">
                		<c:if test="${joinMap.checkId == null}">
                			<input class="input_text" type="text" placeholder="아이디" name="userId" maxlength="20" value="${joinMap.joinDTO.userId}">
                			<input class="checkId" type="button" value="중복체크">
                		</c:if>
                		<c:if test="${joinMap.checkId == false}">
                			<input class="input_text" type="text" placeholder="아이디" name="userId" maxlength="20" value="${joinMap.joinDTO.userId}">
                			<input class="checkId" type="button" value="중복체크">
                			<p class="checkError">중복된 아이디 입니다.</p>
                		</c:if>
                		<c:if test="${joinMap.checkId == true}">
                			<input class="input_text" type="text" placeholder="아이디" name="userId" maxlength="20" value="${joinMap.joinDTO.userId}" readonly="true">
                			<p class="checkPass">사용 가능한 아이디 입니다.</p>
                		</c:if>
                	</div>
                	<div class="section top input_password"><img src="resources/images/icon_password_before.png"><input class="input_text" type="password" placeholder="비밀번호" name="userPw" maxlength="16" value="${joinMap.joinDTO.userPw}"><img class="eye" src="resources/images/eye_dark.png"></div>
                	<div class="section top input_password"><img src="resources/images/icon_password_before.png"><input class="input_text" type="password" placeholder="비밀번호 확인" name="userPw2" maxlength="16" value="${joinMap.userPw2}"><img class="eye" src="resources/images/eye_dark.png"></div>
                	<div class="check_password">비밀번호가 일치하지 않습니다.</div>
            	</div>
            	<div class="input_bottom">
                	<div class="section input_email">
                		<img src="resources/images/icon_message.png">
                		<c:if test="${joinMap.checkEmail == null}">
                			<input class="input_text" type="text" placeholder="이메일" name="userEmail" value="${joinMap.joinDTO.userEmail}">
                			<input class="checkEmail" type="button" value="중복체크">
                		</c:if>
                		<c:if test="${joinMap.checkEmail == false}">
                			<input class="input_text" type="text" placeholder="이메일" name="userEmail" value="${joinMap.joinDTO.userEmail}">
                			<input class="checkEmail" type="button" value="중복체크">
                			<p class="checkError">중복된 이메일 입니다.</p>
                		</c:if>
                		<c:if test="${joinMap.checkEmail == true}">
                			<input class="input_text" type="text" placeholder="이메일" name="userEmail" value="${joinMap.joinDTO.userEmail}" readonly="true">
                			<p class="checkPass">사용 가능한 이메일 입니다.</p>
                		</c:if>
                	</div>
                	<div class="section top input_phone">
                		<img src="resources/images/icon_call.png">
                		<c:if test="${joinMap.checkPhone == null}">
                			<input class="input_text" type="text" placeholder="휴대폰 번호" name="userPhone" maxlength="11" value="${joinMap.joinDTO.userPhone}">
                			<input class="checkPhone" type="button" value="중복체크">
                		</c:if>
                		<c:if test="${joinMap.checkPhone == false}">
                			<input class="input_text" type="text" placeholder="휴대폰 번호" name="userPhone" maxlength="11" value="${joinMap.joinDTO.userPhone}">
                			<input class="checkPhone" type="button" value="중복체크">
                			<p class="checkError">중복된 전화번호 입니다.</p>
                		</c:if>
                		<c:if test="${joinMap.checkPhone == true}">
                			<input class="input_text" type="text" placeholder="휴대폰 번호" name="userPhone" value="${joinMap.joinDTO.userPhone}" readonly="true">
                			<p class="checkPass">사용 가능한 전화번호 입니다.</p>
                		</c:if>
                	</div>
                	<div class="section top input_birth"><img src="resources/images/icon_gift.png"><input class="input_text" type="text" placeholder="생년월일 8자리" name="userBirth" maxlength="8" value="${joinMap.joinDTO.userBirth}"></div>
                	<div class="section top input_gender"><img src="resources/images/icon_human.png">
                		<input type="text" placeholder="성별" disabled>
                		<select name="genderSeq">
                			<option value="0">남자</option>
                			<option value="1">여자</option>
                		</select>
                	</div>
            	</div>
            	<input type="hidden" name="checkTarget">
            	<div class="button1">가입하기</div>
            	<input type="button" class="button2" value="가입하기">
            	<input type="submit" class="button3">
            </form>
        </div>
        <input id="checkedId" type="hidden" value="${joinMap.checkId}">
        <input id="checkedEmail" type="hidden" value="${joinMap.checkEmail}">
        <input id="checkedPhone" type="hidden" value="${joinMap.checkPhone}">
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>