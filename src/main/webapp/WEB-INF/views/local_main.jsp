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
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&family=Roboto&display=swap"
        rel="stylesheet">
    <!-- 지역 메인 css -->
    <link rel="stylesheet" href="resources/css/local_main.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
	let result = new Array(15);

    for (let i = 0; i < result.length; i++){
        result[i] = new Array(2);
    }
    
    result[0][0]="천안"
    result[1][0]="아산"
    result[2][0]="당진"
    result[3][0]="서산"
    result[4][0]="태안"
    result[5][0]="예산"
    result[6][0]="공주"
    result[7][0]="홍성"
    result[8][0]="보령"
    result[9][0]="청양"
    result[10][0]="부여"
    result[11][0]="서천"
    result[12][0]="논산"
    result[13][0]="계룡"
    result[14][0]="금산"

    // 지역별 좌표
    result[0][1]="nx=63&ny=110"
    result[1][1]="nx=60&ny=110"
    result[2][1]="nx=54&ny=112"
    result[3][1]="nx=51&ny=110"
    result[4][1]="nx=48&ny=109"
    result[5][1]="nx=58&ny=107"
    result[6][1]="nx=63&ny=102"
    result[7][1]="nx=55&ny=106"
    result[8][1]="nx=54&ny=100"
    result[9][1]="nx=57&ny=103"
    result[10][1]="nx=59&ny=99"
    result[11][1]="nx=55&ny=94"
    result[12][1]="nx=62&ny=97"
    result[13][1]="nx=65&ny=99"
    result[14][1]="nx=69&ny=95"

    let now = new Date(Date.now())
    let before = new Date(Date.now()-1000*60*60)
     
    let year = now.getFullYear()
    let month = now.getMonth()+1
    let day = now.getDate()
    let hours = now.getHours()
    let minutes = now.getMinutes()
     
    // 45분 기준으로 api가 배포되기때문에 조건문으로 조회 시점을 변경
    if(minutes < 45){
    	year = before.getFullYear()
     	month = before.getMonth()+1
     	day = before.getDate()
     	hours = before.getHours()
    }
     
    // 포맷형식을 두자릿수로 정렬
	if(month < 10){
		month = "0" + month
	}
     
     if(day < 10){
		day = "0" + day
	}
     
     if(hours < 10){
		hours = "0" + hours
	}

     if(minutes < 10){
     	minutes = "0" + minutes
	}
     
     //url 주소에서 regionSeq 값 추출
     let regionSeq = $(location).attr('search').substr(11, 2);
     
     let select = new Array(6);
     
     for(let i = 0; i<result[regionSeq].length; i++){
    	 select[i] = result[regionSeq][i];
     }
     
     
    let input_xy = select[1];
    let xhr = new XMLHttpRequest();
    let url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?serviceKey=ZVVKvZ%2F9XZ0XNbYrTeRqtelsi5YnTmeE0eXfkBXt319boYdmGKbF0L712MaVdYhwHBb5%2BV0Ic%2BrRwxIVuIBwYQ%3D%3D&dataType=JSON&numOfRows=1000&pageNo=1&base_date="+year+month+day+"&base_time="+hours+minutes+"&"+input_xy
    xhr.open("GET", url);
    xhr.send();
    
    xhr.onload = function () {
        let data = JSON.parse(xhr.responseText)
        let item = data.response.body.items.item
        
        let pty = 0;
        let sky = 0;
        let t1h = 0;
        let reh = 0;
        
        // 최신값인 첫번째 아이템 값만 넣고 끝내기
        for(let j = 0; j<item.length; j++){
			if(item[j].category == "PTY" && pty == 0){
				select[2] = item[j].fcstValue
				pty = 1
          	}
			
          	if(item[j].category == "SKY" && sky == 0){
      			select[3] = item[j].fcstValue
      			sky = 1
			}
          	
			if(item[j].category == "T1H" && t1h == 0){
				select[4] = item[j].fcstValue
				t1h = 1
			}
			
            if(item[j].category == "REH" && reh == 0){
            	select[5] = item[j].fcstValue
            	reh = 1
			}
         }
        
        for(let i = 0; i<select.length; i++){
        	console.log(select[i])
        }
    	
        pty = select[2]
        sky = select[3]
       	t1h = select[4]
 		reh = select[5]
        
        // 날씨 아이콘 변경하는 메소드로 이동
        check(select)
    	
    	let html = select[0]+"의 현재날씨 <br>"
    	html += "온도 : "+t1h+"도 <br>"
    	html += "습도 : "+reh+"% <br>"
    	
    	$("#weather").html(html)
    }
    
    function check(result){
        let img = document.querySelectorAll(".weather_img img")
            for (let i = 0; i<img.length; i++){
                img[i].style.display = "none"
            }

        if(result[2] == 0){
            if(result[3] == 1){
                document.querySelector(".sunny").style.display = "block"
            } else {
                document.querySelector(".cloudy").style.display = "block"
            }
        } else {
            if(result[2] == 1 || result[2] == 2 || result[2] == 5 || result[2] == 6){
                document.querySelector(".rain").style.display = "block"
            } else {
                document.querySelector(".snow").style.display = "block"
            }
        }
       
        // pty=2  0없음 1비 2비/눈 3눈 5빗방울 6빗방울눈날림 7눈날림
        // sky=3  1맑음 3구름많음 4흐림
        // t1h=4
        // reh=5
    }
})
</script>
<style>
.board_wrap {
	display: flex;
	justify-content: space-evenly;
}
.board_section {
	border: 1px solid black;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	text-align: center;
	
	width: 230px;
	height: 200px;
}
.board_image {
	width: 230px;
    height: 160px;
    object-fit: cover;

	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.weather_img img {
	display: none;
}

.board_title {
	height: 50px;
	display: flex;
	
	align-items: center;
	justify-content: center;
}
</style>
<body>
	<jsp:include page="header.jsp"/>
    
    
    <div class="wrap">
        <div class="best_travel">
            <div class="weathers">
                <div class="weather_img">
                    <img class="sunny"
                        src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Sunny.png?raw=true">
                    <img class="cloudy"
                        src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Cloudy.png?raw=true">
                    <img class="rain"
                        src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Rain.png?raw=true">
                    <img class="snow"
                        src="https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Snow.png?raw=true">
                </div>
                <div class="weather_wrap"><div id="weather"></div></div>
            </div>
            <div class="title">
                
            </div>
            <div class="items">
                <div class="itemss">
                   
                </div>
            </div>
            <div style="margin-top : 5px;"></div>
            
        </div><br>


        <div class="second_line">
            <span>
                <p4>대충 놓치면 안될 먹거리</p4>
            </span><br>
            <div style="margin-top : 5px;"></div>
            <span>
                <p5>대충 의미 있는 ${regionName}맛집</p5>
            </span><a href="localMore?typeSeq=2&regionSeq=${regionSeq}" class="item_more">
                <p5>더보기</p5>
            </a><br><br>

        </div>


		<div class="board_wrap">
           <c:forEach var="item" items="${boardListMap.typeSeq2}" varStatus="i">
           	<a href="getBoardDetail?boardSeq=${item.boardSeq}">
           		<div class="board_section">
           			<div><img class="board_image" src="${item.boardImage}"></div>
           			<div class="board_title">${item.boardTitle}</div>
           		</div>
           	</a>
           </c:forEach>
        </div><br><br>



        <div class="second_line">
            <span>
                <p4>대충 여행지 고민을 해결해줄</p4>
            </span><br>
            <div style="margin-top : 5px;"></div>
            <span>
                <p5>대충 유명한 ${regionName}의 여행지</p5>
            </span><a href="localMore?typeSeq=0&regionSeq=${regionSeq}" class="item_more">
                <p5>더보기</p5>
            </a><br><br>
        </div>

		<div class="board_wrap">
           <c:forEach var="item" items="${boardListMap.typeSeq0}" varStatus="i">
           		<a href="getBoardDetail?boardSeq=${item.boardSeq}">
           		<div class="board_section">
           			<div><img class="board_image" src="${item.boardImage}"></div>
           			<div class="board_title">${item.boardTitle}</div>
           		</div>
           	</a>
           </c:forEach>
        </div><br><br>

        <div class="second_line">
            <span>
                <p4>대충 나만의 여행을 위한</p4>
            </span><br>
            <div style="margin-top : 5px;"></div>
            <span>
                <p5>대충 유명한 ${regionName}의 이색장소</p5>
            </span><a href="localMore?typeSeq=1&regionSeq=${regionSeq}" class="item_more">
                <p5>더보기</p5>
            </a><br><br>
        </div>

       <div class="board_wrap">
           <c:forEach var="item" items="${boardListMap.typeSeq1}" varStatus="i">
           		<a href="getBoardDetail?boardSeq=${item.boardSeq}">
           		<div class="board_section">
           			<div><img class="board_image" src="${item.boardImage}"></div>
           			<div class="board_title">${item.boardTitle}</div>
           		</div>
           	</a>
           </c:forEach>
        </div><br><br>
        
        <div class="second_line">
            <span>
                <p4>대충 편안하게 휴식하기 좋은</p4>
            </span><br>
            <div style="margin-top : 5px;"></div>
            <span>
                <p5>대충 유명한 ${regionName}의 숙소</p5>
            </span>
            <a href="localMore?typeSeq=3&regionSeq=${regionSeq}" class="item_more">
                <p5>더보기</p5>
            </a><br><br>
        </div>
		<%-- 숙소 리스트 --%>
        <div class="board_wrap">
           <c:forEach var="item" items="${boardListMap.typeSeq3}" varStatus="i">
           		<a href="getBoardDetail?boardSeq=${item.boardSeq}">
           		<div class="board_section">
           			<div><img class="board_image" src="${item.boardImage}"></div>
           			<div class="board_title">${item.boardTitle}</div>
           		</div>
           	</a>
           </c:forEach>
        </div>
        <%--------------------%>

       

    </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>