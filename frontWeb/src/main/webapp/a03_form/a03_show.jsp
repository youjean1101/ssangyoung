<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">구매한 물건 정보</h2>
	<table border="1" align="center" width="30%">
		<col width="50%">
		<col width="50%">
		<thread>
			<tr><th>물건명</th><th>구매갯수</th></tr>
		</thread>
		<tbody>
			<tr><td>${param.product}</td><td>${param.count}</td></tr>
		</tbody>
	</table>
</body>
</html>