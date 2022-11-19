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
</script>

</head>
<body>
<% 
String ename=request.getParameter("ename"); if(ename==null) ename="";
String job=request.getParameter("job"); if(job==null) job="";
String frSal=request.getParameter("frSal"); if(frSal==null) frSal="0";
String toSal=request.getParameter("toSal"); if(toSal==null) toSal="9999";
double frSalD = Double.parseDouble(frSal);
double toSalD = Double.parseDouble(toSal);

A02_EmpDao dao = new A02_EmpDao();
Emp sch = new Emp(ename, job, frSalD, toSalD);
//초기에 전체 데이터 로딩, 입력내용에 따라서 검색되게 처리.
%>
<h2>사원정보</h2>
<form>
	<table id = frm01>
		<col width="40%">
		<tr><th>사원명</th>
			<td colspan="2"><input type="text" name="ename" value="<%=ename %>" /></td></tr>
		<tr><th>직책명</th>
			<td colspan="2"><input type="text" name="job" value="<%=job %>"/></td></tr>
		<tr><th>급여</th>
			<td><input type="text" name="frSal" value="<%=frSal %>"/></td>
			<td><input type="text" name="toSal" value="<%=toSal %>"/></td>
		</tr>
		<tr><td colspan="3">
				<input type="button" onclick="send()" value="검색" />
			</td></tr>
	</table>
</form>
<%

%>

<table>
	<tr>
	<th>사원번호</th><th>사원명</th><th>직책명</th>
	<th>관리자번호</th><th>급여</th><th>부서번호</th>
	</tr>
	<%for(Emp e:dao.getEmpSch(sch)){ %>
	<tr>
	<td><%=e.getEmpno() %></td>
	<td><%=e.getEname() %></td>
	<td><%=e.getJob() %></td>
	<td><%=e.getMgr() %></td>
	<td><%=e.getSal() %></td>
	<td><%=e.getDeptno() %></td>
	</tr>
	<%} %>
</table>
</body>
<script type="text/javascript">
	function send(){
		// 사전에 전송되기 전에 데이터 유효성 check해서 전송..
		var frSalObj = document.querySelector("[name=frSal]")
		var toSalObj = document.querySelector("[name=toSal]")
		// isNaN() : 숫자형 데이터인지를 확인
		// Is not a number?
		// 숫자형일 때, false
		// 숫자형이 아닐 때, true
		// frSalObj.value =="": 데이터를 입력하지 않을 때.
		// " ".trim() : 공백제거
		if((frSalObj.value.trim()=="") || isNaN(frSalObj.value)){
			alert("공백이거나 숫자형 데이터가 아닙니다.")
			frSalObj.value="";
			frSalObj.focus()
			return; // 프로세스 진행 방지
		}
		if((toSalObj.value.trim()=="") || isNaN(toSalObj.value)){
			alert("공백이거나 숫자형 데이터가 아닙니다.")
			toSalObj.value="";
			toSalObj.focus()
			return; // 프로세스 진행 방지
		}
		//var fr = frSalObj.value;
		//var to = toSalObj.value;
		//alert( fr > to );
		//alert(frSalObj.value+":"+toSalObj.value);
		//alert(Number(frSalObj.value) > Number(toSalObj.value));
		//alert(Number(frSalObj.value) > Number(toSalObj.value));
		if(Number(frSalObj.value) > Number(toSalObj.value)){
			alert("시작 범위가 마지막 범위보다 크네요.")
			frSalObj.value=""
			toSalObj.value=""
			frSalObj.focus()
			return;
		}
		// 모든 유효성이 check되었을 때, 서버로 전송처리..
		// submit()을 클릭한 것과 동일한 효과처리..
		document.querySelector('#frm01').submit();
		//alert("전송");
		//alert("공백인 경우:"+(frSalObj.value.trim()==""));
		//alert("숫자형이 아닐 경우:"+isNaN(frSalObj.value));
	}
</script>
</html>