<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
      
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
<%-- 
# request 기본 객체
1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
2. 주요 기능
	1) 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
	2) 서버와 관련된 정보 읽기 기능
	3) 클라이언트가 전송한 요청 파라미터 읽기 기능
	4) 클라이언트가 전송한 쿠키 읽기 기능
	5) 속성 처리 기능
3. request 기본 객체 - 주요 정보 제공 메소드
	기준이 되는 서버 : http:local
	1) getRemoteAddr()
		웹 서버에 연결한 클라이언트의 ip 주소를 구한다.
		게시판이나 방명록 등에서 글 작성자의 ip 주소가 자동으로 입력되기도 하는데,
			이 때, 입력되는 ip주소가 바로 이 메서드를 사용하여 구현되는 것이다.
	2) getMethod()
		웹 브라우저가 정보를 전송할 때, 사용한 방식을 구한다.
	3) getRequestURI() : 웹브라우저가 요청한 URL에서 경로를 구한다.
	4) getContextPath() : JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경로를 구한다.
	5) getServerName() : 연결할 때 사용한 서버 이름을 구한다.
	6) getServerPort() : 서버가 실행중인 포트 번호를 구한다.
	ps) 위 정보들을 서버에서 LOG파일이나 db로 저장해서, 현재 서버의 부하량이나 
		접속 정보들을 파악해서 모니터링할 때, 활용된다.
--%>
<h2>원격주소:<%=request.getRemoteAddr() %></h2>
<h2>전송방식:<%=request.getMethod() %></h2>
<h2>요청uri:<%=request.getRequestURI() %></h2>
<h2>기준 context:<%=request.getContextPath() %></h2>
<h2>서버명<%=request.getServerName() %></h2>
<h2>포트명:<%=request.getServerPort() %></h2>
<%
String path = request.getContextPath();
//경로상 webapp 하위이다.
%>
<img src ="<%=path%>/a00_img/apple.jpg"/>
<!-- 
클라이언트 <============> 서버
		====request==>
		<===response==
1. 클라이언트에서 서버로 주는 내용
	1) 요청 query string ?key=value
	2) 쿠키정보
	3) 기타 클라이언트 관련 접속 정보
2. 서버에서 클라이언트로 주는 내용
	1) 구성된 화면(웹화면)
	2) session 정보 전달
	3) 기타 서버 관련 정보

# request 기본 객체 - 파라미터 읽기 메서드(요청값 처리 메서드)
1. 기준 요청값
	?key=value
2. 기능메서드
	request.getParameter(String name)
		이름이 name인 파라미터의 값을 구한다. 존재하지 않을 경우 null로 리턴
		주로 요청 키와 요청값이 단일인 경우 사용한다.
		EX) ?name=홍길동&age=25&loc=서울
	request.getParameterValues(String name)
		이름이 name인 모든 파라미터의 값을 배열로 구한다. 존재하지 않을 경우 null을 리턴한다.
		ex) ?names=홍길동&names=김길동&names=마길동
	request.getParameterNames() : 웹브라우저가 전송한 파라미터의 이름을 구한다.
	request.getParameterMap() : 웹브라우저가 전송한 파라미터의 맵을 구한다. 맵은
		파라미터 이름, 값 쌍으로 구성된다.
	==> 요청 key를 모르거나, 변동이 되는 경우, 해당 요청 key와 값을 설정하여 처리할 때, 활용된다.
	
 -->
 	<%--
 	http://localhost:7080/a02_jsp/a02_startJSP/a03_request.jsp 
 	?name=홍길동&age=25&loc=서울&price=3000&price=4000&price=5
 	--%>
 	<h2>name:<%=request.getParameter("name") %></h2>
 	<h2>age:<%=request.getParameter("age") %></h2>
 	<h2>loc:<%=request.getParameter("loc") %></h2>
 	<%
 	String prices[] = request.getParameterValues("price");
 	if(prices!=null){
 	%>
 	<h2>price[0]:<%=prices[0] %></h2>
 	<h2>price[1]:<%=prices[1] %></h2>
 	<h2>price[2]:<%=prices[2] %></h2>
 	<%} %>
 	<h2>getParameterNames 처리</h2>
 	<%
 	// 요청값이 가변적일 때, 처리되는 객체로 요청 키들을 가지고 온다.
 	Enumeration e = request.getParameterNames();
 	
 	int tot = 0;
 	while(e.hasMoreElements()){ // 요청키가 있을 때까지 처리..
 		String key = (String)e.nextElement(); // 요청키를 가지고 온다.
 		//String value = request.getParameter(key); //요청값을 가지고 온다.
 		// 여러개가 단일 갯수가 섞여 있는 경우..
 		String req[] = request.getParameterValues(key);
 		for(String value:req){
 			if(key.equals("price")){
 				
 				int price=0;
 				// null, "", 숫자형이 아닌 것을 모두 다 0으로 처리
 				try{
 					price = Integer.parseInt(value);
 				}catch(Exception ex){}
					tot+=price;	
 			}
 			out.print("<h3>"+key+":"+value+"</h3>");
 		%>
 		<%-- <h3><%=key %>:<%=value %></h3> --%>
 	<%}
 	} 
 	out.print("<h3>총비용 합산:"+tot+"</h3>");
 	%>
 	
 	
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>