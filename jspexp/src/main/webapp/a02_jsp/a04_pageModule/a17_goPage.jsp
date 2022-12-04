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
	<h1>forward된 페이지</h1>
	<h2>페이지: <%=pageContext.getAttribute("pag_name")%></h2>
	<h2>요청: <%=request.getAttribute("req_name")%></h2>
</body>
<script type="text/javascript">

</script>
</html>