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
<title>중고월드 판매내역</title>
<script type="text/javascript">
</script>
<style>
	#salesViewBox{
		border:4px solid lightgrey;
		border-radius:10px;
		width:1200px;
		height:700px;
		position:fixed;
		left:20%;
		top:12%;
	}
	#salesViewBox #name{
		font-size:28pt;
		margin:15px 30px;
	}
	#salesViewBox hr{
		width:92%;
		position:absolute;
		top:11%;
		left:3%;
		border:0;
	    height:2px;
	    background:lightgrey;
	}
	#salesViewBox .button{
		color:grey;
		border:none;
		background:none;
		font-size:18pt;
	}
	#salesViewBox #salesingbox input[name=salesing]{
		color:black;
	}
	#salesingbox{
		/* border:1px solid black; */
		width:85px;
		height:40px;
		position:absolute;
		bottom:5%;
		left:35%
	}
	#dealSuccessbox{
		/* border:1px solid black; */
		width:85px;
		height:40px;
		position:absolute;
		bottom:5%;
		left:45%;
	}
	#hiddenbox{
		/* border:1px solid black; */
		width:85px;
		height:40px;
		position:absolute;
		bottom:5%;
		left:57%;
	}
	#salesingbox hr{
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
	#hiddenbox hr{
		width:70%;
		border:0;
	    height:2px;
	    background:grey;
	}
	#salesViewframeposition iframe{
		border:none;
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
	<box id="salesViewBox">
		<h2 id="name"><%=Login.getUsername() %>님의 판매내역</h2>
		<hr>
		<div id="salesViewframeposition"></div>
			<box id="salesingbox">
				<div id="salesinghr"><hr></div><br>
				<input type="button" class="button" name="salesing" value="판매중"/>
			</box>
			<box id="dealSuccessbox">
				<div id="dealsucchr"></div><br>
				<input type="button" class="button" name="dealSuccess" value="거래완료"/>
			</box>
			<box id="hiddenbox">
				<div id="hiddenhr"></div><br>
				<input type="button" class="button" name="hidden" value="숨김"/>
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
//-------------------------판매중이 판매내역 조회기능메서드------------------------------------
var salesingOb = document.querySelector("[name=salesing]")
var salesinghrOb = document.querySelector("#salesinghr")
var dealsucchrOb = document.querySelector("#dealsucchr")
var hiddenhrOb = document.querySelector("#hiddenhr")
var framePosition =document.querySelector("#salesViewframeposition")
framePosition.innerHTML = "<iframe src='salesVIew_salesing.jsp' name='buyreserve' width='100%' height='700'></iframe>"
salesingOb.onclick=function(){
	this.style.color="black"
	dealSuccessOb.style.color="grey"
	hiddenOb.style.color="grey"
	dealsucchrOb.innerHTML=""
	hiddenhrOb.innerHTML=""
	salesinghrOb.innerHTML="<hr>"
	framePosition.innerHTML = "<iframe src='salesVIew_salesing.jsp' name='buyreserve' width='100%' height='700'></iframe>"
}
//-------------------------구매완료된 구매내역 조회기능메서드------------------------------------
var dealSuccessOb = document.querySelector("[name=dealSuccess]")
dealSuccessOb.onclick=function(){
	salesingOb.style.color="grey"
	hiddenOb.style.color="grey"
	this.style.color="black"
	dealsucchrOb.innerHTML="<hr>"
	salesinghrOb.innerHTML=""
	hiddenhrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='salesView_dealSuccess.jsp' name='buyreserve' width='100%' height='700'></iframe>"
}
//-------------------------숨김처리된 구매내역 조회기능메서드------------------------------------
var hiddenOb = document.querySelector("[name=hidden]")
hiddenOb.onclick=function(){
	salesingOb.style.color="grey"
	dealSuccessOb.style.color="grey"
	this.style.color="black"
	hiddenhrOb.innerHTML="<hr>"
	salesinghrOb.innerHTML=""
	dealsucchrOb.innerHTML=""
	framePosition.innerHTML = "<iframe src='salesView_hidden.jsp' name='buyreserve' width='100%' height='700'></iframe>"
}

</script>
</html>