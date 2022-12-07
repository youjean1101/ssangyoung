<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"    
    import="jspexp.a13_database.*"    
    import="jspexp.a13_database.vo.*"     
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*
 
 */
</script>
</head>
<body>
<%
	String proc = request.getParameter("proc");
	String[] cidx = request.getParameterValues("cidx");
	String[] ckey = request.getParameterValues("ckey");
	String[] cval = request.getParameterValues("cval");
	if(proc!=null){
		for(String cidxS:cidx){
			int idx = Integer.parseInt(cidxS);
			String key = ckey[idx];
			String val = cval[idx];
			// 쿠키를 만들어서 
			Cookie c = new Cookie(key,val);
			if(proc.equals("del")){
				c.setMaxAge(0);
			}
			response.addCookie(c);			
		}
	}
	response.sendRedirect("a10_CookieList.jsp");

%>
<%--
# 

 --%>


</body>
<script>
/*

 */
</script>
</html>