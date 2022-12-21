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
		height:500px;
		border:1px solid black;
		position:fixed;
		left:35%;
		top:20%;
	/* 	margin:auto 300px; */
	}
	
	#infofield{
		width:100%;
	}
	#infofield legend{
		text-align:center;
		font-size:25pt;
	}
	#infofield #userInfotab{
	}
	#infofield #userInfotab td{
		text-align:center;
		
	}
	#infofield #userInfotab th{
		text-align:right;
	}
	
</style>

</head>
<body>
		<jsp:include page="frame.jsp"></jsp:include>
		<%
			User loginUser = (User)session.getAttribute("loginUserInfo");
			boolean hasSess = loginUser!=null; // 로그인한계정정보가 null아니면 true
			if(hasSess){
		%>
		<box id="infobox">
			<fieldset id="infofield">
				<legend><%=loginUser.getsUsername() %>님의 회원정보</legend>
				<table id="userInfotab">
					<tr><th>아이디:</th><td><%=loginUser.getsId() %></td></tr>
					<tr><th>권한:</th><td><%=loginUser.getsDiv() %></td></tr>
					<tr><th>이름:</th><td><%=loginUser.getsUsername() %></td></tr>
					<tr><th>생년월일:</th><td><%=loginUser.getsBirthday() %></td></tr>
					<tr><th>성별:</th><td><%=loginUser.getsGender() %></td></tr>
					<tr><th>휴대폰번호:</th><td><%=loginUser.getsPhonenumber() %></td></tr>
					<tr><th>주소:</th><td><%=loginUser.getsAddress() %></td></tr>
					<tr><th>상세주소:</th><td><%=loginUser.getsDetailaddress() %></td></tr>
					<tr><th>이메일:</th><td><%=loginUser.getsEmail() %></td></tr>
					<tr><th>포인트:</th><td><%=loginUser.getiPoint() %></td></tr>
					<tr><th>판매횟수:</th><td><%=loginUser.getiSalecount() %></td></tr>
					<tr><th>구매횟수:</th><td><%=loginUser.getiBuycount() %></td></tr>
					<tr><th>신고당한횟수:</th><td><%=loginUser.getiDeclarationcount() %></td></tr>
					</table>
			</fieldset>
		<%} %>
		<input type="button" value="수정하기" /><input type="button" value="뒤로가기" />
		</box>
		

</body>
<script type="text/javascript">

</script>
</html>