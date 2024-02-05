<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.frontline.dto.UserDTO" %>
	<header>
		<div class="header_logo">
			<a href="gomain"><img src="resources/images/logo_main.png"></a>
		</div>
		<div class ="header_input">
			<ul class = "input_wrap">
				<li ><input class="input" type="text" placeholder="어디로 갈까U?"></li>
					<ul class="input_list">
                    	<a href="getBoardList?regionSeq=0"><li class="header_ch"><img src="https://lh3.googleusercontent.com/p/AF1QipOpGwORvHaWdXZWGdqSLvntyd49eIocfPV162kD=s1360-w1360-h1020">천안</li></a>
                    	<a href="getBoardList?regionSeq=1"><li class="header_as"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Asan_City_Hall.JPG/270px-Asan_City_Hall.JPG">아산</li></a>
                    	<a href="getBoardList?regionSeq=2"><li class="header_as"><img src="https://lh5.googleusercontent.com/p/AF1QipOeLIzgqjMyK3cc3HQ_-tl2cSNuZPt1_pdqmcBD=w594-h343-n-k-no">당진</li></a>
                    	<a href="getBoardList?regionSeq=3"><li class="header_as"><img src="https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSb8IWsc2n5Yv7qMHRhH_V77SmWmV_Vyf-RwM1tReGKO0OoEZ92j9_JFMQgP0hsSGx48tvoi5Sq7OH89d9XcMLK_m8JtT0oz7e4fitFjQ">서산</li></a>
                    	<a href="getBoardList?regionSeq=4"><li class="header_as"><img src="https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQfdHTdYsEyha8K-JnZWYPxE87rLuTMKuxLBm02cs4kPx3h22-bzLV7Bm1kdfvNTka1E4VFHXkbZsgi5FNPE4C61gIxv0GGb7PX80RmcA">태안</li></a>
                    	<a href="getBoardList?regionSeq=5"><li class="header_as"><img src="https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTmfnh9HJOkDsKgmMPe27eCJkqBhqhcMkQscmhgaO64AW9yDQFVbT7zOuqlgYB99fGF3F1ItAnryMn-27tJAltzjR7IBvkLMjn-TpIMSg">예산</li></a>
                    	<a href="getBoardList?regionSeq=6"><li class="header_as"><img src="https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQjLXwEVKbJUpqPChuGDQlGg33ZHbQI9Pv57U6U9nLTtARNOI413vR84OVwIWyKr8YE7DQ6IyyZn_EG5ION0zkvAnk5-DEGErLxwdV8r38">공주</li></a>
                    	<a href="getBoardList?regionSeq=7"><li class="header_as"><img src="https://lh5.googleusercontent.com/p/AF1QipPhb8kcIwvrUc4Lzy3lOHSPf8rWOkF-8TeqAGnV=w594-h343-n-k-no">홍성</li></a>
                    	<a href="getBoardList?regionSeq=8"><li class="header_as"><img src="https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcSCSf77ZIgkA4KBqH5cAIJU1yxudMUGcqqKDyblZqrVoGo7Y9X40Uo9ClaRL9Wvrvrtm1G4NPvp4gGLeGCzzioSBwAxYQ5cmZKiErBwaA">보령</li></a>
                    	<a href="getBoardList?regionSeq=9"><li class="header_as"><img src="https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTwsLkJj6B_Mqh0VsOAAhcD4eV74nKUmRI6nDOuLZBPIPrVIkyzrj6iEtbMTN9BQZHy3nCtO8AL5vvAIvMmgitFhb2RcoDC9MowyAL0Fg">청양</li></a>
                    	<a href="getBoardList?regionSeq=10"><li class="header_as"><img src="https://lh5.googleusercontent.com/p/AF1QipMYeIPUQy0-V2Gf1qqolD0NiPanxOtXQMrq27b0=w594-h343-n-k-no">부여</li></a>
                    	<a href="getBoardList?regionSeq=11"><li class="header_as"><img src="https://lh5.googleusercontent.com/p/AF1QipNzvQ0znziR2lV2DS4ypTFmw1HyC_RLDZfoPCkF=w594-h343-n-k-no">서천</li></a>
                    	<a href="getBoardList?regionSeq=12"><li class="header_as"><img src="https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcQRnMXc4EyK7X2lxiArmxyIc3Aqu4LCkNye1LOhnnuMNBglq6209J_5162kxhPEVtCpuM45BHyADwS3HxTkBNvVyRrldyrXDC0xd_JAJA">논산</li></a>
                    	<a href="getBoardList?regionSeq=13"><li class="header_as"><img src="https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTW-QKwcz1A_h8o30KG3qdzqRHhJmeD5_QA7oK0V0CmMSV4gNUGUl1FLNQbJj0zNGQ9RwpHNZ2-hBaiF4zWiClYGu3IcUOdlpztY8I85Tk">계룡</li></a>
                    	<a href="getBoardList?regionSeq=14"><li class="header_as"><img src="https://lh5.googleusercontent.com/p/AF1QipP0Vq0oWt62GJ6WiLj5O2TOhIUstykjV-F2-vg7=w594-h343-n-k-no">금산</li></a>
                	</ul>
			</ul> 
		</div>
		<div>
			<ul class="menu_wrap">
				<li><img class="header_img" src="resources/images/세줄로고.png"></li>
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
