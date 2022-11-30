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
		<h3>아이디(page): <%=pageContext.getAttribute("ID") %></h3>
		<h3>이름(request): <%=request.getAttribute("NAME") %></h3>
		<h3>포인트(session): <%=session.getAttribute("POINT") %></h3>
		<h3>권한(application): <%=application.getAttribute("AUTH") %></h3>
<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>