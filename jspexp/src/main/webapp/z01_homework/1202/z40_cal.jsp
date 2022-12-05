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
	<%-- 물건명 : <%= request.getAttribute("pname2")%>
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
	%> --%>
	<%
		String price5 = request.getParameter("price5"); if(price5==null) price5="0";
		String cnt5 = request.getParameter("cnt5"); if(cnt5==null) cnt5="0";
		int priceI = Integer.parseInt(price5);
		int cntI = Integer.parseInt(cnt5);
		int tot2 = priceI*cntI;
		request.setAttribute("tot2",tot2);
		String page05 = "z42_normal.jsp";
		if(tot2>=100000){
			page05 = "z41_mvp.jsp";
		}
	%>
		<jsp:forward page="<%=page05%>"/>
</body>
<script type="text/javascript">

</script>
</html>