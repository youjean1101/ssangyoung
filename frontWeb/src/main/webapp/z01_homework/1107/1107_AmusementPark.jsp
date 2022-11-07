<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>놀이공원 할인한 가격</h2>
	<h3>기본입장료:${param.fee}</h3>
	<h3>할인율:${param.discount}</h3>
	<h3>총 가격:${param.fee*(100-param.discount)/100}</h3>
</body>
</html>