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
	#infoupdatebox{
		width:500px;
		height:700px;
		position:fixed;
		left:35%;
		/* border:1px solid black; */
	}
	#addresschage{
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
		width:500px;
		height:500px;
		/* border:1px solid black;  */
	}
	#signuptab th{
		font-size:20pt;
		height:25px;
	}
	#signuptab td{
		font-size:13pt;
		height:25px;
		/* border:1px solid black;  */
	}
	.input{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
		width:100%;
		height:100%
	}
	.email{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
		width:100%;
	}
	input[name=rrn1]{
		width:170px;
	}
	input[name=rrn2]{
		width:170px;
	}
	
	#signuptab td input[name=email1]{
		width:140px;
	}
	#signuptab td input[name=email2]{
		width:140px;
	}
	#infoupdatebox .button{
		width:120px;
		height:50px;
		border-radius:50px;
		background:rgb(142, 68, 173);
		color:white;
		border:none;
		font-size:15pt;
		position:absolute;
		bottom:-2%;
		left:60%;
	}
	#infoupdatebox .button:hover{
		background:white;
		color:rgb(142, 68, 173);
		border:3px solid rgb(142, 68, 173);
	}
	#infoupdatebox #doupdate{
		position:absolute;
		left:20%;
	}
	#infoupdatebox #cancel{
		position:absolute;
		right:20%;
	}
	
	#signuptab option[value=""][disabled] {
		display:none;
	}
	#emailaddress{
		border:none;
	}
	#signuptab td #bar{
		position:absolute;
		left:48%;
		font-size:18pt;
	}
</style>
<script>
	function userUpdate(){ // 수정은 입력하지 않았을 시, 그전데이터로 받아오기 기능넣기 
		var password = document.querySelector("[name=password]")
		var passwordV = password.value.trim();
		var passwordConfirm = document.querySelector("[name=passwordConfirm]")
		var passwordConfirmV = passwordConfirm.value.trim();
		var phonenumber = document.querySelector("[name=phonenumber]")
		var phonenumberV = phonenumber.value.trim();
		var address = document.querySelector("[name=address]")
		var addressV = address.value.trim();
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
		if(phonenumberV==""){
			alert("[안내메시지]휴대폰번호를 입력해주세요.")
			phonenumber.focus()
			return;
		}
		if(addressV==""){
			alert("[안내메시지]주소를 입력해주세요.")
			address.focus()
			return;
		}
		document.querySelector("#userUptForm").submit();
	}
