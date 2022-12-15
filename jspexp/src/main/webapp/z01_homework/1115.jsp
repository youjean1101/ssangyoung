<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"   
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
	<h2>[1단계:확인] 2. Computer 클래스에 제조사, 가격, 종류 속성을 선언하고, jsp 화면에 테이블로 리스트를 출력하세요</h2>
	<% 	List<Computer> comlist = new ArrayList<Computer>();
 	comlist.add(new Computer("LG",1500000,"데스크탑"));
 	comlist.add(new Computer("ThinkPad",2000000,"노트북"));
 	comlist.add(new Computer("Apple",3000000,"맥북"));
 	 %>
	<table>
		<tr><th>제조사</th><th>가격</th><th>종류</th></tr>
		<% for(Computer c:comlist) { %>
		<tr>
		<td><%=c.getMaker() %></td><td><%=c.getPrice() %></td><td><%=c.getType() %></td>
		</tr>
		<%} %>
	</table>
	<h2>[1단계:확인]* 4. dao에 부서정보를 찾아서, jsp로 부서정보를 출력하세요.</h2>
	<!-- 
	1) 부서정보 기능 메서드 확인
	2) jsp import 확인
	3) dao객체 생성
	4) 반복문을 통해서 출력확인
	5) script(scriptlet, expression)을 통해서  table형식으로 출력 처리.
	// import jsexp.vo.* 삭제 처리..
	-->
	<%
	A06_PareparedDao dao = new A06_PareparedDao();
	%>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>지역</th></tr>
		<% for(Dept d:dao.getDept()) { %>
		<tr>
			<td><%=d.getDeptno() %></td><td><%=d.getDname() %></td><td><%=d.getLoc() %></td>
		</tr>
		<%} %>
	</table>
	<h1>정답</h1>
	<h2>부서정보</h2>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d:dao.getDeptList(new Dept("",""))) {%>
		<tr><td><%=d.getDeptno() %></td><td><%=d.getDname() %></td><td><%=d.getLoc() %></td></tr>
		<%} %>
	</table>
	
	<h2>[1단계:확인]* 5. dao에 회원정보리스트 처리 기능메서드를 추가하고 jsp로 회원정보리스트를 출력하세요.</h2>
	<!--  
	1. dao 기능메서드 처리순서
		1) sql 확인
		2) vo추가 
		3) 기능메서드 추가
		4) dao호출
		5) for script		
	-->
	<%
	z01_memberInfoDao dao1 = new z01_memberInfoDao();
	%>
	<table>
		<tr>
			<th>회원번호</th><th>구분(관리자/사용자)</th><th>이름</th><th>주민등록번호</th><th>주소</th>
			<th>휴대폰번호</th><th>아이디</th><th>패스워드</th>
		</tr>
		<% for(Memberinfo m:dao1.getMemberinfoList()) {%>
		<tr>
			<td><%=m.getUserno() %></td>
			<td><%=m.getDiv() %></td>
			<td><%=m.getUname() %></td>
			<td><%=m.getRrn() %></td>
			<td><%=m.getAddress() %></td>
			<td><%=m.getPhonenumber() %></td>
			<td><%=m.getId() %></td>
			<td><%=m.getPassword() %></td>
		</tr>
		<%} %>	
	</table>
	
	<h2>[1단계:개념] 6. js의 함수의 기본형식을 기술하고 매개변수로 밑면과 높이를 전달하고, 삼각형의 면적으로 리턴값을 alert() 출력되게 처리해보세요.
	</h2>
	
	<h1 onclick="triangle(7,3)">삼각형면적 확인</h1>
	<script>
	function triangle(underside,height){
		alert(underside*height/2);
	}
	</script>
	<h2>[1단계:확인] 8. 학생의 이름 정보와 국어,영어,수학점수를 입력 후, 클릭시, 총점과 평균이 출력되게 하세요.</h2>
	
	<h3>학생 정보</h3>
	학생이름 : <input type="text" name="name"/>
	국어점수 : <input type="text" name="korean"/>
	영어점수 : <input type="text" name="english"/>
	수학점수 : <input type="text" name="math"/>
	<input type="button" value="총점/평균계산" onclick="score()"/>
	<h3 id="scoreout"></h3>
	<script>
		function score(){
			var kor = document.querySelector("[name=korean]").value;
			var math = document.querySelector("[name=math]").value;
			var english = document.querySelector("[name=english]").value;
			var tot = Number(kor)+Number(math)+Number(english);
			var avg = tot/3;
			
			document.querySelector("#scoreout").innerText = "총점: "+tot+", "+"평균: "+avg;
		}
	</script>
	
	<h2>[1단계:확인] 9. 1~9까지 번호가 있는 3X3테이블을 만들고 해당 td를 클릭시 마다, 클릭한 td만 배경색상과 글자 색상이 변경되게 처리하세요.</h2>
	<table>
		<tr><td onclick="colorch(this)">1</td><td onclick="colorch(this)">2</td><td onclick="colorch(this)">3</td></tr>
		<tr><td onclick="colorch(this)">4</td><td onclick="colorch(this)">5</td><td onclick="colorch(this)">6</td></tr>
		<tr><td onclick="colorch(this)">7</td><td onclick="colorch(this)">8</td><td onclick="colorch(this)">9</td></tr>
	</table>
	<script>
	function colorch(obj){
		obj.style.color="blue";
		obj.style.background="yellow";
	}
	</script>
	
	<h2>[3단계:확인] 10. 좋아요버튼과 싫어요 버튼 만들고, 좋아요 버튼을 누를 때 마다 
                  하단에 ♥가 증가되고, 싫어요 버튼을 누를 때 마다♡ 증가 되게 처리해보세요 </h2>
    <input type="button" value="좋아요" name="like" onclick="likechoice()">
    <input type="button" value="싫어요" name="hate" onclick="hatechoice()">
    <h2 id="choice">좋아요(♥)/싫어요(♡) : </h2>
    
    <script>
    function likechoice(obj){
    	document.querySelector('#choice').innerText += "♥";
    }
    function hatechoice(obj){
    	document.querySelector('#choice').innerText += "♡";
    }
    </script>
    
   
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>