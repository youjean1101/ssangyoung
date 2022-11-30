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
<%
// page 범위, request 범위를 저장하고
pageContext.setAttribute("name", "홍길동");
request.setAttribute("age", 28);
// 화면에 오자마자 forward 처리..
request.getRequestDispatcher("a14_showSessionView.jsp").forward(request,response);
%>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>