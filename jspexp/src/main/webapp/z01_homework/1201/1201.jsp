<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
<div id="container" ></div>
	<h2>[1단계:확인] 2. 현재날짜로 부터 2000시간 이후의 년도, 월, 일, 시간:분 형식으로 출력하세요.</h2>
	<h3 id="ex2"></h3>
	<script>
	 var toDay = new Date()
	 toDay.setHours(toDay.getHours()+2000)
	 document.querySelector("#ex2").innerHTML+= "현재날짜로 부터 2000시간 이후: " +toDay.toLocaleString()+ "<br>"
	</script>
	
	<h2>[1단계:확인] 3. 기념일 계산 : 기준 년 [    ] 월[    ] 일[     ] 계산할 일수 : [select 100/500/1000] 이후 
		==> 선택했을 때, 해당 날짜를 출력</h2>
		
	기념일 계산: <br>
	기준<br>
	년<input type="text" name="year"/>
	월<input type="text" name="month"/>
	일<input type="text" name="date"/>
	계산할일수(이후) :<select name="calcuDate">
				<option value="100">100</option>
				<option value="500">500</option>
				<option value="1000">1000</option>
			</select>
	 <input type="button" value="계산" onclick="dayCalcu()"/>
	<h3 id="ex3"></h3>
	<script>
	
	function dayCalcu(){
		var dateYear = document.querySelector("[name=year]").value
		var dateMonth = document.querySelector("[name=month]").value
		var datedate = document.querySelector("[name=date]").value
		var plusDate = document.querySelector("[name=calcuDate]").value
		var memorialDay = new Date(dateYear,dateMonth-1,datedate)
		 
		document.querySelector("#ex3").innerHTML = "입력하신 날짜: "+memorialDay.toLocaleString()+"<br>"
		memorialDay.setDate(memorialDay.getDate()+Number(plusDate))
		document.querySelector("#ex3").innerHTML += "기념일 "+plusDate+" 일 후 날짜:"+memorialDay.toLocaleString()
	} 
	</script>
	
	<h2>[3단계:확인]* 3. 기념일 계산 : 기준일 [    ] 계산할 일수 : [    ] [이전][이후]  기준일(type="date")은 
	default로 오늘 날짜가 년-월-일로 입력되고, 해당날짜를 입력 후, 버튼 클릭시, 기념을 계산할 날짜가 하단에 출력되게 하세요.</h2>
	<h3>정답</h3>
	<!-- # 처리순서
	1. 화면구현 : 입력/출력
	2. 이벤트 핸들러 선언
		1) 필요한 DOM 객체 선언 : 기준일, 계산할 일
		2) 기준일 : 년-월-일	2022-12-02 ==> 년/월/일 분리 추출..
			subString, split("-")
		3) Date()에 생성과 할당
			기능메서드 +, - setDate(getDate()+@@)
		4) 출력 DOM에 toLocaleString()
	 -->
	기준일 : <input type="date" name="date01" /><br>
	계산할 일수 : <input type="text" name="dcnt"/><br>
	<input type="button" value="이전" onclick="calcu(false)"/>
	<input type="button" value="이후" onclick="calcu(true)"/>
	<p id="show01" align="center"></p>
	<script>
	var date01 = document.querySelector("[name=date01]")
	var dcnt = document.querySelector("[name=dcnt]")
	var show01 = document.querySelector("#show01")
	var d = new Date()
	date01.value = d.toISOString().split("T")[0]
	function calcu(isAfter){
		var d = date01.value.split("-")
		// console.log(d)
		// console.log(d[1]-1+"월(-1)처리")
		// 입력
		var dt01 = new Date(d[0],d[1]-1,d[2])
		var datecnt = parseInt(dcnt.value) //입력된 내용을 형변환+ parseInt()
		// 날수 처리
		if( !isAfter ) datecnt = -datecnt
		//console.log(datecnt)
		dt01.setDate(dt01.getDate()+datecnt)
		show01.innerText = dt01.toLocaleString()
	}
	
	// 오늘 날짜 설정.
	// console.log(d.toISOString())
	// console.log(d.toISOString().split("T"))
	// console.log(d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate())
	// date01.value=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
	</script>
	
	<h2>[1단계:확인]* 7. include 액션태그를 활용하여 하위페이지 z21_sub.jsp에 월드컵 B조별리그 1위 팀명과 승점을 전송해보세요</h2>
	<h2>월드컵 B조별리그 1위</h2>
	<div style="border:1px solid red">
		<jsp:include page="z21_sub.jsp">
			<jsp:param value="잉글랜드" name="teamname"/>
			<jsp:param value="7" name="point"/>
		</jsp:include>
	</div>
	
	<h3>정답</h3>
	<div style="border:1px solid blue">
		<jsp:include page="z21_sub.jsp">
			<jsp:param value="잉글랜드" name="nation"/>
			<jsp:param value="7" name="points"/>
		</jsp:include>
	</div>
	
	
	<h2>[1단계:확인] 8. include 지시자를 활용하여 메인헤서 최고 득점 선수 정보(국가, 이름, 점수) 
		정보를 form으로 입력하게 하고 하위페이지 z22_sub.jsp에서 요청값을 처리하고, 다시 메인에서 입력된 요청변수를 출력하게 하세요</h2>
	<form>
		국가 : <input type="text" name="country"/>
		이름 : <input type="text" name="name"/>
		점수 : <input type="text" name="score"/>
		<input type="submit" value="최고 득점 선수 정보"/>
	</form>
	
	<%-- <div style="border:1px solid green;">
		<%@ include file="z22_sub.jsp" %>
		<h1>최고 득점 선수 정보</h1>
		<h2><%=country %></h2>
		<h2><%=name %></h2>
		<h2><%=score %></h2>
	</div> --%>
	
	<h3>정답</h3>
	<h2>카타르 월드컵 최고 득점 선수</h2>
	<form>
		나라:<input type="text" name="nation2" />
		이름:<input type="text" name="name2" />
		점수:<input type="text" name="point2" />
		<input type="submit" />		
	</form>
	<%@ include file="z22_sub.jsp" %>
	<h2>입력결과</h2>
	<h3>나라:<%=nation2 %></h3>
	<h3>이름:<%=name2 %></h3>
	<h3>점수:<%=point2 %></h3>
	
	
	<h2>[1단계:확인] 9. 2개 iframe을 활용하여 이름을 입력하게 하고 선택하게 하여 2개 팀에 선수를 나누어 출력하게 하세요.</h2>
	선수 이름 : <input type="text" name="playeName">
	<input type="submit" value="팀1 등록" onclick="go(0)">
	<input type="submit" value="팀2 등록" onclick="go(1)">
	
	<iframe name="team1" src="1201_team1_sub.jsp"></iframe>
	<iframe name="team2" src="1201_team2_sub.jsp"></iframe>
	<script>
	function go(idx){
		var player = document.querySelector("[name=playeName]").value
		if(idx==0) team1.document.querySelector("h3").innerHTML+=player+", "
		if(idx==1) team2.document.querySelector("h3").innerHTML+=player+", "
	}
	</script>
	
	
	<h2>
		[2단계:확인]* 9. select[장바구니1/장바구니2]로 선택하게 하고 3X3 과일명을 리스트하고, 
		해당 과일명을 클릭시마다 포함된 장바구니1(iframe - z23_sub.jsp), 장바구니2(iframe-z24_sub.jsp)에 포함되게 하세요.</h2>
	<!-- 
	1. 화면구현
	2. 이벤트 처리
	 -->
	 <style>td{width:33%;height:33%;}</style>
	 <h2>두 개의 장바구니에 담기</h2>
	 <select name="cart">
	 	<option value="cart1">장바구니1</option>
	 	<option value="cart2">장바구니2</option>
	 </select>
	 <table>
	 	<%
	 	String []fruits = {"사과","바나나","오렌지","수박","키위","멜론","자몽","블루베리","딸기"};
	 	for(int idx=0;idx<fruits.length;idx++){
	 		if(idx%3==0) out.print("<tr>");
	 		out.print("<td onclick='ch01(this.innerText)'>"+fruits[idx]+"</td>");
	 		if(idx%3==2) out.print("</tr>");	
	 	}
	 	%>
	 </table>
	 <iframe name="cart01" src="z23_sub.jsp" height="200px"></iframe>
	 <iframe name="cart02" src="z24_sub.jsp" height="200px"></iframe>
			 
</body>
<script type="text/javascript">
	function ch01(fruit){
		//alert(fruit)
		var chCart = document.querySelector("[name=cart]").value
		
		if(chCart=="cart1") cart01.document.body.innerHTML += fruit+","
		if(chCart=="cart2") cart02.document.body.innerHTML += fruit+","
	}
</script>
</html>