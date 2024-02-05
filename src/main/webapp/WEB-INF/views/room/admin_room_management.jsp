<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%@ page import="com.frontline.db.RoomDB"%> --%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin_room_management</title>
<!-- 헤더 자바스크립트 -->
<!-- 어드민 헤더만 자바스크립트로 헤더 스타일 변경해줌 -->
<script src="resources/js/header_admin.js"></script>

<!-- 헤더 스타일 -->
<link rel="stylesheet" href="resources/css/header_admin.css">

<!-- 초기화 스타일 -->
<link rel="stylesheet" href="resources/css/style.css">

 <!-- 푸터 스타일 -->
<link rel="stylesheet" href="resources/css/footer.css">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	</script>
<script type="text/javascript">
	$(function() {

		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {

			console.log("클릭")
			//input name='allCheck'를 클릭하면
			var chk_listArr = $("input[name='RowCheck']");
			// input name='RowCheck'를 list변수에 넣고
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
				// for문 돌리면서 list에 포함된값들을 체크한다
			}
		});
		// 전체체크 중 하나가 풀리면 '전체 체크박스'가 풀리게하고
		// 전체체크 중 체크가 안된 하나를 체크하면 '전체 체크박스'가 체크되게하는 코드
		// 그 아래 RowCheck 이름을 가진 체크박스의 체크수가 rowCnt 전체 갯수와 같다는건
		// 전체 선택이 되었다는 뜻이기때문에 allCheck 체크박스도 체크해준다.
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				// 체크된 RowCheck의 길이와 rowCnt의 개수의 길이가 같으면
				$("input[name='allCheck']")[0].checked = true;
				// $("input[name='allCheck']").prop("checked", true);
			} else {
				$("input[name='allCheck']")[0].checked = false;
				//$("input[name='allCheck']").prop("checked", false);
			}
		});

	});

	function deleteValue() {
		var url = "delete"; // Controller로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { // 만약 체크되어있으면
				valueArr.push(list[i].value); // lsit[i]의 값을 넣어라
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?")
			if (chk) { // confirm은 예/아니오로 true false를 반환
				$.ajax({
					url : url, // 전송 URL
					type : 'POST', // POST 방식
					traditional : true,
					data : {

						valueArr : valueArr
					// 보내고자 하는 data 변수설정
					},
					success : function(data) {
						console.log(data)
						if (data != 0) {
							alert("삭제성공");
							location.replace("goAdmin_room_management") // list 로 페이지 새로고침
						} else {
							alert("삭제실패");
						}
					}
				});
			}
		}
	}
	// 수정하기 누르면 seq값 가지고 updatepage로 이동
	// 체크를 두개 누르고 수정하기 누르면 alert(수정하기는 체크 하나만 해주세요)
	function updateValue() {
		/* var url = "updatePage"; // Controller로 보내고자 하는 URL */
		/* var valueArr = []; */
		var list = $("input[name='RowCheck']:checked"); // 자동 배열
		if (list.length > 1) {
			alert("하나만 선택가능합니다.");
			return;
		} else if (list.length == 0) {
			alert("선택된 글이 없습니다.");
			return;
		} else {
			/* console.log(list.parent().parent().find("#text_num")) */
			console.log(list[0].value) // 배열에 0번 값
			$("#updateValue").val(list[0].value)
			$("#updateValue2").click()
			//alert("성공");
			//location.replace("updatePage") // list 로 페이지 새로고침
			/* $.ajax({
				url : url, // 전송 URL
				type : 'POST', // POST 방식
				traditional : true,
				data : {
					valueArr : list[0].value
				},
				success : function(data) {
					b.countperpage 
					console.log(data)
					"{a:1,b:2}"
					{
						a:1,
						b:2
					}
					let i = JSON.parse(data)
					if (data = 1) {
						alert("성공");
					} else {
						alert("실패");
					}
				}
			}); */

		}

	}
</script>

<style>
/*셀렉트*/
/* .head {
	display: block;
} */

select {
	height : 30px;
}

.inputbuttons {
	display: flex;
	justify-content: flex-end;
	margin-right: 31px;
}

