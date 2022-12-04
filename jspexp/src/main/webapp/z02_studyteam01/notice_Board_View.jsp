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

</style>
<script type="text/javascript">

</script>

</head>
<body>
	<box>
		<table>
		<tr><th>구분 : </th><td></td></tr>
		<tr><th>제목 : </th><td></td></tr>
		<tr><th>내용 : </th><td></td></tr>
		<tr><th>파일 첨부 : </th><td></td></tr>
		<tr><th></th><td>파일명.jpg</td></tr>
		</table>
	</box>
	<input type="button" value="수정하기" onclick="noticeEditGo()">
	<input type="button" value="삭제하기" onclick="noticeRemoveGo()">
	<input type="button" value="뒤로가기" onclick="noticeBackGo()">

</body>
<script type="text/javascript">
	function noticeEditGo(){
		location.replace("notice_Board_Edit.jsp");
	}
	function noticeRemoveGo(){
		alert("! 해당 게시물을 정말 삭제하시겠습니까?");
	}
	function noticeBackGo(){
		location.replace("notice_Board_All_View.jsp");
	}
</script>
</html>