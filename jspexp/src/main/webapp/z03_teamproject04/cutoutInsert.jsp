<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="z02_teamproject4.vo.*"
    import="z02_teamproject4.*"
    import="java.util.*"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차단회원등록</title>
<script type="text/javascript">
</script>

</head>
<body>
	<%
		User loginUser = (User)session.getAttribute("loginUserInfo");
		User registerUser = (User)session.getAttribute("userCutCollect"); 
		socialdao socialDao = new socialdao();
		socialDao.collectAdd(new Social(loginUser.getsId(),"차단",registerUser.getsId()));
		//boolean isCutout = true;
	%>

</body>
<script type="text/javascript">
	<%-- var isCutoutOb = <%=isCutout%> --%>
	var isCutOutOb = confirm("[안내메시지]회원 차단이 완료되었습니다.\n차단한 회원을 조회하러 가시겠습니까?")
	
	if(isCutOutOb){
		location.href="cutoutView.jsp"
	}else{
		location.href="productDetailView.jsp"
	}
	
</script>
</html>