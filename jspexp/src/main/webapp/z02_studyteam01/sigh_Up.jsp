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
	
	box{
		position:fixed;
		left:28%;
		top:20%;
	}
	
	input{
		width: 300px;
   	 	height: 40px;
	}
	
	 box input[name="back"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
		position:absolute;
	    bottom: -60px;
    	right: 280px;
   		width: 170px;
	    height: 50px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	box input[name="confirm"]{
		background-color:white;
		color:green;
		border:1px solid green; 
		width: 80px;
	    height: 40px;
	}
	
	box input[name="go"]{
		background-color:green;
		color:white;
		border:none;
		border-radius:5px;
		position:absolute;
	    position: absolute;
	    bottom: -60px;
	    right: 90px;
	   	width: 170px;
	    height: 50px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	th{
		text-align:right;
	}
	
	legend{
		font-size:30pt;
		font-weight:900pt;
		text-align:center;
		
	}
	
	fieldset{
		border:1px solid green;
	}
</style>
<script type="text/javascript">
	function userInsert(){
		var id = document.querySelector("[name=id]")
		var idV = id.value.trim();
		var password = document.querySelector("[name=password]")
		var passwordV = password.value.trim();
		var passwordConfirm = document.querySelector("[name=passwordConfirm]")
		var passwordConfirmV = passwordConfirm.value.trim();
		var name = document.querySelector("[name=name]")
		var nameV = name.value.trim();
		var email = document.querySelector("[name=email]")
		var emailV = email.value.trim();
		var phonenumber = document.querySelector("[name=phonenumber]")
		var phonenumberV = phonenumber.value.trim();
		if(idV==""){
			alert("[안내메시지]아이디를 입력해주세요.")
			id.focus()
			return;
		}
		if(passwordV==""){
			alert("[안내메시지]비밀번호를 입력해주세요.")
			password.focus()
			return;
		}
		if(passwordConfirmV==""){
			alert("[안내메시지]비밀번호 확인을 입력해주세요.")
			passwordConfirm.focus()
			return;
		}
		
		if(passwordV!=passwordConfirmV){
			alert("[안내메시지]입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다.")
			passwordConfirm.focus()
			return;
		}
		
		if(nameV==""){
			alert("[안내메시지]이름를 입력해주세요.")
			name.focus()
			return;
		}
		if(emailV==""){
			alert("[안내메시지]이메일를 입력해주세요.")
			email.focus()
			return;
		}
		if(phonenumberV==""){
			alert("[안내메시지]휴대폰번호를 입력해주세요.")
			phonenumber.focus()
			return;
		}
		document.querySelector("form").submit();
	}
</script>

</head>
<body>
	<h2 id="title"><a href="login.jsp"><img src=".\a_img\icon.jpg" />스터디 게시판</a></h2>
	<box>
		<fieldset>
			<legend>회원가입</legend>
			<form>
				<table>
					<tr><th>ID : </th><td><input type="text" name="id" placeholder="아이디를 입력해주세요."/></td>
						<td><input type="button" name="confirm" value="중복확인" onclick="idConfirm()"/></td></tr>
						<!-- 아이디 중복 확인 기능 넣기 -->
					<tr><th>PASSWORD : </th><td><input type="password" name="password" placeholder="비밀번호를 입력해주세요."/></td><td></td></tr>
					<tr><th>PASSWORD 확인 : </th><td><input type="password" name="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요." /></td><td></td></tr>
					<tr><th>이름 : </th><td><input type="text" name="name" placeholder="이름을 입력해주세요."/></td><td></td></tr>
					<tr><th>이메일 : </th><td><input type="text" name="email" placeholder="xxx@xxx.com 형식의 이메일을 입력해주세요."/></td><td></td></tr>
					<tr><th>전화번호 : </th><td><input type="text" name="phonenumber" placeholder="010-0000-0000 형식의 전화번호를 입력해주세요."/></td><td></td></tr>
				</table>
				<input type="button" value="뒤로가기"  name="back" onclick="loginGo()"/>
				<input type="button" value="회원가입"  name="go" onclick="userInsert()"/>
			</form>
		</fieldset>
			
	<%
	studyteamDao dao = new studyteamDao();
	String id = request.getParameter("id"); if(id==null) id="";
	boolean isIDConfirm = false;
	if(dao.isIDConfirm(id)){ //id가 없으면 false 있으면 true(true일때, is)
		isIDConfirm = true;
	}
	String password = request.getParameter("password"); if(password==null) password="";
	String passwordConfirm = request.getParameter("passwordConfirm"); if(passwordConfirm==null) passwordConfirm="";
	String name = request.getParameter("name"); if(name==null) name="";
	String email = request.getParameter("email"); if(email==null) email="";
	String phonenumber = request.getParameter("phonenumber"); if(phonenumber==null) phonenumber="";
	boolean isInsert = false;
	if(id!=""&&password!=""){
		NoticeBoardUser ins = new NoticeBoardUser(id, passwordConfirm, name, email, phonenumber);
		dao.NoticeBoardUserAdd(ins);
		isInsert = true;
	}
	
	
	%>
	</box>

</body>
<script type="text/javascript">
	function loginGo(){
		location.replace("login.jsp");
	}
	
	function idConfirm(){
		var isIDConfirm = <%=isIDConfirm%>; // 계정이 존재하면 false
		document.querySelector("form").submit();// 한번전송해서 안됌.
		alert(isIDConfirm);
		/* if(isIDConfirm){
			alert("[안내메시지] 사용가능한 아이디 입니다.");
		}else{
			alert("[안내메시지] 이미 등록 되어있는 아이디입니다.\n 다른 아이디를 이용해주세요. ")
		} */
	}
	
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		if(confirm("[안내메시지]회원가입이 완료되었습니다. \n로그인 화면으로 이동하시겠습니까?")){
			location.href="login.jsp";
		}
	}
	
</script>
</html>