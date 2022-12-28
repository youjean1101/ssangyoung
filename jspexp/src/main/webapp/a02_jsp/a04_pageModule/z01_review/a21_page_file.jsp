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
<h2>메인화면</h2>
<%-- 
a22_sub.jsp
/ 공통화면과 공통 변수 선언
String name="홍길동";
int age=25;
String loc="서울강남";
%>
<h2>공통 화면내용입니다. ^^</h2>
--%>
<%@ include file="a22_sub.jsp" %>
<%--
1. 활용 예제
	1) 공통적인 jsp(java)단 처리할 변수와 함께 처리되는 js, css가 
		있을 때, 이러한 형태로 처리해주어 include file로 선언하는 것을 효율적
		ex) 세션처리, 권한처리, 유효성처리
 --%>
<h2>이름:<%=name %></h2>
<h2>나이:<%=age %></h2>
<h2>사는곳:<%=loc %></h2>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>