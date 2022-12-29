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
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null;
		socialdao socialDao = new socialdao();
		boolean loginalert=false;
		boolean isCutoutSuss =false;
		boolean isCollect = false;
		boolean isCutout = false;
		
		if(hasSess){
			Olddealuser registerUser = (Olddealuser)session.getAttribute("userCutCollect");
			isCollect = socialDao.isCollectCut(new Social(Login.getId(),"모아",registerUser.getId()));
			isCutout = socialDao.isCollectCut(new Social(Login.getId(),"차단",registerUser.getId()));
			if(!isCollect){
				if(!isCutout){
			socialDao.collectAdd(new Social(Login.getId(),"차단",registerUser.getId()));
			isCutoutSuss= true; 
				}
			}
		}else{
			loginalert=true;
		}
		
	%>

</body>
<script type="text/javascript">
//----------------------------로그인후 사용해달라는 기능메서드------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
}
//----------------------------모아보기/차단하기 중복방지 기능메서드---------------------------------	
	var isCollectOb = <%=isCollect%>
	var isCutoutOb = <%=isCutout%>
	if(isCollectOb){
		if(confirm("[안내메시지]모아보기에 등록되어있는 회원이므로, 차단하기가 불가능합니다.\n 모아보기 해제하러 가시겠습니까?")){
			location.href="collectView.jsp"
		}else{
			location.href="productDetailView.jsp"
		}
	}
	if(isCutoutOb){
		alert("[안내메시지]차단하기에 이미 등록되어있는 회원입니다.");
		location.href="productDetailView.jsp"
	}
//---------------------------모아보기 완료 알람 기능메서드------------------------------------------
	var isCutoutSussOb = <%=isCutoutSuss%> 
	if(isCutoutSussOb) {
		var isCutOutOb = confirm("[안내메시지]회원 차단이 완료되었습니다.\n차단한 회원을 조회하러 가시겠습니까?")
		
		if(isCutOutOb){
			location.href="cutoutView.jsp"
		}else{
			location.href="productDetailView.jsp"
		}
	}
	
</script>
</html>