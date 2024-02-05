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
    <script>
        window.addEventListener("load", function(){
            join()
            <%--login()--%>
            logo()
            x()
            tab()
            focus()
            x_input()
            input_check()
            login_click()
        })
        
        function login_click(){
        	document.querySelector(".main_login").addEventListener("click",function(){
                document.querySelector(".main_form").submit();
            })
        }
		
        // 키업 이벤트 발생시 이벤트의 키값을 읽어서 1차로 걸러주는 메소드
        function input_check(){
            document.querySelector(".input_id input").addEventListener("keyup", function(event){
                // console.log(event)
                //<키값 예시>
                //위 숫자 0부터 48~57
                //넘패드 숫자 0부터 96~105
                //a~z 65~90
                //엔터13 백스페이스8 딜리트46
                //방향키 37~40
                // console.log(event.keyCode);
                
                if((48 <= event.keyCode && event.keyCode <= 57) || (96 <= event.keyCode && event.keyCode <= 105) || (65 <= event.keyCode && event.keyCode <= 90) || (37 <= event.keyCode && event.keyCode <= 40) || event.keyCode == 13 || event.keyCode == 8 || event.keyCode == 46){

                } else {
                    alert("아이디는 영문(소문자)과 숫자만 입력하세요")
                    // console.log(document.querySelector(".input_id").value)
                    while(document.querySelector(".input_id input").value != ""){
                        document.querySelector(".input_id input").value = null
                    }
                    document.querySelector(".input_id_x").style.display = "none"
                }

                // console.log(document.querySelector(".input_id input"))
            })

            
        }
        
        function join(){
            document.querySelector(".join p").addEventListener("click",function(){
                alert("회원가입 페이지로 이동합니다.")
                location.href="goJoin_1"
            })
        }

        <%--function login(){
            document.querySelector(".main_login").addEventListener("click", function(){
                let id_value = document.querySelector(".input_id input").value
                let password_value = document.querySelector(".input_password input").value
                let id = [];
                let password = [];
                
                id.push("frontline")
                password.push("1234")

                // console.log(document.querySelector("[type=text]").value) id.value 테스트

                // console.log(id[0], password[0]) 배열 테스트

                for(let i = 0; i<id.length; i++){
                    if(id[i] == document.querySelectorAll(".main_input div input")[0].value && password[i] == document.querySelectorAll(".main_input div input")[1].value){
                        alert(id[i]+"님 환영합니다.")
                        if(document.referrer.length == 0){
                            location.href="./manager-회원관리.html"
                        } else {
                            // history.back(); //괄호안에 -n 수치 조절하면 -n번째 페이지까지
                            location.href="./manager-회원관리.html"
                        }
                    }
                    else{
                        alert("아이디 또는 비밀번호가 맞지 않습니다.")
                    }
                }

                
            })
        }--%>
		
        // 로고클릭시 메인으로 이동
        function logo(){
            document.querySelector(".logo img").addEventListener("click", function(){
                location.href="./main.html"
            })
        }
		
        // x버튼 클릭시 이전의 페이지로 이동 예)고객센터 페이지에서 로그인으로 왔으면 고객센터 페이지로
        function x(){
            document.querySelector(".main_top img").addEventListener("click",function(){
                // console.log(document.referrer.length) 이전페이지 기록 테스트
                if(document.referrer.length == 0){
                    location.href="./main.html"
                } else {
                    history.back();
                }
            })
        }
		
        
        // 인풋창에서 엔터 입력시 다음칸으로 ~ 비밀번호칸에서는 로그인버튼 작동
        function tab(){
        	
        	//input 에서 enter 입력하면 자동으로 submit 되는것 막기
        	document.querySelector(".main_form").addEventListener("keydown", function(event){
        		if(event.keyCode == 13){
        			event.preventDefault();
        		}	
        	})
        	
        	//아이디에서 비밀번호로
            document.querySelector("[name=userId]").addEventListener("keyup", function(event){
                // console.log(event.keyCode)
                if(event.keyCode == 13){
                    document.querySelector("[name=userPw]").focus();
                }
            })
	
            //비밀번호에서 서브밋으로
            <document.querySelector("[name=userPw]").addEventListener("keyup", function(event){
                // console.log(event.keyCode)
                if(event.keyCode == 13){
                	document.querySelector(".main_form").submit();
                	// 로그인 버튼에서 .click()이 먹지않아서 form 자체에서 .submit()으로 변경
                }
            })
        }
		
        
        // 인풋창 눌렀을때 테두리 색과 아이콘 색상 변하는 메소드
        function focus(){
            document.querySelector(".input_id input").addEventListener("focus", function(){
                document.querySelector(".input_id img").setAttribute("src", "resources/images/icon_id_after.png")
                document.querySelector(".input_id").style.border = "2px solid black";
                document.querySelector(".input_password").style.borderTop = "2px solid black";
            })
            document.querySelector(".input_id input").addEventListener("blur", function(){
                document.querySelector(".input_id img").setAttribute("src", "resources/images/icon_id_before.png")
                document.querySelector(".input_id").style.border = "2px solid lightgray";
                document.querySelector(".input_password").style.border = "2px solid lightgray";
            })

            document.querySelector(".input_password input").addEventListener("focus", function(){
                document.querySelector(".input_password img").setAttribute("src", "resources/images/icon_password_after.png")
                document.querySelector(".input_password").style.border = "2px solid black";
            })
            document.querySelector(".input_password input").addEventListener("blur", function(){
                document.querySelector(".input_password img").setAttribute("src", "resources/images/icon_password_before.png")
                document.querySelector(".input_password").style.border = "2px solid lightgray";
            })
        }
	
        // 인풋창에 글자 다 지워주는 메소드
        function x_input(){
        	
        	// 입력이 끝나면 밸류값을 읽어서 x버튼을 보여준다
            document.querySelector(".input_id input").addEventListener("keyup", function(){
                if(document.querySelector(".input_id input").value != ""){
                    document.querySelector(".input_id_x").style.display = "block"
                } else {
                    document.querySelector(".input_id_x").style.display = "none"
                }
            })  

            document.querySelector(".input_password input").addEventListener("keyup", function(){
                if(document.querySelector(".input_password input").value != ""){
                    document.querySelector(".input_password_x").style.display = "block"
                } else {
                    document.querySelector(".input_password_x").style.display = "none"
                }
            })
			
            
            //클릭시 밸류를 ""로 초기화
            document.querySelector(".input_id_x").addEventListener("click", function(){
                document.querySelector(".input_id input").value = ""
                document.querySelector(".input_id_x").style.display = "none"
            }) 

            document.querySelector(".input_password_x").addEventListener("click", function(){
                document.querySelector(".input_password input").value = ""
                document.querySelector(".input_password_x").style.display = "none"
            }) 
        }
    </script>
    
    <style>
        .main_wrap {
            display: flex;
            flex-direction: column;
            align-items: center;

            margin-top: 10%;
            margin-bottom: 20%;
        }

        .main {
            border: 2px solid #A6A6A6;
            width: 700px;
            border-radius: 15px;

            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .main_top {
            border-bottom: 2px solid black;
            width: 100%;
            text-align: center;
        }

        .main_top img {
            cursor: pointer;
            float: left;
            position: relative;
            left: 10px;

        }

        .main_login {
            cursor: pointer;
            height: 40px;
            width: 300px;

            color: white;
            font-weight: bolder;
            border-radius: 7px;
            background-color: #5498FF;
            
            text-align: center;
            line-height: 40px;
        }

        .join p {
            display: inline-block;
            cursor: pointer;
        }

        .main_input {
            /* border: 2px solid #A6A6A6;
            border-radius: 15px; */
            width: 300px;

            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        .main_input input {
            border: 1px solid white;
            border-radius: 15px;
            width: 95%;
            height: 30px;
            outline: none;
        }
        
        .logo img{
            cursor: pointer;
            margin-bottom: 20px;
        }

        .main_bottom {
            display: flex;
            justify-content: center;
            flex-direction: column;
            text-align: center;
        }

        .input_id, .input_password {
            display: flex;
            align-items: center;
            padding: 10px;
        }

        .input_id {
            border: 2px solid lightgray;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .input_password {
            border: 2px solid lightgray;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;

            margin-top: -2px;
        }

        .input_id_x, .input_password_x {
            display: none;
            cursor: pointer;
        }

        .input_id img {
            height: 20px;
        }

        .input_password img {
            height: 20px;
        }
        .main .find {
            display: flex;
            justify-content: space-between;

            margin-top: 10px;
            margin-bottom: 10px;
        }

        .main a {
            color: black; text-decoration: none; outline: none
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="main_wrap">
        <div class="main">
            <div class="main_top">
                <h4><img src="resources/images/x.png">로그인 또는 회원가입</h4>
            </div>
            <div class="main_bottom">
                <h3>놀아유에 오신걸 환영합니다</h3>
                <form class= "main_form" method="post" onsubmit="return false;" action="doLogin">
                	<div class="main_input">
                    	<div class="input_id"><img src="resources/images/icon_id_before.png"><input type="text" placeholder="아이디" name="userId" maxlength="20"><img class="input_id_x" src="resources/images/x.png"></div>
                    	<div class="input_password"><img src="resources/images/icon_password_before.png"><input type="password" placeholder="비밀번호" name="userPw" maxlength="16"><img class="input_password_x" src="resources/images/x.png"></div>
                	</div>
                	<div class="find">
                    	<div><a href="goFindId">아이디 찾기</a></div>
                    	<div><a href="goFindPw">비밀번호 찾기</a></div>
                	</div>
                	<input class="main_login" type="submit" value="로그인">
                </form>
                <div class="join">
                    <p>회원가입</p>
                </div>
                <div class="logo">
                    <img src="resources/images/logo.png">
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>