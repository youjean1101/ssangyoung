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
# 모든 브라우저를 닫고 주소만 복사하거나,
다른 브라우저를 열고 주소만 복사하면
pageContext는 출력되지 않지만 application는 출력된다.
==> application 범위 : 서버가 재기동하지 않는 이상 유지됨

--%>
<h2><%=application.getAttribute("name01") %></h2>
<h2><%=pageContext.getAttribute("name02") %></h2>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>