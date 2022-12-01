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
# include 디렉티브
1. 코드 차원에서 포함
2. 기본형식
	<%@ include file="포함할 파일" ?
3. 활용
	- 모든 jsp 페이지에서 사용되는 변수 지정
	- 저작권 표시와 같은 간단하면서 모든페이지에 중복되는 문장
--%>
<h2>인크루드 디렉티브 연습</h2>
<div style="border:1px solid red;">
	<%@ include file="a06_subPage.jsp" %>
</div>

<h2>선언된 변수 호출</h2>
<h3><%=name %></h3>
<h3><%=age %></h3>
<h3><%=loc %></h3>
<%
// ex) a07_main.jsp로 메인페이지로 선언하고 a08_sub.jsp에 선언된 요청값 출력
//		a08_sub.jsp 사용할 변수를 선언 요청값을 물건명을 가격을 선언
//		include 지시자를 통해서 포함되어 출력되게 하세요.

%>


<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>