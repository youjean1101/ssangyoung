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
		width:400px;
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
		height:80%
	}
	.email{
		border:none;
		border-bottom: solid 1px rgb(243, 156, 18);
		opacity:0.6;
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
</style>
<script>
	function userUpdate(){
		var password = document.querySelector("[name=password]")
		var passwordV = password.value.trim();
		var passwordConfirm = document.querySelector("[name=passwordConfirm]")
		var passwordConfirmV = passwordConfirm.value.trim();
		var phonenumber = document.querySelector("[name=phonenumber]")
		var phonenumberV = phonenumber.value.trim();
		var gender = document.querySelector("[name=gender]")
		var genderV = gender.value.trim();
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
		if(genderV==""){
			alert("[안내메시지]성별을 선택해주세요.")
			gender.focus()
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
				User loginUser = (User)session.getAttribute("loginUserInfo");
				boolean hasSess = loginUser!=null; // 로그인한계정정보가 null아니면 true
				
				String []emailArr = loginUser.getsEmail().split("@");
				String emailArr1 = emailArr[0];
				String emailArr2 = emailArr[1];
				String beforegender = loginUser.getsGender();
				//String gender = 
				if(hasSess){
			%>
		<box id="infoupdatebox">
		<table id="signuptab">
			<tr><th colspan="2">회원정보</th></tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr><td>아이디</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="id" value="<%=loginUser.getsId()%>" readonly/></td></tr>
			<tr><td>비밀번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="password" value="<%=loginUser.getsPassword()%>"/></td></tr>
			<tr><td>비밀번호 확인</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="password" name="passwordConfirm" value="<%=loginUser.getsPassword()%>"/></td></tr>
			<tr><td>이름</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="username" value="<%=loginUser.getsUsername()%>" readonly/></td></tr>
			<tr><td>휴대폰 번호</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="phonenumber" value="<%=loginUser.getsPhonenumber()%>"/></td></tr>
			<tr><td>생년월일</td><td></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="birthday" value="<%=loginUser.getsBirthday()%>"/></td></tr>
			<tr><td>성별</td><td></td></tr>
			<tr><td colspan="2"><input type="radio" name="gender" value="남성" selected>남성
								<input type="radio" name="gender" value="여성">여성</td></tr>
			<tr><td>주소</td><td></td></tr>
			<tr><td><input type="text" class="input" name="address" value="<%=loginUser.getsAddress()%>"/></td>
				<td><input id="addresschage" type="button" value="주소변경"></td></tr>
			<tr><td colspan="2"><input class="input" type="text" name="addressDetail" value="<%=loginUser.getsDetailaddress()%>"/></td></tr>
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
		<input class="button" id="cancel" type="button" value="취소" onclick="location.href='userInfoUpdate.jsp'">
		</box>
	</form>
		<%
			userdao dao = new userdao();
			String id = request.getParameter("id"); if(id==null) id="";
			String password = request.getParameter("password"); if(password==null) password="";
			String passwordConfirm = request.getParameter("passwordConfirm"); if(passwordConfirm==null) passwordConfirm="";
			String name = request.getParameter("name"); if(name==null) name="";
			String phonenumber = request.getParameter("phonenumber"); if(phonenumber==null) phonenumber="";
			String birthday = request.getParameter("birthday"); if(birthday==null) birthday="";
			String gender = request.getParameter("gender"); if(gender==null) gender="";
			String address = request.getParameter("address"); if(address==null) address="";
			String addressDetail = request.getParameter("addressDetail"); if(addressDetail==null) addressDetail="";
			String email1 = request.getParameter("email1"); if(email1==null) email1="";
			String email2 = request.getParameter("email2"); if(email2==null) email2="";
			String email = email1+"@"+email2;
			if(id!=""&&password!=""){
				//new User("test2","1234","프로필사진","010-7985-4444","20221231","여자","서울","홍대입구역","test2@daum.net")
				User upt = new User(id, passwordConfirm, null, phonenumber, birthday, gender, address, addressDetail, email);
				dao.userUpdate(upt); // null값은 프로필
				isUpdate = true;
				User sel = new User(loginUser.getsId(),loginUser.getsPassword());
				for(User user:dao.userInfo(sel)){
					User loginuser = new User(id,password,user.getsDiv(),user.getsProfileimg(),user.getsUsername(),user.getsPhonenumber(),
												user.getsBirthday(),user.getsGender(),user.getsAddress(),user.getsDetailaddress(),
												user.getsEmail(),user.getiPoint(),user.getiSalecount(),user.getiBuycount(),
												user.getiDeclarationcount()); //12개
					session.setAttribute("loginUserInfo",loginuser);
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
	id.onclick=function(){
		alert("[안내메시지]아이디는 수정 불가합니다.");
	}
	username.onclick=function(){
		alert("[안내메시지]이름은 수정 불가합니다.");
	}
//-------------------------여성/남성 selected 기능메서드------------------------------------
	var genderOb = <%=beforegender%>
	var genderck = document.querySelector("[name=gender]")
	if(genderOb=="여성"){
		genderck.checked = true;
	}


</script>
</html>