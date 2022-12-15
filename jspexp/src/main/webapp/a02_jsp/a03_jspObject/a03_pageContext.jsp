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
	a03_pageContext.jsp 물건명 가격 갯수를 문자열/숫자 변수로 저장했다가 호출하세요.
--%>
<% 
	pageContext.setAttribute("name","홍길동");
	pageContext.setAttribute("age",25);
	pageContext.setAttribute("loc","서울 방배동");
%>
	<h2>이름:<%= pageContext.getAttribute("name") %></h2>
	<h2>나이(+5년 후):<%= (Integer)pageContext.getAttribute("age")+5 %></h2>
	<%-- 기본적으로 형변환이 없으면 문자열로 출력은 되나, 원하는 데이터 연산을 위해서는형변환이 반드시 필요로 하다. --%>
	<h2>사는곳:<%= pageContext.getAttribute("loc") %></h2>
	<%-- ex) Product객체로 물건명 가격 갯수를 pageContext로 설정한 후, 호출하세요. --%>
	<%
		pageContext.setAttribute("물건정보",new Product("사과",3000,2));
		Product pro = (Product)pageContext.getAttribute("물건정보");
	%>
	<%
		pageContext.setAttribute("prod",new Product("사과",3000,2));
		//할당된 내용을 사용하려면 typecasting 필요..
		Product prod = (Product)pageContext.getAttribute("prod");
	%>
	<h3>물건명 : <%=pro.getPname() %></h3>
	<h3>가격 : <%=pro.getPrice() %></h3>
	<h3>갯수 : <%=pro.getCnt() %></h3>
	<h3>총합계 : <%=pro.getPrice()*pro.getCnt() %></h3>
	
	<h3>물건명 : <%=prod.getPname() %></h3>
	<h3>가격 : <%=prod.getPrice() %></h3>
	<h3>갯수 : <%=prod.getCnt() %></h3>
	
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>