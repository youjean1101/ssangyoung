<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">

</script>

</head>
<body>

	<h2>[1단계:확인] 2. [js] 선수1(소속,이름,득점)을 json 객체로 선언하여, 대입연산자로 선수2할당한 경우와 ...(spread) 키워드로 
                  deep복사한 선수2를 만들어 득점을 증가했을 때, 차이를 출력하세요.</h2>
     <h3 id="ex2"></h3>
     <script>
     var player1 = {team:"대한민국",name:"조규성",score:"0"}
     var player2 = player1
     var player3 = {...player1}
     player1.score="2"
     document.querySelector("#ex2").innerHTML= "선수1: "+JSON.stringify(player1)+"<br>"
     document.querySelector("#ex2").innerHTML+= "선수2(대입연산자복사): "+JSON.stringify(player2)+"<br>"
     document.querySelector("#ex2").innerHTML+= "선수3(deep복사): "+JSON.stringify(player3)+"<br>"
   
     </script>
	<h2>[1단계:확인] 3. [js] 회원 아이디를 입력하면 입력된 수를 옆에 표시하세요.</h2>
	    회원아이디:<input type="text" name="id" onkeyup="textCnt(this)"/>
	    <span id="textCntout"></span>
   	<script>
   		function textCnt(obj){
	   		var len = obj.value.length
	   		document.querySelector("#textCntout").innerText= "입력하신 글자수: "+len
   		}
   	</script>
   
	<h2>[2단계:확인] 3. [js] 회원 아이디를 입력시 글자수 제한을 8~16로 처리하기로 했다. 입력시, 해당 범위에 맞지 않으면
               하단에 입력범위는 8~16 표시하고 그외에는 입력가능으로 표시하게 하세요.</h2>
	 
	 회원아이디:<input type="text" name="id" onkeyup="textCnt3(this)"/>
	 <span id="textCntout3"></span>
   
    <script>
    function textCnt3(obj){
   	 var len = obj.value.length
   	 if(len>16 || len<8){
   		document.querySelector("#textCntout3").innerText = "8~16자로 입력해주세요."
   		 obj.value = obj.value.substring(0,16)
   	 }else{
   		document.querySelector("#textCntout3").innerText= "글자수:"+len+"(입력가능)"
   	 }
    }
    </script>
    
	<h2>[2단계:확인] 4. [js] 팀인원등록[    ][등록] 
			==> 선수명을 ,단위로 구분해서 등록 버튼을 누르면 바로 밑에 테이블 형식으로 번호(1.2...)와 함께 이름이 출력되게 하세요</h2>
			
	팀인원등록:<input type="number" name="teamcnt" />
	<input type="button" value="등록" onclick="playerName()"/>
	<h3>선수명조회</h3>
	
	<table id="ex4"></table>
	<script>
		function playerName(){
			var playerName = "손흥민, 이강인, 황인범, 김민재, 황희찬, 조현우, 김영권, 정우영, 조규성"
			var playerNameEach = playerName.split(",")
			
			var playerCnt =document.querySelector("[name=teamcnt]").value;
			var show = "<tr><th>no</th><th>선수명</th></tr>"
			
		 	for(var i=0;i<playerCnt;i++){
				show += "<tr><td>"+(i+1)+"</td><td>"+playerNameEach[i]+"</td></tr>"
			}
			document.querySelector("#ex4").innerHTML = show 
		}
	</script>
		
	<h2>[1단계:확인]* 5. [jsp] 웹 서버단위로 초기 설정값을 설정할려고 한다. 처리 방식을 기술하세요</h2>
	
	<h2>[1단계:확인]* 6. [jsp] 웹 서버에서 DB 주소, port, sid, 계정, 비번설정해서 DB를 접속할려고 한다. 처리하고, 호출하세요.</h2>
		<h3>DB주소:<%=application.getInitParameter("DB address") %></h3>
		<h3>Port:<%=application.getInitParameter("port") %></h3>
		<h3>sid:<%=application.getInitParameter("sid") %></h3>
		<h3>id:<%=application.getInitParameter("id") %></h3>
		<h3>password:<%=application.getInitParameter("password") %></h3>
		<!-- 자바의 변경이나 서버 단위 설정 정보변경(web.xml..)은 실행시 반드시 서버를 재기동하여야 한다. -->
		<h2>정답</h2>
		<h3>DB정보</h3>
		<h3>주소:<%=application.getInitParameter("ip2") %></h3>
		<h3>포트:<%=application.getInitParameter("port2") %></h3>
		<h3>DB명:<%=application.getInitParameter("sid2") %></h3>
		<h3>계정:<%=application.getInitParameter("username2") %></h3>
		<h3>패스워드:<%=application.getInitParameter("pass") %></h3>
	
	<h2>[1단계:확인] 8. [jsp] 회원을 아이디(page), 이름(request), 포인트(session), 권한(application) 범위로 설정하여, 출력하세요.
               요청값 범위 확인, 세션값 범위 확인 클릭을 통해 해당 범위 데이터를 확인하세요.</h2>
		<%
		pageContext.setAttribute("ID", "himan");
		request.setAttribute("NAME", "홍길동");
		session.setAttribute("POINT","300P");
		application.setAttribute("AUTH", "관리자");
		%>
		<h3>아이디(page): <%=pageContext.getAttribute("ID") %></h3>
		<h3>이름(request): <%=request.getAttribute("NAME") %></h3>
		<h3>포인트(session): <%=session.getAttribute("POINT") %></h3>
		<h3>권한(application): <%=application.getAttribute("AUTH") %></h3>
		<a href="1129_request.jsp">요청값 범위 확인</a>
		<a href="1129_session.jsp">세션값 범위 확인</a>
	
	
	<h2>[3단계:확인]* 9. [jsp] 로그인페이지(z10_login.jsp) 아이디와 패드워드를 입력해서,  z11_checkValid.jsp로 submit처리하여
                  인증이되면 session범위로 id를  설정하여 z11_main.jsp에 @@님 로그인되었습니다. 출력하게하고,
                  그렇지 않으면 request의 forward메서드로 다리 z01_login.jsp 화면에서 로그인 실폐하였습니다가 
                  출력되게 하세요.</h2>
	<form action="z11_checkValid.jsp">
		아이디:<input type="text" name="ID" />
		패스워드:<input type="text" name="PASSWORD" />
		<input type="submit" value="로그인" />
	</form>
	<h3>정답</h3>
	<!--
	# 처리순서
	1. 업무처리 flow 확인
		로그인페이지 아이디 패스워드 입력 ==> 인증여부에 따라서 ==> 로그인페이지
														메인페이지
	2. 개발 순서
		1) 로그인 화면 구성(z10_login.jsp)
			- 4) 항목을 같이 처리해도 무방한다.
			<form> action="z11_checkValid.jsp"
		2) form action 요청페이지 호출 설정(유효성 check-js)
		3) 요청값을 받을 내용을 처리(z11_checkValid.jsp)
			- DB나 조건에 의해 인증되었을 때, 세션값 설정 z11_main.jsp 이동 처리
			- 인증되지 않았을 때, forward로 z10_login.jsp 이동
				if(id.equals("haman") && pass.equals("7777"){
					session.setAttribute("id",id);
					response.sendRedirect("z11_main.jsp");
				}else{
					// request.setAttribute()로 처리해도 되지만,
					// request.getParameter("id")로 처리가 되기에 생략 가능
					request.getRequestDispather("z10_login.jsp"
					).forward(request, response);
				}
			
			
		4) 유효화하지 않는 id에 대한 로그인 화면 요청값 처리(z10_login.jsp)
			- request 객체로 요청값 확인 및 인증되지 않음 경고창 처리
			String id = request.getParameter("id")
			boolean isInvalid = false;
			if(id!=null){
				isInvalid = true;
			}
			js
			var isInvalid = < %=isInvalid%>;
			if(isInvalid) alert("< %=id%>는 인증된 계정이 아닙니다.");
			
		5) 메인 화면에서 session 출력 z11_main.jsp
			<h2>< %=session.getAttribute("id")%>님 로그인 중입니다.</h2>
		
	
	
	 -->
</body>
<script type="text/javascript">

</script>
</html>