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
<%--ex) a18_forwardTest.jsp?id=himan 처리하여 요청값(request.getAttribute("id"))이 himan일 때는 로그인 성공 페이지 a19_main.jsp로 전송
		그 외는 a20_error.jsp로 로그인 실패 페이지로 이동하여 출력되게 하세요.
 --%>
 	<form>
 		아이디 입력:<input type="text" name="id"/>
 		<input type="submit" value="로그인"/>
 	</form>
 	<%
 	String id = request.getParameter("id");
 	if(id!=null){
 		String page01 = "a20_error.jsp";
 		if(id.equals("himan")){
 			page01 = "a19_main.jsp";
 	 	}
	 %>
	 <jsp:forward page="<%=page01%>"/>
	<%
 	}%>
 	
 <%--a19_main.jsp
 		<h2><%=request.getParameter("id")%>로그인 성공<h2> 
 	a20_error.jsp
 		<h2><%=request.getParameter("id")%>로그인 실패<h2> 
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