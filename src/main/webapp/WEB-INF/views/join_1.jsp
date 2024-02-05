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
            check()
            button()
            pop()
        })

        function check(){
            document.querySelector(".all div img").addEventListener("click", function(){
                let count = 0;
                let check_all = document.querySelectorAll(".main_bottom div div img")
                let count_essential = 0;
                let check_essential = document.querySelectorAll(".essential div img")
                // console.log("all")
                for(let i = 0; i<check_all.length; i++){
                    if(check_all[i].getAttribute("src") == "resources/images/check_false.png" || check_all[i].getAttribute("src") == "./images/check_false_gray.png"){
                        count += 1;
                    }
                }

                if(count != 0){
                    for(let i = 0; i<check_all.length; i++){
                        check_all[i].setAttribute("src", "resources/images/check_true.png")
                    }
                } else {
                    // 전체 동의 되돌리기
                    for(let i = 0; i<check_all.length; i++){
                        if(check_all[i].parentElement.parentElement.classList.contains("essential") == true){
                            check_all[i].setAttribute("src", "resources/images/check_false.png")
                        } else if(check_all[i].parentElement.parentElement.classList.contains("all") == true){
                            check_all[i].setAttribute("src", "resources/images/check_false.png")
                        } else {
                            check_all[i].setAttribute("src", "resources/images/check_false_gray.png")
                        }
                    }
                }

                for(let i = 0; i<check_essential.length; i++){
                    if(check_essential[i].getAttribute("src") == "resources/images/check_true.png"){
                        count_essential += 1;
                    }
                }

                if(count_essential == check_essential.length){
                    document.querySelector(".button1").classList.add("hide")
                    document.querySelector(".button2").classList.remove("hide")
                } else {
                    document.querySelector(".button1").classList.remove("hide")
                    document.querySelector(".button2").classList.add("hide")
                }
            })

            let check_one = document.querySelectorAll(".section div img")

            for(let i = 0; i<check_one.length; i++){
                check_one[i].addEventListener("click",function(){
                    let count = 0;
                    let count_essential = 0;
                    let check_essential = document.querySelectorAll(".essential div img")
                    // console.log("one")

                    //check_false_gray, check_false 구분해서 체크 해제 나누기
                    if(check_one[i].getAttribute("src") == "resources/images/check_false.png"){
                        check_one[i].setAttribute("src", "resources/images/check_true.png")
                    } else if(check_one[i].getAttribute("src") == "resources/images/check_false_gray.png"){
                        check_one[i].setAttribute("src", "resources/images/check_true.png")
                    } else {
                        // console.log(check_one[i].parentElement.parentElement.classList.contains("essential"))
                        if(check_one[i].parentElement.parentElement.classList.contains("essential") == true){
                            check_one[i].setAttribute("src", "resources/images/check_false.png")
                        } else {
                            check_one[i].setAttribute("src", "resources/images/check_false_gray.png")
                        }
                        
                    }

                    for(let i = 0; i<check_one.length; i++){
                        if(check_one[i].getAttribute("src") == "resources/images/check_true.png"){
                            count += 1;
                        }
                    }

                    if(count == check_one.length){
                        document.querySelector(".all div img").setAttribute("src", "resources/images/check_true.png");
                    } else {
                        document.querySelector(".all div img").setAttribute("src", "resources/images/check_false.png");
                    }
                    

                    for(let i = 0; i<check_essential.length; i++){
                        if(check_essential[i].getAttribute("src") == "resources/images/check_true.png"){
                            count_essential += 1;
                        }
                    }

                    if(count_essential == check_essential.length){
                        document.querySelector(".button1").classList.add("hide")
                        document.querySelector(".button2").classList.remove("hide")
                    } else {
                        document.querySelector(".button1").classList.remove("hide")
                        document.querySelector(".button2").classList.add("hide")
                    }
                })
            }
        }

        function button(){
            document.querySelector(".button2").addEventListener("click",function(){
                let count_essential = 0;
                let check_essential = document.querySelectorAll(".essential div img")

                for(let i = 0; i<check_essential.length; i++){
                    if(check_essential[i].getAttribute("src") == "resources/images/check_true.png"){
                        count_essential += 1;
                    }
                }

                if(count_essential = check_essential.length){
                    location.href="goJoin_2"
                }
            })
        }


        function pop(){
            let section = document.querySelectorAll("p")
            let text = document.querySelectorAll(".text")
            
            for(let i = 0; i<section.length; i++){
                section[i].addEventListener("click", function(){
                    // console.log(i+1+"번째 섹션 클릭")
                    if(text[i].classList.contains("hide")){
                        text[i].classList.remove("hide")
                        // console.log(section[i].textContent)
                        section[i].textContent = "접기"
                    } else {
                        text[i].classList.add("hide")
                        section[i].textContent = "펼치기"
                    }
                    
                    
                })
            }
        }
    </script>
    
    <style>
        .main {
            display: flex;
            flex-direction: column;
            align-items: center;

            margin-bottom: 10%;
        }

        .main_top {
            
            text-align: center;
            margin-bottom: 50px;
        }

        .section_title {
            display: flex;
            align-items: center;
        }

        .section_title div {
            display: flex;
            align-items: center
        }

        .section_title div div {
            width: 100%;
        }

        .main_bottom div {
            /* border: 1px solid red; */
            width: 700px;
        }

        .main_bottom div div img {
            cursor: pointer;
        }

        .main_bottom div div{
            /* border: 1px solid black; */
            margin: 5px;
        }
        .hide{
            display: none;
        }
        
        main input {
            cursor: pointer;
        }
        
        .next {
            display: flex;
            justify-content: center;
            
            width: 700px;
            margin-top: 50px;
        }

        .button1 {
            height: 40px;
            width: 300px;

            text-align: center;
            color: white;
            font-weight: bolder;
            border-radius: 7px;
            background-color: lightgray;
            line-height: 40px;
        }
        .button2 {
            cursor: pointer;
            height: 40px;
            width: 300px;

            text-align: center;
            color: white;
            font-weight: bolder;
            border-radius: 7px;
            background-color: #5498FF;
            line-height: 40px;
        }
        strong {
            color: blue;
        }
        a, .option div {
            color: gray;
        }
        .more {
            display: flex;
            flex-direction: row-reverse;
            height: 40px;
        }
        .essential .text {
            border: 1px solid black;
            border-radius: 7px;
            width: 610px;

            padding: 10px;
            margin-left: 60px;

            word-break:break-all;
        }

        .option .text {
            border: 1px solid lightgray;
            border-radius: 7px;
            width: 610px;

            padding: 10px;
            margin-left: 60px;

            word-break:break-all;
        }
        .all {
            margin-bottom: 50px;
        }
        p {
            cursor: pointer;
        }
    </style>

