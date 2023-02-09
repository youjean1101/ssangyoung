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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#noneUserViewTab{
		/* border:1px solid black; */
		text-align:center;
		width:80%;
		margin-left:10%;
		/* margin-top:15%; */
		font-size:9pt;
	}
	#noneUserViewTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#noneUserViewTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
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
		
	});
</script>
</head>

<body>
	<table id="noneUserViewTab">
		<col width="35%">
	   	<col width="15%">
	   	<col width="15%">
	   	<col width="25%">
	   	<col width="10%">
		<thead>
			<tr><th>결제상품</th><th>금액</th><th>결제방법</th>
				<th>대여시간</th><th>사용시간</th></tr>
		</thead>
		<tbody>
			<c:forEach var="nRlist" items="${nonUserRentalList}">
			<tr><td>${nRlist.ticketKind}</td><td>${nRlist.payMoney}원</td><td>${nRlist.payMethod}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${nRlist.rentalTime}"/></td>
				<td>${nRlist.useTime}</td></tr>
			</c:forEach> 
		</tbody>
	</table>
</body>
</html>