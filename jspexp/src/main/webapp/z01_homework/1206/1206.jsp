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

</script>

</head>
<body>
	<h2>[1단계:확인] 2. 월드컵 16강 팀들을 배열로 리스트하고, 8X2 테이블에 DOM으로 출력하세요 </h2>
	<table id="ex2">
		<thead>
		<tr><th>월드컵 16강 1팀</th><th>월드컵 16강 2팀</th></tr>
		</thead>
		<tbody>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
		</tbody>
	</table>
	
	<script>
		var ex2 = document.querySelectorAll("#ex2 td")
		var wordCups = ["네덜란드","미국","아르헨티나","호주","일본","크로아티아",
						"브라질","대한민국","프랑스","폴란드","잉글랜드","세네갈","모르코","스페인","포루투갈","스위스"]
		for(var idx=0;idx<ex2.length;idx++){
			ex2[idx].innerText = wordCups[idx]
		}
	</script>
	
	
	<h2>[1단계:확인] *3. 사원번호/사원명 5개,  부서번호와 부서명4개를 json데이터를 선언하고, 
	하나는 테이블에 하나는 select의 option에 레이블과 value로 출력해보세요</h2>
	<table id="ex3_1">
		<thead>
			<tr><th>사원번호</th><th>사원명</th></tr>
		</thead>
		<tbody>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
		</tbody>
	</table>
	<select id="ex3_2">
		
	</select>
	<script>
		var ex3_1 = document.querySelectorAll("#ex3_1 td")
		var emps=[{empno:7000,ename:"홍길동"},{empno:7001,ename:"김길동"},
			{empno:7002,ename:"이길동"},{empno:7003,ename:"신길동"},{empno:7004,ename:"오길동"}]
		
		emps.forEach(function(emp,idx){
			ex3_1[idx*2].innerText = emp.empno
			ex3_1[idx*2+1].innerText = emp.ename
		})
		
		var ex3_2 = document.querySelector("#ex3_2")
		var depts=[{deptno:10,dname:"인사"},{deptno:20,dname:"마케팅"},{deptno:30,dname:"개발"},{deptno:40,dname:"영업"}]
		
		depts.forEach(function(dept,idx){
			ex3_2.innerHTML += "<option value='"+dept.deptno+"'>"+dept.dname+"</option>"
		})
	</script>
	<hr>
	<h3>정답</h3>
	<h2>json 데이터 처리1(요소에 할당)</h2>
	<table id="tab01">
		<thead><th>사원번호</th><th>사원명</th></thead>
		<tbody>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
		</tbody>
	</table>
	<script>
		var emps=[
				{empno:7800,ename2:"홍길동"},
				{empno:7801,ename2:"김길동"},
				{empno:7802,ename2:"신길동"},
				{empno:7803,ename2:"이길동"},
				{empno:7804,ename2:"마길동"}
			]
		var tds = document.querySelectorAll("#tab01 td")
		emps.forEach(function(emp,idx){
			//	0 {empno:7800,ename2:"홍길동"}
			//	1 {empno:7800,ename2:"홍길동"}
			tds[idx*2].innerText = emp.empno
			tds[idx*2+1].innerText = emp.ename2
			
		})
	</script>
	
	
	<h2>json 데이터 처리2(동적요소 만들기)</h2>
	<select name="dept" onchange="alert(this.value)">
	</select>
	<script>
		var dept = [
					{deptno2:10, dname2:"인사"},
					{deptno2:20, dname2:"재무"},
					{deptno2:30, dname2:"회계"},
					{deptno2:40, dname2:"기획"}
					]
		var deptDom = document.querySelector("[name=dept]")
		var addHTML = ""
		dept.forEach(function(dept){
			addHTML+="<option value='"+dept.deptno2+"'>"+dept.dname2+"</option>"
		})
		deptDom.innerHTML = addHTML
	</script>
	
	<h2>[1단계:확인] 5. z55_errPage.jsp로 에러 페이지를 지정하고, 
	z51_callError.jsp 지정된 페이지로 에러가 호출되게 처리해보세요.</h2>
		
	
	
	<h2>[1단계:확인]* 6. 새로운 프로젝트를 web.xml 파일과 함께 만들어서 404, 500 에러를 페이지를 지정하여 대체 화면으로 처리하세요.</h2>
	
	<h2>[1단계:확인]* 7. 위 프로젝트에 NullPoiterException, ArrayIndexOutBoundsException을 처리하는 에러페이지를 만들고 
	web.xml에 등록하고 테스트를 통해서 해당 화면이 나타나게 하세요.</h2>
	<%--
	1) 예외 파일 생성
		z03_null.jsp
			isErrorPage = "true"
			객체가 null로 설정되어 발생 에러입니다.
			<%=exception.getClass().getName()%>
			<%=exception.getMessage()%>
		z04_arrayIndex.jsp
			isErrorPage = "true"
			배열의 index 범위를 확인하세요.
			<%=exception.getClass().getName()%>
			<%=exception.getMessage()%>
	2) web.xml
		<exception-type>java.lang.NullPointerException</exception-type>
	  	<location>/z03_null.jsp</location>
		<exception-type>java.lang.ArrayIndexOutBoundsException</exception-type>
	  	<location>/z04_arrayIndex.jsp</location>

		
	 --%>

</body>
<script type="text/javascript">


</script>
</html>