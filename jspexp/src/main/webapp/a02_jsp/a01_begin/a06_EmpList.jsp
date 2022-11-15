<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*" 
    import="jspexp.a13_database.*"    
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
A02_EmpDao dao = new A02_EmpDao();
%>
<h2>사원정보</h2>
<table>
	<tr>
	<th>사원번호</th><th>사원명</th><th>직책명</th>
	<th>관리자번호</th><th>급여</th><th>부서번호</th>
	</tr>
	<%for(Emp e:dao.getEmpSch(new Emp("","",0,9999))){ %>
	<tr>
	<td><%=e.getEmpno() %></td>
	<td><%=e.getEname() %></td>
	<td><%=e.getJob() %></td>
	<td><%=e.getMgr() %></td>
	<td><%=e.getSal() %></td>
	<td><%=e.getDeptno() %></td>
	</tr>
	<%} %>
</table>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>