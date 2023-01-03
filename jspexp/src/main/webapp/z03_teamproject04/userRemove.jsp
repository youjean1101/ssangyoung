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
<title>중고월드 회원탈퇴</title>
<style>
	.button{
		color:rgb(243, 156, 18);
		background:white;
		border:3px solid rgb(243, 156, 18);
		width:200px;
		height:50px;
		font-size:17pt;
		font-weight:bord;
	}
	input[type=submit]:hover{
		color:red;
		border:3px solid red;
	}
	input[type=submit]:active{
		color:white;
		border:3px solid red;
		background:red;
	}
	input[type=button]:hover{
		color:green;
		border:3px solid green;
	}
	input[type=button]:active{
		color:white;
		border:3px solid green;
		background:green;
	}
</style>
<script type="text/javascript">
	function cancel(){
		window.close();
	} 
	/* if(confirm("[안내메시지]정말로 회원탈퇴를 하시겠습니까?")){
		go()
	}
	function go(){
		document.form.submit();
	} */
</script>
</head>
<body>
	<%
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		//boolean hasSess = loginUser!=null; // 로그인한계정정보가 null아니면 true
	%>
	<form method="get">
		<input type="hidden" name="id" value=<%=Login.getId()%> />
		<input type="hidden" name="password" value=<%=Login.getPassword()%> />
		<table>
			<tr><th colspan="2"><h2>* 정말로 회원탈퇴를 하시겠습니까?</h2></th></tr>
			<tr><td><input class="button" type="submit" value="확인" /></td>
			<td><input class="button" type="button" value="취소" onclick="cancel()"/></td></tr>
		</table>
	</form>
	<%
		String id = request.getParameter("id");  if(id==null) id="";
		String password = request.getParameter("password"); if(password==null) password="";
		boolean isInsert = false;
		if(id!=""&&password!=""){
			userdao dao = new userdao();
			dao.userdel(new Olddealuser(id,password));
			isInsert = true;
		}
	%>
</body>
<script type="text/javascript">
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		alert("[안내메시지]회원탈퇴가 완료되었습니다.")
		go();
	}
	function go(){
		window.close();
		window.open('sessionremove.jsp')
	}
		
</script>
</html>