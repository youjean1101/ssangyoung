<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@page import = "java.util.Enumeration"%>

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
<h2>업로드 성공!(파일정보)</h2>
<%

	String loc="C:/a01_javaexp/workspace/jspexp/src/main/webapp/a02_jsp/z02_upload";
	int maxSize=1024*1024*5; // 키로바이트*메가바이트*기가바이트
	MultipartRequest multi = new MultipartRequest(
				request,
				loc,
				maxSize,
				"utf-8",
				new DefaultFileRenamePolicy()
			);
// Preferences>General>Workspace>Refresh using native hooks or polling 체크(업로드 refresh없이 바로적용)
String name =  multi.getParameter("name");

Enumeration<?> files = multi.getFileNames();
while(files.hasMoreElements()){
	String ele = (String)files.nextElement();
%>
	<h2>자료 내용:<%=name %></h2>
	<h2>파라미터이름:<%=ele %></h2>
	<h2>서버업로드파일명:<%=multi.getFilesystemName(ele) %></h2>
	<h2>유저 업로드파일명:<%=multi.getOriginalFileName(ele) %></h2>
	<h2>파일 타입:<%=multi.getContentType(ele) %></h2>
	<h2>파일 길이:<%=multi.getFile(ele).length() %></h2>
	<%-- <img src="./a02_jsp/z02_upload/<%=multi.getFilesystemName(ele) %>"/> --%>
	<%-- <img src="./a02_jsp/z02_upload/"<%=URLDecoder.decode(multi.getFilesystemName(ele),"utf-8")/> --%>
<% } %>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>