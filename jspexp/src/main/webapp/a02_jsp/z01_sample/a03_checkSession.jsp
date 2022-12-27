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
<script type="text/javascript">
/*
 
*/
</script>

</head>
<body>
	<h2>로그인아이디:${mem.id}</h2>
	<h2>이름:${mem.name}</h2>
	<h2>권한:${mem.auth}</h2>
	<input type="button" value="로그아웃" onclick="logout()">
	<%--
	# 메뉴 페이지별로 권한 설정 테이블 
	no	메뉴명	페이지소스				권한
	100	로그인	a01_login_DB.jsp	all
	101	메뉴1		a02_menu01.jsp		user01
	102	관리자	a05_admin.jsp		admin
	
	--%>
	
	<ul>
		<li onclick="goPage('all','a01_login_DB.jsp')">로그인</li>
		<li onclick="goPage('user01','a02_menu01.jsp')">메뉴1</li>
		<li onclick="goPage('user02','a03_menu02.jsp')">메뉴2</li>
		<li onclick="goPage('user03','a04_menu03.jsp')">메뉴3</li>
		<li onclick="goPage('all','a04_boardDetail.jsp')">게시판</li>
		<li onclick="goPage('admin','a05_admin.jsp')">관리자</li>
	</ul>
</body>
<script type="text/javascript">
	var id = "${mem.id}"
		if(id==""){
			alert("로그인을 하셔야 합니다.\n로그인페이지이동")
			location.href="a01_login.jsp"
		} // DB연동 안됐을때.
	function logout(){
		if(confirm("로그아웃하시겠습니까?")){
			location.href="a01_login_DB.jsp"
		}
	}
		
	function goPage(auth, page){
		var loginAuth = "${mem.auth}" 
		if(loginAuth == 'admin' || auth == 'all'){
			alert(page+"로 이동")
			if(page =="a04_boardDetail.jsp"){
				location.href=page
			}
			//location.href=page
		}else if(auth == loginAuth){
			alert(page+"로 이동")
			//location.href=page
		}else{
			alert("페이지에 대한 접근 권한이 없습니다");
		}
	}
</script>
</html>