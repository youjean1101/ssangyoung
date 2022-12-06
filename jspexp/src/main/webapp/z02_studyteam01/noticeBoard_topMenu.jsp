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
	
	select option[value=""][disabled] {
		display:none;
	}
	select {
		border:none;
	}
	
	label>#profile{
		width:45px;
		height:40px;
	}
	
	box{
		position:fixed;
		top:10%;
		right:5%;
	}
	
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<h2 id="title"><a href="main.jsp"><img src=".\a_img\icon.jpg" />스터디 게시판</a></h2>
	<box>
		<label for="usermenu">
			<img id="profile" src=".\a_img\profile.jpg" />
			<select id="usermenu" onchange="menuChoice(this.form)">
				<option value="" disabled selected><%=session.getAttribute("loginID") %></option> 
				<option value="userDelete">회원탈퇴</option>
				<option value="logout">로그아웃</option>
				<option value="userSet">설정(개인정보수정)</option>
			</select></label>
		
	</box>
</body>
<script type="text/javascript">
	function menuChoice(form) {
		var usermenu = document.querySelector("#usermenu").value;
		if(usermenu=="userDelete"){
			location.replace("UserRemove.jsp");
		} 
		if(usermenu=="logout"){
			<%-- <%session.removeAttribute("loginID");%>
			<%session.removeAttribute("loginPassword");%>
			<%session.removeAttribute("loginName");%>
			<%session.removeAttribute("loginEmail");%>
			<%session.removeAttribute("loginPhone");%> --%>
			location.replace("login.jsp");
		}
		if(usermenu=="userSet"){
			location.replace("user_Info_edit.jsp");
		}
		
	}
</script>
</html>