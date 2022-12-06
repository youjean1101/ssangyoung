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
	<h2>[1단계:확인]* 2. 임의의 구구단 출력 h2로 출력 eval함수를 활용하여 4X3 테이블에  0~9 정답확인 문자열 생성
            @@@ X @@  = ?
            테이블 ==> cell 클릭시 ?에 입력될 숫자를 출력하고,
            정답확인 버튼 클릭시 출력되게 처리. 정답여부를 출력되게 하세요</h2>
            <h3>구구단풀기</h3>
            <h2 id="ex2"></h2>
            
            <table id="noTab" width="50%" height="70%">
            	<col width="33%"><col width="33%"><col width="33%">
            	<tr><td style="text-align:right;height:20%;"colspan="3"></td></tr>
	            <tr><td>1</td><td>2</td><td>3</td></tr>
	            <tr><td>4</td><td>5</td><td>6</td></tr>
	            <tr><td>7</td><td>8</td><td>9</td></tr>
	            <tr><td colspan="3"><input type="button" value="정답확인" /></td></tr>
            </table>
            
            <script>
            	var num01 = Math.floor(Math.random()*101+1)
            	var num02 = Math.floor(Math.random()*101+1)
            	var ex2 = document.querySelector("#ex2")
            	ex2.innerHTML = num01+" X "+num02+" = "
            	var answer = num01*num02
            	
               	var gugudan =document.querySelectorAll("#noTab td")
            	for(var idx=0;idx<gugudan.length;idx++){
            		gugudan[idx].onclick=function(){
            			gugudan[0].innerText += this.innerText
            		},gugudan[10].onclick=function(){
            			if(answer==gugudan[0].innerText){
            	   			alert("정답 입니다")
               			}else{
               				alert("정답이 아닙니다!")
               			}
            		}
            	}
            </script>
            <h3>정답</h3>
            <%--
            1) 화면구현
            	- 문제출력 h2, ?(정답입력 출력내용 span)
            	- 테이블 구현
            	
            2) DOM 객체 선언 및 임의의 문제 출력
            	var gugu = document.querySelector("h2")
            	var inNum = document.querySelector("span")
            	var td = document.querySelector("#tab01 td")
            	
            	var grade = Math.floor(Math.random()*8+2) 
            	var cnt = Math.floor(Math.random()*9+1) 
            	var corNum = grade*cnt
            	gugu.innerText = grade + " X " + cnt
            	
            3) 이벤트 처리(익명)
				- 클릭 시, ?에 입력한 숫자 출력
				- 정답여부 클릭 시, 입력한 숫자와 정답인지 확인
				- 다음 문제  
				
             --%>
            
	<h2>
		[1단계:확인]* 4. 4X4 테이블을 1~16까지 출력하고, 가장 밑라인 클래스로 cls01은 배경색상을 노랑색 ,  
		왼쪽라인 클래스로 cls02 글자색상을 파랑색,  왼쪽라인 클래스로 cls03 빙고라고 표시, 
		위쪽 라인은 클래스로 cls04 처리하고 글자를 오른쪽 정렬 처리 처리되게 하세요.</h2>
		
		<table>
		<tr><td class="cls02 cls03 cls04">1</td><td class="cls04">2</td><td class="cls04">3</td><td class="cls04">4</td></tr>
		<tr><td class="cls02 cls03">5</td><td>6</td><td>7</td><td>8</td></tr>
		<tr><td class="cls02 cls03">9</td><td>10</td><td>11</td><td>12</td></tr>
		<tr><td class="cls01 cls02 cls03">13</td><td class="cls01">14</td><td class="cls01">15</td><td class="cls01">16</td></tr>
		</table>
		<script>
			var cls01 = document.querySelectorAll(".cls01")
			cls01[0].style.background="yellow"
			cls01[1].style.background="yellow"
			cls01[2].style.background="yellow"
			cls01[3].style.background="yellow"
			
			var cls02 = document.querySelectorAll(".cls02")
			cls02[0].style.color="blue"
			cls02[1].style.color="blue"
			cls02[2].style.color="blue"
			cls02[3].style.color="blue"
			
			var cls03 = document.querySelectorAll(".cls03")
			cls03[0].innerText="빙고"
			cls03[1].innerText="빙고"
			cls03[2].innerText="빙고"
			cls03[3].innerText="빙고"
			
			var cls04 = document.querySelectorAll(".cls04")
			cls04[0].style.textAlign="right"
			cls04[1].style.textAlign="right"
			cls04[2].style.textAlign="right"
			cls04[3].style.textAlign="right"
		</script>
	
	<h2>[1단계:확인]* 7. 5X5 테이블을 임의의 25개 숫자(0~100)로 출력하고, 이 중 짝수 열의 글자색상을 파랑색으로 출력하세요.</h2>
	<h3 id="ex7"></h3>
	<script>
		var ex7 = document.querySelector("#ex7")
		var show="<table id='ex7tab'>"
		for(var row=0;row<5;row++){
			show+="<tr>"
			for(var col=0;col<5;col++){
				var num = Math.floor(Math.random()*101)
				show+="<td>"+num+"</td>"
			}
			show+="</tr>"
		}
		show+="</table>"
		document.querySelector("#ex7").innerHTML=show
		
		var evenRow=document.querySelectorAll("#ex7tab td")
		for(var idx=0;idx<25;idx++){
				if(idx%5==1 || idx%5==3){ 
					evenRow[idx].style.color="blue"
				}
		}
	</script>

</body>
<script type="text/javascript">

</script>
</html>