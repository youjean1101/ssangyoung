<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 //jspexp.a13_database.A06_PareparedDao
// getDeptList(Dept sch)
*/
</script>
</head>
<%--Bean DB를 로딩하고, 요청값 받은 VO객체 처리 --%>
<jsp:useBean id="dao" class="jspexp.a13_database.A06_PareparedDao"/>
<%--id, pass 값을 받는 객체--%>
<jsp:useBean id="reMem" class="jspexp.vo.Member"/>
<jsp:setProperty property="*" name="reMem" />
<body>
	<%--dao를 통해서 객체가 있을 때만 session 객체 선언 --%>
	<c:if test="${not empty dao.login(reMem)}">
		<c:set var="mem" scope="session" value="${dao.login(reMem)}"/>
	</c:if>

</body>
<script type="text/javascript">
	var isFail='${mem.id}'
	if(isFail==""){
		alert("로그인 실패\n로그인 페이지 이동")
		location.href="a01_login_DB.jsp"
	}else{
		alert("로그인 성공\n메인페이지이동")
		location.href="a03_checkSession.jsp"
	}
</script>
</html>