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
	box{
		position:fixed;
		left:30%;
		top:28%;
	}
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<h2 id="title"><a href="login.jsp"><img src=".\a_img\icon.jpg" />스터디 게시판</a></h2>
	<box>
		<form>
			<table>
				<tr><th>ID : </th><td><input type="text" name="id" placeholder="아이디를 입력해주세요."/></td></tr>
				<tr><th>PASSWORD : </th><td><input type="password" name="password" placeholder="비밀번호를 입력해주세요."//></td></tr>
			</table>
			<input type="button" value="회원가입" onclick="signUpGo()"/>
			<input type="submit" value="로그인" />
		</form>
	<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	boolean isFail = false;
	if(id!=null&&password!=null){
		studyteamDao dao = new studyteamDao();
		
		if(dao.login(id, password)){ //true(있으면)
			response.sendRedirect("main.jsp");
			session.setAttribute("loginID",id);
			session.setAttribute("loginPassword",password);
			NoticeBoardUser sel= new NoticeBoardUser(id,password);
			for(NoticeBoardUser user:dao.userInfo(sel)){
				session.setAttribute("loginEmail",user.getsEmail());
				session.setAttribute("loginName",user.getsName());
				session.setAttribute("loginPhone",user.getsPhonNumber());
			}
		}else{ //false(없으면)
			isFail = true;
		}
	}
	%>
	<script>
		var isFail=<%=isFail%>
		if(isFail){
			alert("로그인 실패\n인증된 아이디가 아닙니다.")
		}
	</script>
	</box>
</body>
<script type="text/javascript">
	function signUpGo(){
		location.replace("sigh_Up.jsp");
	}
</script>
</html>