#updateValue, #updateValue2{
	display: none;
}

.members{
	color: #474747;
	font-weight: bold;
	font-size: 30px;
	margin-top: 5%;
	margin-left: 31px;
}

.sinput {
	width: 150px;
	height: 30px;
	font-size: 14px;
	text-align: center;
	border: 1px solid #aaa;
	border-radius: 6px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 2px;
}

.sbtn {
	width: 50px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #aaa;
	border-radius: 6px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 5px;
}

.sbtn2 {
	width: 80px;
	height: 30px;
	font-size: 14px;
	border: 1px solid #aaa;
	border-radius: 6px;
	margin-top: 10px;
	margin-bottom: 10px;
}

/*표*/
table {
	border-collapse: collapse;
	margin: 0 auto;	
	width: 95%;
}

#tablemain th, td {
	border: 1px solid #aaa;
 	text-align: center; 
}

#tablemain input {
	width: 80%;
	text-align: center;
	border: none;
/* 	margin: 0 auto;	 */
}

#tablemain input[type="checkbox"]{
	margin: 3px 3px 3px 3px;
	padding: 0px;
}

#tablemain .eventnone{
	pointer-events: none;
}

/*페이징*/
.page_wrap {
	margin-top: 30px;
	text-align: center;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	margin: 0px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 27px;
	background-color: #fff;
	font-size: 14px;
	color: #999999;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .prev {
	background: #f8f8f8 url('') no-repeat center center;
	margin-right: 6px;
}

.page_nation .next {
	background: #f8f8f8 url('') no-repeat center center;
	margin-left: 6px;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

.arrow.prev {
	margin-right: 10px;
}

.arrow.next {
	margin-left: 10px;
}

button {
	background-color: #474747;
	all: unset;
}
</style>


<style>

#wrap{
    max-width: 1280px;
    margin: 0 auto;
}

/* ===== 리셋 구간 ===== */

body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
  }
  
  h1, h2, h3, h4, h5, h6 {
    font-size: inherit;
    font-weight: normal;
    margin: 0;
  }
  
  p {
    margin: 0;
  }
  
  strong, em {
    font-weight: inherit;
    font-style: normal;
  }
  
  ul, ol {
    margin: 0;
    padding: 0;
    list-style-type: none;
  }
  
  dl { margin: 0; }
  dd {
    margin: 0;
    display: inline;
  }
  
  figure { margin: 0; }
  
  a {
    text-decoration: none;
    color: inherit;
  }
  
  th { font-weight: normal; }
  
  address { font-style: inherit; }

</style>

</head>



