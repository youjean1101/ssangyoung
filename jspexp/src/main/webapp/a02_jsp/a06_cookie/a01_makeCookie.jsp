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
 # 쿠키 만들기

--%>
<%
	// 1. 쿠키만들기
	Cookie  c1 = new Cookie("c01","himan");
	// 2. 쿠키 클라이언트에 보내기
	response.addCookie(c1);
%>
	<h2>쿠키 생성 완료!!</h2>
	<a href="a02_showCookie.jsp">만든 쿠키 확인하러가기</a>
<%-- JSESSIONID는 쿠키의 default
ex) a03_makeCookie.jsp price 3000 쿠키값 추가
	a04_showCookie.jsp 생성된 쿠키값 확인
 --%>
 
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>