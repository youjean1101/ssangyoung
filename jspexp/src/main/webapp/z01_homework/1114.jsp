<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a13_database.vo.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script></script>
	<style>
		table{border-collapse:collapse;}
		td{text-align:center; width:40%;}
	</style>
</head>
<body>
	<h2>[1단계:확인]* 3. js(javascript)의 입력창으로 물건명, 가격, 갯수를 입력받아서, 화면에 출력해보세요. </h2>
	<h2>
	<h3></h3>
	<h4></h4>
	<h5></h5>
	
	<!-- <h1>정답</h1>
	<h3>물건 정보 입력..</h3>
	<table id="prodTab" width="50%" border>
		<tr><th>물건명</th><td></td></tr>
		<tr><th>가격</th><td></td></tr>
		<tr><th>갯수</th><td></td></tr>
		<tr><th>총계</th><td></td></tr>
	</table>
	
	<script type="text/javascript">
		var pname1=prompt("물건명","")
		var price1=prompt("가격입력","0")
		var cnt1=prompt("갯수입력","0")
		var tds = document.querySelectorAll("#prodTab td");
		tds[0].innerText=pname; 
		tds[1].innerText=price; 
		tds[2].innerText=cnt; 
		tds[3].innerText=price*cnt; //js에서 +(덧셈) 연산자 이외는 자동형 변환을 해준다. 
	</script> -->
	
	
	<h2>[1단계:확인] 4. 70점 이상입니까?라는 confirm 입력 받아서 내용에 따라 합격/불합격을 화면에 출력하세요.</h2>
	<h6></h6>
	<h2>[1단계:확인]* 5. 테이블 3X3을 만들고, DOM을 활용하여 1행1열 1행2열 1행3열. 9개의 td의 내용을 출력하세요.</h2>
	<table width="300px" height="300px" style="border-collapse:collapse;" border>
		<tr>
		<td id="id1" onclick="no1()"></td>
		<td id="id2" onclick="no2()"></td>
		<td id="id3" onclick="no3()"></td>
		</tr>
		<tr><td id="id12"></td><td id="id22"></td><td id="id32"></td></tr>
		<tr><td id="id13"></td><td id="id23"></td><td id="id33"></td></tr>
	</table>
	
	<h1>정답</h1>
		<table id="tdb02" height="300px" border>
			<tr><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td></tr>
		</table>
		<script type="text/javascript">
			var tds = document.querySelectorAll("#tdb02 td"); //DOM객체를 배열로 받아서
			// index 번호로 접근해서 innerText 속성을 이용해서 값을 할당 처리
			tds[0].innerText="1행1열"; tds[1].innerText="1행2열"; tds[2].innerText="1행3열";
			tds[3].innerText="2행1열"; tds[4].innerText="2행2열"; tds[5].innerText="2행3열";
			tds[6].innerText="3행1열"; tds[7].innerText="3행2열"; tds[8].innerText="3행3열";
		</script>
	<h2>[1단계:확인]* 6. 위 내용을 열마다 물건명 가격 갯수 class를 따로 선언하여 선택자로 물건명 가격 갯수가 3개 나오게 출력하세요.</h2>
	
	<table width="300px" height="300px" style="border-collapse:collapse;" border>
		<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
		<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
	</table>
	
	<h1>정답</h1>
		<h2>물건정보</h2>
		<table id="tdb03" height="300px" border>
			<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
			<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
			<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
			<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
		</table>
		<script type="text/javascript">
			var pnames = document.querySelectorAll("#tdb03 .pname"); //DOM객체를 배열로 받아서
			var prices = document.querySelectorAll("#tdb03 .price"); //DOM객체를 배열로 받아서
			var cnts = document.querySelectorAll("#tdb03 .cnt"); //DOM객체를 배열로 받아서
			// index 번호로 접근해서 innerText 속성을 이용해서 값을 할당 처리
			pnames[0].innerText="사과"; pnames[1].innerText="바나나"; pnames[2].innerText="딸기";
			// 클래스 단위로 접근하기에 클래스마다 0 index 다시 시작
			prices[0].innerText="1200"; prices[1].innerText="4000"; prices[2].innerText="12000";
			cnts[0].innerText="3"; cnts[1].innerText="2"; cnts[2].innerText="5";
		</script>
	
	<h2>[1단계:확인] 8. 부서정보 VO을 클래스로 선언하고, 화면에 부서정보를 출력하세요.</h2>
	<%
		Dept d1 = new Dept(10,"인사팀","서울");
	%>
	
	<p>부서번호:<%=d1.getDeptno() %></p>
	<p>부서명:<%=d1.getDname() %></p>
	<p>지역:<%=d1.getLoc() %></p>
	
	<h2>[1단계:확인]* 9. 배열로 선수명3개, 선수성적3개, 소속팀3개를 선언하고 for문에 의해 테이블로 출력하세요.</h2>
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
		
		<h1>정답</h1>
		<%
			String []players={"최정","송성문","김성현"};
			String []teams = {"SSG","키움","SSG"};
			double []records={0.476, 0.381, 0.348};
			
			for(int idx=0;idx<players.length;idx++){
				log(players[idx]+":"+teams[idx]+":"+records[idx]);
			}
		%>
		<table height="300px" border>
			<tr><th>번호</th><th>소속팀</th><th>선수명</th><th>성적</th></tr>
			<%for(int idx=0;idx<players.length;idx++){ %>
			<tr><td><%=idx+1 %></td><td><%=players[idx] %></td>
				<td><%=teams[idx] %></td><td><%=records[idx] %></td></tr>
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