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
<title>마이페이지 공통부분</title>
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>
	<div id="idposition">test님</div>
	<box>
		<div id="userInfoBox" class="MypageMenu">
			<img src="${path}\b01_img\userInfoManagerIcon.png">
			회원정보 관리
			<div class="hrposition"></div>
		</div>
		<div id="payManagerBox" class="MypageMenu">
			<img src="">
			결제 관리
			<div class="hrposition"></div>
		</div>
		<div id="useInfoBox" class="MypageMenu">
			<img src="">
			이용정보 관리
			<div class="hrposition"></div>
		</div>
	</box>
<body>

</body>
</html>