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
	h2{
	color:red;
	}
</style>

</head>
<body style="background-repeat:no-repeat; background-image:url('/a00_img/500_img.jpg') ">
	<h2 align="center">500 에러입니다.</h2>
	<h2 align="center"><%=exception.getClass().getName() %></h2>
	<h2 align="center"><%=exception.getMessage() %></h2>


</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>