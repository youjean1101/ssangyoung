<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.align-self-center{
	margin: 0 5px 0px 5px;
}
/*
#header, #navbar{
	padding : 0 10% 0 10%;
}*/
.nav-item{
	margin-left: 5px;
	font-weight: bolder;
}
.headertext{
	font-size: 0.8rem;
	margin-left: 3px;
}
.headertext, .headertext:active, .nav-link, .nav-link:active{
	padding-left: 5px;
	color:black;
	text-decoration: none;
}
.headertext:hover, .nav-link:hover{
	color:gray;
	text-decoration: none;
}
.navbar-collapse{
	width:1000%
}
hr{
	width:100%;
	margin-top: 5px;
	margin-bottom: 2px;
}
.col-4{
	text-align: right;
}

.badge{
	font-size: 0.4rem !important;
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
		
	});
</script>
<html>
<head >

</head>
<body>

<div id="header" class="row">
 <div class="col-8"></div>
 <div class="col-4"> 
 	<a class="headertext" href="#">마이페이지</a>
 	<a class="headertext" href="#">로그아웃</a>
 	<a class="headertext" href="#">알림</a>
 </div>
</div>

<hr>
<nav id="navbar" class="navbar navbar-expand-sm">
    <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="${path }/b01_img/logo.png" width="50%"/></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">공지사항</a>
        </li>
         <li class="nav-item">
            <a class="nav-link" href="#">안전수칙</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">자주하는질문</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">1:1문의<span class="badge position-absolute top-23 start-85 translate-middle rounded-circle bg-danger">4</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">회원정보</a>
        </li>
        </ul>
    </div>
    </div>
</nav>




    
</body>
</html>

