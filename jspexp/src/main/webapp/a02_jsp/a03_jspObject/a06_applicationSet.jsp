<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
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
a06_applicationSet.jsp
	판매물품명 : @@@ (page범위)
	장바구니담기 : @@@(application 범위)
	장바구니 확인 ==> 클릭

--%>
<%-- 범위별로 session scope로 데이터 설정 --%>
	<!-- <form action="a07_show.jsp">
	판매물품명 : <input type="text" name="pname(page)">
	장바구니 담기 : <input type="text" name="pname(application)">
	<input type="submit" value="장바구니 확인">
	</form> -->
	<%
	pageContext.setAttribute("busket", "사과(page)");
	application.setAttribute("pname", "사과(application)");
	%>
	<h2>판매물품명: <%=pageContext.getAttribute("busket") %></h2>
	<h2>장바구니담기: <%=application.getAttribute("pname") %></h2>
	<a href = "a07_show.jsp">장바구니 확인</a>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>