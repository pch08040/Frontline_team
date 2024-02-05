<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 헤더 자바스크립트 -->
    <!-- 인포 헤더만 자바스크립트로 헤더 스타일 변경해줌 -->
    <script src="resources/js/header_info.js"></script>
    <!-- 헤더 스타일 -->
    <link rel="stylesheet" href="resources/css/header.css">
    <script>
        window.addEventListener("load", function () {
            bind()
            
            submit_block();
            double_check();
        })

        function bind() {

            let background = document.querySelector(".popUp_Background")
            let double_check = document.querySelector(".double_check")
            let adjust = document.querySelectorAll(".adjust")
            let title_h2 = document.querySelector(".title_h2")
            let cancel = document.querySelector(".cancel");
            let apply = document.querySelector(".apply");
            let popUp_text = document.querySelector(".popUp_text")
            let t1 = document.querySelector(".t1")
            let t2 = document.querySelector(".t2")
            let t3 = document.querySelector(".t3")
            let xBox = document.querySelector(".xBox")
            let tbox1 = document.querySelector(".tbox1")
	
            let form = document.querySelector(".form")
            for (let i = 0; i < adjust.length; i++) {
                
                adjust[i].addEventListener("click", function () {
                    background.style.display = "block";
                    
                    <%-- i==0 : 이름 / i==1 : 비밀번호 / i==2 : 이메일 / i==3 : 휴대폰번호 --%>
                    <%-- 이름변경 팝업엔 t3(두번째인풋) 없음 나머지 팝업에선 t2가 첫번째인풋 t3가 두번째인풋 --%>
                        if(i == 0) {
                            title_h2.innerHTML= "이름 변경"
                            t1.innerHTML = "<c:out value='${sessionScope.userDTO.userName}'/>"
                            t2.setAttribute("placeholder", "새 이름")
                            t2.setAttribute("maxlength", "6")
                            t2.setAttribute("name", "userName")
                            form.setAttribute("action", "updateUser")
                            t3.style.display="none";
                        } else if(i == 1){
                            title_h2.innerHTML= "비밀번호 변경"
                            t1.innerHTML = ""
                            t2.setAttribute("placeholder", "새 비밀번호")
                            t2.setAttribute("maxlength", "16")
                            t2.setAttribute("type", "password")
                            t2.removeAttribute("name");
                            t3.setAttribute("placeholder", "새 비밀번호 확인")
                            t3.setAttribute("maxlength", "16")
                            t3.setAttribute("name", "userPw")
                            t3.setAttribute("type", "password")
                            form.setAttribute("action", "updateUser")
                            t3.style.display="block";
                        } else if( i == 2){
                            title_h2.innerHTML= "이메일주소 변경"
                            t1.innerHTML = "<c:out value='${sessionScope.userDTO.userEmail}'/>"
                            t2.setAttribute("placeholder", "새 이메일주소")
                            t2.removeAttribute("name");
                            t3.setAttribute("placeholder", "새 이메일주소 확인")
                            t3.setAttribute("name", "userEmail")
                            form.setAttribute("action", "updateUser")
                            t3.style.display="block";
                        } else if(i == 3){
                            title_h2.innerHTML= "휴대폰번호 변경"
                            t1.innerHTML = "<c:out value='${sessionScope.userDTO.userPhone}'/>"
                            t2.setAttribute("placeholder", "새 휴대폰번호")
                            t3.setAttribute("maxlength", "11")
                            t2.removeAttribute("name");
                            t3.setAttribute("placeholder", "새 휴대폰번호 확인")
                            t3.setAttribute("maxlength", "11")
                            t3.setAttribute("name", "userPhone")
                            form.setAttribute("action", "updateUser")
                            t3.style.display="block";
                        }
						<%------------------------------------------------------%>
						
                        cancel.addEventListener("click", function () {
                            background.style.display = "none";
                            t2.value=null;
                            t3.value=null;
                            
                        })
                        
                        xBox.addEventListener("click", function () {
                            background.style.display = "none";
                            t2.value=null;
                            t3.value=null;
                            double_check.style.display = "none";
                        })
                        
                        apply.addEventListener("click",function(){
                        	let title_h2 = document.querySelector(".title_h2")
                        	let t1 = document.querySelector(".t1")
            				let t2 = document.querySelector(".t2")
            				let t3 = document.querySelector(".t3")
            				let submit = document.querySelector("#popUpSubmit")
                        	
                        	if(title_h2.textContent == "이름 변경"){
                        		
                        		let check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
                        		
                        		if(!check.test(t2.value)){
                        			alert("이름은 한글로 입력해주세요.")
                        		}  else {
                        			submit.click()
                        		}
                        	}
                        	
                        	if(title_h2.textContent == "비밀번호 변경"){
                        		
                        		let check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
                        		
                        		if(!check.test(t2.value) || !check.test(t3.value)){
                        			alert("비밀번호는 영문,숫자,특수기호를 조합하여 8자리 이상 입력해주세요.")
                        		}  else {
                        			submit.click()
                        		}
                        	}
                        	
							if(title_h2.textContent == "이메일주소 변경"){
                        		
                        		let check = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
                        		
                        		if(!check.test(t2.value) || !check.test(t3.value)){
                        			alert("이메일이 형식에 맞지 않습니다.")
                        		}  else {
                        			submit.click()
                        		}
                        	}
							
							if(title_h2.textContent == "휴대폰번호 변경"){
                        		
                        		let check = /^[0-9]{11}$/;
                        		
                        		if(!check.test(t2.value) || !check.test(t3.value)){
                        			alert("전화번호는 숫자 11자리로 입력해주세요.")
                        		}  else {
                        			submit.click()
                        		}
                        	}
                        })
                        
                        
                        
                        
                    })
                }
                
                
            }
        
        function double_check(){
        	let input_1 = document.querySelector(".t2");
        	let input_2 = document.querySelector(".t3");
        	
        	let title_h2 = document.querySelector(".title_h2")
        	
        	let submit = document.querySelector(".apply");
        	
        	let double_check = document.querySelector(".double_check");
        	
        	input_1.addEventListener("keyup", function(){
        		if(input_1.value != input_2.value && title_h2.textContent != "이름 변경"){

        			submit.setAttribute("type", "none");
        			double_check.style.display="block";
        		} else {
        			submit.setAttribute("type", "button");
        			double_check.style.display="none";
        		}
        	})
        	
        	input_2.addEventListener("keyup", function(){
        		if(input_1.value != input_2.value && title_h2.textContent != "이름 변경"){
        			submit.setAttribute("type", "none");
        			double_check.style.display="block";
        		} else {
        			submit.setAttribute("type", "button");
        			double_check.style.display="none";
        		}
        	})
        	
        }
        
        function submit_block(){
        	document.querySelector(".form").addEventListener("keydown", function(event){
        		if(event.keyCode == 13){
        			event.preventDefault();
        		}	
        	})
        }
    </script>
    <style>
        body {
            margin: 0;
        }

        /******화면축소 시 가운데로 몰리게*******/
        .bigBox {
            max-width: 1280px;
            margin: 0 auto;
        }

        /*********위드 똑같이 줘서 메뉴바 생성*********/
        .headerBar {
            width: 1280px;
            height: 200px;
            background-color: #5498FF;
        }

        .frontBar {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .navBar {
            width: 1280px;
            display: flex;
        }

        .sideBar {
            display: flex;
            flex-direction: column;
        }

        button {
            all: unset;
        }

        .barMar {
            margin: 20px;
        }

        .menuTitle {
            margin-left: 10px;
            padding: 10px;
            color: #FFF;
        }

        .my {
            padding: 10px;
            margin: 10px;
            line-height: 30px;
        }

        .info {
            margin-top: 60px;
            color: #5498FF;
        }

        .reser {
            color: #A6A6A6;
        }

        .lineBar {
            margin-right: 25px;
        }

        .hov:hover {
            cursor: pointer;
        }
    </style>
    <style>
        a,
        a:link,
        a visited {
            color: inherit;
            text-decoration: none;
        }

        .bigbox {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .terms {
            font-weight: bold;
            font-size: 25px;
            padding: 25px;
            margin: 25px;
        }

        .textbox {
            border: 1px solid #999999;
            padding: 10px;
            width: 530px;
            position: relative;
            display: flex;
        }

        .tbox {
            border-width: 0px;
            width: 150px;
            height: 41px;
            vertical-align: top;
            position: relative;
            left: 10px;
            font-size: 15px;
            line-height: 45px;
            margin-left: 5px;
        }
        .textbox .tname{
            font-size: 13px;
            color:#999999;
        }


        .adjust {
            width: 60px;
            height: 30px;
            border-radius: 25px;
            border: 1px solid #D9D9D9;
            background-color: #FFF;
            line-height: 10px;
        }

        .adjust:hover {
            cursor: pointer;
        }

        .top {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom: none;
        }

        .bottom {
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
            margin-bottom: 20px;
            border-top: none;
        }

        .confirm {

            background-color: rgb(106, 156, 231);
            margin: 20px;
            padding: 15px;
            width: 420px;
            height: 30px;
            text-align: center;
            border-radius: 15px;
            font-weight: bold;
            font-size: 25px;
            color: #fff;
            cursor: pointer;
            line-height: 30px;

        }

        .flus {
            display: flex;
        }

        .members {
            margin-right: 22%;
            margin-top: 6%;
        }

        .popUp_Background {
            /*Hidden by default*/
            display: none;
            position: fixed;
            /*Stay in place*/
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            /* overflow: auto; Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.6);
            /* Black w/ opacity */
        }

        .popUpPw {
            /* display: inline-block; */
            position: fixed;
            border-radius: 25px;
            padding: 25px;
            width: 300px;
            height: 360px;
            left: 480px;
            top: 250px;
            background-color: #FFF;
            z-index: 10;
            justify-content: center;
        }

        /* ********** 투명도 조절 opacity: 0.5; ************** */

        .popUp-Line {
            border-color: #000;
        }

        .popUp-set {
            display: flex;
            margin-top: 25px;
        }

        .popUp-text {
            width: 270px;
            height: 30px;
            margin: 5px;
            margin-left: 10px;
        }

        .popUp {
            /* border: 1px solid red; */
            height: 70px;
            line-height: 65px;
            margin-top: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            color: #FFF;
        }

        .cancel {
            border-radius: 10px 0px 0px 10px;
            border-right: 0px;
            width: 110px;
            background-color: #b4b4b4;
        }

        .apply {
            border-radius: 0px 10px 10px 0px;
            width: 180px;
            background-color: #5498FF;
        }

        .xBox {
            font-size: 30px;
            margin-left: 270px;
        }

        .popUp-title {
            margin: 10px;
        }
        
        .double_check {
        	display: none;
        	color: red;
        }
        
        #popUpSubmit {
        	display: none;
        }
    </style>
</head>

<body>
    <div class="bigBox">
        <jsp:include page="header.jsp"/>
        <div class="flus">
            <nav class="navBar">
                <div class="sideBar">
                    <div class="my">
                        <h1 class="info hov"><button>내정보</button></h1>
                    </div>
                    <div class="my">
                        <a href="./my-예약내역.html">
                            <h1 class="reser hov"><button>예약내역</button></h1>
                        </a>
                    </div>
                </div>
            </nav>
            <div class="bigbox members">
                <div class="popUp_Background">
                    <div class="popUpPw">
                        <div class="xBox"><button>x</button></div>
                        <div class="popUp-title">
                            <h2 class="title_h2"> 변경</h2>
                        </div>
                        <div class="popUp-Line">
                            <hr>
                        </div>
                        <%------- 팝업 입력값 들어가는 부분 -------%>
                        <form class="form">
                        	<div>
                            	<div><div class="popUp-text t1"></div></div>
                            	<div><input class="popUp-text t2" type="text"></div>
                            	<div><input class="popUp-text t3" type="text"></div>
                            	<div class="double_check">정보가 일치하지 않습니다.</div>
                        	</div>
                       		<div class="popUp-set">
                            	<div class="popUp cancel">취소</div>
                            	<input class="popUp apply" type="button" value="적용">
                            	<input id="popUpSubmit" type="submit">
                        	</div>
                        </form>
                        <%------------------------------------%>
                    </div>
                </div>
                <div>
                    <div class="textbox top">
                        <img style="position:relative; top: 5px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_human.png?raw=true">
                        <div class="tbox tname">이름</div>
                        <div class="tbox tbox1">${sessionScope.userDTO.userName}</div>
                        <input style="position:relative; top: 6px; left:110px;" class="adjust" id="이름" type="button"
                            value="수정">
                    </div>
                    <div class="textbox">
                        <img style="position:relative; top: 5px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_id_before.png?raw=true">
                            <div class="tbox tname">아이디</div>
                            <div class="tbox">${sessionScope.userDTO.userId}</div>
                    </div>
                    <div class="textbox bottom">
                        <img style="position:relative; top: 5px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_password_before.png?raw=true">
                            <div class="tbox tname">비밀번호</div>
                        <input style="position:relative; top: 6px; left:270px;" class="adjust" type="button" id="비밀번호"
                            value="수정">

                    </div>
                    <div class="none-block">
                        <div class="block-name"></div>
                        <div class="block-id"></div>
                        <div class="block-pw"></div>
                    </div>
                </div>
                <div>
                    <div class="textbox top">
                        <img style="position:relative; top: 6px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_message.png?raw=true">
                        <div class="tbox tname">이메일주소</div>
                        <div class="tbox tbox2">${sessionScope.userDTO.userEmail}</div>
                        <input style="position:relative; top: 6px; left:110px;" class="adjust" type="button"
                            id="이메일주소" value="수정">
                    </div>
                    <div class="textbox">
                        <img style="position:relative; top: 6px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_call.png?raw=true">
                        <div class="tbox tname">휴대폰번호</div>
                        <div class="tbox tbox3 ">${sessionScope.userDTO.userPhone}</div>
                        <input style="position:relative; top: 6px; left:110px;" class="adjust" type="button" value="수정"
                            id="휴대폰번호">
                    </div>
                    <div class="textbox bottom">
                        <img style="position:relative; top: 6px; left:5px;"
                            src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/icon_gift.png?raw=true">
                        <div class="tbox tname">생년월일 8자리</div>
                        <div class="tbox ">${sessionScope.userDTO.userBirth}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>