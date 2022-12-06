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
	img{
	width:50px;
	height:60px;
	}
	
	h2#title{
		color:green;
		text-align:center;
		font-size:30pt;
		font-weight:border;
	}
	
	a{
		text-decoration:none;
	}
	
	a:visited{
		text-decoration:none;
		color:green;
	}
	
	input{
		width: 290px;
   	 	height: 40px;
	 }
	 
	box input[type="button"]{
		background-color:white;
		color:green;
		border:1px solid green;
		border-radius:5px;
	    width: 50px;
	    height: 20px;
	    font-size:10pt;
	    font-weight:bord;
	}
	 
	 box input[name="cancel"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
		position:absolute;
	    bottom: -60px;
    	right: 150px;
   		width: 140px;
	    height: 40px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	box input[type="submit"]{
		background-color:green;
		color:white;
		border:none;
		border-radius:5px;
		position:absolute;
	    position: absolute;
	    bottom: -60px;
	    right: 0px;
	    width: 140px;
	    height: 40px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	th{
		text-align:right;
	}
	
	box{
		position:fixed;
		margin: 0px auto;
		left:37%;
		top:28%;
	}
	legend{
		font-size:30pt;
		font-weight:900pt;
		text-align:center;
	}
	
	fieldset{
		border:1px solid green;
	}
	
</style>
<script type="text/javascript">

</script>

</head>
<body>
	<h2 id="title"><a href="main.jsp"><img src=".\a_img\icon.jpg" />스터디 게시판</a></h2>
	<box>
		<fieldset>
			<legend>회원정보 수정</legend>
			<form>
				<table>
				<tr><th>ID : </th><td><%=session.getAttribute("loginID") %></td><td></td></tr>
				<tr><th>PASSWORD : </th><td><%=session.getAttribute("loginPassword") %></td><td><input type="button" value="수정" onlcick="#" /></td></tr> <!-- 수정클릭시, 패스워드재확인창등장과함꼐 변경입력창 -->
				<tr><th>이름 : </th><td><%=session.getAttribute("loginName") %></td><td><input type="button" value="수정" onlcick="#" /></td></tr><!-- 수정클릭시, 수정항목을 변경입력창으로 변경기능 추가 -->
				<tr><th>이메일 : </th><td><%=session.getAttribute("loginEmail") %></td><td><input type="button" value="수정" onlcick="#" /></td></tr>
				<tr><th>전화번호 : </th><td><%=session.getAttribute("loginPhone") %></td><td><input type="button" value="수정" onlcick="#" /></td></tr>
				</table>
				<input type="button" name="cancel" value="취소" onclick="mainGo()"/>
				<input type="submit" value="수정하기" />
			</fieldset>
		</field>
	</box>

</body>
<script type="text/javascript">
	function mainGo(){
		location.replace("main.jsp");
	}
</script>
</html>