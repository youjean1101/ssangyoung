<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식에서 한글요청값을 받을 때, 반드시 설정되어야 한다.
	request.setCharacterEncoding("utf-8");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>검색된 내용:${param.sch}</h2>
</body>
</html>