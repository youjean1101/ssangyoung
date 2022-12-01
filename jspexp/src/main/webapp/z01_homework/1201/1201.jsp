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
	 toDay.setDate(toDay.getHours()+2000)
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
	
	<h2>[3단계:확인] 3. 기념일 계산 : 기준일 [    ] 계산할 일수 : [    ] [이전][이후]  기준일(type="date")은 
	default로 오늘 날짜가 년-월-일로 입력되고, 해당날짜를 입력 후, 버튼 클릭시, 기념을 계산할 날짜가 하단에 출력되게 하세요.</h2>
	
	
	<h2>[1단계:확인] 7. include 액션태그를 활용하여 하위페이지 z21_sub.jsp에 월드컵 B조별리그 1위 팀명과 승점을 전송해보세요</h2>
	<h2>월드컵 B조별리그 1위</h2>
	<div style="border:1px solid red">
		<jsp:include page="z21_sub.jsp">
			<jsp:param value="잉글랜드" name="teamname"/>
			<jsp:param value="7" name="point"/>
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
	
	<div style="border:1px solid green;">
		<%@ include file="z22_sub.jsp" %>
		<h1>최고 득점 선수 정보</h1>
		<h2><%=country %></h2>
		<h2><%=name %></h2>
		<h2><%=score %></h2>
	</div>
	
	
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
		[2단계:확인] 9. select[장바구니1/장바구니2]로 선택하게 하고 3X3 과일명을 리스트하고, 
		해당 과일명을 클릭시마다 포함된 장바구니1(iframe), 장바구니2(iframe)에 포함되게 하세요.</h2>

</body>
<script type="text/javascript">

var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>