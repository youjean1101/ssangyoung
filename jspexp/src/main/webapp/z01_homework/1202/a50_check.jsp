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

</script>

</head>
<body>
	<%= request.getAttribute("pname") %>
	<%if(request.getAttribute("pname").equals("사과")){ 
		//재고없음
	%>
    	<jsp:forward page="a54_main.jsp"/> 
   
    <%	}else{
    	// 재고있음
    %>
		<jsp:forward page="a53_main.jsp"/>
    <%
    	}
    %>
 
</body>
<script type="text/javascript">

</script>
</html>