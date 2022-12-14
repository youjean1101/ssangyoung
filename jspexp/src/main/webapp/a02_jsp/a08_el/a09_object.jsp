<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"
    import="jspexp.a13_database.*" 
    import="jspexp.a13_database.vo.*"
    session = "true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
# jstl을 활용한 객체 저장과 호출
1. jstl은 객체를 젖아하여 데이터를 할당하고, 호출할 수 있다.
2. 아래의 방법에 의해 객체를 저장하고 처리한다.
	1) 객체 저장
		범위객체.setAttribute("키", new 객체());
		<c:set var="num01" value="${}" />
	2) 바로 호출 및 할당
		<c:set var="num02" value="<%=new Person("홍길동",25,"서울")%>" />
	3) usebean을 통한 객체 생성 및 호출
		<jsp:useBean class="@@@.@@@" scope="session범위"/>
--%>
<%
request.setAttribute("num01",25);
request.setAttribute("p01",new Person("오길동",25,"서울"));
%>
<c:set var="p02" value="${p01}" />
<%--Person p02 = p01; --%>
<c:set target="${p02}" property="name" value="신길동"/>
<%--
	p02.setName("신길동");
# property
1. 객체단위로 접근가능한 public으로 선언된 메서드를  호출할 때, 사용하는 개념이다.
2. getXXX(), setXXX() 메서드로 property라고 한다.
3. property 명의 기준
	get/set 메서드에서 get/set을 삭제하고 대문자로 시작하는 메서드명을 소문자로 변경하여 해당 내용을 property 지칭한다.
	public void setAge(String s){}
	==> setAge ==> Age ==> age(set property, property age)
	public String getLoc(){}
	==> getLoc ==> Loc ==> loc(get property, property loc)
4. property 개념
	1) bean에서 사용
	2) el에서도 사용 ${p01.name} name은 getName()메서드를 호출
	
 --%>
<h2>객체:${p02.name}</h2>
<h2>객체:${p02.age}</h2>
<h2>객체:${p02.loc}</h2>
<h2>원객체:${p01.name}</h2><%--주소값이 복사되어 처리된다. --%>

<c:set var="num02" value="${num01+30}" />
<h2>변수1:${num01}</h2>
<h2>변수2:${num02}</h2>
<h2>jstl 객체 사용</h2>
<c:set var="emp" value="<%=new Emp() %>" />
<c:set target="${emp}" property="ename" value="홍길동" />
<h3>사원명:${emp.ename}</h3>

<%--emp.setEname("홍길동") 
ex) Dept를 선언하고, 위 형식으로 부서번호 부서명 부서이름을 할당하고
--%>
<c:set var="dept" value='<%=new Dept(10,"인사","서울") %>' />
<c:set target="${dept}" property="deptno" value="20" />
<h3>부서번호:${dept.deptno}</h3>
<h3>부서명:${dept.dname}</h3>
<h3>부서위치:${dept.loc}</h3>

</body>
<script type="text/javascript">
/*
 
*/

</script>
</html>