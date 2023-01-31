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

</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
	<table>
		<tr><th>인증 수단</th><td><input type="radio" checked="checked">휴대전화</td></tr>
		<tr><th>휴대전화번호</th><td><input type="text">-<input type="text">-<input type="text"></td></tr>
		<tr><th>인증번호</th>
		<td><input type="text" />
			<input id="Timer" type="text" value="" readonly/>
			<input type="button" id="sendbutton" value="인증번호 발송"/></td></tr>
	</table>
	<button type="button">조회</button>
</body>
<script>
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
	            Timer.value=Math.floor(min)+':'+sec; //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
	           
	        }
	        if(sec===0){
	         	// 0에서 -1을 하면 -59가 출력된다.
	            // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
	            sec=60;
	            Timer.value=Math.floor(min)+':'+'00'
	        }     
	    },1000); //1초마다 
	}
	
	TIMER();
	setTimeout(function(){
	    clearInterval(PlAYTIME);
	},180000);//3분이 되면 타이머를 삭제한다.
</script>
</html>