</script>
</head>
<body>
	<jsp:include page="\frame\frame.jsp"></jsp:include>
	<form id=userUptForm>
			<%
				boolean isUpdate = false;
				boolean loginalert=false;
				Olddealuser Login = (Olddealuser)session.getAttribute("Login");
				boolean hasSess = Login!=null; // 로그인한계정정보가 null아니면 true
				
				if(hasSess){
					String []emailArr = Login.getEmail().split("@");
					String emailArr1 = emailArr[0];
					String emailArr2 = emailArr[1];
					String []rrnArr = Login.getRrn().split("-");
					String rrnArr1 = rrnArr[0];
					String rrnArr2 = rrnArr[1];
			%>
		<box id="infoupdatebox">
		<table id="signuptab">
			<tr><th colspan="2">회원정보</th></tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr><td>아이디</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="id" value="<%=Login.getId()%>" readonly/></td></tr>
			<tr><td>비밀번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="password" value="<%=Login.getPassword()%>"/></td></tr>
			<tr><td>비밀번호 확인</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="passwordConfirm" value="<%=Login.getPassword()%>"/></td></tr>
			<tr><td>이름</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="username" value="<%=Login.getUsername()%>" readonly/></td></tr>
			<tr><td>닉네임</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="nickname" value="<%=Login.getNickname()%>"/></td></tr>
			<tr><td>주민등록번호</td><td></td></tr>
			<tr><td><input class="input" type="text" name="rrn1" value="<%=rrnArr1%>" readonly/><span id="bar">-</span></td>
				<td><input class="input" type="password" name="rrn2" value="<%=rrnArr2%>" readonly/></td></tr>
			<tr><td>휴대폰 번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="phonenumber" value="<%=Login.getPhonenumber()%>"/></td></tr>
			<tr><td>주소</td><td></td></tr>
			<tr><td><input type="text" class="input" name="address" value="<%=Login.getAddress()%>"/></td>
				<td><input id="addresschage" type="button" value="주소변경"></td></tr>
			<tr><td><input class="input" type="text" name="detailaddress" value="<%=Login.getDetailaddress()%>"/></td>
					<td><input class="input" type="text" name="zipcode" value="<%=Login.getZipcode()%>"/></td></tr>
			<tr><td>이메일</td><td></td></tr>
			<tr><td><input class="email" type="text" name="email1" placeholder="이메일 아이디" size="15" value="<%=emailArr1%>">@
					<input class="email" type="text" name="email2" placeholder="이메일주소" size="15" value="<%=emailArr2%>"/>
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
		</table>
		<input class="button" id="doupdate" type="button" value="수정" onclick="userUpdate()">
		<input class="button" id="cancel" type="button" value="취소" onclick="location.href='userView.jsp'">
		</box>
	</form>
		<%
			userdao dao = new userdao();
			String id = request.getParameter("id"); if(id==null) id="";
			String password = request.getParameter("password"); if(password==null) password="";
			String passwordConfirm = request.getParameter("passwordConfirm"); if(passwordConfirm==null) passwordConfirm="";
			String username = request.getParameter("username"); if(username==null) username="";
			String nickname = request.getParameter("nickname"); if(nickname==null) nickname="";
			String rrn1 = request.getParameter("rrn1"); if(rrn1==null) rrn1="";
			String rrn2 = request.getParameter("rrn2"); if(rrn2==null) rrn2="";
			String rrn = rrn1 +"-"+rrn2;
			String phonenumber = request.getParameter("phonenumber"); if(phonenumber==null) phonenumber="";
			String zipcode = request.getParameter("zipcode"); if(zipcode==null) zipcode="";
			String address = request.getParameter("address"); if(address==null) address="";
			String detailaddress = request.getParameter("detailaddress"); if(detailaddress==null) detailaddress="";
			String email1 = request.getParameter("email1"); if(email1==null) email1="";
			String email2 = request.getParameter("email2"); if(email2==null) email2="";
			String email = email1+"@"+email2;
			if(id!=""&&password!=""){
				//public Olddealuser(String id, String password, String nickname, String phonenumber, 
				//String zipcode, String address,String detailaddress, String email)
				Olddealuser upt = new Olddealuser(id, passwordConfirm, nickname, phonenumber, zipcode, address, detailaddress, email);
				dao.userUpdate(upt); // null값은 프로필
				isUpdate = true;
				Olddealuser sel = new Olddealuser(Login.getId(),Login.getPassword());
				for(Olddealuser user:dao.userInfo(sel)){
					/* Olddealuser loginuser = 
							new Olddealuser(id, passwordConfirm,"회원", username, nickname, rrn, 
									phonenumber, zipcode, address, detailaddress, email); */
					session.setAttribute("Login",upt);
				}
			}
		}else{ 
			loginalert=true;
		} %>
	

</body>
<script type="text/javascript">
//----------------------------회원가입 등록 후 로그인 페이지 이동 기능-------------------------------
var isUpdate = <%=isUpdate%>; 
if( isUpdate ){
	if(confirm("[안내메시지]회원수정이 완료되었습니다. \n회원조회 화면으로 이동하시겠습니까?")){
		location.href="userView.jsp";
	}
}
//--------------------------미로그인으로 회원수정화면접속 시, 기능메서드-------------------------------------
	var alertis = <%=loginalert%>
	if(alertis){
		alert("[안내메시지]로그인을 해주세요.")
		location.href="login.jsp";
	}
//--------------------------아이디/이름 수정 불가기능메서드-------------------------------------
	var id = document.querySelector("[name='id']");
	var username = document.querySelector("[name='username']");
	var rrn1 = document.querySelector("[name='rrn1']");
	var rrn2 = document.querySelector("[name='rrn2']");
	id.onclick=function(){
		alert("[안내메시지]아이디는 수정 불가합니다.");
	}
	username.onclick=function(){
		alert("[안내메시지]이름은 수정 불가합니다.");
	}
	rrn1.onclick=function(){
		alert("[안내메시지]주민번호는 수정 불가합니다.");
	}
	rrn2.onclick=function(){
		alert("[안내메시지]주민번호는 수정 불가합니다.");
	}
//---------------------------------이메일 선택 기능-------------------------------
	var emailaddressSel=document.querySelector("#emailaddress");
	var email2input=document.querySelector("[name=email2]");
	emailaddressSel.onchange=function(){
		if(emailaddressSel.value=="직접입력하기"){
			email2input.focus()
			email2input.readOnly=false
		}
		else{
			email2input.value=emailaddressSel.value
			email2input.readOnly=true
		}
	}


</script>
</html>