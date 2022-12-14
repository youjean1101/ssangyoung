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
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*
 
*/
</script>
<style>
	input[type="button"]{
		border:2px solid green;
	}
</style>
</head>
<body>
	<h2>[1단계:확인] 2. 로그인 클릭시 session에 설정 후 다시 Member의 아이디와 이름이 출력되고 하고,
           로그아웃 클릭시, 로그인해야합니다가 출력되게 하세요.</h2>
   <input type="button" value="로그인" onclick="login()"/>
   <input type="button" value="로그아웃" onclick="logout()"/>
	<script>
		function login(){
			location.href="1209.jsp?sess=y"
		}
		
		function logout(){
			location.href="1209.jsp?sess=n"
		}
	</script>
	<%
		String sess = request.getParameter("sess");
		if(sess!=null){
			if(sess.equals("y")){
				session.setAttribute("m02",new Member("himan","홍길동"));
			}
			if(sess.equals("n")){
				session.removeAttribute("m02");
			}
		}
		
		Member gm = (Member)session.getAttribute("m02"); 
		if(gm!=null){
			out.print("<h3>세션생성됨</h3>");
			out.print("<h3>아이디:"+gm.getId()+"</h3>");
			out.print("<h3>이름:"+gm.getName()+"</h3>");
		}else{
			out.print("<h3>로그인해야합니다.</h3>");
		}
	%>
	
	<br><br>
    <hr>
           
    <h2>[1단계:확인] 3. el로 session범위로 사원 정보 사원번호, 사원명, 부서명을 저장후, 페이지가 이동해서도
           해당 정보를 출력하는 것을 확인하세요.
    <input type="button" value="사원정보보러가기" onclick="location.href='1209_empinfo.jsp'"/>
    </h2>
    
    <%
    //public Emp(int empno, String ename, int deptno)
    session.setAttribute("emp",new Emp(7000,"김길동",30));
    %>
    
    <h2>
	[1단계:확인] 4. 1~100까지 임의의 숫자를 session객체에 국어/영어/수학 점수로 할당후, el로 각 점수와 총점,
            평균, 평균70이상일때 합격 그외는 불합격을 출력하세요.</h2>
   	<%
   	int rKor= (int)Math.floor(Math.random()*100)+1;
   	int rEng= (int)Math.floor(Math.random()*100)+1;
   	int rMath= (int)Math.floor(Math.random()*100)+1;
   	
   	pageContext.setAttribute("kor",rKor);
   	pageContext.setAttribute("eng",rEng);
   	pageContext.setAttribute("math",rMath);
   	%>
   	<h2>국어점수:${kor}</h2>
   	<h2>영어점수:${eng}</h2>
   	<h2>수학점수:${math}</h2>
   	<h2>총점:${kor+eng+math}</h2>
   	<h2>평균:${(kor+eng+math)/3}</h2>
   	<h2>합격여부:${(kor+eng+math)/3>=70?"합격":"불합격"}</h2>
   		
   	
    <h2>[1단계:확인] 6. Member객체로 session객체로 할당한 후, 해당 객체를 el로 호출하여 출력하세요.</h2>
	<%
		//public Member(String id, String name, String auth, int point)
		request.setAttribute("m01",new Member("himan","홍길동","사용자",2000));
	%>
		<h2>아이디: ${m01.id}</h2>
		<h2>이름: ${m01.name}</h2>
		<h2>권한: ${m01.auth}</h2>
		<h2>포인트: ${m01.point}</h2>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>