<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

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
<%-- 
# js로 프레임 controller
1. a href로 특정 한 프레임의 내용 변경 및 호출
2. 각 프레임간의 데이터 전송
	1) 클라이언트단의 BOM객체와 DOM 객체간의 접근 방법
		window나 frame은 BOM(브라우저 모델)은 DOM의 상위 객체이다.
	2) 각 객체의 접근 방법
		BOM객체명.document.querySelector("해당 DOM의 하위 객체")
		형식으로 접근이 가능하다.
	3) 하위 BOM객체에서 상위 객체의 DOM 접근 처리
		parent.document.querySelector("해당 DOM객체 요소")
--%>

<script>
	var win = ""
	function call01(){
		var fm01H2Ob = frame01.document.querySelector("h2")
		fm01H2Ob.innerText="frame01의 내용 변경"
		fm01H2Ob.style.background="yellow"
	}
	// ex) 버튼을 추가하여 프레임2를 접근해서 타이틀을 변경하고 글자색도 변경하는 이벤트 핸들러 call02를
	//		구현하여 처리하세요.
	function call02(){
		var fm02H2Ob = frame02.document.querySelector("h2")
		fm02H2Ob.innerText="frame02의 내용 변경"
		fm02H2Ob.style.color="blue"
	}
	function call03(){
		win = window.open("a06_sub.jsp","","width=300pt, height=300pt")
		// <h2>윈도우 창 로딩</h2>
	}
	function call04(){
		var winH2Ob = win.document.querySelector("h2")
		winH2Ob.style.background="orange"
	}
	function sendFrame(pname){
		var fm02H2Ob = frame02.document.querySelector("h2")
		fm02H2Ob.innerText = "전송된 물건명:" +pname
	 }
	 function sendFrameDp(dname){
			var fm02H2Ob = frame02.document.querySelector("h2")
			fm02H2Ob.innerText = "전송된 부서:" +dname
		 }
	
</script>
<h2>최상위 </h2>
<a href="a04_sub03.jsp" target="frame01">프레임1의 페이지 변경</a><br>
<%--<h2>프레임3</h2> --%>
<a href="a05_sub04.jsp" target="frame02">프레임2의 페이지 변경</a><br>
<a href="javascript:call03()" >윈도우 객체 로딩</a><br>
<%--<h2>프레임4</h2> --%>
<button type="button" onclick="call01()">프레임1 접근해서 타이틀 변경</button><br>
<button type="button" onclick="call02()">프레임2 접근해서 타이틀 변경</button><br>
<button type="button" onclick="call04()">윈도우 변경</button>
<iframe src="a02_sub01.jsp" name="frame01" width="100%" height="200pt"></iframe>
<%--<h2>프레임1</h2> --%>
<iframe src="a03_sub02.jsp" name="frame02" width="100%" height="400pt"></iframe>
<%--<h2>프레임2</h2> --%>
<%
//

%>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>