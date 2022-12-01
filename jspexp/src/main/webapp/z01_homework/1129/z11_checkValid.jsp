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
	String id = request.getParameter("ID"); 
	if(id.equals("himan")){
		session.setAttribute("ID",id);
		response.sendRedirect("z11_main.jsp");
	}else{
		request.setAttribute("ID", id);
		request.getRequestDispatcher("z01_login.jsp").forward(request,response);
	}
%>
<%-- 
String id = request.getParameter("ID"); 
String pass = request.getParameter("pass");
if(id.equals("himan") && pass.equals("7777")){
	session.setAttribute("ID",id);
	response.sendRedirect("z11_main.jsp");
}else{
	//request.setAttribute()로 처리해도 되지만,
	//request.sendParameter("id")로 처리가 되기에 생략 가능
	//request.setAttribute("ID", id);
	request.getRequestDispatcher("z01_login.jsp").forward(request,response);
}
--%>

<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>