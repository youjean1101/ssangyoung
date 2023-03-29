<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>

</head>
<body>
<select onchange="document.getElementById('mid').value = this.options[this.selectedIndex].value">
	<option value='board1'>게시판1</option>
	<option value='board2'>게시판2</option>
</select>

 

<input type="hidden" name="mid" value="">


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>