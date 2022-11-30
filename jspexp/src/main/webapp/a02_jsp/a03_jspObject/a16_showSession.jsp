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


--%>
<table>
<tr><th>물건명(page)</th><td><%=pageContext.getAttribute("name") %></td></tr>
<tr><th>가격(request)</th><td><%=request.getAttribute("price") %></td></tr>
<tr><th>갯수(session)</th><td><%=session.getAttribute("cnt") %></td></tr>
<tr><th>구매처(application)</th><td><%=application.getAttribute("bloc") %></td></tr>
</table>
<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>