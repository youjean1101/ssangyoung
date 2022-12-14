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
function userInsert(){
	var title = document.querySelector("[name=title]")
	var titleV = title.value.trim();
	var content = document.querySelector("[name=content]")
	var contentV = content.value.trim();
	if(idV==""){
		alert("[안내메시지]게시판 제목을 입력해주세요.")
		id.focus()
		return;
	}
	if(passwordV==""){
		alert("[안내메시지]게시판 내용을 입력해주세요.")
		password.focus()
		return;
	}
	document.querySelector("form").submit();
}
</script>

</head>
<body>
	<jsp:include page="noticeBoard_topMenu.jsp"></jsp:include>
	<form>
		<table>
			<tr><th>구분 : </th><td row="2"><select name="div">
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
	<%
	studyteamDao dao = new studyteamDao();
	String div = request.getParameter("div"); if(div==null) div="";
	String title = request.getParameter("title"); if(title==null) title="";
	String content = request.getParameter("content"); if(content==null) content="";
	String files = request.getParameter("files"); if(files==null) files="";
	
	boolean isInsert = false;
	if(title!=""&&content!=""){
		NoticeBoard ins = new NoticeBoard("yujin",div,title,content,files);
		dao.NoticeBoardAdd(ins);
		isInsert = true;
	}
	
	%>
	
</body>
<script type="text/javascript">
	function noticeAllViewGo(){
		location.replace("notice_Board_All_View.jsp");
	}
	
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		if(confirm("[안내메시지]게시판 등록이 완료되었습니다. \n게시판조회 화면으로 이동하시겠습니까?")){
			location.href="notice_Board_All_View.jsp";
		}
	}
</script>
</html>