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
	String proc = request.getParameter("proc");
	String[] cidx = request.getParameterValues("cidx");
	String[] ckey  = request.getParameterValues("ckey");
	String[] cval  = request.getParameterValues("cval");
	if(proc!=null){
		for(String cidxS:cidx){
			// check box로 선택되어진 key/value
			int idx = Integer.parseInt(cidxS);
			String key = ckey[idx];
			String val = cval[idx];
			if(proc.equals("add")||proc.equals("upt")){
				Cookie c = new Cookie(key,val);
				response.addCookie(c);
			}
			if(proc.equals("del")){
				for(Cookie c:request.getCookies()){
					if(c.getName().equals(key)){
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
		}
	}
	response.sendRedirect("a05_CookieList.jsp");
%>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>