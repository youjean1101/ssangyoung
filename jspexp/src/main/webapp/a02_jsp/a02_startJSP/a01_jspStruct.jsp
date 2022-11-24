<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
      
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
# jsp 페이지의 구성요소
1. directive(선언 부분)
2. script : 실제 코드
	scriplet <% %>
	expression <%= %>
	declaration <%! %>
3. expression language el(표현언어)
	${param.name}
4. 내장 객체(implicit Object)
5. action tag
	<jsp:useBean
	<jsp:include
	<jsp:forward
6. 커스터 태그와 jstl(표준 태그 라이브러리

# directive(디렉티브)
1. jsp페이지에 대한 설정 정보를 지정
2. 디렉티브 구분
	<%@ 디렉티브명 속성 = 속성값, ...%>
3. 디렉티브 종류
	1) page : jsp페이지에 대한 정보를 지정
		문서의 타입, 출력, 버퍼의 크기, 에러 페이지 등 정보 지정
	2) taglib : 사용할 태그 라이브러리를 지정
	3) include : 다른 문서
# 스크립트 요소
1. 동적으로 출력 결과를 생성하기 위해 사용
	1) 표현식(expression)
	2) 스크립트릿(scriptlet)
	3) 선언부(declaration) : 자바 메서드 함수 정의
# 기본 객체
1. 웹 프로그래에 필요한 기능을 제공
2. jsp에서 별로 선언 없이 사용 가능 : servlet 변환 시, 해당 내용의 객체가 선언됨
3. 주요 기본 객체
	request : 요청 정보를 구할 때 사용
	response : 응답 관련된 설정(헤더, 쿠키 등) 시 사용
	out : 직접 응답을 출력할 때 사용
	session : 세션 관리에 사용
	
--%>


</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>