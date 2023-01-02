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
 
*/
</script>

</head>
<body>
<%-- 
# controller단 내용
		request.setAttribute("model01", "홍길동");
		request.setAttribute("model02", 25);
		request.setAttribute("dept", new Dept(10,"인사","서울강북"));
# 주의 : mvc패턴은 jsp에서 실행하지 않고, controller에서 연동해서 실행합니다.
ex) A04_MVC.java로 모델 데이터를 사원번호, 사원명, 급여를 설정하여,
	a04_view.jsp에서 호출하여 출력하게 하세요.
--%>
	<h2>MVC 2단계(모델데이터 처리)</h2>
	<h3>이름:${model01}</h3>
	<h3>나이:${model02}</h3>
	<h3>부서:${dept.deptno}, ${dept.loc}</h3>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>