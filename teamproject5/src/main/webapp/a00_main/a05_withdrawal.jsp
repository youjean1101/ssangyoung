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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.nextbutton{
	width:28%;
	padding: 10px 20px 10px 20px;
	background: #24384a;
	color: white;
	font-size: 0.9rem;
	border: #24384a solid 1px;
	text-align: center;
	margin-left: 0; margin-right: 0;
	font-weight: bold;
}
.form-select{
	width: 28%;
}
.quitmsg{
	background: #d2d2d2;
	width: 100%;
	color:gray;
	font-size: 0.8rem;
	height: 50px;
	align-items: center;
	display: flex;
	justify-content: center;
}
.quitmsg p{
	margin: 0 auto;
}
.quitDiv{
	display: flex;
	height: 400px;
	align-items:center;
	margin:0 auto;
	justify-content:center;
	text-align:center;
	flex-direction: column;
}
h2{
	padding-top: 10%;
	font-weight: bold;
}
span{
	color:red;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

</head>

<body>
	<div class="quitDiv">
	<h2><span>회원탈퇴</span>를 신청합니다.</h2><br><br>
	<h5>그동안 이용해 주셔서 감사합니다.<br>탈퇴하실 경우 아래와 같이 회원정보가 처리됩니다.</h5><br><br>
	<div class="quitmsg">
	<p>탈퇴 신청 즉시 회원탈퇴 처리되며, 해당 아이디의 회원정보 및 마일리지는 삭제처리되며, 복원할 수 없습니다.<br>
	이용권 기간이 남아있는 경우 즉시 탈퇴가 불가능 하오니 고객센터에 문의 바랍니다.</p>
	</div><br><br><br><br>
	<select name="quitReason" class="form-select" aria-label="Default select example">
		<option value="0" selected="selected">탈퇴사유 선택</option>
		<option>서비스 불만족</option>
		<option>요금정책 불만</option>
		<option>기타</option>
		<option>개인정보</option>
	</select>
	<button class="nextbutton" type="button" style="margin-top: 2%;">회원탈퇴</button>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
			
	});
</script>
</html>