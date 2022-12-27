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
<title>중고월드 찜 넣기</title>
<script type="text/javascript">
</script>

</head>
<body>
	<%	
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		Olderproduct = (Olderproduct)session.getAttribute("basket");
		//boolean isCollect = true;
	%>


</body>
<script type="text/javascript">
var isCollectOb = confirm("[안내메시지]찜등록이 완료되었습니다.\n찜 조회화면으로 이동하시겠습니까?")

if(isCollectOb){
	location.href="#"
}else{
	location.href="productDetailView.jsp"
}
</script>
</html>