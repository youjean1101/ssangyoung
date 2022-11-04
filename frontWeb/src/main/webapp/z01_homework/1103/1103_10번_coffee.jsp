<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	th{background-color:yellow;}
</style>
<body>
	<h3>#커피주문목록#</h3>
	<table border="1">
		<tr>
			<th>커피종류</th><th>커피갯수</th>
		</tr>
		<tr>
			<td>${param.order1}</td><td>${param.ordercnt1}</td>
		</tr>
		
		<tr>
			<td>${param.order2}</td><td>${param.ordercnt2}</td>
		</tr>
		
		<tr>
			<td>${param.order3}</td><td>${param.ordercnt3}</td>
		</tr>
	</table>
</body>
</html>