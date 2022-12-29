<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="z02_teamproject4.*"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 모아보기 회원 삭제</title>
<script type="text/javascript">
	
</script>
	
</head>
	<jsp:useBean id="socialDao" class="z02_teamproject4.socialdao"/>
	<jsp:useBean id="SoceialVo" class="z02_teamproject4.vo.Social"/>
	<jsp:setProperty property="*" name="SoceialVo" />
<body>
	<c:if test="${not empty socialDao.collcutremove(SoceialVo)}">
		<c:set var="sel" scope="session" value="${socialDao.collcutremove(SoceialVo)}"/>
	</c:if>

	
	
	
</body>
<script type="text/javascript">

//-------------------------------삭제 완료시 알람 발생과 페이지 이동 기능메서드---------------------------------------------------
var isFail='${sel.removeUserSel}'
	if(isFail==""){
		alert("삭제실패\n모아보기완료페이지 이동")
		location.href="collectView.jsp"
	}else{
		alert("삭제완료\n모아보기완료페이지 이동")
		location.href="collectView.jsp"
	}
</script>

</script>
</html>