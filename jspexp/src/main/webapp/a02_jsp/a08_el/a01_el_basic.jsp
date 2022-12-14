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
<%-- 
# Expression Language
1. jsp에서 사용가능한 새로운 스크립트 언어
2. el의 주요 기능
	1) jsp의 4가지 기본 객체가 제공하는 영역의 속성을 가진 변수로 사용
	2) 집합 객체에 대한 접근 방법 제공
	3) 수치 연산, 관계 연산, 논리 연산자 제공
	4) 자바 클래스의 메서드 호출 기능 제공
	5) 표현 언어만의 기본 객체 제공
3. 간단한 구문 대문에 표현식 대신 사용
	- el와 jstl로 인해서 script(expression, scriplet)를 사용하지 않을 수도 있다.
--%>
<%
	// 페이지 범위 변수 선언.
	pageContext.setAttribute("num01",25);
	pageContext.setAttribute("num02",35);
	pageContext.setAttribute("name","홍길동");
	session.setAttribute("sess01","안녕하세요.");
%>
	<h2>숫자1:${num01}</h2>
	<h2>숫자2:${num02}</h2>
	<h2>합산:${num01+num02}</h2>
	<h2>이름:${name01}</h2>
	<h2>이름2:${name01}</h2>
	<h2>세션값:${sess01}</h2>
	<a href="a02_el_basic2.jsp">세션값 확인하러가기?(과연 무슨 일이?)</a>
<%-- ex) request객체로 물건명 가격 갯수를 할당, el로 호출하되, 총계까지 출력하세요. --%>
<%
	request.setAttribute("product","사과");
	request.setAttribute("price","3000");
	request.setAttribute("cnt","5");
%>
	<h2>물건명:${product}</h2>
	<h2>가겨:${price}</h2>
	<h2>갯수:${cnt}</h2>
	<h2>총계:${price*cnt}</h2>
	<h2>등급:${price*cnt>10000}</h2>
	<h2>등급:${price*cnt>10000?'MVP':'일반고객'}</h2>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>