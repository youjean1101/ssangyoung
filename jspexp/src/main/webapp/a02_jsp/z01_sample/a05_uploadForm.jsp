<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<h2>파일업로드</h2>
<form action="a06_uploadFile.jsp" method="post" 
   enctype="multipart/form-data">
   자료명:<input type="text" name="name"/><br>
   파일:<input type="file" name="file01"/><br>
   <input type="submit" value="업로드"/><br>
</form>

<%-- 
# fileupload 처리
0. 업로드 프로세스
	client	===========네트웤환경===========> server
	 파일		==> 변환(multipart)	==>	서버에서 multipart ==> File 
1. 환경설정
	1) 업로드 모듈 설정
		cos.jar WEB-INF/lib
	2) 업로드 경로 설정
		C:\a01_javaexp\workspace\jspexp\src\main\webapp\a02_jsp\z02_upload
2. 업로드 폼(a05_uploadForm.jsp)
	1) form 속성 설정
	<form enctype="multipart/form-data"	
	2) file 객체 type 선언
		<input type="file" name="file01" />
	
3. 업로드 처리(a06_uploadFile.jsp)
	1) 업로드 처리하는 lib 객체 import 처리
		<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
		<%@page import="com.oreilly.servlet.MultipartRequest"%>  
	2) 경로 설정
		String loc = "업로드할 위치"
		int maxSize = 1024*1024*5; // 최대크기 설정
	3) 파일 업로드 하는 객체 선언으로 업로드가 된다.
		MultipartRequest multi = new MultipartRequest(
			loc,
			maxSize,
			"utf-8",
			new DefaultFileRenamePolicy()
		);
		// DefaultFileRenamePolicy : 중복시 저장 적책
	4) 업로드된 파일 정보 가져오기
		Enumeration<?> files = multi.getFileNames();
		if(files.hasMoreElements()){
			String ele = (String) files.nextElements();
			multi.getFilesystemName(ele); //서버가 업로드 파일명
			multi.getOriginalFileName(ele); // 유저가 업로드한 파일명
			multi.getContentType(ele); // content타입
			multi.getFile(ele).length(); // 파일의 길이
		}
	# 이미지 활용 예제
	1. 회원정보에 사진 이미지 올리기
		회원테이블에 이미지명을 저장한느 컬럼 필요
	2. 물건의 정보에 물건 이미지 올리기
		물건테이블 정보에 물건의 이미지명을 저장하는 컬럼 필요
	
--%>


</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>