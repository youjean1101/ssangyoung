<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    isErrorPage = "true"
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
	<h2 align="center">ArrayIndexOutBounds 예외 발생</h2>
	<h3 align="center">배열의 범위를 확인해주세요.</h3>
	<h3 align="center"><%=exception.getClass().getName() %></h3>
	<h3 align="center"><%=exception.getMessage() %></h3>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>