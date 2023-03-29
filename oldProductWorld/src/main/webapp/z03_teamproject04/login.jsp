<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="z02_teamproject4.*"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 로그인</title>
<style>
	#snsphoto{
		/* border:1px solid black; */
		position:fixed;
		left:40%;
		bottom:35%;
		width:350px;
		height:450px;
	}
	#snsphoto #logintab{
		width:100%;
		height:100%;
	}
	
	#logintab td{
		width:50%;
		height:11%;
		/* border:none; */
		/* border:1px solid black */
	}
	.input{
		width:97%;
		height:80%;
		background:rgb(255, 203, 164);
		opacity:0.6;
		border:2px solid lightgrey;
		border-radius:5px;
	}
	input[type="submit"]{
		width:100%;
		height:100%;
		color:white;
		background:rgb(243, 156, 18);
		border:2px solid lightgrey;
		border-radius:5px;
		font-size:13pt;
		font-weight: bold;
	}
	button{
		color:grey;	
		border-radius:5px;
	}
	#clickGo{
		width:100%;
		text-align:center;
		
	}
	#signupGo{
		font-size:9pt;
		border:none;
		background:none;
	}
	#idFindGo{
		font-size:9pt;
		border:none;
		background:none;
	}
	span{
		color:grey;
	}
	td .sns{
		width:100%;
		height:100%;
		border:3px solid lightgrey;
		background:none;
		font-size:11pt;
	}
	#google{
		border:3px solid lightgrey;
	}
	#naver{
		border:3px solid lightgreen;
	}
	#kakao{
		border:3px solid yellow;
	}
	.sns .mark{
		width:25px;
		height:25px;
		position:fixed;
		left:42%;
	}
	
</style>
<script>
</script>
</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<box id="snsphoto">
		<table id="logintab">
			<tr><td><h3>반갑습니다.<br>중고월드입니다.</h3></td><td></td></tr>
			<form>
			<tr><td colspan="2"><input type="text" class="input" name="id" placeholder="아이디를 입력해주세요."></td></tr>
			<tr><td colspan="2"><input type="password" class="input" name="password" placeholder="비밀번호를 입력해주세요."></td></tr>
			<tr><td colspan="2"><input type="submit" value="로그인 하기"></td></tr>
			</form>
			<tr><td colspan="2" id="clickGo"><button id="signupGo" onclick="location.href='signUp.jsp'"/>회원가입</button><span>|</span><button id="idFindGo"/>아아디/비밀번호 찾기</button></td></tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr><td colspan="2"><button class="sns" id="google"/><img class="mark" id="googlemark" src=".\img\googlemark.png"/>구글 계정으로 로그인</button></td></tr>
			<tr><td colspan="2"><button class="sns" id="naver"/><img class="mark" id="navermark" src=".\img\navermark.png"/>네이버 계정으로 로그인</button></td></tr>
			<tr><td colspan="2"><button class="sns" id="kakao"/><img class="mark" id="kakaomark" src=".\img\kakaomark.png"/>카카오톡 계정으로 로그인</button></td></tr>
		</table>
	</box>	
	<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	boolean isFail = false;
	if(id!=null&&password!=null){
		userdao dao = new userdao();
		
		if(dao.login(id, password)){ //true(있으면)
			response.sendRedirect("main.jsp");
			/* session.setAttribute("loginID",id);
			session.setAttribute("loginPassword",password); */
			Olddealuser sel= new Olddealuser(id,password);
			/*
			public Olddealuser(String id, String password, String div, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email, int point,
			int salecount, int buycount, int declarationcount)
			*/
			for(Olddealuser user:dao.userInfo(sel)){
				Olddealuser loginuser = new Olddealuser(id,password,user.getUserdiv(),user.getUsername(),user.getNickname(),user.getRrn(),
														user.getPhonenumber(),user.getZipcode(),user.getAddress(),user.getDetailaddress(),
														user.getEmail(),user.getPoint(),user.getSalecount(),user.getBuycount(),user.getDeclarationcount()); 
				session.setAttribute("Login",loginuser);
			}
		}else{ //false(없으면)
			isFail = true;
		}
	}
	%>
</body>
<script type="text/javascript">
	
	var isFail=<%=isFail%>
	if(isFail){
		alert("[안내메시지]등록된 계정이 없습니다.\n아이디/패스워드를 확인해주세요.")
	}
</script>
</html>