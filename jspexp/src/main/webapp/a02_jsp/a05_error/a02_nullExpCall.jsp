<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
	errorPage = "z01_errorPage.jsp"
    %>
 <%--
 # 예외가 발생가능성 있는 페이지에 예외 페이지 지정하기
 1. 페이지 지시작에 예외가 발생했을 때, 처리할 페이지 지정
 2. 테스트용을 강제 예외 코드 설정
  --%>
  <%
  String name = null; name.toString(); 
  // 객체 생성하지 않고 메서드 활용, NullPointerException 발생
  request.setCharacterEncoding("utf-8");
  %>
  <%--ex) z02_errorPage.jsp 만들고, 에러 내용을 h2로 출력하세요.(배경이미지지정) 
  		 a03_arrayIndex.jsp 만들고
  		 	String[] arr = {"홍길동"}
  		 	arr[1]; 처리로 강제 예외 발생..--%>
  
  
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