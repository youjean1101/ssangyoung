<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
# forEach
1. 특정한 횟수 반복
	<c:forEach var="cnt" begin="시작번호" end="마지막번호" step="증감단위" />
		반복한 내용
2. 집합이나 콜렉션 데이터 사용
	<c:forEach var="변수" item="배열/객체형배열" varStatus="sts"
		${단위데이터변수}
		${참조명.property} ex) ${emp.empno}
		${sts.index}	0부터 카운트
		${sts.count}	1부터 카운트
		${sts.first}	첫번째 데이터일 때, boolean true
		${sts.last}		마지막 데이터일 때, boolean true
--%>
<c:forEach var="cnt" begin="1" end="10">
	<h2>${cnt}번째 안녕하세요!</h2>
</c:forEach>

<%
	List<String> list = Arrays.asList(new String[]{"사과","바나나","딸기"});
	request.setAttribute("fruits",list);
%>
<c:forEach var="fruit" items="${fruits}" varStatus="sts">
	<h3 style="background:${sts.first or sts.last?'pink':''}">
		${sts.index} = ${sts.count} - ${fruit}
	</h3>
</c:forEach>
<%--ex) 특정횟수 반복 1~9번호와 함께하는 테이블 생성 --%>
	<table>
		<c:forEach var="cnt" begin="1" end="9">
			<c:if test="${cnt%3==1}"><tr></c:if>
			<td>${cnt}</td>
			<c:if test="${cnt%3==0}"></tr></c:if>
		</c:forEach>
	</table>
<%--ex) 과일가게 판매물품 배열로 9개 선언하고 3X3 테이블로 출력처리(2번째 forEach로) --%>
	<%
		request.setAttribute("fruits",new String[]{"사과","바나나","딸기","복숭아","자두","멜론","수박","감","감귤"});
	 %>
	 <table>
	 <c:forEach var="fruit" items="${fruits}" varStatus="sts">
			<c:if test="${sts.count%3==1}"><tr></c:if>
			<td>${fruit} [${sts.index}]</td>
			<c:if test="${sts.count%3==0}"></tr></c:if>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>