<body>

	<div id="wrap">
		<jsp:include page="../header_admin.jsp"/>		
		
		<div class="members">숙소 등록 관리</div>
			
			<div class="inputbuttons">
						
				<!-- 검색버튼(미구현) -->
				<form action="boardPick">
					<select class="sbtn" name="boardPick">
						<option value="-1" selected="selected">전체</option>
						<option value="0">글번호</option>
						<option value="1">지역</option>
					</select>
					<input type="hidden" name="typeSeq" value="3">
					<input class="sinput" type="text" name="boardSearch" placeholder="검색어를 입력해주세요">
					<input class="sbtn" type="submit" value="검색">
				</form>
				
				<!-- 수정버튼 -->
				<input class="sbtn" type="submit" value="수정" onclick="updateValue();">

				<!-- 삭제버튼 -->
				<input class="sbtn" type="button" value="삭제" onclick="deleteValue();">
				
				<!-- 등록버튼 -->
				<a href="goAdmin_room_new"><input class="sbtn2" type="button" value="신규등록"></a>
				
			</div>


			<table id="tablemain">
			
			<tbody>
				<tr>
					<th scope="col"><input id="allCheck" type="checkbox"
						name="allCheck" /></th>
					<th scope="col">번호</th>
					<th scope="col">숙소명</th>
					<th scope="col">주소</th>
					<th scope="col">전화번호</th>
					<th scope="col">오픈시간</th>
					<th scope="col">작성시간</th>
					<th scope="col">이미지</th>
					<th scope="col">상세내용</th>
				</tr>

				<c:forEach var="dto" items="${data.list}" varStatus="status">
					<tr>
						<td class="checktype"><input name="RowCheck" type="checkbox" value="${dto.boardSeq}" /></td>

						<td class="eventnone"><input type="text" value="${dto.boardSeq}"></td>
						<!-- 기존방식의 수정은 하나를 바꾸면 반복을 돌려 전부 가져가는 형식이다 그렇기에 좋지않은 방법 -->
						<td class="eventnone"><input type="text" value="${dto.boardTitle}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardAddress}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardPhone}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardOpen}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardRegDate}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardImage}"></td>

						<td class="eventnone"><input type="text" value="${dto.boardDetail}"></td>
					</tr>
				</c:forEach>
			</tbody>
			
			</table>

			<div class="page_wrap">
				<%@ page import="java.util.*"%>
				<%
				// model에 넣은 "data" 가져오기
				Map data = (Map) request.getAttribute("data");
				// System.out.println("data : " + data);
				// get은 무조건 object로 돌려줌
				int pageNum = (Integer) data.get("pageNum"); // (일단) 1페이지
				int total = (Integer) data.get("total"); // (일단) 총 114의 정보
				// 한번에 보여줄 글의 개수
				int countPerPage = (Integer) data.get("countPerPage"); // (일단)10개씩

				// 전체 페이지의 수
				// 올림처리 (전체 글의 수 / 한번에 보여줄 글의 수)
				// int/int는 소수점이 안나옴 하나는 double로 변환해서 계산
				// 12 / 5 >> 2.4 >> ceil결과 3.0 >> int 변수에 저장
				// 올림처리 Math.ceil / 내림처리 Math.floor / 반올림 Math.round
				int totalPaging = (int) Math.ceil((double) total / countPerPage); // 12페이지

				// 한번에 보여줄 페이지의 개수
				int groupCount = 5;

				// 현재 페이지가 몇번째 그룹에 있는지
				int position = (int) Math.ceil((double) pageNum / groupCount); // 그룹 1 / 그룹 2 / 그룹 3
				System.out.println("position : " + position);

				// 현재 페이지가 첫번째 페이지 번호
				int beginPaging = ((position - 1) * groupCount) + 1; // 1 / 6 / 11
				int endPaging = position * groupCount; // 5 / 10 / 15 = totalPaging = 12;

				// 15 = totalPaging = 12; totalpaging이 12까지인데 그걸 넘으면 12로 다시 재정의
				if (endPaging > totalPaging) {
					endPaging = totalPaging;
				}

				if (beginPaging == 1) {
					out.println(
					"<img src='https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202187.png?raw=true'>");
				} else {
					out.println("<a class='arrow prev' href='goAdmin_room_management?pageNum=" + (beginPaging - 1) + "'>"
					+ "<img src='https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202187.png?raw=true'></a>");
				}

				for (int i = beginPaging; i <= endPaging; i++) {
					if (i == pageNum) {
						out.println("<div class='page_nation'> <a href='goAdmin_room_management?pageNum=" + i + "'><strong>" + i
						+ "</strong></a> </div>");
					} else {
						out.println(
						"<div class='page_nation'> <a href='goAdmin_room_management?pageNum=" + i + "'>" + i + "</a> </div>");
					}
				}

				if (endPaging == totalPaging) {
					out.println(
					"<img src='https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202188.png?raw=true'>");
				} else {
					out.println("<a class='arrow next' href='goAdmin_room_management?pageNum=" + (endPaging + 1) + "'>"
					+ "<img src='https://github.com/Jominsang1/FrontLine_Project/blob/main/images/Group%202188.png?raw=true'></a>");
				}
				%>
			</div>		
		
		
	<jsp:include page="../footer.jsp"></jsp:include>
		<form action="updatePage">
			<input type="text" id="updateValue" name="boardSeq">
			<input type="submit" id="updateValue2">
		</form>
		
	</div>
	
</body>
</html>