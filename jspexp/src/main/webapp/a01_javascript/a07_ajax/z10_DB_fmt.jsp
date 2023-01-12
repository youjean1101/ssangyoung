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
<%-- 
 # DB연동하여 출력된 데이터 확읹하기
--%>
<jsp:useBean id="dao" class="springweb.a13_database.A02_EmpDao"/>
<jsp:useBean id="sch" class="jspexp.vo.Emp"/>
<jsp:setProperty property="*" name="sch"/>
<%--검색시, 요청값 default 처리 --%>
<c:if test="${empty param.ename}">${sch.setEname("")}</c:if>
<c:if test="${empty param.job}">${sch.setJob("")}</c:if>
<c:if test="${empty param.toSal}">${sch.setToSal(9999)}</c:if>
<table>
	<tr><th>사원번호</th><th>사원명</th><th>직책명</th><th>관리자번호</th>
		<th>입사일</th><th>급여</th><th>부서번호</th></tr>
	<c:forEach var="emp" items="${dao.getEmpSch(sch)}">
	<tr><td>${emp.empno}</td><td>${emp.ename}</td><td>${emp.job}</td><td>${emp.mgr}</td>
		<td><fmt:formatDate type="both" value="${emp.hiredate}" /></td>
		<td><fmt:formatNumber value="${emp.sal}" /></td>
		<td>${emp.deptno}</td></tr>
	</c:forEach>
</table>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>