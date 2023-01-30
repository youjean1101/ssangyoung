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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
.fs-1{
	font-size: 2.3rem;
	font-weight: bolder;
	padding: 0 0 0 2.5%;
}
.formdiv{
	padding: 2% 2% 2% 2%;
	border: #c8c8c8 solid 1px;
	border-radius: 5px 5px 5px 5px;
}
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
.input-button{
	display: flex;
	justify-content: center;
	align-items: center;
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
<div class="container">
	<jsp:include page="${path }/a10_admin/admin_header.jsp"></jsp:include>

<p class="fs-1 text-lg-start">1:1 문의 답변</p><br><br>

<div class="formdiv">
<form>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">사용자 아이디</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;&nbsp;등록 일자&nbsp;&nbsp;&nbsp;</span>
  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="inputGroup-sizing-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
  <input name="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" >
</div>

<div class="form-floating">
  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 350px"></textarea>
  <label for="floatingTextarea2">답변을 입력하세요</label>
</div>
<br>
<div class="input-group mb-3">
  <input type="file" class="form-control" id="inputGroupFile02">
  <label class="input-group-text" for="inputGroupFile02">Upload</label>
</div>
<div class="input-button">
<button class="nextbutton" type="button" style="margin-top: 1%;">등록</button>
</div>
</form>
</div>

</div>
</body>
</html>