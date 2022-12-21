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
	<h2>로그인아이디:${mem.id}</h2>
	<h2>이름:${mem.name}</h2>
	<h2>권한:${mem.auth}</h2>

</body>
<script type="text/javascript">
	var id = "${mem.id}"
		if(id==""){
			alert("로그인을 하셔야 합니다.\n로그인페이지이동")
			location.href="a01_login.jsp"
		}
	
</script>
</html>