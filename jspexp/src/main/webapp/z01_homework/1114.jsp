<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.Dept"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>[1단계:확인] 3. js(javascript)의 입력창으로 물건명, 가격, 갯수를 입력받아서, 화면에 출력해보세요. </h2>
	<h2>
	<h3></h3>
	<h4></h4>
	<h5></h5>
	
	<h2>[1단계:확인] 4. 70점 이상입니까?라는 confirm 입력 받아서 내용에 따라 합격/불합격을 화면에 출력하세요.</h2>
	<h6></h6>
	<h2>[1단계:확인] 5. 테이블 3X3을 만들고, DOM을 활용하여 1행1열 1행2열 1행3열. 9개의 td의 내용을 출력하세요.</h2>
	<table width="300px" height="300px" style="border-collapse:collapse;" border>
		<tr>
		<td id="id1" onclick="no1()"></td>
		<td id="id2" onclick="no2()"></td>
		<td id="id3" onclick="no3()"></td>
		</tr>
		<tr><td id="id12"></td><td id="id22"></td><td id="id32"></td></tr>
		<tr><td id="id13"></td><td id="id23"></td><td id="id33"></td></tr>
	</table>
	<h2>[1단계:확인] 6. 위 내용을 열마다 물건명 가격 갯수 class를 따로 선언하여 선택자로 물건명 가격 갯수가 3개 나오게 출력하세요.</h2>
	
	<table width="300px" height="300px" style="border-collapse:collapse;" border>
		<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
	</table>
	
	<h2>[1단계:확인] 8. 부서정보 VO을 클래스로 선언하고, 화면에 부서정보를 출력하세요.</h2>
	<%
		Dept d1 = new Dept(10,"인사팀","서울");
	%>
	
	<p>부서번호:<%=d1.getDeptno() %></p>
	<p>부서명:<%=d1.getDname() %></p>
	<p>지역:<%=d1.getLoc() %></p>
	
	<h2>[1단계:확인] 9. 배열로 선수명3개, 선수성적3개, 소속팀3개를 선언하고 for문에 의해 테이블로 출력하세요.</h2>
		<%
			String[] playername ={"엘링 홀란", "해리 케인","이반 토니"};
			int[] playerscore ={18, 12, 10};
			String[] playerteam ={"맨시티", "토트넘", "브렌트포드"};
		%>
		<table width="300px" height="300px" style="border-collapse:collapse;" border>
			<tr><th>선수명</th><th>선수성적</th><th>소속팀</th></tr>
			<% for(int idx=0;idx<playername.length; idx++){ %>
			<tr>
			<td><%=playername[idx] %></td>
			<td><%=playerscore[idx] %></td>
			<td><%=playerteam[idx] %></td>
			</tr>
			<%} %>
		</table>
		
</body>
<script> 
	/* var pname = prompt("물건명을 입력하세요.", "물건명(여기에)");
	document.querySelector("h3").innerText="입력된 물건명:"+pname
	var price = prompt("가격을 입력하세요.", "가격(여기에)");
	document.querySelector("h4").innerText="입력된 가격:"+price
	var cnt = prompt("갯수를 입력하세요.", "갯수(여기에)");
	document.querySelector("h5").innerText="입력된 갯수:"+cnt */
	
	/* var score = confirm("70점 이상입니까?")
	document.querySelector("h6").innerText="결과:"+(score?"합격":"불합격"); */
	function no1(){
		var td1Obj = document.querySelector('#id1')
		td1Obj.innerText = "1행1열";
		document.querySelector('#id12').innerText = "2행1열";
		document.querySelector('#id13').innerText = "3행1열";
	}
	function no2(){
		var td2Obj = document.querySelector('#id2')
		td2Obj.innerText = "2행2열"
		document.querySelector('#id22').innerText = "2행2열";
		document.querySelector('#id23').innerText = "3행2열";
	}
	function no3(){
		var td3Obj = document.querySelector('#id3')
		td3Obj.innerText = "3행3열"
		document.querySelector('#id32').innerText = "2행3열";
		document.querySelector('#id33').innerText = "3행3열";
	}
	var pinfo =  document.querySelectorAll('.pname')
		pinfo[0].innerText="사과"
		pinfo[1].innerText="바나나"
		pinfo[2].innerText="딸기"
	var pinfo =  document.querySelectorAll('.price')
		pinfo[0].innerText="3000"
		pinfo[1].innerText="6000"
		pinfo[2].innerText="12000"
	var pinfo =  document.querySelectorAll('.cnt')
		pinfo[0].innerText="5"
		pinfo[1].innerText="1"
		pinfo[2].innerText="3"
</script>

</html>