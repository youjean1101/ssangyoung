<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<c:set var="bprod" value="바나나" scope="page" />
<c:set var="bloc" value="제주" scope="request" />
<%--forward 처리할 때는 다른 변수로 설정이 필요하다. --%>
<c:set var="bperson" value="홍길동" scope="session" />
<c:set var="rcnt" value="2000" scope="application" />
<jsp:forward page="a08_session.jsp"/>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>