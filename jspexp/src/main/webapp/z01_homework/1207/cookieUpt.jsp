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
	<%
	Cookie []cookies = request.getCookies();
		for(Cookie c:cookies){
			if(!c.getName().equals("JSESSIONID")){
				out.print("<h2>"+c.getName()+":"+c.getValue()+"</h2>");
				
				if(c.getName().equals("coffee")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}
	%>
	<a href="cookieDel.jsp">아무래도 쿠키만 먹어야겟다./</a>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>