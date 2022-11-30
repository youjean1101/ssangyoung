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
<h1>page와 request 범위 확인(request에서 forward 처리시, )</h1>
<table>
	<tr><th>(페이지범위)이름</th><td><%=pageContext.getAttribute("name") %></td></tr>
	<tr><th>(요청범위)나이</th><td><%=request.getAttribute("age") %></td></tr>
</table>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>