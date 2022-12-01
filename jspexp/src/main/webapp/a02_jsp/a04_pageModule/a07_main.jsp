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
// ex) a07_main.jsp로 메인페이지로 선언하고 a08_sub.jsp에 선언된 요청값 출력
//		a08_sub.jsp 사용할 변수를 선언 요청값을 물건명을 가격을 선언
//		
--%>
<h2>메인 페이지</h2>


<form>
	물건명 : <input type="text" name="name"/>
	가격 : <input type="text" name="price"/>
	<input type="submit" value="구매"/>
</form>

<div style="border:1px solid green;">
	<%@ include file="a08_sub.jsp" %>
	<h2><%=name %></h2>
	<h2><%=price %></h2>
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