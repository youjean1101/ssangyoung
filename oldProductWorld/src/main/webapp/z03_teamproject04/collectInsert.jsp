<%@page import="java.util.Locale.IsoCountryCode"%>
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
		Olddealuser Login = (Olddealuser)session.getAttribute("Login");
		boolean hasSess = Login!=null;
		socialdao socialDao = new socialdao();	
		boolean loginalert=false;
		boolean isCollectSuss =false;
		boolean isCollect = false;
		boolean isCutout = false;
		if(hasSess){
			Olddealuser registerUser = (Olddealuser)session.getAttribute("userCutCollect"); 
			isCollect = socialDao.isCollectCut(new Social(Login.getId(),"모아",registerUser.getId()));
			isCutout = socialDao.isCollectCut(new Social(Login.getId(),"차단",registerUser.getId()));
			if(!isCollect){
				if(!isCutout){
					socialDao.collectAdd(new Social(Login.getId(),"모아",registerUser.getId()));
					isCollectSuss= true; 
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
		alert("[안내메시지]모아보기에 이미 등록되어있는 회원입니다.");
		location.href="productDetailView.jsp"
	}
	if(isCutoutOb){
		if(confirm("[안내메시지]차단하기에 등록되어있는 회원이므로, 모아보기가 불가능합니다.\n 차단 해제하러 가시겠습니까?")){
			location.href="cutoutView.jsp"
		}else{
			location.href="productDetailView.jsp"
		}
	}
//---------------------------모아보기 완료 알람 기능메서드------------------------------------------
	var isCollectSussOb = <%=isCollectSuss %>
	if(isCollectSussOb){
		var isCollectOb = confirm("[안내메시지]모아보기 회원등록이 완료되었습니다.\n모아보기 조회화면으로 이동하시겠습니까?")
		if(isCollectOb){
			location.href="collectView.jsp"
		}else{
			location.href="productDetailView.jsp"
		}
	}
</script>
</html>