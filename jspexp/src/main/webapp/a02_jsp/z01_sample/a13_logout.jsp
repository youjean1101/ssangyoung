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
	<%
	// 특정한 session 삭제
	session.removeAttribute("sesMem");
	// 쿠키 삭제 1.
	/* Cookie[] cookie = request.getCookie();
	if(cookies!=null){
		for()
	} */
	// 쿠키 삭제 2.
	Cookie c1 = new Cookie("id",""); Cookie c2 = new Cookie("passwd","");
	c1.setMaxAge(0); c2.setMaxAge(0); c1.setPath("/"); c2.setPath("/");
	response.addCookie(c1); response.addCookie(c2); 
	%>
	<script>
		alert("로그아웃")
		location.href="a10_loginAuto.jsp"
	</script>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>