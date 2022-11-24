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
# 주요 기본 객체
1. request : 클라이언트의 요청정보를 저장한다.
2. response : 응답 정보를 저장한다.
3. pageContext : jsp 페이지에 대한 정보를 저장한다.
4. session : HTTP 세션 정보를 저장한다.
5. application : 웹 어플리케이션에 대한 정보를 저장한다.
	- 웹서버 전체에 대한 저장 정보를 처리할 수 있다.
6. out : jsp 페이지가 생성하는 결과를 출력할 때 사용되는 출력 스트림이다.
7. config : jsp 페이지에 대한 설정 정보를 저장한다.
8. page : JSP 페이지를 구현한 자바 클래스 인스턴스이다.
9. exception : 예외 객체, 에러 페이지에서만 사용된다.

# out 기본 객체
1. jsp 페이지가 생성되는 모든 내용은 out 기본 객체를 통해서 전송할 수 있다.
2. 복잡한 if-else 사용시, out 기본 객체 사용하면 편리하다.
	1) scriptlet, expresion의 복잡한 사용보다. out 으로 활용할 때
		더 효율적일 때가 많다.
3. 출력 메서드
	1) out.print() : 데이터를 출력만 한다.
	2) out.println() : 데이터를 출력하고 줄바꿈처리까지 한다.
	3) out.newLine() : 줄바꿈 처리를 한다.
--%>
<h2>안녕하세요</h2>


<h3>
<%for(int cnt=0;cnt<=10;cnt++) {%>
	<%=cnt %>,
<%} %>
</h3>
<h2>out객체 사용</h2>
<h3>
<%
	for(int cnt=0;cnt<=10;cnt++){
		out.print(cnt+",");
	}
%>
</h3>
<%--
ex) cnt를 1~16까지하여 테이블을 번호가 있는 테이블(4X4)을 만들어 보세요. 
	( 조건문 쓰기 곤란한분들은 이중 for문 쓰셔도 됩니다.)
 --%>
 <table>
 	 <%
	 	 int cnt = 0;
	 	 for(int row=1;row<=4;row++){
	 	 	out.print("<tr>");
	 	 	for(int col=1;col<=4;col++){
	 	 		out.print("<td>"+(++cnt)+"</td>");
	 	 	}
	 	 	out.print("</tr>");
	 	 } 	 
 	 %>
 </table>
 
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>