<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>비회원 메뉴메인</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#guestText{
		color:grey;
		margin-left:2%;
	}
	#non-MemberText{
		margin-left:5%;
		font-weight:bold;
	}
	#goBuyTicketButt{
		margin-left:42%;
		border:none;
		outline:none;
		background:none;
	}
	#goBuyTicketImg{
		width:170px;
		height:150px;
	}
	#centerGreyBox{
		width:100%;
		height:80px;
		position:absolute;
		top:50%;
		left:0%;
		background:rgb(239, 239, 239);
		opacity: 0.8;
	}
	.greyButton{
		border:none;
		outline:none;
		background:none;
		color:rgb(54, 51, 51);
		font-weight:bold;
	}
	.inGreyBoxButton{
		width:50px;
		height:50px;
	}
	#centerGreyBox #unpaidPayButt{
		margin-left:15%;
	}
	#centerGreyBox #rentalnumberSeaButt{
		margin-left:20%;
	}
	#centerGreyBox #signUpButt{
		margin-left:25%;
	}
	.clickhr{
		border:solid 3px black;
		margin-left:-2%;
	}
	#nonUserMenuframe{
		width:100%;
		height:470px;
		position:absolute;
		top:63%;
		left:0%;
		border:none;
	}

</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#goBuyTicketButt").click(function(){
			$("#rentalnumberSeaImg").attr("src", "${path}/b01_img/rentalNumberSearchButton.png");
			$("#rentalnumberSeaButt").css({"background":"","color":""})
			document.querySelector("#buttonHrPosition2").innerHTML=""
			
			$("#unpaidPayImg").attr("src", "${path}/b01_img/unpaidChargePayButton.png");
			$("#unpaidPayButt").css({"background":"","color":""})
			document.querySelector("#buttonHrPosition").innerHTML=""
			
			$("#nonUserMenuframe").attr("src", "${path}/a40_BuyTicket/nonUser_TicketBuyNotice.jsp");
		})
		$("#unpaidPayButt").click(function(){
			$(this).css({"background":"white","color":"black"})
			document.querySelector("#buttonHrPosition").innerHTML="<hr class='clickhr'>"
			$("#unpaidPayImg").attr("src", "${path}/b01_img/unpaidChargePayButton(click).png");
			
			$("#rentalnumberSeaImg").attr("src", "${path}/b01_img/rentalNumberSearchButton.png");
			$("#rentalnumberSeaButt").css({"background":"","color":""})
			document.querySelector("#buttonHrPosition2").innerHTML=""
			
			$("#nonUserMenuframe").attr("src", "${path}/a40_BuyTicket/nonUser_UnpaidChargePayInput.jsp");
		})
		$("#rentalnumberSeaButt").click(function(){
			$(this).css({"background":"white","color":"black"})
			document.querySelector("#buttonHrPosition2").innerHTML="<hr class='clickhr'>"
			$("#rentalnumberSeaImg").attr("src", "${path}/b01_img/rentalNumberSearchButton(click).png");
			
			$("#unpaidPayImg").attr("src", "${path}/b01_img/unpaidChargePayButton.png");
			$("#unpaidPayButt").css({"background":"","color":""})
			document.querySelector("#buttonHrPosition").innerHTML=""
			
			$("#nonUserMenuframe").attr("src", "${path}/a40_BuyTicket/nonUser_TicketViewInput.jsp");
		})
		$("#signUpButt").click(function(){
			location.href="${path}/a00_main/a01_main.jsp";
		})
	});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<hr>
	<div id="guestText">Guest</div>
	<div id="non-MemberText">비회원</div>
	<button id="goBuyTicketButt" type="button">
	<img id="goBuyTicketImg" src="${path }\b01_img\goBuyTicketButton.png">
	</button>
	<box id="centerGreyBox">
		<button class="greyButton" id="unpaidPayButt" type="button">
			<img id="unpaidPayImg" class="inGreyBoxButton" src="${path }\b01_img\unpaidChargePayButton.png"><br>미납요금 결제<div id="buttonHrPosition"></div></button>
		<button class="greyButton" id="rentalnumberSeaButt" type="button">
			<img id="rentalnumberSeaImg"class="inGreyBoxButton" src="${path }\b01_img\rentalNumberSearchButton.png"><br>대여번호 조회<div id="buttonHrPosition2"></div></button>
		<button class="greyButton" id="signUpButt" type="button"><img class="inGreyBoxButton" src="${path }\b01_img\signupButton.png"><br>회원가입</button>
	</box>
	<iframe id="nonUserMenuframe" src=""></iframe>
	<%-- <jsp:include page="${path}/a00_main/a08_footer.jsp"></jsp:include> --%>
</body>
</html>