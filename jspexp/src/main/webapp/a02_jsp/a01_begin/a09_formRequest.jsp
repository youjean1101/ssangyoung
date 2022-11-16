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
# form과 요청값과 request.getParameter() 관계
1. 요청값 형식
	페이지명?요청키=요청값&요청키=요청값
	==> 이것을 처리해주는 화면
	<form action="페이지명">
		<input name="요청키" value="요청값" />
		<input type="submit" />
	submit 버튼을 클릭시, 서버로 위에 url형식을 전송을 하고.
	request.getParameter("요청키") : 요청값..
	
--%>

	<form><!-- action이 없으면 현재페이지를 다시 요청값과 함께 전송한다. -->
	이름: <input type="text" name="name" />
	나이: <input type="text" name="age" />
	사는곳: <input type="text" name="loc" />
	<input type="submit"/>
	</form>
	<%
	String name=request.getParameter("name");
	if(name==null) name="";
	String age=request.getParameter("age");
	if(age==null) age="0";
	String loc=request.getParameter("loc");
	if(loc==null) loc="";
	%>
	<h2>전송 받은 값</h2>
	<table>
		<col width="40%">
		<tr><th>이름</th><td><%=name %></td></tr>
		<tr><th>나이</th><td><%=age %></td></tr>
		<tr><th>사는곳</th><td><%=loc %></td></tr>
	</table>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>