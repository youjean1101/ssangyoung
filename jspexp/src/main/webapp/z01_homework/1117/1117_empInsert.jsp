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
<h2>사원정보등록</h2>
	<form>
			사원명 <input type="text" name="ename"/>
			직책 <input type="text" name="job"/>
			관리자번호 <input type="text" name="mgr"/>
			입사일 <input type="date" name="hiredate"/><br>
			급여 <input type="text" name="sal"/>
			보너스 <input type="text" name="comm"/>
			부서번호 <input type="text" name="deptno"/>
			<input type="submit" value="등록" />
	</form>
	
	<%
	String ename = request.getParameter("ename"); if(ename==null) ename="";
	String job = request.getParameter("job"); if(job==null) job="";
	String mgr = request.getParameter("mgr");
	int mgrInt = 0;
	if(mgr!=null) mgrInt = Integer.parseInt(mgr);
	String hiredate = request.getParameter("hiredate"); if(hiredate==null) hiredate="";
	String sal = request.getParameter("sal"); 
	double salDouble = 0;
	if(sal!=null) salDouble = Double.parseDouble(sal);
	String comm = request.getParameter("comm"); 
	double commDouble = 0;
	if(comm!=null) commDouble = Double.parseDouble(comm);
	String deptno = request.getParameter("deptno");
	int deptnoInt = 0;
	if(deptno!=null) deptnoInt = Integer.parseInt(deptno);
	boolean isInsert = false;

	if(ename!=null&& !ename.equals("")){
		
		Emp ins = new Emp(ename, job, mgrInt, hiredate, salDouble, commDouble, deptnoInt);
		A02_EmpDao dao = new A02_EmpDao();
		dao.insertEmp(ins);
		isInsert = true;
	} 
	%>


</body>
<script type="text/javascript">
	var isInsert = <%=isInsert%>;
	if( isInsert ){
		//확인 시 조회 화면으로 이동, 취소시 현재 등록 화면에서 계속 등록 가능하도록 처리
		if(confirm("등록성공\n조회화면으로 이동하시겠습니까?")){
		location.href="1117.jsp";
		}
	}
</script>
</html>