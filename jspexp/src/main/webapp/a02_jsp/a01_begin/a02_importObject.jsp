<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.Person"
    import="jspexp.vo.Product"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{border-collapse:collapse;}
</style>
</head>
<body>
<%
	Person p01 = new Person("홍길동",25,"서울");
%>
	<table width="30%" border>
		<tr><th>이름</th><td><%=p01.getName() %></td></tr>
		<tr><th>나이</th><td><%=p01.getAge() %></td></tr>
		<tr><th>사는곳</th><td><%=p01.getLoc() %></td></tr>
	</table>
<%--
ex) vo하위에 Product 물건명/가격/갯수 선언..
	현재 화면에서 테이블로 출력 처리..
 --%>
 	<%
 	Product pro01 = new Product("사과",3000,5);
 	%>
 	<h3>물건 정보</h3>
 	<table width="50%" border>
	 	<tr><th>물건명</th><td><%=pro01.getPname() %></td></tr>
	 	<tr><th>가격</th><td><%=pro01.getPrice() %></td></tr>
	 	<tr><th>갯수</th><td><%=pro01.getCnt() %></td></tr>
	 	<tr><th>총</th><td><%=pro01.getPrice()*pro01.getCnt() %></td></tr>
 	</table>
</body>
</html>