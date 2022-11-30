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
//1. page 범위 설정
pageContext.setAttribute("page01", "페이지범위 데이터(page scope)");
//2. request 범위 설정
request.setAttribute("request02", "request범위 데이터(request scope)");
//3. session 범위 설정
session.setAttribute("session03","session 범위 데이터(session scope)");
//4. application 범위 설정
application.setAttribute("application04", "application 범위 데이터(application scope)");
//request 테스트를 위한 처리
// request의 forward는 현재 설정을 처리하는 request, response를 가지고, 해당 페이지로 이동하는 것이다.
// 그래서, page 범위에 있는 데이터는 사라지지만 request범위 이상의 데이터를 가지고 있다.
request.getRequestDispatcher("a10_showScopePage.jsp").forward(request,response);
%>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>