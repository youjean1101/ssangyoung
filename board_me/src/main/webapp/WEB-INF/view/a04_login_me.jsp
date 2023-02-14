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
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var msg = "${msg}"
		if(msg!=""){
			alert(msg)
			if(msg == "로그인 성공"){
				location.href="${path}/list.do"
			}
		}
	});
</script>
</head>

<body>
<div class="container">
   <form action="login.do" method="post">
		  <div class="mb-3 mt-3">
		    <label for="id" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="id" placeholder="ID" name="id">
		  </div>
		  <div class="mb-3">
		    <label for="pass" class="form-label">비밀번호:</label>
		    <input type="password" class="form-control" id="pass" placeholder="PASSWORD" name="pass">
		  </div>
		  <button type="submit" class="btn btn-primary">로그인</button>
	</form> 
</div>
</body>
</html>