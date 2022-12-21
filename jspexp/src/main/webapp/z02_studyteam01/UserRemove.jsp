<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="z01_studyteam01.vo.*" 
    import="z01_studyteam01.*" 
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td,th{
		border:10px solid white;
	}
	th{
		background:lightgreen;
		font-size:20pt;
		text-align:right;
		width:200px;
		height:50px;
	}
	td{
		font-size:20pt;
		text-align:center;
		width:350px;
		height:50px;
	}
	legend{
		text-align:center;
		font-size: 20pt;
	}
	fieldset{
		width:500px;
		height:400px;
		position:fixed;
		left:30%;
		top:20%;
	}
	form input[type="text"]{
		display:none;
	}
	form input[type="button"]{
		background:white;
		color:green;
		border:2px solid green;
		font-size:20pt;
		text-align:center;
		width:200px;
		height:60px;
	}
	 form input[name="remove"]{
		position:fixed;
		left:35%;
		bottom:10%;
	}
	form input[name="cancel"]{
		position:fixed;
		right:32%;
		bottom:10%;
	}
	
</style>
<script type="text/javascript">
	function userRemove(){
		if(confirm("[안내메시지]정말로 회원탈퇴를 하시겠습니까?")){
			document.querySelector("form").submit();
		}
	}
</script>

</head>
<body>
	
		<form>
			<fieldset>
				<legend>회원님의 정보</legend>
				<table>
						<tr><th>ID : </th><td><%=session.getAttribute("loginID") %></td></tr>
						<tr><th>PASSWORD : </th><td><%=session.getAttribute("loginPassword") %></td></tr>
						<tr><th>이름 : </th><td><%=session.getAttribute("loginName") %></td></tr>
						<tr><th>이메일 : </th><td><%=session.getAttribute("loginEmail") %></td></tr>
						<tr><th>전화번호 : </th><td><%=session.getAttribute("loginPhone") %></td></tr>
				</table>
			</fieldset>
				<input type="text" name="id" value=<%=session.getAttribute("loginID") %> />
				<input type="text" name="password" value=<%=session.getAttribute("loginPassword") %> />
				<input type="button" value="탈퇴하기" name="remove" onclick="userRemove()"/>
				<input type="button" value="취소" name="cancel" onclick="mainGo()"/>
		</form>
	<%
		String id = request.getParameter("id");  if(id==null) id="";
		String password = request.getParameter("password"); if(password==null) password="";
		boolean isInsert = false;
		if(id!=""&&password!=""){
			studyteamDao dao = new studyteamDao();
			dao.userRemove(new NoticeBoardUser(id,password));
			isInsert = true;
		}
	%>
</body>
<script type="text/javascript">
	function mainGo(){
		location.replace("main.jsp");
	}
	
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		alert("[안내메시지]회원탈퇴가 완료되었습니다. \n로그인 화면으로 이동합니다.")
		location.href="login.jsp";
	}
	
</script>
</html>