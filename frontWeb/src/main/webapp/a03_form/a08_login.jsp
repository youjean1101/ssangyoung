<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	클라이언트	<====>	서버
	1. 웹서버가 고정 아이피(도메인주소), 서버를 프로젝트단위 소스와 함께 실행을 한 상태..
		(준비가 된 상황) - 마트에 손님 받을 준비
	2. 클라이언트 url주소로 도메인 => ip 주소 ==> port
		(마트에 여러물건을 파트 코너가 있듯이 웹서비스1, 웹서비스2, ..오라클서버)
		==> context path 설정에 의해서 서버안 소스를 접근(webapp)
		/, 프로젝트명/
		http://@@@:7080/context path명/
		==> 폴드안에 특정한 html/jsp를 호출
	3. 서버가 해당 자원(html/jsp) client에 전달한다.
		html형식으로 소스를 전달하면 클라이언트에 있는 브라우저가 html을 랜더링
		(h1 ==> 글자크기 크게, table ==> 테이블 형식으로 변경)
		# 클라이언트로 전달되기 전에
		1) html(태그, css, js, 이미지) : 바로 전달
		2) jsp(html + java) ==> java ==> class ==> 
			최종 html(결과 html) ==> 클라이언트에 전달.
			ex) 화면 ${}, <%%> 등 자바 application은 전달되지 않는다.
			html 형식으로 소스를 전달하면 클라이언트에 있는 브라우저가 
			html을 랜더링(h1 ==> 글자크기 크게, table ==> 테이블 형식으로 변경)
	4. 클라이언트는 위 html랜더링한 화면을 브라우저에 의해서 볼 수 있다.
	5. 클라이언트 : form 형식이 있는 내용을 보고, 데이터를 입력 후, submit를 클릭하면
		서버에 특정 페이지와 요청값을 전달한다.
		페이지명?요청키=요청값
	6. 서버는 해당 자원을 경로따라서 받고, 요청값이 있는 경우는 
		jsp(어플리케이션 프로그램)에 의해서 받아서 해석을 한 후, 
		최종 결과 html을 만들어 다시 클라이언트에 전송을 한다.
		ex) id=himan&pass=7777 ==> ${param.hi}
			==> DB서버접속 ==> 결과에 대한 최종 html을 만드는 자바+html 코드를 통해서 
			==> html만들어서 결과코드를 클라이언트에 전달. 
	
	target = "_self"
	1. 현재 페이지를 대체하는 옵션 a link, form
	2. default 옵션 : 설정하지 않더라도 처리되는 옵션
	3. jsp 페이지를 form으로 만들고 submit 처리하면 다시 현재 페이지를 호출
		이 때, 다시 현재 페이지를 호출하여 처리가 가능하다.
		즉, 물리적으로는 하나의 페이지이지만, 시간간격상 다른 두개의 페이지가 처리되는 것이다.
		cf) 
			사람1 --(너 멋있어졌구나)-->	사람2
	 								이 말을 듣기 전 사람2의 정보와 
	 								이 말을 들은 후 사람2의 정보를 다르다.
	 		client <===> 서버
	 	1. 브라우저에서 url주소로 a08_login.jsp페이지를 호출
	 	2. 서버는 a08_login.jsp 요청값이 없는 페이지 그대로 브라우저애서 전달한다.
	 			a08_login.jsp ==> @@@.html
	 	3. 브라우저에서 로그인 폼을 보고 아이디와 패스워드를 입력하여 전송(submit)버튼을 클릭한다.
	 		a08_login.jsp?id=himan&pass=7777
	 	4. 서버에서는 요청값을 받아서 해당내용을 실행시키고, 그 결과를 html로 만들어서 다시 
	 		client에 전송한다. ${param.id}
	 	5. 브라우저(클라이언트)에서는 이 내용을 최종 결과로 확인 할 수 있다.
	 --%>
	 <h2>로그인</h2>
	 <form method="post">
	 	아이디: <input type="text" name="id"/><br>
	 	패스워드: <input type="password" name="passwd"/><br>
	 	<input type="submit" value="로그인"/>
	 </form>
	 <h3>로그인 결과</h3>
	 <h4>아이디:${param.id}</h4>
	 <h4>패스워드:${param.passwd }</h4>
	 <h4>${param.id=='himan' and param.passwd=='7777'? 
	 			'로그인성공':'로그인실패'}</h4>
	 <!-- 
	 ex) a09_sellProduct.jsp
	 		물건명:[	] 구매갯수:[	]
	 		[구매]
	 		
	 		구매내역
	 		물건명 : @@@
	 		갯수 : @@
	  -->
</body>
</html>