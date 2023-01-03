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
<title>중고월드 차단하기 조회하기</title>
<script type="text/javascript">
</script>
<style>
/* 내가쓴 css*/
#cutoutViewbox{
	width:1200px;
	height:600px;
	position:fixed;
	top:13%;
	margin:auto 250px;
	border:5px solid lightgrey;
	border-radius:10px;
}
#cutoutViewbox h2{
	position:absolute;
	left:5%;
	top:-2%;
	font-size:25pt;
}
#cutoutViewbox hr{
	width:95%;
	position:absolute;
	top:11%;
	left:3%;
	border:0;
    height:2px;
    background:lightgrey;
    
}
#cutoutViewbox #cutoutTab{
	position:absolute;
	left:3%;
	top:15%;
	width:95%;
	/* border:1px solid black; */
}
#cutoutTab th{
	background:rgb(243, 156, 18);
	color:white;
	font-size:20pt;
	border:none;
	/* width:25%; */
}
#cutoutTab td{
	font-size:15pt;
	text-align:center;
	height:40px;
	border-bottom:0.02px solid rgb(244,190,61);
	/* border:1px solid black; */
	/* width:25%; */
}
#cutoutTab td input[type="checkbox"]{
	width:20px;
	height:20px;
}
input[name="cutoutCancel"]{
	background:rgb(142, 68, 173);
	color:white;
	border:1px solid rgb(142, 68, 173);
	border-radius:5px;
	position:absolute;
	left:3%;
	bottom:-10%;
	font-size:14pt;
	width:120px;
	height:50px;
	font-weight:bold;
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
#cutoutViewbox #nothing{
	color:grey;
	position: absolute;
	top:40%;
	left:38%;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<box id="cutoutViewbox">
		<%	
			Olddealuser Login = (Olddealuser)session.getAttribute("Login");
			// User registerUser = (User)session.getAttribute("userCutCollect"); 차단해지시 삭제 해야하므로 쓸수동..
			socialdao socialDao = new socialdao();
			//List<User> cutUserList= socialDao.cutoutView(new Social(Login.getsId(),"차단"));
			int i = 1;
			boolean hasSess = Login!=null; 
			boolean loginalert=false;
			if(hasSess){
		%>
		<h2><%=Login.getUsername() %>님이 차단한 사용자 정보</h2>
		<hr>
		<form id="cutoutRemoveform" action="cutoutRemove.jsp"><!--  -->
		<%if(socialDao.isCutCollectExist(Login.getId(),"차단")) {%>
		<table id="cutoutTab">
			<tr><th width="15%">checkBox</th><th width="15%">No.</th><th width="20%">ID</th><th width="50%">지역</th></tr>
			<%for(Olddealuser cutoutuserinfo:socialDao.cutoutView(new Social(Login.getId(),"차단"))){ %>
			<%//for(int idx=1;idx<cutUserList.size();idx++){ %>
			<tr>
				<td width="15%"><Input type="checkbox" name="removeUserSel" value='<%=cutoutuserinfo.getId() %>'/></td>
				<td width="15%"><%=i++ %></td><td width="20%"><%=cutoutuserinfo.getId() %></td>
				<td width="50%"><%=cutoutuserinfo.getAddress() %></td>
			</tr>
			<%} %>
		</table>
		<%} else{ %>
			<h2 id="nothing">차단한 회원이 없습니다.</h2>
		<%} %>
		<input type="submit" name="cutoutCancel" value="차단해제" onclick="cutoutremove()"/>
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
function cutoutremove(){
	var cutoutRemoveUserSelArr = document.querySelectorAll("[name=removeUserSel]")
	var is_checked = false;
	cutoutRemoveUserSelArr.forEach(function(userck){
		if(userck.checked==true){
			is_checked=true
		}
	})
	if(!is_checked){
		alert("[안내메시지]차단해제할 회원을 선택해주세요.")
	}else{
		if(confirm("선택하신 회원을 차단목록에서 삭제하시겠습니까?")){
			document.querySelector("#collectRemoveform").submit();
		}
	}
} 
//--------------------------미로그인으로 회원수정화면접속 시, 기능메서드-------------------------------------
var alertis = <%=loginalert%>
if(alertis){
	alert("[안내메시지]로그인을 해주세요.")
	location.href="login.jsp";
}
</script>
</html>