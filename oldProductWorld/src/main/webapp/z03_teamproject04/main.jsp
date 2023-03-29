<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="z02_teamproject4.*"
    import="java.util.*"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 메인</title>
<style>
	#use{
		/* border:1px solid black; */
		width: 300px;
	    height: 400px;
		position:fixed;
		bottom: 35%;
	    left: 10%;
	    background:lightyellow;
	}
	#login{
		/* border:1px solid black; */
		width: 300px;
	    height: 400px;
		position:fixed;
		bottom: 35%;
	    left: 40%;
	    background:lightyellow;
	}
	#notice{
	 	/* border:1px solid black; */
	 	width: 300px;
	    height: 400px;
		position:fixed;
		bottom: 35%;
	    left: 70%;
	    background:lightyellow;
	}
	#use img{
		width:100%;
		height:100%;
	}
	#login img{
		width:100%;
		height:100%;
	}
	#notice img{
		width:100%;
		height:100%;
	}
	box input[type=button]{
		background:white;
		border:none;
		color:rgb(243, 156, 18);
		width:110px;
		height:40px;
		font-weight:bold;
		font-size:13pt;
	}
	box #useGo{
		width: 220px;
	    position: absolute;
	    bottom: 4%;
	    left: 13%;
	}
	#login #signupGo{
		width:100px;
		position:absolute;
		bottom:4%;
		left:10%;
		font-size:14pt;
	}
	#login #loginGo{
		width:100px;
		position:absolute;
		bottom:4%;
		left:57%;
		font-size:14pt;
	}
	#notice #noticeGo{
		width:200px;
		position:absolute;
		bottom:9%;
		left:2%;
		height:70px;
		font-size:16pt;
	}
	#thanks{
		position: fixed;
	    bottom: 50%;
	    left: 35%;
	    text-align:center;
	    font-size:24pt;
	    font-family: "Arial Black", sans-serif;
	    color: black;
	    text-shadow:2px 4px 2px gray;
	}
	
</style>

</head>
<body>
	<jsp:include page="\frame\frame.jsp"></jsp:include>
	
	<box id="use">
		<img src=".\img\main1.png">
		<input id="useGo" type="button" value="중고나라 이용하기" />
	</box>
	<%
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null; // 로그인한계정정보가 null아니면 true
		if(!hasSess){
	%>
	<box id="login">
		<img src=".\img\main2.png">
		<input id="signupGo" type="button" value="회원가입" onclick="location.href='signUp.jsp'"/>
		<input id="loginGo" type="button" value="로그인" onclick="location.href='login.jsp'"/>
	</box>
	<%}else{ %>
		<h2 id="thanks">저희 중고월드를 이용해주셔서 <div>감사합니다.♥</div></h2>
	<%} %>
	<box id="notice">
		<img src=".\img\main3.png">
		<input id="noticeGo" type="button" value="공지사항 보러가기" />
	</box>
</body>
<script type="text/javascript">

</script>
</html>