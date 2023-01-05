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


--%>
	<h2>쿠키값 보기</h2>
<%
	// a02_showCookie.jsp
	// 로딩되는 순간, client(브라우저)에서 저장된 쿠키정보를
	// 서버에서 확인하기 위해서
	Cookie []cookies = request.getCookies();
	for(Cookie c:cookies){
		if(!c.getName().equals("JSESSIONID")){ // JSESSIONID : 쿠키 default값
			out.print("<h2>"+c.getName()+":"+c.getValue()+"</h2>");
		}
	}
%>
<%-- JSESSIONID는 쿠키의 default값 설정으로 기본 값이 설정되어 있다. --%>
	
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>