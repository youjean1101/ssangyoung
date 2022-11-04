<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">로그인결과</h2>
	<h3 align="center">아이디 :${param.id}
		패스워드 : ${param.passwd}
	</h3>
	<h3 align="center">${param.id=='himan' and param.passwd=='7777'? '로그인성공':'로그인실패'}</h3>
	<%--jsp 주석--%>
	<%--
	${조건문?true일때:false일떄}
	1. el(jsp에서 사용하는 언어)
		'':문자열 처리
	2. 산술연산을 효율적으로 처리한다.
		1) 숫자형문자는 숫자로 자동 변환해서 처리해준다.
		2) ?price=3000&cnt=5
			=> 네트워크상 전송되는 모든 데이터는 문자열이지만 el는 자동으로 연산시 숫자형으로 변환해준다.
			${param.price*param.cnt}
			
	 --%>
</body>
</html>