<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.vo.Person, jspexp.vo.Product"
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
# page 디렉티브
1. jsp 페이지에 대한 정보를 입력
	- jsp가 생성할 문서의 타입, 사용할 클래스, 버퍼여부, 세션 여부

2. 주요 속성
	contentType : jsp가 생성할 문서의 타입을 지정
	session : jsp 페이지가 세션을 사용할 지의 여부를 지정
		default session = "true"
	info : jsp 페이지에 대한 설명을 입력한다.
	errorPage : 에러가 발생할 때, 보여줄 페이지를 지정
	isErrorPage : 에러페이지인지의 여부를 지정
	
# page 디렉티브 : import 속성
1. jsp 페이지에서 사용할 클래스(인터페이스)지정
2. import 속성의 사용 예
	page import="java.util.Calendar"
	page import="java.util.*, jspexp.vo.*"
3. import한 클래스는 단순 클래스 이름으로 사용가능
4. 다른 패키지의 같은 클래스는 패키지명까지 선언하여 호출 사용하여야 한다.

# 스크립트 요소
1. 요청을 처리하는데 필요한 코드를 실행
2. 동적으로 응답 결과를 생성하기 위해 사용
3. 스크립트 요소 세가지
	1) scriptlet <% %>
	2) expression <%= %>
	3) declartion : 자바의 클래스명 밑에 선언된 내용
--%>

<%!
String name = "홍길동";
int call(int num01, int num02){
	return num01+num02;
}
class Person{
	private String name;
	private int age;
	Person(String name, int age){
		this.name = name;
		this.age = age;
	}
	String getName(){
		return name;
	}
	int getAge(){
		return age;
	}
}
//숫자형 요청값에 대한 서버단 처리 기능 메서드 선언.
int chInt(String req){
	int ret = 0;
	if(req!=null){
		try{
		ret = Integer.parseInt(req);
		}catch(Exception e){
			log("에러발생:"+e.getMessage());
		}
	}
	return ret;
}
%>
<% 
	int num01 = chInt(request.getParameter("num01"));
	int num02 = chInt(request.getParameter("num02"));
	int plusTot = num01+num02;
%>
<h2>선언된 내용 호출</h2>
<h3><%=name %></h3>
<h3><%=call(25,30) %></h3>
<%
Person p01 = new Person("신길동",25);
%>
<h3><%=call(25,30) %></h3>
<h3><%=p01.getName() %></h3>
<h3><%=p01.getAge() %></h3>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>