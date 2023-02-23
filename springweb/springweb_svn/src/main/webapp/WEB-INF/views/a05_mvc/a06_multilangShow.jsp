<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	td{text-align:center;}
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
		$("#selLan").val("${param.lang}")
		$("#selLan").change(function(){
			if($(this).val()!=""){
				$("[name=lang]").val($(this).val())
				$("form").submit();
			}
		});		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2><spring:message code="mutilanguage"/></h2>
  <p align="right">
  	<select class="form-control" id="selLan">
  		<option value=""><spring:message code="chlang"/></option>
  		<option value="ko"><spring:message code="ko"/></option>
  		<option value="en"><spring:message code="en"/></option>
  	</select>
  </p>
  <h3><spring:message code="regmem"/></h3>
</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
		<input type="hidden" name="lang" value=""/>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder='<spring:message code="id"/>' />
	    <input class="form-control mr-sm-2" placeholder='<spring:message code="pwd"/>' />
	    <button class="btn btn-info" type="submit"><spring:message code="reg"/></button>
 	</nav>
	</form>
</div>
</body>
</html>