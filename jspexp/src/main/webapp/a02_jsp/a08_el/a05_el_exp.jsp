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
/*
 
*/
</script>

</head>
<body>
<%-- 
ex) 점수 : [		][합격여부]
	클릭 시, 70점 이상 합격/그외 불합격 출력 처리하세요.
	입력값여부 : @@
	70이상여부: @@
	구분:합격/불합격 - 3항연산자 활용 
--%>
	<form>
	점수:<input type="text" name="score" />
	<input type="submit" value="합격여부" />
	</form>

	<h2>입력값 여부:${not empty param.score}</h2>
	<h2>70점이상 여부:${param.score>=70}</h2>
	<h2>구분:${param.score>=70?"합격":"불합격"}</h2>
</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>