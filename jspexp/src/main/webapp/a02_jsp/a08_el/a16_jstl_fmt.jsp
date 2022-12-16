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
# fmt유형 jstl
1. 데이터 유형을 변경하거나, 원하는 데이터를 처리할 때, 주로 활용한다.
2. 날짜 처리(java.util.Date)
	1) 날짜 + 시간
	2) 기본형식
		<fmt:formatDate type="date|time|both"
			dataStyle="full|short"
			timeStyle="full|short"
			pattern="yyyy/MM/dd kk:mm:ss.S"
			value="선언된 날짜형 데이터" />
	
3. 숫자 처리
	1) 숫자를 통화나 소숫점이하 처리, 지정된 형식으로 처리할 때 활용된다.
	2) type의 속성\
		currency : 통화단위
		percent : %처리
	3) pattern : 00,000,000.000 등과 같이 특정한 출력 형식을 처리할 수 있다.

--%>
<%
	request.setAttribute("now",new Date()); // 오늘 날짜 객체 생성
	request.setAttribute("num01", 798999.75); // 숫자데이터 설정
%>
<h2>날짜 format형식</h2>
<table>
	<col width="30%">
	<tr><th>날짜(기본형식)</th><td><fmt:formatDate value="${now}"/></td></tr>
	<tr><th>날짜(full)</th><td><fmt:formatDate value="${now}" type="date" dateStyle="full" /></td></tr>
	<tr><th>날짜(short)</th><td><fmt:formatDate value="${now}" type="date" dateStyle="short" /></td></tr>
	<tr><th>시간(full)</th><td><fmt:formatDate value="${now}" type="time" timeStyle="full" /></td></tr>
	<tr><th>시간(short)</th><td><fmt:formatDate value="${now}" type="time" timeStyle="short" /></td></tr>
	<tr><th>날짜 + 시간</th><td><fmt:formatDate value="${now}" type="both" /></td></tr>
	<tr><th>패턴형식</th><td><fmt:formatDate value="${now}" pattern="yyyy/MM/dd kk:mm:ss.S" /></td></tr>
</table>
<h2>숫자 format형식</h2>
<table>
	<col width="30%">
	<tr><th>기본형식</th><td><fmt:formatNumber value="${num01}"/></td></tr>
	<tr><th>통화표기</th><td><fmt:formatNumber currencySymbol="원" value="${num01}"/></td></tr>
	<tr><th>숫자패턴</th><td><fmt:formatNumber pattern="00,000,000,000" value="${num01}"/></td></tr>
</table>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>