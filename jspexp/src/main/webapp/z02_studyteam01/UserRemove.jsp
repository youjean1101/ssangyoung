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
	th{
		background:yellow;
	}
	legend{
		text-align:center;
		font-size: 20pt;
	}
	fieldset{
		width:250px;
		height:180px;
		position:fixed;
		left:35%;
		top:20%;
	}
	form input[type="text"]{
		display:none;
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
			<input type="button" value="탈퇴하기" onclick="userRemove()"/>
			<input type="button" value="취소" onclick="mainGo()"/>
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