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
/*내가쓴 css */
#reserveBox{
	border:4px solid lightgrey;
	border-radius:10px;
	width:1200px;
	height:700px;
	position:fixed;
	left:20%;
	top:12%;
}
#reserveBox #name{
	font-size:28pt;
	margin:15px 30px;
}
#reserveBox hr{
	width:92%;
	position:absolute;
	top:11%;
	left:3%;
	border:0;
    height:2px;
    background:lightgrey;
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
	width:70%;
	border:0;ㅛㅕ
    height:2px;
    background:grey;
}
#salesbox hr{
	width:70%;
	border:0;
    height:2px;
    background:grey;
}
#reservframeposition iframe{
	border:none;
}
#reserveBox h4{
	position:absolute;
	top:-7%;
	left:5%;
	font-size:11pt;
	color:rgb(74 79 90);
	font-weight:-100;
}
</style>
<script type="text/javascript">
	
</script>

</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<%
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null; 
		boolean loginalert=false;
		if(hasSess){
	%>
	<box id="reserveBox">
		<h2 id="name"><%=Login.getUsername() %>님의 예약중인 상품목록</h2>
		<hr>
		<div id="reservframeposition"></div>
			<box id="buybox">
				<div id="buyhr"><hr></div><br>
				<input type="button" class="button" name="buy" value="구매"/>
			</box>
			<box id="salesbox">
				<div id="salesehr"></div><br>
				<input type="button" class="button" name="sales" value="판매"/>
			</box>
		<h4>* 상품 클릭으로 예약시간 확인 가능</h4>
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
var framePosition =document.querySelector("#reservframeposition")
framePosition.innerHTML = "<iframe src='reserveView_buy.jsp' name='buyreserve' width='100%' height='700'></iframe>"
buyOb.onclick=function(){
	this.style.color="black"
	salesOb.style.color="grey"
	buyhrOb.innerHTML="<hr>"
	saleshrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='reserveView_buy.jsp' name='buyreserve' width='100%' height='700'></iframe>"
	
}
//-------------------------예약 판메중인 상품 목록 조회기능메서드------------------------------------
var salesOb = document.querySelector("[name=sales]")
salesOb.onclick=function(){
	buyOb.style.color="grey"
	this.style.color="black"
	saleshrOb.innerHTML="<hr>"
	buyhrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='reserveView_sales.jsp' name='salesreserve' width='100%' height='700'></iframe>"
}

</script>
</html>