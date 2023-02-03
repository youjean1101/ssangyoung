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
<title>추과과금결제</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#addPayexp{
		font-size:8pt;
		color:grey;
		margin-left:12%;
		margin-top:2%;
	}
	#addPayexp span{ 
		color:red;
	}
	#payMethodSelTab{
		border:1px solid black;
		margin-left:15%;
		margin-top:2%;
		width:70%;
		text-align:center;
		font-size:9pt;
	}
	#payMethodSelTab th{
		border:1px solid black;
		width:30%;
		height:50px;
		font-weight:bold;
		background:rgb(219, 217, 217);
	}
	#payMethodSelTab td{
		border:1px solid black;
		width:70%;
		height:50px;
	}
	#payMoneyTab{
		width:35%;
		margin-left:32%;
		margin-top:2%;
		text-align:center;
	}
	#payMoneyTab th{
		height:70px;
		background:rgb(219, 217, 217);
		font-size:16pt;
	}
	#payMoneyTab #heightCont{
		height:50px;
		background:navy;
	}
	#payMoneyTab th input[type="button"]{
		width:100%;
		height:100%;;
		background:navy;
		color:white;
		border:none;
	}
	#payMoneyTab td{
		height:30px;
		font-size:8pt;
	}
	#addPayHistoryDataFra{
		width:70%;
		margin-left:15%;
		margin-top:2%;
	}
	#payMethodSelTab input[type='radio']{
		width:20px;
		height:20px;
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
	$("#addPay").css({"background":"navy","color":"white"})
	
});
</script>
</head>

<body>
	<jsp:include page="${path}/a00_main/a00_header.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a07_mypagecommon.jsp"></jsp:include>
	<jsp:include page="${path}/a00_main/a09_myPagePayManager.jsp"></jsp:include>
	<div id="addPayexp">
		<span>이용 가능시간</span>은 첫 회 대여시점을 기준으로 계산합니다.<br>
		서울자전거 모든 대여소에서 <span>사용이 가능</span>합니다.<br>
		서울자전거 <span>환불</span>규정에 따릅니다.  <a href="https://www.bikeseoul.com/info/infoCoupon.do?part=refund">환불 규정 보기></a><br>
		이용권을 다른 사람에게 <span>양도</span>할 수 없으며,양도로 인해 발생하는 불이익은 구매자가 책임지셔야 합니다.<br>
	</div>
	<table id="payMethodSelTab">
		<tr><th>결제수단</th>
			<td><input type="radio" name="payMethod" value="card" checked/> 신용/체크카드 &nbsp &nbsp &nbsp      
				<input type="radio" name="payMethod" value="phone"/> 휴대폰결제 &nbsp &nbsp &nbsp   
				<input type="radio" name="payMethod" value="getCard"/> 등록된카드</td></tr>
		<tr><th>미납금액</th><td>원</td></tr>
		<tr><th>미납내역</th><td>초과이용  0 건</td></tr>
	</table>
	<table id="payMoneyTab">
		<tr><th>결제금액 &nbsp &nbsp &nbsp 원</th></tr>
		<tr><td><input type="checkbox"/> <a href="https://www.bikeseoul.com/info/infoCoupon.do?part=add">추가요금</a>자동결제, 
										<a href="https://www.bikeseoul.com/info/infoCoupon.do?part=refund">환불규정</a>, 
										<a href="https://www.bikeseoul.com/app/use/moveUseMenuClauseInfo.do">이용약관</a>에 동의하며 결제를 진행합니다.</td></tr>
		<tr><th id="heightCont"><input type="button" value="결제"></th></tr>
	</table>
	<iframe id="addPayHistoryDataFra" src=" "></iframe>
</body>
</html>