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
# 쿠키의 삭제
1. 해당 쿠키를 equals 조건을 처리한 후,
2. setMaxAge(0)으로 설정하여,
3. 반응객체(response)로 할당 처리한다.
--%>
<%
	Cookie cks[] = request.getCookies();
	for(Cookie c:cks){
		if(c.getName().equals("cnt")){
			c.setMaxAge(0); // 쿠키의 생존 주기를 0으로 설정
			response.addCookie(c);
		}
	}
%>
	<h2>쿠키값 삭제</h2>
	<a href="a05_CookieList.jsp">쿠키값 확인</a>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>