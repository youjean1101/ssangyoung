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

ex) a15_sessionExp.jsp 물건명 가격 갯수 구매처를 각 4가지 session 범위로 설정하여 출력하고,
	session 범위 확인 클릭 시, a16_showSession.jsp로 4가지 session 범위에서 확인하세요.
	
--%>
 <% 
	pageContext.setAttribute("name","사과(page)");
 	request.setAttribute("price",3000);
 	session.setAttribute("cnt",3);
 	application.setAttribute("bloc","브라질(application)");
 %>
 <a href = "a16_showSession.jsp">세션 범위 확인</a>
 
<h2>물건명(page) : <%=pageContext.getAttribute("name") %></h2>
<h2>가격(request) : <%=request.getAttribute("price") %></h2>
<h2>갯수(session) : <%=session.getAttribute("cnt") %></h2>
<h2>구매처(application) : <%=application.getAttribute("bloc")%></h2>

<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>