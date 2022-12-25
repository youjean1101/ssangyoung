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
<title>모아보기 회원등록</title>
<script type="text/javascript">
</script>

</head>
<body>
	<%	
		User loginUser = (User)session.getAttribute("loginUserInfo");
		User registerUser = (User)session.getAttribute("userCutCollect"); 
		socialdao socialDao = new socialdao();
		socialDao.collectAdd(new Social(loginUser.getsId(),"모아",registerUser.getsId()));
		//boolean isCollect = true;
	%>

</body>
<script type="text/javascript">
	<%-- var isCollectOb = <%=isCollect%> --%>
	var isCollectOb = confirm("[안내메시지]모아보기 회원등록이 완료되었습니다.\n모아보기 조회화면으로 이동하시겠습니까?")
	
	if(isCollectOb){
		location.href="collectView.jsp"
	}else{
		location.href="productDetailView.jsp"
	}
</script>
</html>