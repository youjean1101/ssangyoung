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
	
	box{
		position:fixed;
		left:28%;
		top:20%;
	}
	
	input{
		width: 300px;
   	 	height: 40px;
	}
	
	 box input[name="back"]{
		background-color:green;
		color:white;
		border:1px solid green; 
		border-radius:5px;
		position:absolute;
	    bottom: -60px;
    	right: 280px;
   		width: 170px;
	    height: 50px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	box input[name="confirm"]{
		background-color:white;
		color:green;
		border:1px solid green; 
		width: 80px;
	    height: 40px;
	}
	
	box input[name="go"]{
		background-color:green;
		color:white;
		border:none;
		border-radius:5px;
		position:absolute;
	    position: absolute;
	    bottom: -60px;
	    right: 90px;
	   	width: 170px;
	    height: 50px;
	    font-size:15pt;
	    font-weight:bord;
	}
	
	th{
		text-align:right;
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
	function userInsert(){
		var id = document.querySelector("[name=id]")
		var idV = id.value.trim();
		var password = document.querySelector("[name=password]")
		var passwordV = password.value.trim();
		var passwordConfirm = document.querySelector("[name=passwordConfirm]")
		var passwordConfirmV = passwordConfirm.value.trim();
		var name = document.querySelector("[name=name]")
		var nameV = name.value.trim();
		var email = document.querySelector("[name=email]")
		var emailV = email.value.trim();
		var phonenumber = document.querySelector("[name=phonenumber]")
		var phonenumberV = phonenumber.value.trim();
		if(idV==""){
			alert("[???????????????]???????????? ??????????????????.")
			id.focus()
			return;
		}
		if(passwordV==""){
			alert("[???????????????]??????????????? ??????????????????.")
			password.focus()
			return;
		}
		if(passwordConfirmV==""){
			alert("[???????????????]???????????? ????????? ??????????????????.")
			passwordConfirm.focus()
			return;
		}
		
		if(passwordV!=passwordConfirmV){
			alert("[???????????????]???????????? ??????????????? ????????????????????? ???????????? ????????????.")
			passwordConfirm.focus()
			return;
		}
		
		if(nameV==""){
			alert("[???????????????]????????? ??????????????????.")
			name.focus()
			return;
		}
		if(emailV==""){
			alert("[???????????????]???????????? ??????????????????.")
			email.focus()
			return;
		}
		if(phonenumberV==""){
			alert("[???????????????]?????????????????? ??????????????????.")
			phonenumber.focus()
			return;
		}
		document.querySelector("#allform").submit();
	}
</script>

</head>
<body>
	<h2 id="title"><a href="login.jsp"><img src=".\a_img\icon.jpg" />????????? ?????????</a></h2>
	<box>
		<fieldset>
			<legend>????????????</legend>
			
				<table>
			<form id="idconfirmForm">
					<tr><th>ID : </th><td><input type="text" name="confirmId" placeholder="???????????? ??????????????????."/></td>
						<td><button name="confirm" onclick="javascript: form.action='IDconfirm.jsp';">????????????</button></td></tr>
			</form>
			
			<% 
				String hasId = (String)request.getAttribute("hasId");
				boolean isCheck=false;
				if(hasId!=null){
					isCheck=true;
				}
				String confirmId = request.getParameter("confirmId");
			%>
			<script type="text/javascript">
				var isCheck = <%=isCheck%>
				if(isCheck){
					var hasId = "<%=hasId%>"
					if(hasId=="Y"){
						alert("[???????????????] ?????? ?????? ???????????? ??????????????????.\n ?????? ???????????? ??????????????????. ")
					}else{
						alert("[???????????????] ??????????????? ????????? ?????????.");
						document.querySelector("[name=confirmId]").value="<%=confirmId%>"
					}
				}
			</script>	
					
			<form id="allform">
					<input type="hidden" name="id" value="<%=confirmId%>"/>
					<tr><th>PASSWORD : </th><td><input type="password" name="password" placeholder="??????????????? ??????????????????."/></td><td></td></tr>
					<tr><th>PASSWORD ?????? : </th><td><input type="password" name="passwordConfirm" placeholder="??????????????? ?????? ??????????????????." /></td><td></td></tr>
					<tr><th>?????? : </th><td><input type="text" name="name" placeholder="????????? ??????????????????."/></td><td></td></tr>
					<tr><th>????????? : </th><td><input type="text" name="email" placeholder="xxx@xxx.com ????????? ???????????? ??????????????????."/></td><td></td></tr>
					<tr><th>???????????? : </th><td><input type="text" name="phonenumber" placeholder="010-0000-0000 ????????? ??????????????? ??????????????????."/></td><td></td></tr>
				</table>
				<input type="button" value="????????????"  name="back" onclick="loginGo()"/>
				<input type="button" value="????????????"  name="go" onclick="userInsert()"/>
			</form>
		</fieldset>
	
	<%
	studyteamDao dao = new studyteamDao();
	String id = request.getParameter("id"); if(id==null) id="";
	String password = request.getParameter("password"); if(password==null) password="";
	String passwordConfirm = request.getParameter("passwordConfirm"); if(passwordConfirm==null) passwordConfirm="";
	String name = request.getParameter("name"); if(name==null) name="";
	String email = request.getParameter("email"); if(email==null) email="";
	String phonenumber = request.getParameter("phonenumber"); if(phonenumber==null) phonenumber="";
	
	boolean isHasId = false;
	boolean isInsert = false;
	if(id!=""&&password!=""){
		NoticeBoardUser ins = new NoticeBoardUser(id, passwordConfirm, name, email, phonenumber);
		dao.NoticeBoardUserAdd(ins);
		isInsert = true;
	}
	
	%>
	</box>
	<%--
	<h2>[2??????:??????]* 3. [js] ?????? ???????????? ????????? ????????? ????????? 8~16??? ??????????????? ??????. ?????????, ?????? ????????? ?????? ?????????
               ????????? ??????????????? 8~16 ???????????? ???????????? ?????????????????? ???????????? ?????????.</h2>
	 
	 ???????????????:<input type="text" name="id" onkeyup="textCnt3(this)"/>
	 <span id="textCntout3"></span>
   
    <script>
    function textCnt3(obj){
   	 var len = obj.value.length
   	 if(len>16 || len<8){
   		document.querySelector("#textCntout3").innerText = "8~16?????? ??????????????????."
   		 obj.value = obj.value.substring(0,16)
   	 }else{
   		document.querySelector("#textCntout3").innerText= "?????????:"+len+"(????????????)"
   	 }
    }
    </script>
    <h3>??????</h3>
    <script type="text/javascript">
    function ckId(obj){
    	var len2 = obj.value.length
    	var spanOb = document.querySelector("#answer3");
    	var msg = "???????????? 8~16 ?????????????????????."
    	spanOb.style.color="red"
    	if(len2>=8 && len2<=16){
    		msg = "????????? ????????? ??????"
    		spanOb.style.color="blue"
    	}
    	spanOb.innerText = msg
    }
    </script>
	 --%>

</body>
<script type="text/javascript">
	function loginGo(){
		location.replace("login.jsp");
	}
	
	<%-- function idConfirm(){
		location.replace("login.jsp");
		document.querySelector("form").submit();// ?????????????????? ??????.
		var isIDConfirm = <%=isIDConfirm%>; // ????????? ???????????? false
		//alert(isIDConfirm);
		 if(isIDConfirm){
			alert("[???????????????] ??????????????? ????????? ?????????.");
		}else{
			alert("[???????????????] ?????? ?????? ???????????? ??????????????????.\n ?????? ???????????? ??????????????????. ")
		} 
	} --%>
	function idConfirm(){
		//var id = document.querySelector("#id").value;
		<%-- var id = document.getElementsByName("id");
		console.log(document.querySelector("#id"));
		console.log(document.querySelector("#id").value);
		console.log(document.querySelector("#id").text);
		console.dir(document.querySelector("#id"));
		var HASID ="";
		<%
		String sID = request.getParameter("id");
		A06_PareparedDao dao2 = new A06_PareparedDao();
		boolean b1 = dao2.checkId(sID);
		
		isHasId = b1;
		%>
		var sID = <%=sID%>;
		HASID = <%=isHasId%>;
		alert("HASID:" + HASID + "/" + sID);--%>
		document.querySelector("#idconfirmForm").submit();
		location.href="IDconfirm.jsp"; 
	}
	
	var isInsert = <%=isInsert%>; 
	if( isInsert ){
		if(confirm("[???????????????]??????????????? ?????????????????????. \n????????? ???????????? ?????????????????????????")){
			location.href="login.jsp";
		}
	}
	
</script>
</html>