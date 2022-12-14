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
# 세션의 중단
1. 세션은 3가지 형태로 중단을 처리할 수 있다.
	1) 명시적으로 중단메서드에 의해서
		session.invalidate()
		ex) 로그아웃하면 지금까지 설정된 세션을 중단시켜 준다.
	2) 시간을 설정해서 해당 시간이후 중단 처리(초)
		session.setmaxInactiveInterval(1000)
		해당 시간동안 요청이 없을 때 중단
	3) web.xml에서 서버단위로 설정
		서버 단위에 분단위로 요청이 없을 때 중단
		<session-config>
			<session-timeout>30</session-timeout>
		</session-config>
--%>
<h2 onclick="makeSess()">세션 설정(로그인 후 세션 생성)</h2>
<h2 onclick="delSess()">세션 삭제(로그아웃)</h2>
<script type="text/javascript">
	function makeSess(){
		location.href="a06_Session.jsp?sess=y"
	}
	function delSess(){
		location.href="a06_Session.jsp?sess=n"
	}
</script>
<h2>세션 상태</h2>
<% 
	String sess01 = (String)session.getAttribute("sess01");
	if(sess01!=null){
		out.print("<h3>세션생성됨:"+sess01+"</h3>");
	}else{
		out.print("<h3>세션생성됨:없음</h3>");
	}
%>
<%--
a06_Session.jsp
String sess = request.getParameter("sess");
if(sess!=null){
	if(sess.equals("y")){
		session.setAttribute("sess01","hi! session");
	}
	if(sess.equals("n")){
		session.invalidate()
	}
	response.sendRedirect("a05_stopSession.jsp");
}
--%>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>