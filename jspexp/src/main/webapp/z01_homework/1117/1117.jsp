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
function goInputPage(){
	if(confirm("등록하시겠습니까?")){
		location.href="1117_empInsert.jsp";
	}
}
</script>

</head>
<body>
	<h2>[1단계:확인]* 2. [jsp] dao에 회원정보리스트를 검색하는 기능메서드(조회 조건 추가)를 만들고, 출력처리 하세요..</h2>
	<%
		String name =  request.getParameter("name"); if(name==null) name="";
		String auth =  request.getParameter("auth"); if(auth==null) auth="";
	%>
	<form>
		<table>
			<col width="20%">
			<tr><th>이름</th><td><input type="text" name="name" value="<%=name %>"/></td></tr>
			<tr><th>권한</th><td><input type="text" name="auth" value="<%=auth %>"></td></tr>
			<tr><td colspan="2"><input type="submit" value="검색"></td></tr>
		</table>
	</form>
	<%
		z01_memberInfoDao dao = new z01_memberInfoDao();
		Member100 sch = new Member100(name, auth);
	%>
	<table>
		<tr>
			<th>아이디</th><th>패스워드</th><th>이름</th><th>권한</th><th>포인트</th><th>생성날짜</th>
		</tr>
		<% for(Member100 m:dao.getMemberinfoIndex(sch)) {%>
		<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getPasswd() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getAuth() %></td>
			<td><%=m.getPoint() %></td>
			<td><%=m.getMakedate() %></td>
		</tr>
		<%} %>	
	</table>
		<h3>정답</h3>
		<!-- 
		# 개발순서
		1) 필요로 하는 조회 조건 sql 작성 ==> test : DBscript
			SELECT * FROM MEMBER100
			WHERE name LIKE '%'||''||'%'
			AND auth LIKE '%'||''||'%'
			
		2) 회원정보리스트 기능메서드 확인
		3) 조회 조건 vo를 확인 - 생성자 확인
		public Member100(String name, String auth) {
			super();
			this.name = name;
			this.auth = auth;
		}
		4) 회원리스트 기능 메서드 복사해서 
			- sql 삽입
			- 매개변수 VO로 할당, 
			- pstmt 처리 내용 확인
		5) 화면 구성
			- form 조회
			- 리스트 테이블 만들기
		6) 요청값에 설정
		7) 요청값에 따른 DB 호출
		 -->
		 <%
		 String name10 = request.getParameter("name"); if(name10 ==null) name10 ="";
		 String auth10 = request.getParameter("auth"); if(auth10==null) auth10="";
		 Member sch10 = new Member(name, auth);
		 // DB데이터가 초기 화면에 전체 데이터 로딩되게 처리..
		 A06_PareparedDao dao10 = new A06_PareparedDao();
		 %>
		 <h2>회원리스트 조회</h2>
		 <form>
		 	회원명:<input type="text" name="name" value="<%=name10 %>" />
		 	권한:<input type="text" name="auth" value="<%=auth10 %>"/>
		 	<input type="submit" value="검색" />
		 	<input type="button" value="회원등록" onclick="insertMember()"/>	
		 </form>
		 <table>
		 	<tr><th>아이디</th><th>이름</th><th>권한</th><th>포인트</th><th>주소</th></tr>
		 	<%for(Member m:dao10.getMemberList(sch10)){ %>
		 	<tr><td><%=m.getId() %></td><td><%=m.getName() %></td><td><%=m.getAuth() %></td>
		 	<td><%=m.getPoint() %></td><td><%=m.getAddress()%></td></tr>
		 	<%} %>
		 </table>
		 
