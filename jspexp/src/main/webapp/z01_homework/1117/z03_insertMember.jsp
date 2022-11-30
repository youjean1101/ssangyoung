<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
      
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
<%
A06_PareparedDao dao = new A06_PareparedDao();

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String auth = request.getParameter("auth");
String pointS = request.getParameter("point");
int point = 0;
if(pointS!=null&&pointS.equals("")){
	point = Integer.parseInt(pointS);
}
String address = request.getParameter("address");
boolean isInsert = false;
if(id!=null&&!id.equals("")){
	Member ins = new Member(id,pass,name,auth,point,address);
	isInsert = true;
	dao.insertMember(ins);
}
%>
<h2>회원등록</h2>
	 <form>
				아이디: <input type="text" name="id"/>
				패스워드: <input type="text" name="pass"/>
				이름: <input type="text" name="name"/>
				권한: <input type="text" name="auth"/>
				포인트: <input type="text" name="point"/>
				주소: <input type="text" name="address"/>
				<input type="submit" value="등록" />
		</form>

</body>
<script type="text/javascript">
	var isInsert = <%= isInsert%>
	if(isInsert){
		if(confirm("조회화면으로 이동하시겠습니까?")){
			location.href="1117.jsp"
		}
	}
/*
 
*/
</script>
</html>