<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="z01_studyteam01.vo.*" 
    import="z01_studyteam01.*" 
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
	<h2>중복확인</h2>
	<%
		String id = request.getParameter("confirmId");
		if(id!=null){
			studyteamDao dao = new studyteamDao();
			request.setAttribute("hasId",dao.isIDConfirm(id)?"Y":"N");
	%>
		<jsp:forward page="sigh_Up.jsp" />
	<%
	}
	%>
	

</body>
<script type="text/javascript">
		
</script>
</html>