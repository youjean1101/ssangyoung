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
<title>마이페이지 공통부분</title>
<style>
	#idposition{
		margin-top:1%;
		margin-left:2%;
	}
	#greyBox{
		background: rgb(122, 127, 130);
		opacity: 0.8;
		width:100%;
		height:70px;
		margin-top:1%;
		position:fixed;
		left:0%;
	}
	#greyBox .MypageMenu{
		margin-top:0%;
		height:85%;
		width:220px;
		height:100%;
		text-align:center;
		color:white;
	}
	#greyBox #userInfoBox{
		margin-left:20%;
	}
	#greyBox #payManagerBox{
		margin-left:40%;
		position:absolute;
		top:0%;
	}
	#greyBox #useInfoBox{
		margin-left:60%;
		position:absolute;
		top:0%;
	}
	.Mypagehr{
		border:solid 3px green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#useInfoBox").css({"background":"white","color":"green"})
		
		$("#userInfoBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition01").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon(click).png");
			
			$("#payManagerBox").css({"background":"","color":""})
			document.querySelector("#hrposition02").innerHTML = ""
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon.png");
			
			$("#useInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition03").innerHTML = ""
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon.png");
		})
		
		$("#payManagerBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition02").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon(click).png");
			
			$("#userInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition01").innerHTML = ""
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon.png");
			
			$("#useInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition03").innerHTML = ""
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon.png");
		})
		
		$("#useInfoBox").click(function(){
			$(this).css({"background":"white","color":"green"})
			document.querySelector("#hrposition03").innerHTML = "<hr class='Mypagehr'>"
			$("#iconID03").attr("src", "${path}/b01_img/useInfoManagerIcon(click).png");
			
			$("#userInfoBox").css({"background":"","color":""})
			document.querySelector("#hrposition01").innerHTML = ""
			$("#iconID01").attr("src", "${path}/b01_img/userInfoManagerIcon.png");
			
			$("#payManagerBox").css({"background":"","color":""})
			document.querySelector("#hrposition02").innerHTML = ""
			$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon.png");
		})
		
	});
</script>
</head>
	<div id="idposition">test님</div><!-- 로그인한 아이디 출력 -->
	<box id="greyBox">
		<div id="userInfoBox" class="MypageMenu">
			<img id="iconID01" src="${path}\b01_img\userInfoManagerIcon.png"><br>
			회원정보 관리
			<div id="hrposition01"></div>
		</div>
		<div id="payManagerBox" class="MypageMenu">
			<img id="iconID02" src="${path}\b01_img\payInfoManagerIcon.png"><br>
			결제 관리
			<div id="hrposition02"></div>
		</div>
		<div id="useInfoBox" class="MypageMenu">
			<img id="iconID03" src="${path}\b01_img\useInfoManagerIcon(click).png"><br>
			이용정보 관리
			<div id="hrposition03"><hr class="Mypagehr"></div>
		</div>
	</box>
<body>

</body>
</html>