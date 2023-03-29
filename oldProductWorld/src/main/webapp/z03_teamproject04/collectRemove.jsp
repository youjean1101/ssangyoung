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
<title>중고월드 모아보기 회원 삭제</title>
<script type="text/javascript">
	
</script>
	
</head>
<body>
		<%	
		boolean isRemoveCollect = false;
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		socialdao socialDao = new socialdao();
		String []colRomoveUserSels= request.getParameterValues("removeUserSel");
		if(colRomoveUserSels!=null){
			for(int idx=0;idx<colRomoveUserSels.length;idx++){
				socialDao.collcutremove(new Social(Login.getId(),"모아",colRomoveUserSels[idx]));
			}
			isRemoveCollect = true;
		}
		%>
	
</body>
<script type="text/javascript">

//-------------------------------삭제 완료시 알람 발생과 페이지 이동 기능메서드---------------------------------------------------
var isFail=<%=isRemoveCollect%>
	if(isFail){
		alert("[안내메시지]선택하신 회원을 모아보기에서 삭제 완료하였습니다.")
		location.href="collectView.jsp"
	}
</script>

</script>
</html>