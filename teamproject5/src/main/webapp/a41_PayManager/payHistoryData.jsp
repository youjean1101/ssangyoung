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
<title>결제내역 데이터</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#payHistoryDataTab{
		/* border:1px solid black; */
		text-align:center;
		width:100%;
		font-size:9pt;
	}
	#payHistoryDataTab th{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:40px;
		background:rgb(219, 217, 217);
	}
	#payHistoryDataTab td{
		border-top:1px solid black;
		border-bottom:1px solid black;
		height:35px;
	}
	#payHistoryCnt{
		font-size:8pt;
		color:darkgrey;
		margin-left:90%;
	}
	#payHistoryCnt span{
		color:red;
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
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
	<div id="payHistoryCnt">Total : <span>0</span> 건 /<span> 0</span> 원</div>
	<table id="payHistoryDataTab">
		<col width="10%">
	   	<col width="10%">
	   	<col width="10%">
	   	<col width="30%">
	   	<col width="20%">
	   	<col width="20%">
		<thead>
			<tr><th>결제상품</th><th>금액</th><th>결제방법</th>
				<th>이용권개시일</th><th>환불예정액</th><th>환불/취소</th></tr>
		</thead>
		<tbody>
			<td colspan="6" style="color:grey;">no data</td>
		</tbody>
	</table>
</body>
</html>