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
<title>마이페이지 결제관리 공통</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	
	#payManagerCommonTab{
		backgroung:white;
		border:2px solid navy;
		color:navy;
		width:80%;
		margin-left:10%;
		margin-top:12%;
	}
	#payManagerCommonTab td{
		border:2px solid navy;
		width:25%;
		text-align:center;
		height:50px;
	}
	#payManagerCommonTab td:hover{
		background:navy;
		color:white;
	}
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#payManagerCommonTab td").click(function(){
			$("#payManagerCommonTab td").css({"background":"","color":""})
			$(this).css({"background":"navy","color":"white"})
		})
		// 마이페이지 공통 클릭상태 유지
		$("#iconID02").attr("src", "${path}/b01_img/payInfoManagerIcon(click).png");
		document.querySelector("#hrposition02").innerHTML = "<hr class='Mypagehr'>"
		$("#payManagerBox").css({"background":"white","color":"green"})
	});
</script>
</head>

<body>
	
	<table id="payManagerCommonTab">
		<tr>
			<td id="payhistory" onclick="location.href='${path}/a41_PayManager/payHistory.jsp'">결제내역</td>
			<td id="addPay" onclick="location.href='${path}/a41_PayManager/user_UnpaidChargePay.jsp'">추가과금결제</td>
			<td id="getPayMethod" onclick="location.href='${path}/a41_PayManager/getPayMethod.jsp'">결제수단 등록</td>
			<td id="returnhistory" onclick="location.href='${path}/a41_PayManager/returnHistory.jsp'">환불신청내역</td>
		</tr>
	</table>
</body>
</html>