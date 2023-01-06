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
<title>중고월드 top메뉴</title>

<style>
	#topmenutab{
		width:100%;
		height:18px;
		background:rgb(243, 156, 18);
	}
	/* #topmenutab td{
		border:1px solid black;
		text-align:right;
	} */
	#menubar ul{/*여백과 패딩 처리*/
		margin:0;
		padding:0;
		width:600px;
	}
	.textclass{
		display:inline-block;
		list-style-type:none;
		padding:5px 15px;
		color:white;
		text-decoration:none;
		font-size:16pt;
		font-weight: bold;
	}
	.textclass:hover{
		color:purple;
	}
	
	img[name=logo]{
		width:120px;
		height:60px;
	}
	img[name=indexclick]{
		width:55px;
		height:35px;		
	}
	img[name=profile]{
		width:80px;
		height:70px;
	}
	input[name=indexblock]{
		width:250px;
		height:30px;
		border:none;
	}
	
  	#menubar ul td{
    	width:12%;
    	font-size:13pt;
  	}
	#usermenu{
		width:140px;
		height:30px;
		border:none;
		border-radius:2px;
	}
	#usermenu option[value=""][disabled] {
		display:none;
	}
	#id{
		background:rgb(243, 156, 18);
		color:white;
	}
	#indexbutton{
		width:55px;
		height:35px;
		border:none;
		background:rgb(243, 156, 18);
	}
	#topmenutab>td>#countTab>td{
		position:absolute;
	}
	#countTab td{
		text-align:right;
		font-size:8pt;
		/* background:white; */
		width:90%;
	}
</style>
</head>
<body>
	
	<table id="topmenutab">
		<nav id="menubar">
			<ul>
				<tr>
					<td><a href="main.jsp"><img name="logo" src=".\img\olderword Logo.png" /></a></td>
					<td width="12.5%"><a class="textclass" href="productDetailView2.jsp">구매하기</a></td>
					<td width="12.5%"><a class="textclass" href="#">판매하기</a></td>
					<td width="20%"><a class="textclass" href="#">문의하기</a></td>
					<form method="get">
						<td width="8%">
						<input name="indexblock" type="text" placeholder="검색 혹은 장소 입력"/>
						</td>
						<td>
						<button id="indexbutton" type="submit"><img name="indexclick" src=".\img\indexclick.png" alt=""></button>
					</form>
					</td>
					<%
						Olddealuser Login = (Olddealuser)session.getAttribute("Login");
						boolean hasSess = Login!=null; // 로그인한계정정보가 null아니면 true
						if(hasSess){
					%>
					<td width="14%">
						<table id="countTab">
							<tr><td>나의 판매횟수: </td><td><%=Login.getSalecount() %>회</td></tr>
							<tr><td>나의 구매횟수: </td><td><%=Login.getBuycount() %>회</td></tr>
							<tr><td>나의 신고당한횟수: </td><td><%=Login.getDeclarationcount() %>회</td></tr>
						</table>
					</td>
						<td width="5%">
					<label for="usermenu">
						<img name="profile" src=".\img\profile.png" />
						</td>
						<td>
						<select id="usermenu">
							<option value="" disabled selected><%=Login.getId() %>님</option>
							<option value="userSet">회원정보수정</option>
							<option value="logout">로그아웃</option>
							<option value="MyPage">MyPage</option>
							<option value="userDelete">회원탈퇴</option>
					
					<%}else{ %>
					
							<td width="5%">
						<label for="usermenu">
							<img name="profile" src=".\img\profile.png" />
							</td>
							<td>
							<select id="usermenu" onchange="menuChoice(this.form)">
							<option value="" disabled selected>로그인을 해주세요.</option>
							<option value="loginGo">로그인 하러가기</option>
							<option value="mainGo">메인으로 가기</option>
					<%} %>
						</select>
						</td>
					</label>
				</tr>
			</ul>
		</nav>
	</table>
	

</body>
<script type="text/javascript">
	/* var profile = document.querySelector("[name=profile]")
	var usermenu = document.querySelector("#usermenu")
	var li = document.querySelector("li")
	
	profile.onclick=function(){
		//alert()
		document.getElementById('usermenu').size = 4
		li.show();
	} */
//----------------------------메뉴선택에따른 페이지이동 기능메서드-------------------------------
	var usermenu = document.querySelector("#usermenu")
	usermenu.onclick=function(){
		if(usermenu.value=="userSet"){
			location.href="userInfoUpdate.jsp"
			usermenu.value=""
			
		}else if(usermenu.value=="logout"){
			/* session.removeAttribute("loginUserInfo"); */
			/* location.href="main.jsp" */
			window.close();
			location.href="sessionremove.jsp";
			usermenu.value=""
			
		}else if(usermenu.value=="MyPage"){
			location.href="MyPage.jsp"
			usermenu.value=""
			
		}else if(usermenu.value=="userDelete"){
			window.open("userRemove.jsp", "탈퇴확인하기", "width=500, height=210, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			//window.close();
			//location.href="userRemove.jsp"
			usermenu.value=""
		}else if(usermenu.value=="loginGo"){
			location.href="login.jsp"
			usermenu.value=""
			
		}else if(usermenu.value=="mainGo"){
			location.href="main.jsp"
			usermenu.value=""
		}
	}
	

</script>
</html>