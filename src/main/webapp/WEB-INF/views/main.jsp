<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
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
    <script>
        window.addEventListener("load", function(){
            hover();
            $(function(){
                $('img[usemap]').rwdImageMaps();
                $("#img").width("100%");
            });
            
            popup_close();
        })

        let result = new Array(15);

        for (let i = 0; i < result.length; i++){
            result[i] = new Array(6);
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
            
            for(let i = 0; i<result.length; i++){
                let input_xy = result[i][1];
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
							result[i][2] = item[j].fcstValue
							pty = 1
                      	}
						
                      	if(item[j].category == "SKY" && sky == 0){
                  			result[i][3] = item[j].fcstValue
                  			sky = 1
    					}
                      	
    					if(item[j].category == "T1H" && t1h == 0){
     						result[i][4] = item[j].fcstValue
     						t1h = 1
   						}
    					
                        if(item[j].category == "REH" && reh == 0){
                        	result[i][5] = item[j].fcstValue
                        	reh = 1
           				}
                     }
                }
            }
        
        function hover(){
            $(".지도").hover(function(){
            	$(".weather").css("backgroundColor", "white")
                $(".weather").css("border", "4px solid lightgray")
                
                let name;
            	let pty; // 강수상태
            	let sky; // 하늘상태
            	let t1h; // 온도
            	let reh // 습도
            	
                for(let i = 0; i<15; i++){
                	if($(this).attr("title") == result[i][0]){
                		$(".map").attr("src", "resources/images/map_"+i+".png")
                		name = $(this).attr("title");
                		pty = result[i][2]
                		sky = result[i][3]
                		t1h = result[i][4]
                		reh = result[i][5]
                		check(result[i])
                	}
                }
            	
            	let html = name + "의 현재 <br>"
            	html += "온도 : "+t1h+"도 <br>"
            	html += "습도 : "+reh+"% <br>"
            	
            	$(".weather_text").html(html)
            })
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
        
        function popup_close(){
        	$("#popup_1_button").click(function(){
        		$(".popup_1").css("display", "none")
        		console.log($("#popup_1_checkbox").is(":checked"))
        		if($("#popup_1_checkbox").is(":checked") == true){
        			$("#popup_1_submit").click()
        		}
        	})
        	
        	$("#popup_2_button").click(function(){
        		$(".popup_2").css("display", "none")
        		console.log($("#popup_2_checkbox").is(":checked"))
        		if($("#popup_2_checkbox").is(":checked") == true){
        			$("#popup_2_submit").click()
        		}
        	})
        }
    </script>
    <style>
        div {
            /* border: 1px solid red; */
        }
        main{
            display: flex;
            justify-content: center;
			
			max-width: 1240px;
    		margin: 0 auto;
			
			position: relative;
			
            background-image: url(resources/images/main_background.png);
            background-repeat: no-repeat;
            background-size: 100%;
        }
        .map {
            max-width: 100%;
            max-height: 100%;
        }
        
       
        .main {
            width: 100%;
        }

        .main_map {
            height: 100%;
            width: 100%;

            display: flex;
            justify-content: center;
        }

        .sunny, .cloudy, .rain, .snow {
            display: none;
        }

        .weather_wrap {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .weather {
            border: 4px solid;
            border-style: none;
            display: flex;
            flex-direction: column;
            justify-content: center;
            border-radius: 15px;
            background-color: none;
	
			position: absolute;
			right: 0;
			
            min-width: 150px;   
            min-height: 150px;

            z-index: 2;
        }

        .weather_img {
            display: flex;
            justify-content: center;
        }
        .weather_text {
            text-align: center;
        }
        
        .popup_1 {
        	border: 2px solid;
        	background-color: white;
        	position: absolute;
        	top: 10px;
    		left: 10px;
    		
    		heigth: 300px;
    		width: 300px;
        }
        
        .popup_2 {
        	border: 2px solid;
        	background-color: white;
        	position: absolute;
        	top: 10px;
    		left: 320px;
    		
    		heigth: 300px;
    		width: 300px;
        }
        
        .popup_1_main, .popup_2_main {
        	display: flex;
        	justify-content: space-between;
        }
        
        .popup_1_submit, .popup_2_submit {
        	display: none;
        }
        
</style>

    
    
    <style>
        /* 미디어 */
        @media screen and (max-width: 800px) {
           
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"/>
        <main>
                <img class="map" src="resources/images/map.png" usemap="#image-map">
        
                <map name="image-map">
                    <area class="천안 지도" target="" alt="천안" title="천안" href="getBoardList?regionSeq=0" coords="561,88,577,109,573,119,574,136,575,147,588,154,582,167,582,182,579,196,592,207,591,221,579,222,571,237,569,253,551,267,540,281,530,297,546,304,571,308,590,298,612,311,622,330,622,302,622,276,607,263,614,247,636,248,652,260,673,275,698,275,711,259,711,245,729,246,726,226,752,230,768,236,777,222,765,206,764,193,732,170,723,166,723,150,708,146,710,129,692,112,669,96,655,99,645,84,620,67,593,64,581,76,582,87" shape="poly">
                    <area class="아산 지도" target="" alt="아산" title="아산" href="getBoardList?regionSeq=1" coords="560,88,542,93,517,93,503,105,479,117,456,127,431,138,428,159,433,185,434,200,424,204,423,224,436,234,445,248,462,250,471,268,496,272,509,287,513,302,531,298,541,275,567,252,574,230,581,217,593,215,580,194,580,165,587,154,572,140,577,120,573,103,564,93" shape="poly">
                    <area class="당진 지도" target="" alt="당진" title="당진" href="getBoardList?regionSeq=2" coords="224,8,205,37,217,56,223,91,218,120,229,137,242,159,259,176,285,167,294,182,312,194,320,214,345,208,351,195,364,200,382,224,414,223,421,208,434,196,430,174,430,149,430,126,412,98,404,78,402,63,367,55,346,41,313,55,297,34,268,19,244,5" shape="poly">
                    <area class="서산 지도" target="" alt="서산" title="서산" href="getBoardList?regionSeq=3" coords="147,34,130,50,145,60,156,64,156,71,142,69,136,66,147,84,157,86,166,92,175,97,175,109,180,120,165,125,153,131,147,146,142,160,137,145,127,146,130,165,137,187,147,200,141,229,140,270,147,300,161,329,192,336,192,305,198,270,206,311,231,315,243,312,286,297,293,254,318,219,305,185,291,174,291,165,246,170,235,137,210,121,227,72,212,42,157,36" shape="poly">
                    <area class="태안 지도" target="" alt="태안" title="태안" href="getBoardList?regionSeq=4" coords="113,64,102,75,105,106,97,119,77,111,40,130,47,153,38,180,36,161,27,168,25,196,2,218,8,241,7,264,28,246,26,225,46,230,57,244,65,265,46,264,31,259,22,274,36,289,63,280,77,271,80,261,96,261,90,276,106,303,105,333,105,355,121,348,123,373,132,396,133,443,133,474,143,483,155,495,170,495,187,496,190,474,168,451,171,432,162,415,155,394,153,366,152,347,136,347,130,335,138,325,145,306,140,279,140,242,148,196,130,179,101,177,120,161,122,135,138,120,118,107,116,75" shape="poly">
                    <area class="예산 지도" target="" alt="예산" title="예산" href="getBoardList?regionSeq=5" coords="282,298,285,322,303,324,303,305,340,290,370,290,371,305,377,313,391,337,378,354,375,372,375,385,393,389,412,392,425,374,431,360,462,362,482,345,482,324,495,303,500,280,510,273,475,268,457,250,437,239,423,215,392,224,372,214,361,198,341,199,328,210,310,225,295,253,293,280" shape="poly">
                    <area class="공주 지도" target="" alt="공주" title="공주" href="getBoardList?regionSeq=6" coords="621,335,654,360,632,379,635,399,634,407,645,427,642,445,664,467,686,471,702,479,687,491,687,527,679,550,666,525,646,521,630,542,605,554,589,530,570,562,555,584,534,570,512,557,516,532,519,507,547,489,520,452,484,442,469,449,467,427,461,400,457,365,485,336,492,310,499,287,510,297,534,296,574,309,584,300,616,314" shape="poly">
                    <area class="홍성 지도" target="" alt="홍성" title="홍성" href="getBoardList?regionSeq=7" coords="208,311,213,336,200,345,202,375,206,389,228,400,245,404,277,415,286,437,325,445,355,430,366,436,382,404,392,390,368,377,387,351,390,334,373,306,375,289,336,292,310,312,300,327,283,322,282,301,255,307,221,321" shape="poly">
                    <area class="보령 지도" target="" alt="보령" title="보령" href="getBoardList?regionSeq=8" coords="222,404,212,426,222,466,213,504,241,512,251,527,242,548,227,549,253,577,252,599,243,626,246,647,275,652,308,657,330,651,345,646,352,621,368,609,347,587,345,552,345,528,357,516,363,501,342,471,337,446,283,441,283,408,257,413,226,397" shape="poly">
                    <area class="청양 지도" target="" alt="청양" title="청양" href="getBoardList?regionSeq=9" coords="331,445,346,479,372,511,402,517,418,504,436,502,427,517,443,541,471,536,491,545,512,534,518,502,545,490,518,441,475,447,460,411,457,367,428,360,420,392,395,385,376,417,368,434,350,431" shape="poly">
                    <area class="부여 지도" target="" alt="부여" title="부여" href="getBoardList?regionSeq=10" coords="358,504,346,529,337,556,348,581,361,610,346,646,376,651,402,655,406,680,428,696,431,730,453,732,468,682,495,685,507,672,526,680,516,639,528,626,541,631,555,592,563,569,517,557,518,529,483,546,465,536,447,546,431,500,410,515,386,519,367,501" shape="poly">
                    <area class="서천 지도" target="" alt="서천" title="서천" href="getBoardList?regionSeq=11" coords="246,645,238,670,226,670,225,685,248,674,253,690,276,692,288,714,310,721,303,737,323,760,330,781,368,784,377,771,417,759,443,737,455,724,430,722,430,695,408,676,395,646,358,650,342,640,307,656,287,659,261,640" shape="poly">
                    <area class="논산 지도" target="" alt="논산" title="논산" href="getBoardList?regionSeq=12" coords="521,679,548,687,561,719,593,732,606,739,612,724,636,724,655,714,678,726,678,704,705,699,705,669,721,645,708,615,692,611,668,611,657,596,646,597,637,536,606,547,592,539,577,536,561,565,560,591,545,615,538,627,525,627,513,647" shape="poly">
                    <area class="계룡 지도" target="" alt="계룡" title="계룡" href="getBoardList?regionSeq=13" coords="643,532,642,586,650,596,661,602,690,610,697,591,681,576,680,545,662,524,651,524" shape="poly">
                    <area class="금산 지도" target="" alt="금산" title="금산" href="getBoardList?regionSeq=14" coords="736,587,727,629,713,667,710,704,726,711,740,755,763,780,781,766,801,799,837,801,851,780,838,756,881,776,901,784,896,764,907,755,896,741,907,731,901,714,893,697,881,684,881,659,880,637,875,611,851,609,842,592,805,617,790,637,760,630,760,604,750,586" shape="poly">
                </map>
                <div class="weather">
                    <div class="weather_img">
                        <img class="sunny" src="resources/images/Sunny.png">
                        <img class="cloudy" src="resources/images/Cloudy.png">
                        <img class="rain" src="resources/images/Rain.png">
                        <img class="snow" src="resources/images/Snow.png">
                    </div>
                    <div class="weather_text">
                        
                    </div>
                </div>
        </main>
    <jsp:include page="footer.jsp"></jsp:include>
    
   	<% 
   		int popup1_count = 0; 
   		int popup2_count = 0; 
   		
   		Cookie[] cookies = request.getCookies(); 
   		
   		if(cookies != null){
   			for(Cookie c : cookies){
   				System.out.println("c.getNanme :" + c.getName());
   				
   	   			if(c.getName().equals("popup1") && c.getValue().equals("setChecked")){
   	   				popup1_count = 1;
   	   				
   	   			}
   	   			if(c.getName().equals("popup2") && c.getValue().equals("setChecked")){
   	   				popup2_count = 1;
   	   			}
   	   		}
   		}
   	   		
   	   		if(popup1_count == 0){ 
 	   			%> 

   	   			<div class="popup_1" id="popup_1">
   	    			<img width="100%" heigth="100%" src="${popup[0].POPUP_IMAGE}">
 	    			<form class="popup_1_form" action="popupCookie">
   	    				<div class="popup_1_main">
   	    					<div>
   	    						<input id="popup_1_checkbox" type="checkbox" name="target" value="popup1"> 10초동안 보지않기
   	    					</div> 
   	    					<input class="popup_1_submit" id="popup_1_submit" type="submit">
   	   	    				<input id="popup_1_button" type="button" value="닫기">
   	    				</div>
    	    			</form>
   	    		</div>

   	   			<%
    	   		} 
   	   		
	 	  		if(popup2_count == 0){ 
		   		%> 
   	   			<div class="popup_2" id="popup_2">
   	   	    		<form class="popup_2_form" action="popupCookie">
   	   	    		<img width="100%" heigth="100%" src="${popup[1].POPUP_IMAGE}">
   	   	    			<div class="popup_2_main">
   	   	    				<div>
   	   	    					<input id="popup_2_checkbox" type="checkbox" name="target" value="popup2"> 10초동안 보지않기
   	   	    				</div> 
   	   	    				<input class="popup_2_submit" id="popup_2_submit" type="submit">
   	   	    				<input id="popup_2_button" type="button" value="닫기">
   	   	    			</div>
  	    		</form> 
   	   	    	</div>
   	   	    	<%
   	   		}
   		
   		
    	%>
</body>
</html>