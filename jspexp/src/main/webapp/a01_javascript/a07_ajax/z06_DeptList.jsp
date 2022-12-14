<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
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
function goInputPage(){
	// confirm("등록하시겠습니까?") true/false 확인 누를때만 조건문 처리
	if(confirm("등록하시겠습니까?")){
		location.href="a13_DeptInsertForm.jsp";
		//js에서 페이지 이동 명령어 a href=""와 동일한 역할
	}
}
</script>

</head>
<body>
<h2>부서정보 검색</h2>
<%
	//요청값 처리 및 value에 할당.
	String dname =  request.getParameter("dname"); 
	// 초기에 query string이 없기 때문에 null
	// a01_begin/a12_DeptList.jsp
	// 입력값 없이 submit 버튼 클릭 시.
	// a01_begin/a12_DeptList.jsp?dname=&loc=
	// dname="", loc=""
	if(dname==null) dname=""; // null을 통한 에러방지. 
	String loc =  request.getParameter("loc"); 
	if(loc==null) loc="";
	
%>

<form>
	<table>
		<col width="40%">
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=dname %>"/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value="<%=loc %>"></td></tr>
		<tr><td colspan="2"><input type="button" value="등록"  style="background:blue;"
								onclick="goInputPage()"/>
							<input type="submit" value="검색"></td></tr>
	</table>
</form>

<%
A06_PareparedDao dao = new A06_PareparedDao();
Dept sch = new Dept(dname, loc);
%>

<table>
	<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
	<%for(Dept d:dao.getDeptList(sch)){ %>
	<tr>
		<td><%=d.getDeptno() %></td>
		<td><%=d.getDname() %></td>
		<td><%=d.getLoc() %></td>
	</tr>
	<%} %>
</table>
<%-- 
# 부서정보 검색 리스트 만들기..
1. 검색 form 만들기
	- dname, loc 검색할 수 있게 만들기
	
2. 요청값에 대한 처리(form 상단에 처리)

3. 조회된 데이터 리스트 table 만들기(형식)
4. 	Dao객체 생성 및
	for문을 통해서 데이터 처리하기

# 등록 처리
1. 프로세스 정리
	1) 화면에 등록 버튼을 클릭 등록 화면 이동
		<input type="button" value="등록 
			onclick="goInputPage()" />
		function goInputPage(){
			if(confirm("등록하시겠습니까?")){
				location.href="a13_DeptInsertForm.jsp";
				// js에서 페이지 이동 명령어 a href=""와 동일한 역할
			}
		}
	2) 등록 화면(a13_DeptInsertForm.jsp)에서 등록 내용을 form 화면 확인
		<form>
			부서번호 <input type="text" name="deptno"/>
			부서명 <input type="text" name="dname"/>
			부서위치 <input type="text" name="loc"/>
			<input type="submit" value="등록" />
	3) 데이터 입력 후, 등록 버튼 클릭
	4) 요청값으로 dao에 등록 기능 메서드 호출
		String deptno = request.getParameter("deptno");
		int deptnoInt = 0;
		if(deptno!=null) deptnoInt = Integer.parseInt(deptno);
		String dname = request.getParameter("dname"); if(dname==null) dname="";
		String loc = request.getParameter("loc"); if(loc==null) loc="";
		boolean isInsert = false;
		// 입력 후, 등록 버튼을 클릭했을 때, 처리할 내용...
		if(deptno!=null&& !deptno.equals("")){
			Dept ins = new Dept(deptnoInt, dname, loc);
			
			dao.insertDept(ins);
			isInsert = true;
		}
		
	5) 등록 처리 후, 전체 리스트 화면이동..
		js : jsp ==>js
		var isInsert = <%=isInsert%>;
		if( isInsert ){
			if(cunfirm("등록성공\n조회화면으로 이동하시겠습니까?")){
			location.href="a12_DeptList.jsp";
			}
		}
--%>


</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>