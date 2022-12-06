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
 # 동적인 화면구성
 1. 컨테이너형 요소객체(body, div, p) 등, 
 	계층형 요소객체(table, ul/ol)은 동적인 화면을 구성할 수 있다.
 2. 기본 데이터에 .innerHTML을 통해 화면등을 만들면서 처리하는 것을 말한다.
 3. innerHTML와 innerText의 차이
 	1) 화면에 html 태그를 랜더링 여부에 따라 차이가 난다.
*/
</script>

</head>
<body>
	<p>
		<h2>안녕하세요.</h2>
	</p>
	<div id="show"></div>
	
</body>
<script type="text/javascript">
	var pObj = document.querySelector("p")
	console.log("innerHTML(가져오기):"+pObj.innerHTML)
	console.log("innerText(가져오기):"+pObj.innerText)
	//pObj.innerHTML+="<h2>추가 변경되었습니다1</h2>"
	//pObj.innerText+="<h2>추가 변경되었습니다2</h2>"
	for(var cnt=1;cnt<=5;cnt++){
		pObj.innerHTML+="<h2>"+cnt+"번째 동적인 html 처리</h2>"
	}
	
	var show = document.querySelector("#show")
	// ex) show 컨테이너에 table을 넣고 1X3으로 카운트1~3을 출력하세요.
	show.innerHTML ="<table><tr>"
	for(var idx=1;idx<=3;idx++){
		show.innerHTML +="<td>"+idx+"</td>"
	}
	show.innerHTML +="</tr></table>"
</script>
</html>