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
<% %>
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
<%
	//정답
	String id = (String)session.getAttribute("id");
%>

<h3><%=session.getAttribute("ID") %>님 로그인되었습니다.</h3>
<!-- <h3><%=id %>님 로그인되었습니다.</h3> -->

<div id="container" ></div>


</body>
<script type="text/javascript">
	var id = "<%=id%>"
	alert(id+"님 로그인 성공")

var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>