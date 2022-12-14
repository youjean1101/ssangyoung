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
	<h2>[1단계:확인] 2. 쿠키값(coffee/americano)로 설정 후, 페이지 링크로 설정된 쿠키값을 리스트하세요.</h2>
		<%
			Cookie  c = new Cookie("coffee","americano");
			response.addCookie(c);
		 %>
		 
		<a href="cookie.jsp">쿠키를 뭐랑먹나요?</a>
		
	<h2>[1단계:확인] 3. 쿠키값(coffee/vanilla)로 변경후, 페이지 링크로 설정된 쿠키값을 리스트하세요.</h2>
	
	<h2>[1단계:확인] 4. 쿠키값(커피) 삭제 후,  페이지 링크로 설정된 쿠키값을 리스트하세요.</h2>
	
	<h2>[1단계:확인] 6. 오늘 월드컵 대전 팀과 결과를 날짜/팀1/팀2/결과를 입력해서 테이블로 추가리스트 되게 처리하세요.</h2>
		<form>
			날짜 : <input type="date" name="playdate" /><br>
			팀1 : <input type="text" name="team1" />
			팀2 : <input type="text" name="team2" />
			결과 : <input type="text" name="result" />
			<input type="button" value="추가" onclick="addWordCup()"/>
		</form>
		<table id="tds">
			<thead>
				<tr><th>날짜</th><th>팀1</th><th>팀2</th><th>결과</th></tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
		<script>
			var dateObj = document.querySelector("[name=playdate]")
			var team1Obj = document.querySelector("[name=team1]")
			var team2Obj = document.querySelector("[name=team2]")
			var resultObj = document.querySelector("[name=result]")
			var tabObj = document.querySelector("#tds tbody")
			function addWordCup(){
				tabObj.innerHTML += "<tr><td>"+dateObj.value+"</td><td>"+team1Obj.value+"</td><td>"+team2Obj.value+"</td><td>"+resultObj.value+"</td></tr>"
			}
		</script>
	<h2>[1단계:확인] 7. 가위/바위/보를 select로 선택하게 하고, 컴퓨터와 play를 클릭해서, 나의 선택과 컴퓨터 선택 결과가 나와서 승/무/패가 출력되게 하세요.</h2>
	<select id="userSel">
		<option value="가위">가위</option>
		<option value="바위">바위</option>
		<option value="보">보</option>
	</select>
	<input type="button" value="컴퓨터와 play" onclick="game()"/>
	<h3 id="ex7"></h3>
	
	<script>
		var outPut = document.querySelector("#ex7")
		var user = document.querySelector("#userSel")
		function game(){
			var computer= Math.floor(Math.random()*3+1)
			if(computer==1){
				outPut.innerHTML = "나:"+user.value+" / 컴퓨터:가위<br>"
				if(user.value=="가위"){
					outPut.innerHTML += "결과: 무"
				}else if(user.value=="바위"){
					outPut.innerHTML += "결과: 승"
				}else if(user.value=="보"){
					outPut.innerHTML += "결과: 패"
				}
			}else if(computer==2){
				outPut.innerHTML = "나:"+user.value+" / 컴퓨터:바위<br>"
				if(user.value=="가위"){
					outPut.innerHTML += "결과: 패"
				}else if(user.value=="바위"){
					outPut.innerHTML += "결과: 무"
				}else if(user.value=="보"){
					outPut.innerHTML += "결과: 승"
				}
			}else if(computer==3){
				outPut.innerHTML = "나:"+user.value+" / 컴퓨터:보<br>"
				if(user.value=="가위"){
					outPut.innerHTML += "결과: 승"
				}else if(user.value=="바위"){
					outPut.innerHTML += "결과: 패"
				}else if(user.value=="보"){
					outPut.innerHTML += "결과: 무"
				}
			}
			user.value=""; 
			computer=""; 
		}
	</script>
	
	<h2>[1단계:확인] 8. [@@][select +,-,*,/][@@] [결과확인] 임의의 숫자 두개가 나오고 연산자의 선택하고 결과확인에 따라 연산처리결과가 하단에 h2로 출력되게 하세요</h2>
		<input type="text" name="num1" />
		<select id="sel">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
		<input type="text" name="num2" />
		<input type="button" value="결과확인" onclick="cal()" />
		
		<h2 id="ex8"></h2>
		
		<script>
			var num01 = document.querySelector("[name=num1]");
			var sel = document.querySelector("#sel");
			var num02 = document.querySelector("[name=num2]");
			function cal(){
				var nNum01 = Number(num01.value);
				var nNum02 = Number(num02.value);
				if(sel.value=="+"){
					document.querySelector("#ex8").innerHTML = nNum01+" + "+nNum02+" = "+(nNum01+nNum02)
				}else if(sel.value=="-"){
					document.querySelector("#ex8").innerHTML = nNum01+" - "+nNum02+" = "+(nNum01-nNum02)
				}else if(sel.value=="*"){
					document.querySelector("#ex8").innerHTML = nNum01+" * "+nNum02+" = "+(nNum01*nNum02)
				}else if(sel.value=="/"){
					document.querySelector("#ex8").innerHTML = nNum01+" / "+nNum02+" = "+(nNum01/nNum02)
				}
			}
		</script>
		<h3>정답</h3>
		<table>
			<tr>
				<td><input type="text" name="num01" value="0" size="2"/></td>
				<td><select name="cal2">
					<option value="0">+</option>
					<option value="1">-</option>
					<option value="2">*</option>
					<option value="3">/</option>
				</select></td>
				<td><input type="text" name="num02" value="0" size="2"/></td>
				<td><input type="button" value="결과확인" onclick="result()"/></td>
			</tr>
		</table>
		<script>
			var num01Ob = document.querySelector("[name=num01]")	
			var num02Ob = document.querySelector("[name=num02]")	
			var calOb = document.querySelector("[name=cal2]")	
			var options = document.querySelectorAll("[name=cal2]>option")
			console.log(options.length)
			// 임의의 값 할당
			num01Ob.value = Math.floor(Math.random()*10+1);
			num02Ob.value = Math.floor(Math.random()*10+1);
			var rIdx = Math.floor(Math.random()*4);
			for(var idx=0;idx<options.length;idx++){
				if(rIdx==idx){
					// selected 선택되어진 것에 대한 속성 설정
					options[idx].selected=true;
				}
			}
			function result(){
				var nuM01 = num01Ob.value
				var nuM02 = num02Ob.value
				var cIx = calOb.value
				var calR = [Number(nuM01)+Number(nuM02),nuM01-nuM02,nuM01*nuM02,nuM01/nuM02]
				var cal2 = [" + ", " - ", " X ", " / "]
				alert(nuM01+cal2[cIx]+nuM02+" = "+calR[cIx])
			}
		</script>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>