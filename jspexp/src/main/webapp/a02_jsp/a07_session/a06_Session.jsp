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
<%
	String sess = request.getParameter("sess");
	if(sess!=null){
		if(sess.equals("y")){
			session.setAttribute("sess01","hi! session");
		}
		if(sess.equals("n")){
			//session.invalidate(); 전체세션 종료 처리
			session.removeAttribute("sess01");
			// 특정한 세션 종료 처리
		}
		response.sendRedirect("a05_stopSession.jsp");
	}
%>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>