<h2>회원</h2>
	<h2>[1단계:확인]* 3. [jsp] 아래의 sql 활용하여  dao기능메서드를 추가하고 검색리스트를 출력하세요. ~17:20
               		검색/등록 리스트를 출력하세요.
               SELECT * 
               FROM salgrade
               WHERE grade BETWEEN 1 AND 5;

               등급 시작 [   ]
               등급 끝 [   ]   [검색]
               검색된 리스트</h2>
               
        <%
		String startGrade = request.getParameter("startGrade"); if(startGrade==null) startGrade="";
		String endGrade = request.getParameter("endGrade"); if(endGrade==null) endGrade="";
		%>
        <form>
	        <table width="20%">
		        <tr><th>등급시작</th><td><input type="text" name="startGrade" value="<%=startGrade %>"/></td></tr>
		        <tr><th>등급 끝</th><td><input type="text" name="endGrade" value="<%=endGrade %>"/></td></tr>
		        <tr><td><input type="submit" value="검색"></td><td><input type="button" value="등록" onclick="salgradeIns()"></td></tr>
	        </table>
        </form>
        <%        
        	SalgradeDao dao1 = new SalgradeDao();
        %>
		<table>
			<tr><th>등급</th><th>급여시작범위</th><th>급여끝범위</th></tr>
			<% for(Salgrade s:dao1.getSalgradeIndex(startGrade, endGrade)) {%>
			<tr><td><%=s.getGrade() %></td><td><%=s.getLosal() %></td><td><%=s.getHisal() %></td></tr>
			<%} %>
		</table>
	<h2>
	[1단계:확인]* 4. [js] h1 클릭하세요를 클릭시,  z02_show.jsp로 이동되게 함수를 선언하고 js의 페이지 이동 기능 객체를 활용하여 처리하세요</h2>
	<h1 onclick="showfuntion()">클릭하세요</h1>
	<h1 onclick="goPage()">클릭하세요(정답)</h1>
	
	<h2>[1단계:확인]* 5. [jsp==>js] jsp변수로 이름, 나이, 성인여부(나이가 20이상 ) 스크립트릿(<%%>)에 선언하고, 
               js에서 이를 할당하여 alert()으로 출력되게 하세요.</h2>
               
               <%
               String sName = "정유진";
               int age = 28;
               String adultConfirm = "O";
               %>
              
               <h3 onclick="alert('이름: <%=sName%> 나이: <%=age%> 성인여부: <%=adultConfirm%>')">사람정보</h3>
               	
          <h3>정답</h3>
			<%
				String sname2="홍길동";
				int age2 = 25;
				boolean isAdult = age>=20;
				//server안에서만 사용.. client단으로 전달할 때는 사라진다.
			%>
			
               
    <h2>[1단계:확인]* 6. [jsp] 기존 사원정보 조회리스트 기준으로 사원정보 등록으로 화면 이동 및 등록 처리 후, 리스트 화면으로 이동 되게 기능처리하세요.</h2>
		 
		<h2>사원정보 조회</h2>
		<%
		A02_EmpDao dao2 = new A02_EmpDao();
		%>
			<table>
				<tr><th>사원번호</th><th>이름</th><th>직책</th><th>관리자번호</th><th>입사일</th><th>급여</th><th>보너스</th><th>부서번호</th></tr>
				<%for(Emp e:dao2.getEmpSch()){ %>
				<tr>
					<td><%=e.getEmpno() %></td>
					<td><%=e.getEname() %></td>
					<td><%=e.getJob() %></td>
					<td><%=e.getMgr() %></td>
					<td><%=e.getHiredate() %></td>
					<td><%=e.getSal() %></td>
					<td><%=e.getComm() %></td>
					<td><%=e.getDeptno() %></td>
				</tr>
				<%} %>
			</table>
			<input type="button" value="사원정보 등록하러가기" onclick="goInputPage()"/>
		
		<h3>정답</h3>
		<p>회원 조회 등록 버튼부분옆에 있음</p>
		<!-- 
		1) 등록 Dao 메서드 만들기..
			sql
			insert into member values('아이디', '패스워드', '이름', '권한', 1000, '주소');
			public void insertMember(Member ins){
			
			}
		2) 조회화면에서 이동
			<input type="button" value="회원등록" onclick="insertMemeber()"/>
			function insertMember(){
				if(confirm("등록하시겠습니까?")){
					location.href="z03_insertMember.jsp"
				}
			}
		3) 등록폼
			<form>
				아이디: <input type="text" name="id"/>
				패스워드: <input type="text" name="pass"/>
				이름: <input type="text" name="name"/>
				권한: <input type="text" name="auth"/>
				포인트: <input type="text" name="point"/>
				주소: <input type="text" name="address"/>
				<input type="submit" value="등록" />
		4) 요청 처리
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String auth = request.getParameter("auth");
			int point = Integer.parseInt(request.getParameter("point"));
			String address = request.getParameter("address");
		5) 등록 객체 생성
		6) Dao에 등록 메서드 호출
			boolean isInsert=false;
			if(id!=null&&!id.equals("")){
				dao.insertMember(ins)
			}
		7) script 등록 후 처리
			var isInsert = <//%=isInsert %>
			if( isInsert){
				if(confirm("등록성공/n조회화면으로 이동하시겠습니까?")){
					location.href="1117.jsp";
				}
		 -->
	
		 <table>
		 	<tr><th>아이디</th><th>이름</th><th>권한</th><th>포인트</th><th>주소</th></tr>
		 	<%for(Member m:dao10.getMemberList(sch10)){ %>
		 	<tr><td><%=m.getId() %></td><td><%=m.getName() %></td><td><%=m.getAuth() %></td>
		 	<td><%=m.getPoint() %></td><td><%=m.getAddress()%></td></tr>
		 	<%} %>
		 </table>
		 
	
    <h2>
		[1단계:확인] 7. [js] let변수와 var의 차이점을 10~100까지 5씩 증가하는 for문의 합산값을 통해서 확인하세요.
    </h2>
    	<h4></h4>
	<h2>[1단계:확인] 8. [js] 객체와 for in 구문의 관계를 음악정보(음악명,가수명,발매연도)를 통해 선언하고 출력하세요</h2>
	<table id="musicTable">
	</table>
	
	
	<h2>[1단계:확인] 9. [js] 배열과 for of 구문을 통해서 프리미어리그 순위 리스트를 테이블로 출력해보세요.</h2>
	<table id=soccerTable></table>
	
</body>
<script type="text/javascript">

	function showfuntion(){
		location.href = "\z02_show.jsp";
	}
	//정답
	function goPage(){
		if(confirm("이동할까요?")){
			location.href="\z02_show.jsp";
		}
	}
	// 3번정답
	function salgradeIns(){
		if(confirm("등록하시겠습니까?")){
			location.href="z04_insertSalGrade.jsp"
		}
	}
	<%-- // 5번 정답
	var sname2 = "<%=sname2%>"
	alert(sname2)
	// var sname2 = "홍길동" // 변수로 인식해서 에러가 발생한다.
	// 이 라인에 에러가 발생한느 순간 이후 js는 처리가 되지 않는다.
	// 문자열 데이터를 client에 전송할 때는 " ", ''를 붙여 주어야 한다.
	
	// var age = 25 형식으로 전달..
	var age2 = <%=age2 %>
	alert("나이:"+age2)
	var isAdult = <%=isAdult%>
	alert("성인 여부:"+isAdult)
	if( isAdult ){
		alert("성인입니다.")
	}else{
		alert("미성년입니다.")
	} --%>
	// 6번정답
	function insertMember(){
		if(confirm("등록하시겠습니까?")){
			location.href="z03_insertMember.jsp"
		}
	}
	
	
	
	var h4 = document.querySelector("h4");
	
	let totLet = 0 
	var totvar= 0
	{
		h4.innerHTML ="지역변수:"+totLet+"<br>"
		h4.innerHTML ="전역변수:"+totvar+"<br>"
	
		for(var cnt=10;cnt<=100;cnt+=5){ 
			h4.innerHTML += cnt+", " 
			totvar +=cnt
			totLet +=cnt
		}
			h4.innerHTML += "<br>var으로 전역변수 호출 totvar:"+totLet
			h4.innerHTML += "<br>let으로 지역변수 호출 totLet:"+totvar
	}
	
	var musicTable = document.querySelector('#musicTable');
	var music = {musicname:"비가오는날엔", singer:"헤이즈", releaseYear:"2021.08.04"}
	musicTable.innerHTML="<tr><th>음악정보</th></tr>";
	for(let musicinfo in music){
		musicTable.innerHTML += "<tr><td>"+music[musicinfo]+"</td></tr>"
	}
	
	 let EPLlist = ["아스널","맨시티","뉴캐슬","토트넘","맨유","리버풀","브라이튼앤","첼시"]
	 var show = document.querySelector("#soccerTable")
	 show.innerHTML = "<tr><th>프리미어리그 팀순위</th></tr>"
	 for(const soccerno of EPLlist){
	 		show.innerHTML += "<tr><td>"+soccerno+"</td></tr>"
		}
	

</script>
</html>