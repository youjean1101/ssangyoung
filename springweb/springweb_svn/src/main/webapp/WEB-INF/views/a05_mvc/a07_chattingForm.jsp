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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	var wsocket;
	$(document).ready(function(){
		<%-- 
		
		--%>
		// 이벤트 핸들러 익명 함수 호출
		// 1. 접속시1(버튼)
		$("#enterBtn").click(function(){
			console.log("접속1")
			if($("#id").val()==""){
				alert("아이디를 입력하셔야 접속가능합니다.")
			}else{
				conn()
			}
		})
		// 2. 접속시2(enter키) 
		$("#id").keyup(function(){
			if(event.keyCode==13){
				console.log("접속2")
				if($("#id").val()==""){
					alert("아이디를 입력하셔야 접속가능합니다.")
				}else{
					conn()
				}
			}
		})
		// 3. 메시지보내기1(버튼)
		$("#sendBtn").click(function(){
			console.log("메시지1")
		})
		// 4. 메시지보내기2(enter키) 
		$("#msg").keyup(function(){
			if(event.keyCode==13){
				console.log("메시지2")
			}
		})	
		// 5. 종료 버튼
		$("#exitBtn").click(function(){
			console.log("종료")
		})
		// 6. 전송해보는 메시지 처리(socket 객체를 통해서 처리)
	});
	// 소캩 통신 관련 공통메서드 처리
	function conn(){
		// 스프링 컨테이너 안에 선언된 서버 핸들러 호출 객체 호출과 함께 소켓 서버 접속
		wsocket = new WebSocket("ws:localhost:7080/${path}/chat-ws.do")
		// 이벤트 핸들러 메서드 선언
		// 1. 접속될 때.. 서버상 afterConnectionEstablished() 메서드와 연동
		wsocket.onopen=function(evt){
			console.log(evt)
			// 메시지 전송 메서드 호출 서버상 handleMessage() 메서드 연동
			wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.")
		}
	}
	
	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>채팅</h2>
</div>
<div class="container">
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text  justify-content-center">접속아이디</span>
		</div>
		<input id="id" class="form-control"  placeholder="접속할 아이디를 입력하세요"/>
		<input type="button" class="btn btn-success" value="채팅입장" id="enterBtn"/>
		<input type="button" class="btn btn-danger" value="나가기" id="exitBtn"/>			
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text  justify-content-center">내용</span>
		</div>
		<div id="chatArea" class="input-group-append">
			<div id="chatMessageArea"></div>
		</div>
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend">
			<span class="input-group-text  justify-content-center">메시지</span>
		</div>
		<input id="msg" class="form-control" value="" placeholder="보낼 메시지 입력"/>
		<input type="button" class="btn btn-info" value="메시지전송" id="sendBtn"/>		
	</div>		
</div>		
</body>
</html>