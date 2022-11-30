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
	<tr><th>페이지 범위 데이터</th><td><%=pageContext.getAttribute("page01") %></td></tr>
	<tr><th>요청 범위 데이터</th><td><%=request.getAttribute("request02") %></td></tr>
	<tr><th>세션 범위 데이터</th><td><%=session.getAttribute("session03") %></td></tr>
	<tr><th>어플리케이션 범위 데이터</th><td><%=application.getAttribute("application04") %></td></tr>
</table>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>