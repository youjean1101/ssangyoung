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
	<form action="z11_checkValid.jsp">
		아이디:<input type="text" name="ID" />
		패스워드:<input type="text" name="PASSWORD" />
		<input type="submit" value="로그인" />
	</form>
<%
	String id = request.getParameter("id");
	boolean isInvalid = false;
	if(id!=null){
		isInvalid = true;
	}
%>	



</body>
<script type="text/javascript">
var isInvalid = < %=isInvalid%>;
if(isInvalid) alert("< %=id%>는 인증된 계정이 아닙니다.");

</script>
</html>