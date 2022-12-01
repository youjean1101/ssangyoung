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
ex) a03_includeExp.jsp에 include액션태그로 a04_subPage.jsp를 만들고, 출력하게 하세요.
		전달데이터 - 회원명 회원권한
--%>
 <h2>포함화면</h2>
	<div style="border:1px solid green">
		<jsp:include page="a04_subPage.jsp">
			<jsp:param value="홍길동" name="ename"/>
			<jsp:param value="관리자" name="auth"/>
		</jsp:include>
	</div>
<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>