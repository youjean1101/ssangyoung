<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 이용권구매 이용권종류 선택</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#userTicketSelTitle{
		margin-left:6%;
		margin-top:5%;
		font-weight:bold;
	}
	#userTicketSelTab{
		width:90%;
		margin-left:6%;
		margin-top:3%;
		height:500px;
	}
	#userTicketSelTab td{
		width:50%;
		border:20px solid white;
	}
	#userTicketSelTab td button{
		width:100%;
		height:100%;
		background:rgb(76, 171, 106);
		color:white;
		border:none;
		text-align:left;
		font-size:18pt;
	}
	#userTicketSelTab td img{
		margin-left:70%;
	}
	#userTicketSelTab td button span{
		font-size:10pt;
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
		$("#userTicketSelTab button").click(function(){
			$("#TicketSelValue").html("<input style='visibility: hidden' name='Sel' value='"+$(this).val()+"'>")
			$("#getTicketkind").submit()
		})
	});
</script>
</head>
<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<h3 id="userTicketSelTitle">이용권 구매</h3>
	<form id="getTicketkind" action="${path}/a40_BuyTicket/User_TicketBuy.jsp" method="get">
		<div id="TicketSelValue"></div>
		
		<table id="userTicketSelTab" >
			<tr><td><button value="seasonSel" type="button">정기권<img src="${path }/b01_img/userTicketSel.png">
					<br><span>1시간권, 2시간권을 선택하실 수 있습니다.</span></button></td>
				<td><button value="daySel" type="button">일일권<img src="${path }/b01_img/userTicketSel.png">
					<br><span>1시간권, 2시간권을 선택하실 수 있습니다.</span></button></td></tr>
			<tr><td><button value="groupSel" type="button">단체권<img src="${path }/b01_img/userTicketSel.png">
					<br><span>1시간권을 선택하실 수 있습니다.</span></button></td>
				<td></td></tr>
		</table>
	</form>
</body>
</html>