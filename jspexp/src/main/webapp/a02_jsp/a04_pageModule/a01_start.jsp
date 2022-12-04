<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<%request.setCharacterEncoding("utf-8"); %>
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
# 페이지 모듈화 및 요청 흐름 정리
0. 화면을 구성할 때는 여러가지 설정이 필요한 경우도 있고, 공통으로 처리하는 페이지가 필요할 때도 많다.
	공통 처리 내용에 대하여 따로 jsp을 선언하고 활용한다면 보다 효과적으로 변경/수정/추가시 처리가 가능하다.
	ex) 공통되는 화면처리, 공통되는 session 처리, 공통되는 java/js 변수 처리
	
1. jsp는 외부페이지를 모듈화하여 포함되어 처리할 수 있다.
	jsp ==> java라는 개념에 의해, 외부의 다른 컴파일된 파일을 포함시켜서 처리하는 방법과
	포함되어서 하나의 컴파일로 파일을 처리하는 방법으로 두가지로 나누어서 처리한다.
	1) 독립된 java파일을 호출하여 처리하는 경우
		<jsp:include 액션 태그
		다른 객체이기에 데이터를 전달할 때도 요청값형식으로 전달한다.
		ex) 파일1	 ==> 따로 컴파일 ==> 컴파일된 파일2를 호출
			파일2 ==> 따로 컴파일
		
	2) 현재 페이지에서 포함시켜 결국은 하나의 jsp로 만들어 처리하는 경우
		include 디렉티브
		같은 파일로 생각해서 변수를 위에서 아래로의 흐름에 따라 선언해서 사용하면 된다.
		ex) 파일1 ==> 파일2와 함께 하나의 파일로 컴파일시켜서 처리하는 방식
			파일2 
		
2. 그 외에서 request의 forward개념으로 현재 페이지를 호출하지만 요청값을 가지고, 특정한 페이지로
	이동처리하는 jsp의 액션태그인 jsp:forward가 있다.
	현재페이지가 가지고 있는 request, response와 함께 있는 데이터를 가지고 다음페이지에 전송이 된다. 
	ex) 요청값, 쿠키값 등..

# jsp:include 액션태그
1. 다른 jsp 페이지의 실행 결과를 현재 위치에 삽입
2. 기본형식
	1) <jsp:include page="포함할 페이지" flush="true"/>
	2) page 속성 : 포함할 외부 jsp 페이지
	3) flush 속성 : 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러시할 지의 여부를 지정한다.
		true는 출력 버퍼를 플러시하고 false이면 하지 않는다.
	ps) 버퍼개념 - 화면을 구현하는데 어느 정도의 데이터가 있는 패킷(데이터단위)가 다 있어야 표현이 되는데,
		네트워크 속도가 좋지 않을 때, 현재 화면을 조금씩 로딩하는 것보다 모든 내용을 다 받아서 로딩하는 것이 효율적일 때,
		버퍼라는 메모리를 써서 한꺼번에 화면을 구성하는 개념을 말한다.
		A 화면 ==> B 화면
		ex) 비유 - 1ton의 물이 이용해서 우물은 완성할 때 조금씩 양동이를 가지고 나르다가 다 차면 
			한번에 완료를 하는 개념이다.
		
3.	<jsp:param>액션 태그
	1) 신규 파라미터를 추가하는데 사용 
		<jsp:parameter name="파라미터이름" value="값" />
		상단에 선언하여야 한글 파라미터값을 전달할 수 있다.
		==> <%request.setCharacterEncoding("utf-8"); %>	
	2) 해당 페이지 안에서는 
		request.getParameter("파라미터이름")
# <jsp:include> 액션 태그와 include 디렉티브
1. <jsp:include>
	1) 요청시간에 처리
	2) 별도의 파일을 요청 처리 흐름을 이동
	3) request 기본 객체나 <jsp:param>을 이용한 파라미터 전달
	4) 화면의 레이아웃의 일부분을 모듈화할 때, 주로 사용된다.
2. <include 디렉티브>
	1) jsp 파일을 자바 소스로 변환할 때 처리
	2) 현재 파일에 삽입시킴
	3) 페이지 내에 변수를 선언 후, 변수에 값 저장
	4) 다수의 jsp페이지에서 공통으로 사용되는 변수를 지정하는 코드나 저작원과 같은 문장을 포함한다.
--%>
	<h2>include 액션 페이지 호출</h2>
	<div style="border:1px solid green">
		<jsp:include page="a02_subPage.jsp">
			<jsp:param value="사과" name="name"/>
			<jsp:param value="3000" name="price"/>
			<jsp:param value="2" name="cnt"/>
		</jsp:include>
	</div>
	<%--
	ex) a03_includeExp.jsp에 include액션태그로 a04_subPage.jsp를 만들고, 출력하게 하세요.
		전달데이터 - 회원명 회원권한
	 --%>
	
<div id="container" ></div>


</body>
<script type="text/javascript">
/*
 
*/
var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>