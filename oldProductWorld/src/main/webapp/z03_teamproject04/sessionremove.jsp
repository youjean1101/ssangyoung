<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고월드 로그아웃처리(세선삭제)</title>
<script type="text/javascript">
</script>

</head>
<body>
	<% session.invalidate(); 
		boolean islogout=true;
	%>

</body>
<script type="text/javascript">
	var islogout=<%=islogout%>
	if(islogout){
		alert("[안내메시지]로그아웃이 완료되었습니다.") //탈퇴는 다르게 처리
		location.href="main.jsp";
	}
</script>
</html>