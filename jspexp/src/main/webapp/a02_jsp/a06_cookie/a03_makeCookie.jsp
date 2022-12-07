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
<%
	//Cookie price = new Cookie("price","3000");
	//response.addCookie(price);
%>
<%-- 
ex) a03_makeCookie.jsp price 3000 쿠키값 추가
	a04_showCookie.jsp 생성된 쿠키값 확인

--%>
	<h2>장바구니 담기(쿠키 담기)</h2>
	<form>
		물건명 : <input type="text" name="name" />
		가격 : <input type="text" name="price" />
		갯수 : <input type="text" name="cnt" />
		<input type="submit" value="장바구니담기" />
	</form>
	<%
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String cnt = request.getParameter("cnt");
		if(name!=null){
			Cookie c1 = new Cookie("name",name);
			response.addCookie(c1);
			Cookie c2 = new Cookie("price",price);
			response.addCookie(c2);
			Cookie c3 = new Cookie("cnt",cnt);
			response.addCookie(c3);
		}
	%>
	<h2 onclick="location.href='a04_showCookie.jsp'">장바구니 담은 물건 확인하기</h2>
	


	<!-- <h2>쿠키값 확인</h2>
	<a href="a04_showCookie.jsp">만든 쿠키 확인하러가기</a> -->

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>