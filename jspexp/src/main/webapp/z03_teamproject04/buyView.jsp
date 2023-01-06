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
<title>중고월드 구매내역</title>
<script type="text/javascript">
</script>
<style>
	#buyViewBox{
		border:4px solid lightgrey;
		border-radius:10px;
		width:1200px;
		height:700px;
		position:fixed;
		left:20%;
		top:12%;
	}
	#buyViewBox #name{
		font-size:28pt;
		margin:15px 30px;
	}
	#buyViewBox hr{
		width:92%;
		position:absolute;
		top:11%;
		left:3%;
		border:0;
	    height:2px;
	    background:lightgrey;
	}
	#buyViewBox .button{
		color:grey;
		border:none;
		background:none;
		font-size:18pt;
	}
	#buyViewBox #reservebox input[name=reserve]{
		color:black;
	}
	#reservebox{
		/* border:1px solid black; */
		width:85px;
		height:40px;
		position:absolute;
		bottom:5%;
		left:40%
		
	}
	#dealSuccessbox{
		/* border:1px solid black; */
		width:85px;
		height:40px;
		position:absolute;
		bottom:5%;
		left:50%;
	}
	#reservebox hr{
		width:85%;
		border:0;
	    height:2px;
	    background:grey;
	}
	#dealSuccessbox hr{
		width:120%;
		border:0;
	    height:2px;
	    background:grey;
	}
	#buyViewframeposition iframe{
		border:none;
		scroll:no;
	}
</style>
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
	<box id="buyViewBox">
		<h2 id="name"><%=Login.getUsername()%>님의 구매내역</h2>
		<hr>
		<div id="buyViewframeposition"></div>
			<box id="reservebox">
				<div id="reservehr"><hr></div><br>
				<input type="button" class="button" name="reserve" value="예약중"/>
			</box>
			<box id="dealSuccessbox">
				<div id="dealsucchr"></div><br>
				<input type="button" class="button" name="dealSuccess" value="거래완료"/>
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
//-------------------------예약중인 구매내역 조회기능메서드------------------------------------
var reserveOb = document.querySelector("[name=reserve]")
var reservehrOb = document.querySelector("#reservehr")
var dealsucchrOb = document.querySelector("#dealsucchr")
var framePosition =document.querySelector("#buyViewframeposition")
framePosition.innerHTML = "<iframe src='buyView_reserveing.jsp' name='buyreserve' width='100%' height='700'></iframe>"
reserveOb.onclick=function(){
	this.style.color="black"
	dealSuccessOb.style.color="grey"
	reservehrOb.innerHTML="<hr>"
	dealsucchrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='buyView_reserveing.jsp' name='buyreserve' width='100%' height='700'></iframe>"
}
//-------------------------거래완료된 구매내역 조회기능메서드------------------------------------
var dealSuccessOb = document.querySelector("[name=dealSuccess]")
dealSuccessOb.onclick=function(){
	reserveOb.style.color="grey"
	this.style.color="black"
	dealsucchrOb.innerHTML="<hr>"
	reservehrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='buyView_dealSuccess.jsp' name='buyreserve' width='100%' height='700'></iframe>"
}

</script>
</html>