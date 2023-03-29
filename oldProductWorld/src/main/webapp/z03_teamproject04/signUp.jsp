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
<title>중고월드 회원가입</title>
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
		left:35%;
		top:12%;
		width:500px;
		height:500px;
		/* border:1px solid black; */
	}
	#signuptab th{
		font-size:18pt;
	}
	#signuptab td{
		font-size:9pt;
		height:20px;
	}
	.input{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
		width:100%;
		height:100%
	}
	input[name=rrn1]{
		width:180px;
	}
	input[name=rrn2]{
		width:180px;
	}
	
	#signuptab td input[name=email1]{
		width:140px;
		
	}
	#signuptab td input[name=email2]{
		width:140px;
		
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
	.email{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
		width:100%;
	}
	#signuptab option[value=""][disabled] {
		display:none;
	}
	#signuptab td #emailaddress{
		border:none;
		width:130px;
	}
	.guide{
		color:red;
	}
	#signuptab td #bar{
		position:absolute;
		left:48%;
		top:50%;
		font-size:18pt;
	}
</style>
<script>
	function useradd(){
		var id = document.querySelector("[name=id]")
		var idV = id.value.trim();
		var password = document.querySelector("[name=password]")
		var passwordV = password.value.trim();
		var passwordConfirm = document.querySelector("[name=passwordConfirm]")
		var passwordConfirmV = passwordConfirm.value.trim();
		var username = document.querySelector("[name=username]")
		var usernameV = username.value.trim();
		var rrn1 = document.querySelector("[name=rrn1]")
		var rrn1V = rrn1.value.trim();
		var rrn2 = document.querySelector("[name=rrn2]")
		var rrn2V = rrn2.value.trim();
		var phonenumber = document.querySelector("[name=phonenumber]")
		var phonenumberV = phonenumber.value.trim();
		var address = document.querySelector("[name=address]")
		var addressV = address.value.trim();
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
		if(usernameV==""){
			alert("[안내메시지]이름를 입력해주세요.")
			username.focus()
			return;
		}
		if(rrn1V==""){
			alert("[안내메시지]주민번호를 입력해주세요.")
			rrn1.focus()
			return;
		}
		if(rrn2V==""){
			alert("[안내메시지]주민번호 뒷자리를 입력해주세요.") //유효성체크 하기(UNIQUE)
			rrn2.focus()
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
		document.querySelector("#singupform").submit();
	}
</script>
</head>
<body>
	<jsp:include page="\frame\frame.jsp"></jsp:include>
	<form id="singupform">
		<table id="signuptab">
			<tr><th colspan="2">회원가입</th></tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr><td><span class="guide">*</span> 아이디</td><td></td></tr>
			<tr><td><input class="input" type="text" name="id" placeholder="아이디"/></td>
				<td><input class="button" type="button" id="ckIdBtn" value="중복확인"></td></tr>
			<tr><td><span class="guide">*</span> 비밀번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="password" placeholder="비밀번호" /></td></tr>
			<tr><td><span class="guide">*</span> 비밀번호 확인</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="passwordConfirm" placeholder="비밀번호 확인" /></td></tr>
			<tr><td><span class="guide">*</span> 이름</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="username" placeholder="실명을 입력하세요." /></td></tr>
			<tr><td> 닉네임</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="nickname" placeholder="8자안으로 설정하세요." /></td></tr>
			<tr><td><span class="guide">*</span> 주민등록번호</td><td></td></tr>
			<tr><td><input class="input" type="text" name="rrn1" placeholder="주민번호 앞 6자리" /><span id="bar">-</span></td>
								<td><input class="input" type="password" name="rrn2" placeholder="주민번호 뒤 7자리" /></td></tr>
			<tr><td><span class="guide">*</span> 휴대폰 번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="phonenumber" placeholder="'-'구분없이 입력" /></td></tr>
			<tr><td><span class="guide">*</span> 주소</td><td></td></tr>
			<tr><td><input type="text" class="input" name="address" placeholder="주소를 검색해주세요."/></td>
				<td><input class="button" type="button" value="주소검색"></td></tr>
			<tr><td><input class="input" type="text" name="detailaddress" placeholder="상세주소를 입력해주세요."/></td>
				<td><input class="input" type="text" name="zipcode" placeholder="우편번호를 입력해주세요."/></td></tr>
			<tr><td>이메일</td><td></td></tr>
			<tr><td id="emailtd"><input class="email" type="text" name="email1" placeholder="이메일 아이디"/>@
						<input class="email" type="text" name="email2" placeholder="이메일주소"/></td>
				<td><select id="emailaddress">
						<option selected disabled value="">메일선택하기</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="google.com">google.com</option>
						<option value="usedDeal.com">usedDeal.com</option>
						<option value="직접입력하기">직접입력하기</option>
					</select>
				</td></tr>
			<tr><td><span class="guide">*</span> 은 필수입력란</td></tr>
			<tr><td> </td><td></td></tr>
			<tr><td colspan="2"><input id="dosignup" type="button" value="중고월드 시작하기" onclick="useradd()"></td></tr>
		</table>
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
		String rrn = rrn1+"-"+rrn2;
		String phonenumber = request.getParameter("phonenumber"); if(phonenumber==null) phonenumber="";
		String zipcode = request.getParameter("zipcode"); if(zipcode==null) zipcode="";
		String address = request.getParameter("address"); if(address==null) address="";
		String detailaddress = request.getParameter("detailaddress"); if(detailaddress==null) detailaddress="";
		String email1 = request.getParameter("email1"); if(email1==null) email1="";
		String email2 = request.getParameter("email2"); if(email2==null) email2="";
		String email = email1+"@"+email2;
/* 		public Olddealuser(String id, String password, String userdiv, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email)*/
		boolean isInsert = false;
		if(id!=""&&password!=""){
			Olddealuser ins = 
					new Olddealuser(id, passwordConfirm,"회원", username, nickname, rrn, 
							phonenumber, zipcode, address, detailaddress, email);
			dao.userAdd(ins); 
			isInsert = true;
		}
	%>
</body>
<script type="text/javascript">
//----------------------------회원가입 등록 후 로그인 페이지 이동 기능-------------------------------
	 var isInsert = <%=isInsert%>; 
	if( isInsert ){
		if(confirm("[안내메시지]회원가입이 완료되었습니다. \n로그인 화면으로 이동하시겠습니까?")){
			location.href="login.jsp";
		}
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
//-------------------------------중복 확인 기능----------------------------------------------------	
	var idOb = document.querySelector("[name=id]")
	var ckIdBtnOb = document.querySelector("#ckIdBtn")
	ckIdBtnOb.onclick=function(){
		callAjax(idOb.value)
	}
	function callAjax(idVal){
		var xhr = new XMLHttpRequest()
		xhr.open("get","idCheck.jsp?id="+idVal,true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				console.log(xhr.responseText)
				var data = JSON.parse(xhr.responseText) // JSON객체로 변환
				// {"hasMember":false}
				var dlist = data.contacts
				if(data.hasMember){
					alert("[안내메시지]등록된 아이디가 있습니다.\n 다른 아이디를 입력해주세요.")
					idOb.value=""
				}else{
					alert("[안내메시지]등록 가능합니다.")
					idOb.readOnly=true
				}
			}
		}
	}
</script>
</html>