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


--%>
<% 
 Member m = (Member)session.getAttribute("m01"); 
 boolean hasSess = m!=null;
 log("log(hasSess):"+hasSess);
 if(hasSess){
 %>
 <h2>세션값확인</h2>
 
 <h3>아이디:<%=m.getId()%></h3>
 <h3>비밀번호:<%=m.getPasswd()%></h3>
 <h3>이름:<%=m.getName()%></h3>
 <h3>권한:<%=m.getAuth()%></h3>
 <h3>포인트:<%=m.getPoint()%></h3>
 <h3>주소:<%=m.getAddress()%></h3>
 <%} %>

</body>
<script type="text/javascript">
	var hasSess = <%=hasSess%>;
	if(!hasSess){
		alert("세션값이 없습니다. 설정하러 가시겠습니까?")
		location.href="a03_afterLogin.jsp";
	}

</script>
</html>