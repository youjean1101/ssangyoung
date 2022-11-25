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
<%-- 

	ex) form 화면에 아이디 패스워드를 입력해서 해당 서버로 이동해서 해당 요청값이 himan/7777일 때는 
	메인페이지 이동(a07_main.jsp), 그렇지 않으면 현재 페이지(a07_response.jsp)에 있게 처리하세요.
--%>
	<h3>로그인</h3>
	<form>
		아이디: <input type="text" name="id"/>
		패스워드: <input type="password" name="pass"/>
		<input type="submit" value="로그인"/>
	</form>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	boolean isFail = false;
	if(id!=null&&pass!=null){
		// 서버단 로직 처리..
		A06_PareparedDao dao = new A06_PareparedDao();
		
		if(dao.login(id, pass)){ //if(id.equals("himan")&&pass.equals("7777")){
			// 서버단에서 페이지 이동을 결정할 때, response.sendRedirect;
			response.sendRedirect("a09_main.jsp");
		}else{
			isFail = true;
			// 현재 페이지에서 로그인 처리하기 때문에 생략 가능
			// response.sendRedirect("a08_login.jsp");
			// 요청값을 넘기면 초기페이지가 아니라 로그인 check된 페이지라는
			// 것을 구분해주면 처리할 수 있다.
		}
	}
	%>
	<script>
		var isFail=<%=isFail%>
		if(isFail){
			alert("로그인 실패\n인증된 아이디가 아닙니다.")
		}
	</script>
	
	<!--  
	
	<form name="page02">
		아이디: <input type="text" name="id"/>
		패스워드: <input type="password" name="pass"/>
		<input type="submit" value="로그인"/>
	</form>
	<script>
	function goPage2(){
		// 서버단에 가지 않고, 여기서 바로 특정 자원으로 location.href를 통해서 처리
		var idVal = document.querySelector("[name=id]").value
		var passVal = document.querySelector("[name=password]").value
		var page02Val = document.querySelector("[name=page02]").value
		if(idVal=="himan"&&passVal=="7777" ){
			location.href=page02Val
		}
	}
	</script>
	-->
	<%
	/* String page02 = request.getParameter("page02");
	String sID= request.getParameter("[name=id]");
	String sPassword = request.getParameter("[name=password]");
	if(sID=="himan"&&sPassword=="7777" ){
		response.sendRedirect(page02);
	} */
	%>

</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>