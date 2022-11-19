<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
h2{text-align:center;}

input{
	width:350px;
	height:60px; 
	font-size:20pt;
	text-align:center;
	background-color:white; color:rgb(234,0,0); border:3px solid rgb(234,0,0);
	
	margin:30px;
	padding:10px;
	
	position:relative;
	left:35%; 
	bottom:30%;
	
	border-radius:5px;
	}
	
div span{
	font-size: 40pt;
	color:red;}

div.box{
	text-align:center;
	font-size:20pt;
	font-weight:500;
	background:white;
	border-width:10px;
	border-style:solid;
	border-color:rgb(234,0,0);

	margin:30px;
	padding:10px;
}
</style>
<body>
	<h2><img src=".\img\CGV_mark.png" width="200px" height="90px" name="cgvmark"></h2>
	<div class="box">
		<h3>${param.id=='himan' and param.password=='7777'? 
	 			'[안내메시지] <span>로그인 성공</span>하였습니다. <br>CGV 사이트를 이용해주셔서 감사합니다.':
	 			'[안내메시지] <span>로그인 실패</span>하였습니다. <br>아이디와 비밀번호를 다시 입력해주세요.'}</h3>
	 	<h4>☞ 입력하신 아이디: ${param.id}</h4>
	 </div>
	 
	 <a href="Project3_CGV_Login.html"><input type="button" value="로그인 하러가기"></a>
</body>
</html>