<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
h3{
	display: inline-block;
}
thead{
	background: #d2d2d2;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<h3>주간</h3> <h3>월간</h3>
<p>전주 월요일~일요일까지의 이용거리 실적<br>
※ 랭킹서비스 이용거리는 실제 이용거리와 다를 수 있습니다.</p>

<p>나의 랭킹</p>
<hr>
<div>
<h3>~등</h3>
<h3>아이디</h3>
<h3>0km</h3>
</div>
<hr>
<p>전체 랭킹 목록</p>
<table class="table-hover">
<thead>
<tr><th>등수</th><th>아이디</th><th>이동거리</th></tr>
<!-- ajax로 불러올 부분 -->
<tr><td>등수</td><td>아이디</td><td>이동거리</td></tr>
</thead>
</table>
</body>
</html>