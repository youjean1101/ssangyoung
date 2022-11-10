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

h3{text-align:center; color:rgb(234,0,0);font-size:20pt;}

div.box{
	text-align:center;
	font-size:15pt;
	font-weight:200;
	background:white;
	border-width:20px;
	border-style:solid;
	border-color:rgb(234,0,0);
	
	margin:30px;
	padding:10px;
}

table{
	position:absolute;
	bottom:15%;
	right:27%;
	}
	
input[type="button"], input[type="submit"] {
	width:350px;
	height:50px; 
	font-size:20pt;
	background-color:white; color:rgb(234,0,0); border:3px solid rgb(234,0,0);
}
</style>
<body>
	<h2><img src=".\img\CGV_mark.png" width="200px" height="80px" name="cgvmark"></h2>
	<br>
	<h3> 회원가입이 완료 되었습니다.</h3>
	<div class="box">
		<p><img src=".\img\mark.jpeg" width="50px" height="40px"> 저희 CGV를 이용해 주셔서 감사합니다.</p>
		<p><img src=".\img\profile_photo.jpg" name="profilephoto"></p>
		<p>> 아이디: ${param.ID}</p>
		<p>> 이름: ${param.name}</p>
		<p>> 이메일: ${param.email}</p>
	</div>
	<table>
		<form action="Project3_CGV_Login.html">
		<tr><td><input type="submit" value="로그인"></td>
		</form>
		<td><input type="button" value="메인으로 이동" onclick="alert('main이동')"></td></tr>
	</table>
	
	
</body>
</html>