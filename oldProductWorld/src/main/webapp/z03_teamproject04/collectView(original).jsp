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
<title>중고월드 모아보기 조회하기</title>
<style>
#collectViewbox{
	width:1200px;
	height:600px;
	position:fixed;
	top:13%;
	margin:auto 250px;
	border:5px solid lightgrey;
	border-radius:10px;
}
#collectViewbox h2{
	position:absolute;
	left:5%;
	top:-2%;
	font-size:25pt;
}
#collectViewbox hr{
	width:95%;
	position:absolute;
	top:11%;
	left:3%;
	border:0;
    height:2px;
    background:lightgrey;
    
}
#collectViewbox #collectTab{
	position:absolute;
	left:3%;
	top:15%;
	width:95%;
	/* border:1px solid black; */
}
#collectTab th{
	background:rgb(243, 156, 18);
	color:white;
	font-size:20pt;
	border:none;
	/* width:25%; */
}
#collectTab td{
	font-size:15pt;
	text-align:center;
	height:40px;
	border-bottom:0.02px solid rgb(244,190,61);
	/* border:1px solid black; */
	/* width:25%; */
}
#collectTab td input[type="checkbox"]{
	width:20px;
	height:20px;
}
input[name="collectCancel"]{
	background:rgb(142, 68, 173);
	color:white;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	position:absolute;
	left:3%;
	bottom:-10%;
	font-size:14pt;
	font-weight:bold;
	width:140px;
	height:50px;
}
.nextorprev{
	background:white;
	color:grey;
	height:60px;
	width:60px;
	border:5px solid grey;
	border-radius:60px;
	font-size:30pt;
	line-height:0px;
	font-size:30pt;
	box-shadow:3px 3px 3px grey;
}
input[name="previous"]{
	position:absolute;
	left:45%;
	bottom:-12%;
}
input[name="next"]{
	position:absolute;
	left:52%;
	bottom:-12%;
}
input[name="previous"]:hover{
	background:white;
	color:black;
	border:5px solid black;
}
input[name="next"]:hover{
	background:white;
	color:black;
	border:5px solid black;
}
input[name="previous"]:active{
	background:white;
	color:black;
	border:5px solid black;
	box-shadow : none;
}
input[name="next"]:active{
	background:white;
	color:black;
	border:5px solid black;
	box-shadow : none;
}
#collectViewbox #nothing{
		color:grey;
		position: absolute;
		top:40%;
		left:35%;
}
</style>

<script type="text/javascript">
</script>
</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<box id="collectViewbox">
		<%	
			Olddealuser Login = (Olddealuser)session.getAttribute("Login");
			//User registerUser = (User)session.getAttribute("userCutCollect"); 
			socialdao socialDao = new socialdao();
			int i = 1;
			boolean hasSess = Login!=null; 
			boolean loginalert=false;
			if(hasSess){
		%>
		<h2><%=Login.getUsername() %>님이 모아보기한 사용자 정보</h2>
		<hr>
		<form id="collectRemoveform" action="collectRemove.jsp"><!--   -->
		<%if(socialDao.isCutCollectExist(Login.getId(),"모아")) {%>
		<table id="collectTab">
			<tr><th width="15%">checkBox</th><th width="15%">No.</th><th width="20%">ID</th><th width="50%">지역</th></tr>
			<%for(Olddealuser collectuserinfo:socialDao.cutoutView(new Social(Login.getId(),"모아"))){ %>
			<tr>
				<td width="15%"><input type="checkbox" name="removeUserSel" value="<%=collectuserinfo.getId() %>"/></td>
				<td width="15%"><%=i++ %></td><td width="20%"><%=collectuserinfo.getId() %></td>
				<td width="50%"><%=collectuserinfo.getAddress()%></td>
			</tr>
		<%}  %>
		</table>
		<%} else{ %>
			<h2 id="nothing">모아보기한 회원이 없습니다.</h2>
		<%} %>
		<input type="button" name="collectCancel" value="모아보기해제" onclick="collectremove()"/>
		<input type="button" class="nextorprev" name="previous" value="◀"/>
		<input type="button" class="nextorprev" name="next" value="▶"/>
		</form>
		<%}else{
			loginalert=true;
		}
		
		%>
	</box>
</body>
<script type="text/javascript">

//------------------------------미체크 시, 유효성체크 기능메서드-------------------------------------------- 
function collectremove(){
	var collectRemoveUserSelArr = document.querySelectorAll("[name=removeUserSel]")
	var is_checked = false;
	collectRemoveUserSelArr.forEach(function(userck){
		if(userck.checked==true){
			is_checked=true
		}
	})
	if(!is_checked){
		alert("[안내메시지]모아보기 해제할 회원을 선택해주세요.")
	}else{
		if(confirm("선택하신 회원을 모아보기에서 삭제하시겠습니까?")){
			document.querySelector("#collectRemoveform").submit();
		}
	}
}  
//--------------------------미로그인 시, 기능메서드-------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
}

</script>
</html>