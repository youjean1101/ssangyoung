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
	물건명 : <%= request.getAttribute("pname2")%>
	가격 : <%=request.getAttribute("price") %>
	갯수 : <%=request.getAttribute("count") %>
	총가격 : <%=request.getAttribute("tot") %>
	
	<% 
	Object oTot = request.getAttribute("tot"); 
	Integer iTot = (Integer)oTot;
	int iTot2 = iTot; //객체랑 숫자 비교 ㄴㄴ 숫자랑 숫자 비교 ok 같은거아닌가유 선언1-객체선언-숫자타입으로선언?
	if(iTot2>=100000){
	%>
	<jsp:forward page ="z41_mvp.jsp"/>
	<%
	}else{
	%>
	<jsp:forward page ="z42_normal.jsp"/>
	<%
	}
	%>


</body>
<script type="text/javascript">

</script>
</html>