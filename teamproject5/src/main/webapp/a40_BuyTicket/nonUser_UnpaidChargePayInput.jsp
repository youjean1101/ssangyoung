<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>미납요금 결제 입력</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	#unpaidPayInputTab{
		border:1px solid black;
		top-border:3px;
		width:80%;
		margin-left:10%;
		margin-top:2%;
	}
	#unpaidPayInputTab th{
		border:1px solid black;
		background:rgb(219, 217, 217);
		font-size:10pt;
		font-weight:bold;
		text-align:center;
		width:30%;
		opacity:0.7;
	}
	
	#unpaidPayInputTab td{
		border:1px solid black;
		font-size:10pt;
		width:70%;
		height:40px;
		padding-left:3%;
	}
	
	#unpaidPayInputTab td input[type="text"]{
		width:70px;
		height:20px;
	}
	
	#sendbutton{
		background:rgb(67, 84, 100);
		color:white;
		border:none;
		width:150px;
		height:25px;
		font-size:8pt;
		outline:none;
	}
	#viewButton{
		width:250px;
		height:30px;
		margin-top:1.5%;
		margin-left:40%;
		border:none;
		background:rgb(51, 160, 117);
		color:white;
		outline:none;
	}
	#Timer{
		color:red;
		border:none;
		text-align:center;
	}
	
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sendbutton").click(function(){
			TIMER()
		})	
	});
</script>
</head>

<body>
	<table id="unpaidPayInputTab">
		<tr><th>인증 수단</th><td><input type="radio" checked="checked">휴대전화</td></tr>
		<tr><th>휴대전화번호</th><td><input type="text"> - <input type="text"> - <input type="text"></td></tr>
		<tr><th>인증번호</th>
		<td><input type="text" id="certnum"/>
			<input id="Timer" type="text" value="" readonly/>
			<input type="button" id="sendbutton" value="인증번호 발송"/></td></tr>
	</table>
	<button id="viewButton" type="button">조회</button>
</body>
<script>
//-------------------------------타이머 기능-------------------------------
	const Timer=document.getElementById('Timer'); //스코어 기록창-분
	let time= 180000;
	let min=3;
	let sec=60;
	
	Timer.value=min+":"+'00'; 
	
	function TIMER(){
	    PlAYTIME=setInterval(function(){
	        time=time-1000; //1초씩 줄어듦
	        min=time/(60*1000); //초를 분으로 나눠준다.
	
	       if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
	            sec=sec-1;
	            Timer.value=Math.floor(min)+':'+sec; 
	            //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
	        }
	        if(sec===0){
	         	// 0에서 -1을 하면 -59가 출력된다.
	            // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
	            sec=60;
	            Timer.value=Math.floor(min)+':'+'00'
	        }     
	    },1000); //1초마다 
	}
	
	setTimeout(function(){
	    clearInterval(PlAYTIME);
	},180000);//3분이 되면 타이머를 삭제한다.
	//출처:https://twinklehwa.tistory.com/426
</script>
</html>