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
# 처리순서
1. 기본화면 구성
	1) 검색 form
		<input type="text" name="dname" value="${sch.dname}"
	2) 데이터 리스트 테이블
		 <table><tr><th>부서번호</th>
				<tr><td>10</td>
2. 처리할 useBean 선언
	1) dao : dao 자바단 확인
		<jsp:useBean id="dao" class="@@@.@@@.XXXDao"
	2) 검색 요청값 vo
		<jsp:useBean id="sch" class="XXX.XXX.Dept"
		<jsp:setProperty property="*" name="dept"/> 요청값 처리
3. 요청값에 대한 default설정 null ==> ""
		<c:if test="${empty param.dname}"> ${sch.setDname("")}
4. 반복문 jstl, el통해서 데이터 출력 처리
	<c:forEach var="dept" items="${dao.getDeptList(sch)}
		${dept.deptno} ${dept.dname} ${dept.loc}
--%>
<jsp:useBean id="dao" class="jspexp.a13_database.A06_PareparedDao"/>
<jsp:useBean id="sch" class="jspexp.vo.Dept"/>
<jsp:setProperty property="*" name="sch"/>
<c:if test="${empty param.dname}">${sch.setDname("")}</c:if>
<c:if test="${empty param.loc}">${sch.setLoc("")} </c:if>
<h2>부서정보 검색</h2>
<form method="post">
	<table>
		<tr><th>부서명:</th><td><input type="text" name="dname" value="${sch.dname}"/></td></tr>
		<tr><th>부서위치:</th><td><input type="text" name="loc" value="${sch.loc}"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="부서검색" /></td></tr>
	</table>
</form>
<table>
	<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
	<c:forEach var="dept" items="${dao.getDeptList(sch)}">
	<tr><td>${dept.deptno}</td><td>${dept.dname}</td><td>${dept.loc}</td></tr>
	</c:forEach>
</table>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>