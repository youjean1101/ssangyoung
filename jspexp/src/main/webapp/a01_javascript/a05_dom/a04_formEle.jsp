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
 # form 객체의 내용을 통한 js 요소 객체 처리
 1. form 하위 요소 객체의 특정
 	1) 선택자 : name, id
 		document.querySelector("[name=속성값]")
 		var dom01 = document.querySelector("#아이디명")
 	2) 속성값 변경 : value를 통해서 처리..
 		dom01.value
 		dom01.value = "할당처리"
 		
*/
</script>

</head>
<body>
<%-- 


--%>
	<input type="text" name="num01" />
	<input type="text" name="num02" value="0"/>
	<input type="button" value="합산" onclick="cal()" />
	<p id="show"></p>

	<h2>학생성적 등록</h2>
	<!-- 이름:<input type="text" name="name"/>
	<input type="button" value="등록" onclick="addRec()"/> -->
	
	<form>
		학생명 : <input type="text" name="name" />
		국어 : <input type="text" name="kor" />
		영어 : <input type="text" name="eng" />
		수학 : <input type="text" name="math" />
		<input type="button" value="등록" onclick="addRec()"/>
	</form>
	
	<table id="recTab">
		<thead>
			<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
</body>
<script type="text/javascript">
	var num01Obj = document.querySelector("[name=num01]")
	var num02Obj = document.querySelector("[name=num02]")
	var pObj = document.querySelector("#show")
	num01Obj.value=Math.floor(Math.random()*8+2)
	function cal(){
		// 이벤트 시점에서 값을 가져오는 내용이 있을 때가 많으므로, 
		// DOM객체는 객체로만 선언하고, 이벤트 처리시에 value으로 입력된
		// 데이터를 가져올 수 있도록 한다.
		var num01 = Number(num01Obj.value);
		var num02 = Number(num02Obj.value);
		var sum = num01+num02;
		pObj.innerText = num01+" + "+num02 + " = "+sum
	}
	// ex) 학생 성적 등록 학생명, 국어, 영어, 수학 점수를 form요소객체로 입력하게 하고, 등록버튼을 클릭 시, 하단에 table에 추가 등록되게
	//	하세요.
		var nameObj = document.querySelector("[name=name]");
		var korObj = document.querySelector("[name=kor]");
		var engObj = document.querySelector("[name=eng]");
		var mathObj = document.querySelector("[name=math]");
		var recObj = document.querySelector("#recTab tbody");
		var show = ""
		function addRec(){
			var nKor = Number(korObj.value);
			var nEng = Number(engObj.value);
			var nMath = Number(mathObj.value);
			var sum = nKor+nEng+nMath;
			var avg = sum/3;
			
			show +="<tr>"
			show +="<td>"+nameObj.value+"</td><td>"+nKor+"</td><td>"+nEng+"</td><td>"+nMath+"</td><td>"+sum+"</td><td>"+avg+"</td>"
			show +="</tr>"
			recObj.innerHTML = show
			nameObj.value=""; nameObj.focus()
			korObj.value=""; 
			engObj.value=""; 
			mathObj.value="";
		}
	
</script>
</html>