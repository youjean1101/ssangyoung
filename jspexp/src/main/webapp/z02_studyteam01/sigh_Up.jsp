<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{
		width:50px;
		height:60px;
	}
	h2#title{
		color:green;
		text-align:center;
		font-size:30pt;
		font-weight:border;
	}
	a{
		text-decoration:none;
	}
	a:visited{
		text-decoration:none;
		color:green;
	}
	
	box h3{
		position: absolute;
	    top: -60px;
    	right: 125px;
    	font-size:18pt;
	}
	
	box{
		position:fixed;
		left:25%;
		top:28%;
	}
	
	input{
		width: 290px;
   	 	height: 40px;
	}
	
	 box input[type="button"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
		position:absolute;
	    bottom: -60px;
    	right: 150px;
   		width: 140px;
	    height: 40px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	box input[type="submit"]{
		background-color:green;
		color:white;
		border:none;
		border-radius:5px;
		position:absolute;
	    position: absolute;
	    bottom: -60px;
	    right: 0px;
	    width: 140px;
	    height: 40px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	th{
		text-align:right;
	}
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<h2 id="title"><a href="login.jsp"><img src=".\a_img\icon.jpg" />스터디 게시판</a></h2>
	<box>
		<h3>회원가입</h3>
		<form>
			<table>
				<tr><th>ID : </th><td><input type="text" name="id" placeholder="아이디를 입력해주세요."/></td><td><input type="button" value="중복확인" onclick="idConfirm()"/></td></tr>
				<tr><th>PASSWORD : </th><td><input type="password" name="password" placeholder="비밀번호를 입력해주세요."/></td><td></td></tr>
				<tr><th>PASSWORD 확인 : </th><td><input type="password" name="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요."/></td><td></td></tr>
				<tr><th>이름 : </th><td><input type="text" name="id" placeholder="이름을 입력해주세요."/></td><td></td></tr>
				<tr><th>이메일 : </th><td><input type="text" name="id" placeholder="xxx@xxx.com 형식의 이메일을 입력해주세요."/></td><td></td></tr>
				<tr><th>전화번호 : </th><td><input type="text" name="id" placeholder="010-0000-0000 형식의 전화번호를 입력해주세요."/></td><td></td></tr>
			</table>
			<input type="button" value="뒤로가기" onclick="loginGo()" />
			<input type="submit" value="회원가입" />
		</form>
	</box>

</body>
<script type="text/javascript">
	function loginGo(){
		location.replace("login.jsp");
	}
	
	function idConfirm(){
		alert("[안내메시지] 사용가능한 아이디 입니다.");
	}
</script>
</html>