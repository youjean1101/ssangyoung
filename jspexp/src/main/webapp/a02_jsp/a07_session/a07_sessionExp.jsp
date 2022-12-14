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
# ex) a05_stopSession.jsp에서 세션이 만들어진 상태에서 
		세션값을 확인하고 button으로 만들어 세션삭제를 클릭하면 현재 페이지에서
		요청값으로 세션을 삭제하게 처리하고 세션값이 없게 처리하세요.
--%>
<%
String sess01 = (String)session.getAttribute("sess01");
String ses = request.getParameter("ses");
if(ses!=null && ses.equals("n")){
	session.invalidate(); 
	log("세션 삭제!!");
	// 다음 페이지를 호출할 때 없어지므로 한번 더 호출!!
	response.sendRedirect("a07_sessionExp.jsp");
}
%>
	<h2>세션상태:<%=sess01!=null?sess01:"세션없음" %></h2>
	<form><input type="hidden" name="ses" value="n"/>
		<button>세션삭제</button>
	</form>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>