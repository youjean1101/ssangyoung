<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.logo{
	padding : 5% 2% 5% 2%;
	width: 17rem;
}
.justify-content-center{
	padding: 10px 10px 10px 10px;
}
.btn.btn-success, .btn.btn-secondary{
	width:100%;
	padding: 10px 0 10px 0;
	margin-bottom: 3%;
	margin-top:3%;
	font-weight: bold;
}
.form-check-label{
	padding: 2px 58% 0 0;
}
.join{
	padding-right: 10%;
}
.find{
	padding-left: 10%;
}
.join, .find{
	color: black;
	font-weight: bold;
	font-size: 0.9rem;
	margin-bottom: 100px;
}
.join:hover, .find:hover{
	text-decoration: none;
	color: gray;
}
.kakao, .kakao:focus, .naver, .naver:focus{ 
	background-color: transparent;
	width: 30px;
	height: 30px;
	border: none;
	padding: 0 0 0 0;
	outline: none;
	cursor: pointer;
}
.snslogin{
	color: #c8c8c8;
	font-size: 0.6rem;
	padding-bottom: 5px;
}
.justify-content-center.text-center{
	margin-left: 38%;
	margin-top: 5%;
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
</head>

<body>
	
	<div class="justify-content-center text-center" style="width: 23rem;">
  	<img src="${path }/b01_img/logo.png" class="logo" alt="...">
  	<br><br><br><br>
	    <form>
	    	<input class="form-control" type="text" placeholder="아이디" aria-label="default input example">
	    	<input class="form-control" type="password" placeholder="비밀번호" aria-label="default input example">
	    	<input type="checkbox" value="" id="flexCheckDefault">
			<label class="form-check-label" for="flexCheckDefault">로그인 상태 유지</label><br>
			<button type="button" class="btn btn-success">로그인</button><br>
			<a class="join" href="#">회원가입</a>
			<a class="find" href="#">아이디/비밀번호 찾기</a><br>
			<span class="snslogin">sns 로그인</span><br>
			<button type="button" class="kakao"><img class="kakaoImg" src="${path }/b01_img/kakao.png" width="30px"></button>
			<button type="button" class="naver"><img class="naverImg" src="${path }/b01_img/naver.png" width="30px"></button>
			<button type="button" class="btn btn-secondary">비회원</button>
				  
	    </form>
	 </div>
	 
</body>
</html>