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
<title>비회원 이용권구매 안내사항</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#notificationBox{
		width:80%;
		height:340px;
		position:absolute;
		top:10%;
		left:10%;
		border:3px solid grey;
	}
	#notificationUl li{
		line-height:30px;
		font-size:12pt;
	}
	#markimg{
		width:27px;
		height:25px;
	}
	#noticeTitle{
		color:red;
		font-size:14pt;
		font-weight:bold;
		margin-top:10px;
		margin-left:10%;
	}
	#goBuyTicket{
		width:300px;
		height:40px;
		color:white;
		background:rgb(5, 101, 49);
		border:1px solid rgb(5,101,49);
		border-radius:5px;
		margin-left:40%;
		margin-top:380px;
		outline:none;
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
		$("#goBuyTicket").click(function(){
			window.open("${path}/a40_BuyTicket/nonUser_TicketBuy.jsp");
		})
	});
</script>
</head>

<body>
	<h2 id="noticeTitle"><img id="markimg" src="${path }\b01_img\!.png">주의사항 - 이용권 구매 전 반드시 확인하세요!!</h2>
	<box id="notificationBox">
		<ul id="notificationUl">
			<li>이용 전 브레이크, 체인, 안장조임, 타이어 확인, 이용 시 교통법규 준수, 헬멧 등 안전장구 착용
			<li>대여번호는 "대여번호 조회"( 바로가기 )를 통해 다시 확인가능
			<li>이용권은 비회원만 구매가능하며, 1인 1매만 구매가능(회원 가입시 단체권 구매가능)
			<li>이용권 미사용 시 구매 후 24시간이 경과되면 자동 결제취소<br>
				※자동 결제취소가 안된 경우 계좌를 통해 환불(운영센터 1599-0120에서 별도 연락)
			<li>대여후 1시간(2시간 요금제는 2시간)이 경과되면 5분당 200원의 추가요금 부과<br>
				※ 재대여시에는 추가요금이 발생하지 않으므로 1시간 또는 2시간이내에 반납하고<br> 재대여하여 이용(추가요금 발생시 이용권 구매 결제수단으로 자동 결제됨)
			<li>추가요금이 미결제된 경우 재대여가 불가하므로 미납요금 납부 후 이용<br>
				※ 미납요금은 "미납요금 확인" 페이지에서 조회가능( 바로가기 )
			<li>비회원의 경우 하나의 카드로, 한개의 이용권만 구매 가능합니다. 자세한 사항은 FAQ의 이용방법을 통해서 확인하시기 바랍니다.
		</ul>
	</box>
	<button type="button" id="goBuyTicket">이용권 구매하기</button>
</body>
</html>