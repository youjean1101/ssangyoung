<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#use{
		border:1px solid black;
		width: 270px;
	    height: 350px;
		position:fixed;
		bottom: 35%;
	    left: 10%;
	    background:lightyellow;
	}
	#login{
		border:1px solid black;
		width: 270px;
	    height: 350px;
		position:fixed;
		bottom: 35%;
	    left: 40%;
	    background:lightyellow;
	}
	#notice{
	 	border:1px solid black;
	 	width: 270px;
	    height: 350px;
		position:fixed;
		bottom: 35%;
	    left: 70%;
	    background:lightyellow;
	}
	box input[type=button]{
		background:white;
		border:none;
		color:rgb(243, 156, 18);
		width:80px;
		height:40px;
		position:absolute;
		bottom:10%;
		left:30%;
		font-weight: bold;
		font-size:10pt;
	}
	box #noticego{
		width:150px;
	}
	
</style>

</head>
<body>
	<jsp:include page="frame.jsp"></jsp:include>
	
	<box id="use">
		<input type="button" value="이용하기" />
	</box>
	
	<box id="login">
		<input type="button" value="회원가입" />
		<input type="button" value="로그인" />
	</box>
		
	<box id="notice">
		<input id="noticego" type="button" value="공지사항 보러가기" />
	</box>
</body>
<script type="text/javascript">

</script>
</html>