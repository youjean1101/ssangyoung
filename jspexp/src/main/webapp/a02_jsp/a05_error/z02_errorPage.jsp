<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    isErrorPage="true"
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
<style>
	h2{color:navy;}
</style>
</head>
<body style="background-image:url('photo.jpg')">
	
	<%if(exception!=null){ %>
	<h2>에러가 발생했습니다.</h2>
	<h2><%=exception.getClass().getName() %></h2>
	<h2><%=exception.getMessage() %></h2>
	<%} else{ %>
		<h2>테스트용(예외처리화면)</h2>
	<%} %>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>