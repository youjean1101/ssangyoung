<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탑메뉴</title>

<style>
	#topmenutab{
		width:100%;
		height:18px;
		background:rgb(243, 156, 18);
	}
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
		font-size:14pt;
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
	}
	#menubar ul table{
    	width:100%;
  	}
  	#menubar ul table td{
    	width:12%;
    	font-size:13pt;
  	}
	#usermenu{
		width:100px;
		height:30px;
		border:none;
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
	
	
</style>

</head>
<body>
	<table id="topmenutab">
		<nav id="menubar">
			<ul>
				<tr>
					<td><a href="#"><img name="logo" src=".\img\olderword Logo.png" /></a></td>
					<td width="12.5%"><a class="textclass" href="#">구매하기</a></td>
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
					<td width="15%"></td>
						<td width="5%">
					<label for="usermenu">
						<img name="profile" src=".\img\profile.png" />
						</td>
						<td>
						<select id="usermenu" onchange="menuChoice(this.form)">
							<option value="" disabled selected>himan님</option>
							<option value="userSet">회원정보수정</option>
							<option value="logout">로그아웃</option>
							<option value="MyPage">MyPage</option>
							<option value="userDelete">회원탈퇴</option>
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

</script>
</html>