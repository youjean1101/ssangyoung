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
<%-- WEN-INF 하위에 있는 jsp는 url로 접근할 수 없다. controller만 접근 가능.. --%>
<body>
	<h2>사원정보</h2>
	<form method="post">
		사원명:<input type="text" name="ename" value="${sch.ename}" />
		직책:<input type="text" name="job" value="${sch.job}" />
		급여(시작):<input type="text" name="frSal" value="${sch.frSal}" />
		급여(마지막):<input type="text" name="toSal" value="${empty sch.toSal?'9999':param.toSal}" />
			<input type="submit" value="검색"/><br>
	</form>
	<table>
		<tr><th>사원번호</th><th>사원명</th><th>직챙명</th>
			<th>관리자번호</th><th>입사일</th><th>급여</th>
			<th>보너스</th><th>부서번호</th></tr>
		<c:forEach var="emp" items="${empList}">
		<tr>
			<td>${emp.empno}</td><td>${emp.ename}</td>
			<td>${emp.job}</td><td>${emp.mgr}</td>
			<td><fmt:formatDate value="${emp.hiredate}"/></td>
			<td><fmt:formatNumber value="${emp.sal}"/></td>
			<td><fmt:formatNumber value="${emp.comm}"/></td>
			<td>${emp.deptno}</td>
		</tr>
		</c:forEach>
	</table>
	
	
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>