<style>
        
    /* 푸터 */
    footer {
        font-family: 'Noto Sans KR', sans-serif;
        /* font-family: 'Roboto', sans-serif; */
        font-weight: 400;
        color: #FFFFFF;
        font-size: 25px;
        line-height: 34.05px;

        position : relative;
        
        top : 100%;

        /* border: 1px solid red; */
        width: 100%;
        height: 245px;
        background-color: #474747;
        
        
        
    }

    footer .footer_div {
        padding-top: 10px;
        padding-bottom: 10px;
        margin-left: 10px;
        margin-right: 10px;
        /* border: solid 1px red; */
    }

    footer .textdiv {
        display: inline-block;
        padding-top: 30px;
        /* padding-left: 30px; */
        margin-left: 40px;
    }

    footer .icondiv {
        /* display: flex;
        justify-content: flex-end;
        display: inline-block; */
        padding-top: 30px;
        margin-right: 40px;
    }

    footer #logo {
        /* position: relative; */
        /* top: 61px;
        left: 50px; */
    }

    footer .number {
        font-size: 35px;
        font-weight: 600;
        text-align: right;
        /* margin-right: 34px; */
        margin-right: 25px;
        /* margin-bottom:30px; */
        margin-top: -35px;
    }

    footer .rightText {
        text-align: right;
        font-weight: 600;
        /* margin-right: 34px; */
        /* vertical-align: top; */
        margin-right: 25px;
        margin-bottom:20px;
        margin-top: -30px;
    }

    footer .footer_top {
        /* border: 1px solid red; */
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid white;
        /* border-bottom: 1px solid white; */
    
    }

    footer .footer_bottom {
        /* height: 500px; */
        /* border: 1px solid red; */
        padding: 0px;
        display: flex;
        justify-content: space-between;
    }

    footer .text_footer {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
    }
    
    footer .logo_footer{
        margin-left: 40px;
        margin-top: -15px;
    }
    
    footer a {
        color: #fff; text-decoration: none; outline: none
    }
</style>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="main">
        <div class="main_top">
            <h1>회원가입 및 이용약관</h1>
        </div>
        <div class="main_bottom">
            <div class="all">
                <div class="section_title"><img src="resources/images/check_false.png"><div><div>전체 동의하기</div></div></div>
            </div>

            <div class="section essential">
                <div class="section_title"><img src="resources/images/check_false.png"><div><div>이용약관 동의 <strong>(필수)</strong></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>
        
            <div class="section essential">
                <div class="section_title"><img src="resources/images/check_false.png"><div><div>만 14세 이상확인 <strong>(필수)</strong></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>
        
            <div class="section essential">
                <div class="section_title"><img src="resources/images/check_false.png"><div><div>개인정보 수집 및 이용 동의 <strong>(필수)</strong></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>

            <div class="section option">
                <div class="section_title"><img src="resources/images/check_false_gray.png"><div><div><a>개인정보 수집 및 이용 동의 (선택)</a></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>

            <div class="section option">
                <div class="section_title"><img src="resources/images/check_false_gray.png"><div><div><a>마케팅 알림 수신동의 (선택)</a></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>

            <div class="section option">
                <div class="section_title"><img src="resources/images/check_false_gray.png"><div><div><a>위치기반 서비스 이용약관 동의 (선택)</a></div><div class="more"><p>펼치기</p></div></div></div>
                <div class="text hide">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nobis repudiandae quam vero consequuntur vel nesciunt officiis, aperiam facere fugiat? Unde perspiciatis magni temporibus laborum, impedit omnis illo officiis nemo repellat!
                </div>
            </div>
        </div>
        <div class="next">
            <div class="button1">다음</div>
            <div class="button2 hide">다음</div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>