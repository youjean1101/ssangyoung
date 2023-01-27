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
.form-check-label{
	font-size: 0.8rem;
}
.findInfo, .findInfo:active{
	font-size: 0.8rem;
	color: black;
}
.findInfo:hover{
	color:gray;
	text-decoration: none;
}
.btn.btn-success, .btn.btn-secondary{
	width: 100%;
	margin-top:3px;
}
.smlogin{
	position: absolute;
	background: white;
	top: 160px;
	left: 70%;
}
.nav-link.nav2{
	color:white;
	font-size: 1.3rem;
	font-weight: normal;
	font-family: 맑은 고딕;
}
.nav-link.nav2:hover{
	font-weight: bolder;
	color:white;
}
.nav-item.navit2{
	padding: 20px 40px 20px 40px;
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
<div class="container">
	<jsp:include page="${path }/a00_main/a00_header.jsp"></jsp:include>
</div>	
	<div class="text-center smlogin" style="width: 250px;height: 225px;padding: 20px 20px 20px 20px;">
		<form class="form-floating">
		  <input type="text" class="form-control" id="floatingInputValue" placeholder="아이디" value="">
		  <input type="password" class="form-control" id="floatingInputValue" placeholder="비밀번호" value="">
		  <input type="checkbox" value="" id="flexCheckDefault">
		  <label class="form-check-label" for="flexCheckDefault">자동로그인</label>
		  <a class="findInfo text-end" href="#">아이디/비밀번호 찾기</a><br>
		  <button type="button" class="btn btn-success">로그인</button><br>
		  <button type="button" class="btn btn-secondary">비회원</button>	  
		</form>		
	</div>
	<div class="text-center"> <img src="${path }/b01_img/main.jpg" width="1400px" height="700px" class="rounded" alt="..."></div>
	
<nav id="navbar" class="navbar navbar-expand-sm" style="background-color: #24384a;">
    <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
        <ul class="navbar-nav" style="padding-left: 20%;padding-right: 20%;">
        <li class="nav-item navit2">
            <a class="nav-link nav2" href="#">대여방법</a>
        </li>
        <li class="nav-item navit2">
            <a class="nav-link nav2" href="#">반납방법</a>
        </li>
        <li class="nav-item navit2">
            <a class="nav-link nav2" href="#">대여소현황</a>
        </li>
        <li class="nav-item navit2">
            <a class="nav-link nav2" href="#">이용요금안내</a>
        </li>
        </ul>
    </div>
    </div>
</nav>

</body>
</html>