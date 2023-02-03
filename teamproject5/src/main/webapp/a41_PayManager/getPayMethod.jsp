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
<title>결제수단등록</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#guide01{
		font-weight:bold;
		font-size:9pt;
		margin-top:3%;
		margin-left:10%;
	}
	#guide02{
		font-size:9pt;
		margin-top:3%;
		margin-left:10%;
	}
	#guide02 span{
		color:red;
	}
	#getPayMethodSelTab{
		width:80%;
		height:100px;
		margin-top:3%;
		margin-left:10%;
	}
	#getPayMethodSelTab td{
		border:5px solid white;
	}
	#getPayMethodSelTab td button{
		background:lightgrey;
		border:none;
		width:100%;
		height:100%;
		font-size:14pt;
		font-weight:bold;
	}
	#getPayMethodSelTab td button span{
		color:grey;
		font-size:9pt;
		font-weight:10px;
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
	// 마이페이지 결제관리 공통 클릭상태 유지
	$("#getPayMethod").css({"background":"navy","color":"white"})
});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a07_mypagecommon.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a09_myPagePayManager.jsp"></jsp:include>
	<div id="guide01">추가과금이 발생할 경우 등록한 결제 수단으로 자동 결제됩니다.</div>
	<table id="getPayMethodSelTab">
		<tr><td><button type="button">휴대전화등록<br> <span>휴대전화를 추가결제수단으로 등록합니다.</span></button></td>
			<td><button type="button">신용카드 등록<br> <span>신용카드를 추가 결제 수단으로 등록 합니다.</span></button></td></tr>
	</table>
	<div id="guide02">결제수단 변경시 <span>500원이 결제</span>됩니다. 그리고 해당 결제금액은 일정시간이 지난 후 <span>자동으로 결제취소</span>가 진행됩니다. 
		<span>(최대 5분 정도 소요)</span> 회원님의 양해를 부탁드립니다.</div>
</body>
</html>