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
	<form>
		<table>
			<tr><th>구분 : </th><td row="2"><select>
								<option>java script</option>
								<option>jsp</option>
								<option>java</option>
								<option>DataBase</option>
								<option>HTML</option>
								<option>CSS</option>
								</select></td></tr>
			<tr><th>제목 : </th><td row="2"><input type="text" name="title" placeholder="제목을 입력해주세요."/></td></tr>
			<tr><th>내용 : </th><td row="2"><textarea type="text" name="content" placeholder="내용을 입력해주세요."/></textarea></td></tr>
			<tr><th>파일 첨부</th><td><input type="text" name="files" placeholder="c://text.jpg"/></td>
				<td><input type="button" value="파일첨부" onclick=""/></td></tr>
		</table>
		<input type="submit" value="작성하기" />
		<input type="button" value="취소" onclick="noticeAllViewGo()" />
	</form>

</body>
<script type="text/javascript">
	function noticeAllViewGo(){
		location.replace("notice_Board_All_View.jsp");
	}
</script>
</html>