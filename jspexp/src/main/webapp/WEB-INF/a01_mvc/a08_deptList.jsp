<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

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
	<form method="post">
		부서명:<input type="text" name="dname" value="${param.dname}"/><br>
		지역:<input type="text" name="loc" value="${param.loc}"/>
		<input type="submit" value="검색" /><br>
	</form>
	<table>
	<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
	<c:forEach var="dept" items="${deptList}">
		<tr><td>${dept.deptno}</td><td>${dept.dname}</td><td>${dept.loc}</td></tr>
	</c:forEach>
	</table>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>