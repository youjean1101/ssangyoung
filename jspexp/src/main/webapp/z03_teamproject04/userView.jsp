<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="java.util.*"
    import="z02_teamproject4.*"
    %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 회원조회</title>
<style>
	#infobox{
		width:600px;
		height:600px;
		/* border:1px solid black; */
		position:fixed;
		top:15%;
		left:35%;
		margin:auto auto;
	}
	
	#infobox #infofield{
		width:100%;
	}
	#infofield legend{
		text-align:center;
		font-size:25pt;
	}
	#infofield #userInfotab{
		width:100%;
	}
	#infofield #userInfotab td{
		text-align:center;
		width:70%;
		font-size:14pt;
		background:lightyellow;
		border:2px solid white;
		
	}
	#infofield #userInfotab th{
		text-align:right;
		width:30%;
		font-size:18pt;
	}
	#infobox .button{
		border:4px solid rgb(142, 68, 173);
		background:white;
		color:rgb(142, 68, 173);
		width:40%;
		height:50px;
		font-size:16pt;
		font-weight:bold;
		position:absolute;
		bottom:-5%;
	}
	input[value="수정하기"]{
		position:absolute;
		left:12%;
	}
	input[value="뒤로가기"]{
		position:absolute;
		right:5%;
	}
	#infobox .button:hover{
		background:rgb(142, 68, 173);
		color:white;
	}
</style>

</head>
<body>
		<jsp:include page="\frame\frame.jsp"></jsp:include>
		<%
			boolean loginalert=false;
			Olddealuser Login = (Olddealuser)session.getAttribute("Login");
			boolean hasSess = Login!=null; // 로그인한계정정보가 null아니면 true
			if(hasSess){
		%>
		<box id="infobox">
			<fieldset id="infofield">
				<legend><%=Login.getUsername() %>님의 회원정보</legend>
				<table id="userInfotab">
					<tr><th>아이디:</th><td><%=Login.getId() %></td></tr>
					<tr><th>권한:</th><td><%=Login.getUserdiv() %></td></tr>
					<tr><th>이름:</th><td><%=Login.getUsername() %></td></tr>
					<tr><th>닉네임:</th><td><%=Login.getNickname()%></td></tr>
					<tr><th>주민번호:</th><td><%=Login.getRrn() %></td></tr>
					<tr><th>휴대폰번호:</th><td><%=Login.getPhonenumber() %></td></tr>
					<tr><th>주소:</th><td><%=Login.getAddress() %></td></tr>
					<tr><th>상세주소:</th><td><%=Login.getDetailaddress() %></td></tr>
					<tr><th>우편번호:</th><td><%=Login.getZipcode() %></td></tr>
					<tr><th>이메일:</th><td><%=Login.getEmail() %></td></tr>
					<tr><th>포인트:</th><td><%=Login.getPoint() %></td></tr>
					<tr><th>판매횟수:</th><td><%=Login.getSalecount() %></td></tr>
					<tr><th>구매횟수:</th><td><%=Login.getBuycount() %></td></tr>
					<tr><th>신고당한횟수:</th><td><%=Login.getDeclarationcount() %></td></tr>
					</table>
			</fieldset>
		<input class="button" type="button" value="수정하기" onclick="location.href='userInfoUpdate.jsp'"/>
		<input class="button" type="button" value="뒤로가기" onclick="location.href='MyPage.jsp'"/>
		</box>
		<%}else{ 
			loginalert=true;
		} %>
		

</body>
<script type="text/javascript">
	var alertis = <%=loginalert%>
	if(alertis){
		alert("[안내메시지]로그인을 해주세요.")
		location.href="login.jsp";
	}
</script>
</html>