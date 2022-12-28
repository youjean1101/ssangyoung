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
<title>중고월드 찜 목록조회</title>
<style>
	#cartBox{
		border:4px solid lightgrey;
		border-radius:10px;
		width:1200px;
		height:600px;
		position:fixed;
		left:15%;
		top:12%;
	}
	#cartBox #name{
		font-size:28pt;
		margin:15px 15px;
	}
	#cartBox #cartlistTab{
		/* border:1px solid lightgrey; */
		width:100%;
		height:90%;
		position:absolute;
		top:10%;
	}
	#cartBox #cartlistTab td{
		/* border:1px solid lightgrey; */
		width:25%;
		height:42.5%;
	}
	#cartBox #cartlistTab>#cartproTab{
		/* border:1px solid lightgrey; */
		position:absolute;
		top:0%;
		
	}
	#cartBox #cartlistTab #cartproTab th{
		width:10%;
	}
	#cartBox #cartlistTab #cartproTab td{
		width:90%;
		height:20px;
	}
	#cartproTab td #like{
		position:flex;
		right:0%;
		color:black;
	} 
	#cartproTab td img{
		width:100%;
		height:160px;
	}
	#cartproTab input[name="cartremove"]{
		width:20px;
		height:20px;
	}
	input[name="cartCancel"]{
	background:rgb(142, 68, 173);
	color:white;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	position:absolute;
	right:0%;
	bottom:-10%;
	font-size:14pt;
	font-weight:bold;
	width:140px;
	height:50px;
	}
	.nextorprev{
		background:white;
		color:grey;
		height:60px;
		width:60px;
		border:5px solid grey;
		border-radius:60px;
		font-size:30pt;
		line-height:0px;
		font-size:30pt;
		box-shadow:3px 3px 3px grey;
	}
	input[name="previous"]{
		position:absolute;
		left:45%;
		bottom:-12%;
	}
	input[name="next"]{
		position:absolute;
		left:52%;
		bottom:-12%;
	}
	input[name="previous"]:hover{
		background:white;
		color:black;
		border:5px solid black;
	}
	input[name="next"]:hover{
		background:white;
		color:black;
		border:5px solid black;
	}
	input[name="previous"]:active{
		background:white;
		color:black;
		border:5px solid black;
		box-shadow : none;
	}
	input[name="next"]:active{
		background:white;
		color:black;
		border:5px solid black;
		box-shadow : none;
	}
	.title{
		font-size:13pt;
		font-weight:bold;
	}
	.local{
		font-size:10pt;
		color:grey;
	}
	.cost{
		font-size:10pt;
		color:orange;
	}
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<%
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		cartlistdao cartlistDao = new cartlistdao();
		boolean hasSess = Login!=null; 
		boolean loginalert=false;
		int cartCnt=0;
		if(hasSess){
	%>
	<form>
		<box id="cartBox">
			<h2 id="name"><%=Login.getUsername() %>님의 찜목록♥</h2>
			<table id="cartlistTab">
				<tr>
					<%for(Olderproduct productInfo:cartlistDao.cartProductInfo(Login.getId())){ 
						cartCnt = cartlistDao.cartProductCnt(productInfo.getProductno());
					%>
					<td>
						<table id="cartproTab">
							<tr><th><input type="checkbox" name="cartremove" value="<%=productInfo.getProductno()%>"/></th>
								<td><img src=".\img\productPhoto\<%=productInfo.getProductname()%>.png"/></td></tr><!-- 이미지테이블 생성 시, 기능구현 /찜수 기능구현 -->
							<tr><th></th><td class="title"><%=productInfo.getProductname() %></td></tr>
							<tr><th></th><td class="local"><%=productInfo.getFaddressval()%> <%=productInfo.getSaddressval()%> <%=productInfo.getCaddressval()%></td></tr>
							<tr><th></th><td class="cost"><%=productInfo.getPrice()%>원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																<span id="like">♡ <%=cartCnt %></span></td></tr>
						</table>
					</td> <!-- 반복문으로 나타내야함 4X2테이블로 -->
					<%} %>
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td>
				</tr>
			</table>
			<input type="button" name="cartCancel" value="찜 삭제하기" onclick="#"/>
			<input type="button" class="nextorprev" name="previous" value="◀"/>
			<input type="button" class="nextorprev" name="next" value="▶"/>
		</box>
	</form>
	<%}else{ 
		loginalert=true;
	} %>
</body>
<script type="text/javascript">
//--------------------------미로그인으로 회원수정화면접속 시, 기능메서드-------------------------------------
	var alertis = <%=loginalert%>
	if(alertis){
		alert("[안내메시지]로그인을 해주세요.")
		location.href="login.jsp";
	}
</script>
</html>