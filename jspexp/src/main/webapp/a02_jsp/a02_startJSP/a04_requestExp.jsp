<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
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
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>

<%--
 	ex) a04_requestExp.jsp?pname01=사과&pname02=오렌지&pname03=수박
 	을 처리하여, request.getParameterNames()로 가져와서 테이블로 출력되게 하세요.
 	 --%>
 	 
 	<form>
 	과일1:<input type="text" name="pname01" value="사과">
 	과일2:<input type="text" name="pname02" value="오렌지">
 	과일3:<input type="text" name="pname03" value="수박">
 	<input type="submit" value="등록">
 	</form>
 	<table>
 	<%
 	// 요청값이 가변적일 때, 처리되는 객체로 요청 키들을 가지고 온다.
 	Enumeration e = request.getParameterNames();
 	while(e.hasMoreElements()){ 
 		String key = (String)e.nextElement();
 	%>
 		<tr><th><%=key %></th><td><%=request.getParameter(key)%></td></tr>
 	<%} %>
	</table>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>