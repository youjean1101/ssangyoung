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
<style>
	h2{
		font-family:batang;
		font-size:30pt;
		text-align:center;
		color:lightgreen;
		font-style: italic;
	}
	
	input[type="button"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
		position:fixed;
	    bottom: 35%;
	    left:38%;
	    width: 237px;
	    height: 40px;
	    font-size: 19pt
	}
</style>
<script type="text/javascript">

</script>
	
</head>
<body>
 	<jsp:include page="noticeBoard_topMenu.jsp"></jsp:include>
	<h2 id="first">나태함</h2>
	<h2 id="second">그 순간은 달콤하나, 결과는 비참하다.</h2>
	<input type="button" value="게시판 보러가기" onclick="noticeGo()"/>


</body>
<script type="text/javascript">
	function noticeGo(){
		location.replace("notice_Board_All_View.jsp");
	}
</script>
</html>