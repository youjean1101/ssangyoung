<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="java.util.*"
    import="z02_teamproject4.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 회원정보수정</title>
<style>
	.button{
		border-radius:13px;
		background:rgb(142, 68, 173);
		color:white;
		border:none;
		width:100px;
	}
	#signuptab{
		position:fixed;
		left:38%;
		top:11%;
		width:400px;
		height:500px;
		/* border:1px solid black;  */
	}
	#signuptab th{
		font-size:18pt;
	}
	#signuptab td{
		font-size:9pt;
		height:20px;
		/* border:1px solid black;  */
	}
	.input{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
		width:100%;
		height:80%
	}
	.email{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
	}
	#dosignup{
		width:100%;
		height:50px;
		border-radius:50px;
		background:rgb(142, 68, 173);
		color:white;
		border:none;
		font-size:15pt;
	}
	#signuptab option[value=""][disabled] {
		display:none;
	}
	#emailaddress{
		border:none;
	}
</style>

</head>
<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<form>
			<%
				User loginUser = (User)session.getAttribute("loginUserInfo");
				boolean hasSess = loginUser!=null; // 로그인한계정정보가 null아니면 true
				if(hasSess){
			%>
		<table id="signuptab">
			<tr><th colspan="2">회원정보</th></tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr><td>아이디</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="id" value="<%=loginUser.getsId()%>"/></td></tr>
			<tr><td>비밀번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="password" value="<%=loginUser.getsPassword()%>"/></td></tr>
			<tr><td>비밀번호 확인</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="passwordconfirm" value="<%=loginUser.getsPassword()%>" /></td></tr>
			<tr><td>이름</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="name" value="<%=loginUser.getsUsername()%>"/></td></tr>
			<tr><td>휴대폰 번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="phonenumber" value="<%=loginUser.getsPhonenumber()%>"/></td></tr>
			<tr><td>생년월일</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="birthday" value="<%=loginUser.getiPoint()%>"/></td></tr>
			<tr><td>성별</td><td></td></tr>
			<tr><td colspan="2"><input type="radio" name="gender" value="남성">남성
								<input type="radio" name="gender" value="여성">여성</td></tr>
			<tr><td>주소</td><td></td></tr>
			<tr><td><input type="text" class="input" name="address" value="<%=loginUser.getsAddress()%>"/></td>
				<td><input class="button" type="button" value="주소변경"></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="address" value="<%=loginUser.getsDetailaddress()%>"/></td></tr>
			<tr><td>이메일</td><td></td></tr>
			<tr><td><input class="email" type="text" name="email1" placeholder="이메일 아이디" size="15" value="<%=loginUser.getsEmail()%>">@
					<input class="email" type="text" name="email2" placeholder="이메일주소" size="15" value="<%=loginUser.getsEmail()%>"/>
				</td>
				<td><select id="emailaddress">
						<option selected disabled value="">메일선택하기</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="google.com">google.com</option>
						<option value="직접입력하기">직접입력하기</option>
					</select>
				</td></tr>
			<tr><td> </td><td></td></tr>
			<tr><td colspan="2"><input id="dosignup" type="submit" value="중고월드 시작하기"></td></tr>
		</table>
			<%} %>
	</form>

</body>
<script type="text/javascript">
	var 
</script>
</html>