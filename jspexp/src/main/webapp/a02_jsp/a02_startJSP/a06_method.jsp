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
# form 데이터 처리 방식 : method 속성
1. 요청 파라미터를 전송하는 방식
	1) get : url 주소창에 쿼리스트링으로 전송을 한다.
		- tomcat 서버에서 요청값 encoding을 처리
	2) post 방식 : 요청 몸체에서 쿼리스트링을 숨겨서 전송한다.
		- 직접적으로 코드를 통해 encoding을 처리
			request.setCharacterEncoding("utf-8");
--%>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<h2>get방식 전송</h2>
	<form method="get">
		이름:<input type="text" name="name" value="홍길동" />
		<input type="submit" />
	</form>
	<h2><%=request.getParameter("name") %></h2>
	<h2>post방식 전송</h2>
	<form method="post">
		물건명:<input type="text" name="pname" value="사과" />
		<input type="submit" />
	</form>
	<h2><%=request.getParameter("pname") %></h2>


</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>