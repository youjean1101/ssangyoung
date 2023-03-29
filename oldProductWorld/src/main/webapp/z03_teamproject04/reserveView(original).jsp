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
<title>중고월드 예약중인 상품 조회</title>
<style>
#reserveBox{
	border:4px solid lightgrey;
	border-radius:10px;
	width:1200px;
	height:700px;
	position:fixed;
	left:15%;
	top:12%;
}
#reserveBox #name{
	font-size:28pt;
	margin:15px 30px;
}
#reserveBox hr{
	width:95%;
	position:absolute;
	top:11%;
	left:3%;
	border:0;
    height:2px;
    background:lightgrey;
}
#reserveBox #reservelistTab{
	/* border:1px solid lightgrey; */
	width:100%;
	height:90%;
	position:absolute;
	top:10%;
}
#reserveBox #reservelistTab td{
	/* border:1px solid lightgrey; */
	width:25%;
	height:42.5%;
}
#reservelistTab #reserveproTab{
	/* border:1px solid lightgrey; */
	position:absolute;
	top:2%;
	margin:20px 20px;
}
#reserveBox #reservelistTab #reserveproTab td{
	width:100%;
	height:15px;
	/* border:2px solid black; */
}
#reserveproTab td #like{
	position:flex;
	right:0%;
	color:black;
} 
#reserveproTab td img{
	width:250px;
	height:140px;
	border-radius:5px;
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
#reserveBox .button{
	color:grey;
	border:none;
	background:none;
	font-size:18pt;
}
#reserveBox #buybox input[name=buy]{
	color:black;
}
#buybox{
	/* border:1px solid black; */
	width:85px;
	height:40px;
	position:absolute;
	bottom:5%;
	left:40%
	
}
#salesbox{
	/* border:1px solid black; */
	width:85px;
	height:40px;
	position:absolute;
	bottom:5%;
	left:50%;
}
#buybox hr{
	width:85%;
	border:0;
    height:2px;
    background:grey;
}
#salesbox hr{
	width:85%;
	border:0;
    height:2px;
    background:grey;
}


</style>
<script type="text/javascript">
	
</script>

</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<%
		reservedao reserveDao = new reservedao();
		cartlistdao cartlistDao = new cartlistdao();
		int cartCnt=0;
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null; 
		boolean loginalert=false;
		if(hasSess){
	%>
	<box id="reserveBox">
		<h2 id="name"><%=Login.getNickname() %>님의 예약중인 상품목록</h2>
		<hr>
		<table id="reservelistTab">
				<tr>
					<%for(Olderproduct productInfo:reserveDao.salesViewPro(Login.getId(), "예약중")){ 
						cartCnt = cartlistDao.cartProductCnt(productInfo.getProductno());
					%>
						<td>
							<table id="reserveproTab">
								<tr><td><img src=".\img\productPhoto\<%=productInfo.getProductname()%>.png"/></td></tr>
								<tr><td class="title"><%=productInfo.getProductname() %></td></tr>
								<tr><td class="local">
								<%=productInfo.getFaddressval()%> <%=productInfo.getSaddressval()%> <%=productInfo.getCaddressval()%>
								</td></tr>
								<tr>
								<td class="cost"><%=productInfo.getPrice()%>원&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<span id="like">♡ <%=cartCnt %></span></td></tr>
							</table>
						</td> <!-- 반복문으로 나타내야함 4X2테이블로 -->
				<%} %>
				</tr>
				<tr><td></td><td></td><td></td><td></td></tr>
			</table>
			<box id="buybox">
				<div id="buyhr"><hr></div><br>
				<input type="button" class="button" name="buy" value="구매"/>
			</box>
			<box id="salesbox">
				<div id="salesehr"></div><br>
				<input type="button" class="button" name="sales" value="판매"/>
			</box>
	</box>
	<%}else{
		loginalert=true;
		}
	%>
	
</body>
<script type="text/javascript">
//--------------------------미로그인으로 접속 시, 기능메서드-------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
}
//-------------------------예약 구매중인 상품 목록 조회기능메서드------------------------------------
var buyOb = document.querySelector("[name=buy]")
var buyhrOb = document.querySelector("#buyhr")
var saleshrOb = document.querySelector("#salesehr")
buyOb.onclick=function(){
	this.style.color="black"
	salesOb.style.color="grey"
	buyhrOb.innerHTML="<hr>"
	saleshrOb.innerHTML=""
	
}
//-------------------------예약 판메중인 상품 목록 조회기능메서드------------------------------------
var salesOb = document.querySelector("[name=sales]")
salesOb.onclick=function(){
	buyOb.style.color="grey"
	this.style.color="black"
	saleshrOb.innerHTML="<hr>"
	buyhrOb.innerHTML=""
}

</script>
</html>