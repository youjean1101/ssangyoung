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
            	0~9, 상단에 문제출력 td, 입력한 정답출력 td , 입력 초기화 td(C), 정답확인 td
            	
            2) DOM 객체 선언 및 임의의 문제 출력
            	var gugu = document.querySelector("h2")
            	var inNum = document.querySelector("span")
            	var td = document.querySelector("#tab01 td")
            	var gugu = tds[0]
            	var inNum = tds[1]
            	ranGugu(); // 초기문제
            	var corNum = 0
            	function randGugu(){
	            	var grade = Math.floor(Math.random()*8+2) 
	            	var cnt = Math.floor(Math.random()*9+1) 
	            	var corNum = grade*cnt
	            	gugu.innerText = grade + " X " + cnt
	            }
            	
            3) 이벤트 처리(익명)
				- 클릭 시, ?에 입력한 숫자 출력
				var show = ""
				for(var idx=0;idx<tds.length;idx++){
					tds[idx].onclick=function(){
						if( this.innerText =="정답확인" ){
							// 입력한 내용과 정답여부가 같은지 
							 if(inNum.innerText==corNum){
							 	alert("정답\n다음 문제");
							 	ranGugu();
							 }else{
							 	alert("오답\n다시 풀어보세요.");
							 	inNum.innerText=""
							 }
						}else{
							// 번호를 클릭시, 입력한 내용을 출력하는 곳에 출력 처리
							inNum.innerText += this.innerText
							if( this.innerText =="C" ) inNum.innerText=""
						}
					}
				}
				- 정답여부 클릭 시, 입력한 숫자와 정답인지 확인
				- 다음 문제  
             --%>
			<table id="tab01">
				<col width="33%"><col width="33%"><col width="33%">
				<tr style="height:40px"><td colspan="2">@@X@@</td><td>0</td></tr>
				<tr><td>7</td><td>8</td><td>9</td></tr>
				<tr><td>4</td><td>5</td><td>6</td></tr>
				<tr><td>1</td><td>2</td><td>3</td></tr>
				<tr><td>C</td><td>0</td><td>정답확인</td></tr>
			</table>
			<script>
				//var gugu = document.querySelector("h2")
	        	//var inNum = document.querySelector("span")
	        	var tds = document.querySelectorAll("#tab01 td")
	        	//var gugu = tds[0]
	        	//var inNum = tds[1]
	        	var corNum = 0
	        	ranGugu(); // 초기문제
	        	function ranGugu(){
	            	var grade = Math.floor(Math.random()*8+2) 
	            	var cnt = Math.floor(Math.random()*9+1) 
	            	corNum = grade*cnt
	            	tds[0].innerText = grade + " X " + cnt
	            }
	        	
				for(var idx=0;idx<tds.length;idx++){
					tds[idx].onclick=function(){
						if( this.innerText =="정답확인" ){
							console.log(tds[1].innerText+":"+corNum)
							// 입력한 내용과 정답여부가 같은지 
							 if(tds[1].innerText==corNum){
							 	alert("정답\n다음 문제");
							 	ranGugu();
							 }else{
							 	alert("오답\n다시 풀어보세요.");
							 }
							tds[1].innerText=""
						}else{
							// 번호를 클릭시, 입력한 내용을 출력하는 곳에 출력 처리
							tds[1].innerText += this.innerText
							if( this.innerText =="C" ) inNum.innerText=""
						}
					}
				}
			</script>   
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
	
	<h3>정답</h3>
	<%--
		1)화면구현
			<td class="cls01">
			<td class="cls02 cls03"> : 동일한 요소객체에 클래스가 중첩적으로 적용될 때..
			<td class="cls03">
			<td class="cls04">
		2) DOM 객체 호출
			var tds2 = document.querySelectorAll("#tab02 td")
			var cls01 = document.querySelectorAll(".cls01")
			var cls02 = document.querySelectorAll(".cls02")
			var cls03 = document.querySelectorAll(".cls03")
			var cls04 = document.querySelectorAll(".cls04")
			
			for(var idx=0;idx<cls01.length;idx++){
				tds2[idx].innerText=idx+1+"번째"
			}
			
			for(var idx=0;idx<cls01.length;idx++){
				cls01[idx].style.background="yellow"
			}
			for(var idx=0;idx<cls02.length;idx++){
				cls02[idx].style.color="blue"
			}
			for(var idx=0;idx<cls03.length;idx++){
				cls03[idx].innerText="빙고"
			}
			for(var idx=0;idx<cls04.length;idx++){
				cls04[idx].textAlign="right"
			}
	 --%>	
	 <h2>테이블 DOM 클래스 선택자</h2>
	 <table id="tab02" height="300px">
	 	<col width="25%"><col width="25%"><col width="25%"><col width="25%">
	 	<tr><td class="answer04"></td><td class="answer04"></td><td class="answer04"></td><td class="answer04"></td></tr>
	 	<tr><td class="answer02 answer03"></td><td></td><td></td><td></td></tr>
	 	<tr><td class="answer02 answer03"></td><td></td><td></td><td></td></tr>
	 	<tr><td class="answer01"></td><td class="answer01"></td><td class="answer01"></td><td class="answer01"></td></tr>
	 </table>
	<script>
		var tds2 = document.querySelectorAll("#tab02 td")
		var answer01 = document.querySelectorAll(".answer01")
		var answer02 = document.querySelectorAll(".answer02")
		var answer03 = document.querySelectorAll(".answer03")
		var answer04 = document.querySelectorAll(".answer04")
		
		for(var idx=0;idx<tds2.length;idx++){
			tds2[idx].innerText=idx+1+"번째"
		}
		
		for(var idx=0;idx<answer01.length;idx++){
			answer01[idx].style.background="yellow"
		}
		for(var idx=0;idx<answer02.length;idx++){
			answer02[idx].style.color="blue"
		}
		for(var idx=0;idx<answer03.length;idx++){
			answer03[idx].innerText="빙고"
		}
		for(var idx=0;idx<answer04.length;idx++){
			answer04[idx].style.textAlign="right"
		}
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
	<h3>정답</h3>
	<%--
	1. 화면구현
	2. DOM객체 선택
		var tds3 = document.querySelectorAll("#tab02 td")
		var tdsEven = document.querySelectorAll("#tab02 td:nth-child(2n)")
		for(var idx=0;idx<tds3.length;idx++){
			tds3[idx].innerText = Math.floor(Math.random()*101);
		}
		for(var idx=0;idx<tds3.length;idx++){
			tdsEven[idx].style.color = "blue";
		}
	 --%>
	 <table id="tab03">
	 	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	 	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	 	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	 	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	 	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	 </table>
	 <script>
	 var tds3 = document.querySelectorAll("#tab03 td")
	 var tdsEven = document.querySelectorAll("#tab03 td:nth-child(2n)")
	 for(var idx=0;idx<tds3.length;idx++){
		 tds3[idx].innerText = Math.floor(Math.random()*101);
	 }
	 for(var idx=0;idx<tdsEven.length;idx++){
		 tdsEven[idx].style.color = "blue";
	 }
	 </script>
</body>
<script type="text/javascript">

</script>
</html>