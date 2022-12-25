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
<title>중고월드 물건상세보기</title>
<style>
#productbox{
	width:500px;
	height:650px;
	position:fixed;
	top:10%;
	left:28%;
	margin:auto 150px;
	/* border:1px solid black; */
}
#productbox #imgbox{
	width:100%;
	height:45%;
	/* border:1px solid grey; */
	position:absolute;
	top:0%;
}
#productbox #idbox{
	width:100%;
	height:20%;
	position:absolute;
	top:47%;
}

#productbox #productinfobox{
	/* border:3px solid blue; */
	width:100%;
	height:55%;
	position:absolute;
	top:55%;
}

#imgbox #proimg{
	width:100%;
	height:100%;	
}
#imgbox #order{
	position:absolute;
	bottom:5%;
	left:40%;
	color:white;
}
#idbox #userManagerSel{
	position:absolute;
	right:0%;
	top:5%;
	width:80px;
	height:30px;
	border:none;
}
#userManagerSel option[value=""][disabled] {
	display:none;
}
input[name=like]{
	border:none;
	font-size:20pt;
	width:60px;
	color:black;
	background:none;
}
#productinfobox input[name=reservation]{
	border:none;
	border-radius:5px;
	width:120px;
	height:35px;
	font-size:12pt;
	background:purple;
	color:white;
	position:absolute;
	right:3%;
}
div{
	line-height:35px;
}
.font{
	font-size:12pt;
	color:grey;
}
#ID{
	font-size:18pt;
	font-weight:900px;
}
#local{
	color:black;
}
#productname{
	font-size:25pt;
	font-weight:bold;
}
.content{
	font-size:16pt;
}
#price{
	font-size:18pt;
	font-weight:bold;
}
#productbox #previous{
	position:fixed;
	left:33%;
	top:20%;
}
#productbox #next{
	position:fixed;
	right:32%;
	top:20%;
}
#productinfobox #selposition{
	position:absolute;
	right:2%;
/* 	border:1px solid black; */
	width:120px;
	height:70px;
}
#selposition .reserSel{
	width:100%;
	height:33%;
	border-radius:5px;
	border:none;
}
input[name='complete']{
	background:purple;
	color:white;
	height:40%;
	width:80%;
}
</style>
<script type="text/javascript">
</script>
	
</head>
<body>
	<jsp:include page=".\frame\frame.jsp"></jsp:include>
	<%
		olderproductdao proDao = new olderproductdao();
		userdao userDao = new userdao();
		for(Olderproduct product:proDao.productInfo(new Olderproduct(0))){ 
			for(User user:userDao.productWriterInfo(product.getsWriterID())){ 
				User registerUser = new User(user.getsId(),user.getsPassword(),user.getsDiv(),user.getsProfileimg(),user.getsUsername(),
							user.getsPhonenumber(),user.getsBirthday(),user.getsGender(),user.getsAddress(),
							user.getsDetailaddress(),user.getsEmail(),user.getiPoint(),
							user.getiSalecount(),user.getiBuycount(),user.getiDeclarationcount()); 
				session.setAttribute("userCutCollect",registerUser);
	%>
	<box id="productbox">
	<h2 id="previous"><</h2>
	<h2 id="next">></h2>
		<box id="imgbox">
			<img id="proimg" src=".\img\productPhoto\babyshose.png"/>
			<div id="order">● ○ ○ ○</div>
		</box>
		<box id="idbox">
			<table>
			<tr><td></td></tr>
				<div id="ID"><%=product.getsWriterID() %></div>
				<div id="local" class="font"><%=user.getsAddress() %></div>
				<select id="userManagerSel">
					<option value="" disabled selected>●●●</option>
					<option value="collect">모아보기</option>
					<option value="cutout">차단하기</option>
				</select>
			</table>
		</box>
		<box id="productinfobox">
			<br>
			<hr width="100%">
				<div id="productname"><%=product.getsProductname() %></div>
				<div class="font"><%=product.getsKind() %></div>
				<div id="price">[<%=product.getiPrice() %>원]</div>
				<div class="content"><%=product.getsInformation() %></div>
				<div id="likecnt" class="font">관심5(찜 수 기능메서드)</div>
			<hr width="100%">
				<input name="like" type="button" value="♡" onclick="basket()"/>
				<input name="reservation" type="button" value="약속잡기" onclick="reservation()"/><br>
				<span id="selposition"></span>
		</box>
	</box>
	<%	}
	} %>
</body>
<script type="text/javascript">
//-----------------------------사진 넘어가기 기능메서드------------------------------------
var previousOb = document.querySelector("#previous")
var nextOb = document.querySelector("#next")
var orderOb = document.querySelector("#order")
var idx=0;
previousOb.onclick=function(){ //3 2 1 0
	//alert("이전")
	// -1일부터 4,3,2,1순으로넣어야함
	idx--;
	showorder()
}
nextOb.onclick=function(){ //0 1 2 3
	//alert("다음")
	idx++;
	showorder()
}
function showorder(){
	console.log(idx)
	if(Math.abs(idx)%4==0){
		orderOb.innerText = "● ○ ○ ○"
	}else if(Math.abs(idx)%4==1){
		orderOb.innerText = "○ ● ○ ○"
	}else if(Math.abs(idx)%4==2){
		orderOb.innerText = "○ ○ ● ○"
	}else if(Math.abs(idx)%4==3){
		orderOb.innerText = "○ ○ ○ ●"
	}
}
//-------------------------------모아보기/차단하기 기능메서드----------------------------------------
var userMgrSelOb = document.querySelector("#userManagerSel")
userMgrSelOb.onclick=function(){
	if(userMgrSelOb.value=="collect"){
		location.href="collectInsert.jsp";
		userMgrSelOb.value=""
	}else if(userMgrSelOb.value=="cutout"){
		location.href="cutoutInsert.jsp";
		userMgrSelOb.value=""
	}
}

//-------------------------------찜하기 기능메서드-----------------------------------------
function basket(){
	alert();
}
//-------------------------------예약하기 기능메서드---------------------------------------
var selpositionOb = document.querySelector("#selposition")
var show="<form method='get'>";
show += "<input type='date' class='reserSel' name='reservationDate'>"
show += "<input type='time' class='reserSel' name='reservationTime'><br>"
show += "<input type='submit' class='reserSel' name='complete' value='예약잡기'><br>"
show += "</form>"
function reservation(){
	selpositionOb.innerHTML=show
}
</script>
</html>