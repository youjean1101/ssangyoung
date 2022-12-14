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
ex) a03_afterLogin.jsp Member클래스로 session 설정
 		메뉴권한확인이동 a04_sessionMenu.jsp
 	 a04_sessionMenu.jsp
 	 	session 객체 내용 출력
 	 	session 없을 때, a03_afterLogin.jsp 이동 처리.

--%>
<%
Member m = new Member("himan","1234","홍길동","사용자",100,"서울");
session.setAttribute("m01",m);
%>
<h2>세션 생성 완료</h2>
<h3>세션 확인하러 갑시다.</h3>
</body>
<script type="text/javascript">
var h3 = document.querySelector("h3");
h3.onclick=function(){
	location.href="a04_sessionMenu.jsp"
}

/*
 
*/

</script>
</html>