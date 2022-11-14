<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- jsp의 주석 --%>
	
	<%
	// scriptlet
	String name="홍길동"; // java
	int age = 25;
	String loc="서울";
	%>
	<%-- 표현 처리. --%>
	<h2>이름:<%=name%></h2>
	<h2>나이:<%=age%></h2>
	<h2>사는곳:<%=loc%></h2>
	
	<%-- ex) 물건명 가격 갯수를 선언하고 출력하되
			table의 th와 td를 활용하여 출력하세요.
		물건명 @@@
		가격	 @@@
		갯수	 @@@
	 --%>
	 <% 
	 String pname="사과";
	 int price=3000;
	 int cnt=3;
	 %>
		<table width="40%" style="border-collapse:collapse" border>
			<tr><th>물건명</th><td><%=pname %></td></tr>
			<tr><th>가격</th><td><%=price %>원</td></tr>
			<tr><th>갯수</th><td><%=cnt %>개</td></tr>
			<tr><th>계</th><td><%=price*cnt %>원</td></tr>
		</table>
</body>
</html>