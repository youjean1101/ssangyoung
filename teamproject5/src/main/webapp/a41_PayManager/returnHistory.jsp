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
<title>환불내역</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#returnIndexTab{
		width:80%;
		height:80px;
		margin-top:2%;
		margin-left:10%;
		background:lightgrey;
		text-align:center;
	}
	
	#returnIndexTab th{
		width:10%;
	}
	
	#returnIndexTab td{
		width:20%;
	}
	
	#returnIndexTab td input[value="검색"]{
		border:none;
		width:80%;
		height:50px;
		color:white;
		background:navy;
	}
	
	#returnIndexTab td input[type='date']{
		width:80%;
		height:40px;
	}
	
	.returnHistoryMonthSel{
		background:white;
		border:2px solid navy;
		width:90%;
		height:40px;
		color:navy;
	}
	
	.returnHistoryMonthSel:hover{
		background:navy;
		color:white;
	}
	
	#returnHistoryDataFra{
		margin-top:2%;
		margin-left:10%;
		width:80%;
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
	// 마이페이지 결제관리 공통 클릭상태 유지
	$("#returnhistory").css({"background":"navy","color":"white"})
	// 개월수 클릭에 따른 배경 변경
	$(".returnHistoryMonthSel").click(function(){
		$(".returnHistoryMonthSel").css({"background":"","color":""})
		$(this).css({"background":"navy","color":"white"})
	})
});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a07_mypagecommon.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a09_myPagePayManager.jsp"></jsp:include>
	<table id="returnIndexTab">
		<tr>
			<th><input value="1주일" type="button" class="returnHistoryMonthSel"/></th>
			<th><input value="1개월" type="button" class="returnHistoryMonthSel"/></th>
			<th><input value="3개월" type="button" class="returnHistoryMonthSel"/></th>
			<th><input value="6개월" type="button" class="returnHistoryMonthSel"/></th>
			<td><input type="date" name="startdate">&nbsp &nbsp ~</td><td><input type="date" name="enddate"></td>
			<td><input type="button" value="검색"/></td>
		</tr>
	</table>
	<iframe id="returnHistoryDataFra" src="${path}/a41_PayManager/returnHistoryData.jsp"></iframe>
</body>
</html>