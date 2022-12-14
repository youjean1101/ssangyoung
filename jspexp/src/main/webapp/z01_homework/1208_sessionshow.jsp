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
	 Emp e = (Emp)session.getAttribute("emp"); 
	 boolean hasSess = e!=null; // null이아니면 true
	 if(hasSess){
	 %>
	 <h2>세션값확인</h2>
	 
	 <h3>이름:<%=e.getEname()%></h3>
	 <h3>연봉:<%=e.getSal()%></h3>
	 <h3>부서번호:<%=e.getDeptno()%></h3>
	 <%} %>
		
	<table>
		<tr><th>부서번호</th></tr>
		<tr><td onclick="deptno(10)">10</td></tr>
		<tr><td onclick="deptno(20)">20</td></tr>
		<tr><td onclick="deptno(30)">30</td></tr>
		<tr><td onclick="deptno(40)">40</td></tr>
	</table>
</body>
<script type="text/javascript">
	
	
	var hasSess = <%=hasSess%>;
	if(!hasSess){
		alert("세션값이 없습니다. 설정하러 가시겠습니까?")
		location.href="1208.jsp";
	}
	
	function deptno(obj){
		if(<%=e.getDeptno()%>==obj){
			alert("접근가능")
		}else{
			alert("접근불가능")
		}
		
	}

</script>
</html>