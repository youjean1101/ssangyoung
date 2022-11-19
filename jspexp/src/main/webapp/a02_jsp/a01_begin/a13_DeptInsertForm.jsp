<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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


--%>

<h2>부서정보등록</h2>
<%--
# 
alt+space+m
화살표 방향키 (위로)
 --%>
	<form>
			부서번호 <input type="text" name="deptno"/>
			부서명 <input type="text" name="dname"/>
			부서위치 <input type="text" name="loc"/>
			<input type="submit" value="등록" />
	</form>
	
	
	<%
	// 초기 로딩되었을 때도 수행되지만 요청값이 없기에 조건에 해당하지 않기에
	// 화면 로딩만 된다. 입력값을 입력 후, submit 클릭시, 조건에 해당하기에
	// DB처리를 할 수 있게 된다.
	String deptno = request.getParameter("deptno");
	int deptnoInt = 0;
	if(deptno!=null) deptnoInt = Integer.parseInt(deptno);
	String dname = request.getParameter("dname"); if(dname==null) dname="";
	String loc = request.getParameter("loc"); if(loc==null) loc="";
	boolean isInsert = false;
	// 입력 후, 등록 버튼을 클릭했을 때, 처리할 내용...
	// 조건이 입력 후, submit로 요청값을 호출 했을 때와 초기 화면을 구분하여 조건 처리..
	if(deptno!=null&& !deptno.equals("")){
		// 입력을 위한 VO객체 생성
		Dept ins = new Dept(deptnoInt, dname, loc);
		// 매개변수 입력 Dao 기능메서드에 전달.
		A06_PareparedDao dao = new A06_PareparedDao();
		dao.insertDept(ins);
		isInsert = true;
	} 
	%>
</body>
<script>
// jsp(java) ==> js로 전환되어 js의 여러가지 프로그램 처리.
	var isInsert = <%=isInsert%>; // var isInsert = true;
	if( isInsert ){
		//확인 시 조회 화면으로 이동, 취소시 현재 등록 화면에서 계속 등록 가능하도록 처리
		if(confirm("등록성공\n조회화면으로 이동하시겠습니까?")){
		location.href="a12_DeptList.jsp";
		}
	}
</script>
<script type="text/javascript">
/*
 
*/
</script>
</html>