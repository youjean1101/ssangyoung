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
<%-- 
ex) a12_main.jsp 
//		16강 확정팀 [	] [1번] [2번] [3번] 번호대로 해당 팀이 할당되게 하세요.(frame에 할당처리)
//		frame1 팀1 - 팀2		a13_sub.jsp
//		frame2 팀1 - 팀2		a14_sub.jsp
//		frame3 팀1 - 팀2		a15_sub.jsp
--%>

	<style>iframe{border:1px solid blue;width:30%;height:30%;}</style>
	
	<h2>카타르 월드컵</h2>
	16강 확정팀:<input type="text" name="team"/>
	<input type="button" value="16강 1번째 그룹 할당" onclick="alloc(0)"/>
	<input type="button" value="16강 2번째 그룹 할당" onclick="alloc(1)"/><br>
	<input type="button" value="16강 3번째 그룹 할당" onclick="alloc(2)"/><br>
	
	<iframe name="group01" src="a13_sub.jsp"></iframe>
	<iframe name="group02" src="a14_sub.jsp"></iframe>
	<iframe name="group03" src="a15_sub.jsp"></iframe>

<div id="container" ></div>
</body>
<script type="text/javascript">

	function alloc(idx){
		var teamVal = document.querySelector("[name=team]").value
		if(idx==0) group01.document.querySelector("h3").innerHTML+=teamVal+", "
		if(idx==1) group02.document.querySelector("h3").innerHTML+=teamVal+", "
		if(idx==2) group03.document.querySelector("h3").innerHTML+=teamVal+", "
	}
</script>
</html>