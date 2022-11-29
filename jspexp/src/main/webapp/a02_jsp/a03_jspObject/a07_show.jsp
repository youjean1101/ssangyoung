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
a07_show.jsp
	판매물품명 : @@@
	장바구니리스트 : @@@
	출력 확인하세요.

--%>
	<h2>판매물품명: <%=pageContext.getAttribute("busket") %></h2>
	<h2>장바구니담기: <%=application.getAttribute("pname") %></h2>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>