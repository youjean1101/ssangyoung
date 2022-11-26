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

</script>

</head>
<body>
	<h2>[1단계:확인]* 3. 조건(부서번호와 (DB처리)부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다.
	 경고창 처리하세요.(DB처리없이)</h2>
		
	<form>
		부서번호: <input type="text" name="deptno"/>
		부서명 : <input type="text" name="dname"/>
		<input type="submit" value="조회"/>
	</form>
	<%
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	boolean isFail = false;
	if(deptno!=null&&dname!=null){
		if(deptno.equals("30")&&dname.equals("인사")){
			response.sendRedirect("1124_dept.jsp");
		}else{
			isFail = true;
		}
		
	}
	%>
	<script>
		var isFail=<%=isFail%>
		if(isFail){
			alert("[안내메시지]\n 해당부서정보가 없습니다.다시 입력해주세요.")
		}
	</script>
	<h3>정답</h3>
	<!-- 1) 화면구현
			부서번호 [		]
			부서명 [	]
			[등록확인]
		 2) 요청값 처리 : null, 숫자형
		 	String deptnoS = request.getParameter("deptno");
			int deptno = 0; if(deptnoS!=null) deptno = Integer.parseInt(deptnos);
		 	String dname = request.getParameter("dname");
		 	
		 3) 요청값에 따른 페이지 전환  
		 	boolean isInValid = false;
		 	if(deptnoS!=null && dname!=null){
		 		if(deptno==10 && dname.equals("회계")){
		 			response.sendRedirect("z04_main.jsp");
		 		}else{
		 			isInValid = true;
		 		}
		 	}
		 	var isInValid = < %=isInValid%>
		 	if(isInValid){
		 		alert("해당 부서정보가 없습니다.");
		 	}
		 -->
	<form>
		부서번호 :<input type="text" name="deptno3" />
		부서명 :<input type="text" name="dname3" />
		<input type="submit" value="등록확인"/>
	</form>
	<%
	String deptnoS = request.getParameter("deptno3");
	int deptno3 = 0; if(deptnoS!=null) deptno3=Integer.parseInt(deptnoS);
 	String dname3 = request.getParameter("dname3");
 	boolean isInValid = false;
 	if(deptnoS!=null && dname3!=null){
 		if(deptno3==10 && dname3.equals("회계")){
 			response.sendRedirect("z04_main.jsp");
 		}else{
 			isInValid = true;
 		}
 	}
	%>
	<script>
	var isInValid = <%=isInValid%>
 	if(isInValid){
 		alert("해당 부서정보가 없습니다.");
 	}
	</script>
	<h2>[2단계:확인] 3. (DB처리)부서번호와 부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다.
	 경고창 처리하세요.</h2>
	<h3>부서정보</h3>
	<form>
		부서번호: <input type="text" name="deptno2"/>
		부서명 : <input type="text" name="dname2"/>
		<input type="submit" value="이동"/>
	</form>
	<%
	String deptno2 = request.getParameter("deptno2");
	String dname2 = request.getParameter("dname2");
	boolean isFail2 = false;
	if(deptno2!=null&&dname2!=null){
		A06_PareparedDao dao = new A06_PareparedDao();
		
		if(dao.Dept(deptno2, dname2)){ 
			response.sendRedirect("1124_dept.jsp");
		}else{
			isFail2 = true;
		}
	}
	%>
	<script>
		var isFail2=<%=isFail2%>
		if(isFail2){
			alert("[안내메시지]\n 해당부서정보가 없습니다.다시 입력해주세요.")
		}
	</script>
	<h3>정답</h3>
	<!-- 
		1. dao 기능메서드 선언
			1) sql : select * from dept where deptno=? and dname=?
			2) vo
			3) 기능메서드 선언
				public boolean chkDept(int deptno, String dname){
				}
		2. jsp
			if(deptnoS!=null && dname!=null){
				if(dao.ckDept(deptno, dname)){
					response.sendRedirect("@@@@.jsp");
				}else{
				
				}
			}
	 -->
	<%-- <%
	String deptnoS = request.getParameter("deptno3");
	int deptno3 = 0; if(deptnoS!=null) deptno3=Integer.parseInt(deptnoS);
 	String dname3 = request.getParameter("dname3");
 	boolean isInValid = false;
 	if(deptnoS!=null && dname3!=null){
 		if(deptno3==10 && dname3.equals("회계")){
 			response.sendRedirect("z04_main.jsp");
 		}else{
 			isInValid = true;S
 		}
 	}
	%>
	<script>
	var isInValid = <%=isInValid%>
 	if(isInValid){
 		alert("해당 부서정보가 없습니다.");
 	}
	</script> --%>
	
	<h2>[1단계:확인] 4. [화면구현] 배열로 월드컵 D조팀  ul로 리스트 출력하세요.</h2>
	<ul>
	<h3>월드컵 D조</h3>
	<%	String soccers[] = {"프랑스","튀니지","덴마크","호주"};
		for(String country:soccers){
			out.print("<li>"+country);
		}
	%>
	</ul>
	
	
	<h2>[2단계:확인]* 5. [화면구현] 2차원 배열로 월드컵 A,B조 및 그 팀들을 선언하고 ol/ul을 계층적으로 출력하세요.</h2>
	<ul>
		<%
		String soccerA[]={"네덜란드","에콰도르","세네갈","카타르"}; 
		String soccerB[]={"잉글랜드","웨일스","미국","이란"};
		%>
		<li>A조
		<ol>	
			<%for(int idx=0;idx<soccerA.length;idx++){ %>
			<li><%=soccerA[idx] %>
			<%} %>
		</ol>
		<li>B조
		<ol>
			<%for(int idx=0;idx<soccerA.length;idx++){ %>
			<li><%=soccerB[idx] %>
			<%} %>
		</ol>
	</ul>
	<h3>정답</h3>
	<%
	String[][]teams2={{"카타르","에콰도르","세네갈","네덜란드"},
					{"잉글랜드","이란","미국","웨일스"},
					{"아르헨티나","사우디아라비아","멕시코","폴란드"},
					{"잉글랜드","이란"},
					{"잉글랜드","이란","미국","웨일스"},
					{"잉글랜드","이란","미국","웨일스"}
					};
	out.print("<ol type='A'>");
	for(String team[]:teams2){ // 나라들 배열은 1차원 배열
		out.print("<li>조");
		out.print("	<ul>");
		for(String nation:team){ // 나라명은 문자열 하나씩 입력된다.
			out.print("<li>"+nation+"</li>");
		}
		out.print("	</ul>");
		out.print("</li>");
	}
	out.print("</ol>");
	%>
	
	<h2>[1단계:확인]* 6. [화면구현] 오늘 월드컵 출전 팀과 경기 시간을 배열로 선언하고 select의 value는 시간, 
	레이블은 팀명을 출력하되, 선택했을 시간을 경고창으로 출력되게 하세요.(배열, Code객체)</h2>
		<select onchange="alert(this.value)">
		<%	
		String teams[] = {"스페인vs코스타리카","벨기에vs캐나다","스위스vs카메룬","우루과이vs대한민국"};
		String times[] = {"01:00","04:00","19:00","22:00"};
		for(int idx=0;idx<teams.length;idx++){
			out.print("<option value='"+times[idx]+" 시작'>"+teams[idx]+"</option>");
		}
		%>
		</select>
	
	<h3>정답</h3>
	<h2>월드컵 대전팀과 일정(해당 팀을 클릭시 시간 확인)</h2>
	<select onchange="alert(this.value)">
	<%
	List<Code> sch = new ArrayList<Code>();
	sch.add(new Code("오늘 오후7:00", "웨일스:이란"));
	sch.add(new Code("오늘 오후10:00", "카타르:세네갈"));
	sch.add(new Code("내일 오전01:00", "네덜란드:에콰도르"));
	sch.add(new Code("내일 오전04:00", "잉글랜드:미국"));
	for(Code c:sch){
		out.print("<option value='"+c.getKey()+"'>"+c.getVal()+"</option>");
	}
	%>
		<!-- 
		<option value='튀니지:호주'>튀니지:호주</option> -->
		<option>튀니지:호주</option> 
		<!-- 레이블은 설정하면 value도 동일하게 적용되므로 value를 설정할 필요가 없다.-->
	</select>
	<h2>
	[1단계:확인]* 7. [화면구현] 사이트 상단 메뉴항목을 배열로 5개 선언하고, 각 메뉴별로 배경색상을 지정한후, 수
	평으로 리스트 출력되게 하세요.</h2>
	<nav>
		<ul>
		<%
			String menus[]={"뉴스","스포츠","증권","사전","부동산"};
			String colors[]={"darkgrey","tomato","blue","green","pink"};
			for(int idx=0;idx<menus.length;idx++){
		%>
			<li style='background-color:<%=colors[idx] %>;display:inline-block;list-style-type:none;'><%=menus[idx] %></li>
		<%} %>
		</ul>
	</nav>
	<h3>정답</h3>
	<!-- 
	<style>css 메뉴 리스트
	for문 배열 처리
	<ul><li><a href="#">메뉴내용</a></li></ul>
	 -->
	 <style>span{border-radius:5px;padding:5px;}</style>
	<%
	String []menus2={"로그인","메인화면","상품분류1","상품분류2","관리자"};
	String []bks={"orange","yellow","pink","blue","green"};
	for(int idx=0;idx<menus.length;idx++){
	%>
		<span style='background:<%=bks[idx]%>'><%=menus2[idx]%></span>
	
	<%} %>
	
	<h2>[1단계:확인]* 8. [화면구현] jsp에서 테이블로 2X3, 3X4, 5X2를 만들고, 2의 배수, 4의 배수, 
	5의 배수로 출력하세요.(배경색상은 홀짝 다르게 출력)</h2>
	<table>
		<%
		 	for(int cnt=1;cnt<=6;cnt++){
		 		if(cnt%3==1) out.print("<tr>");
		 		out.print("<td style='background:"+(cnt%2==0?"yellow":"")+"'>"+cnt*2+"</td>");
		 		if(cnt%3==0) out.print("</tr>");
		 	}
		 %>
	</table>
	<table>
		<%
		 	for(int cnt=1;cnt<=12;cnt++){
		 		if(cnt%4==1) out.print("<tr>");
		 		out.print("<td style='background:"+(cnt%2==0?"aliceblue":"blue")+"'>"+cnt*4+"</td>");
		 		if(cnt%4==0) out.print("</tr>");
		 	}
		 %>
	</table>
	<table>
		<%
		 	for(int cnt=1;cnt<=10;cnt++){
		 		if(cnt%5==1) out.print("<tr>");
		 		out.print("<td style='background:"+(cnt%2==0?"green":"red")+"'>"+cnt*5+"</td>");
		 		if(cnt%5==0) out.print("</tr>");
		 	}
		 %>
	</table>
	<h3>정답</h3>
	<td>
	<h2>2x3</h2>
	<table>
	<%
	for(int cnt=1;cnt<=6;cnt++){
		if(cnt%3==1) out.print("<tr>");
		out.print("<td style='background:"+(cnt%2==0?"yellow":"pink")+"'>"+cnt*2+"</td>");
		if(cnt%3==0)out.print("</tr>");
	}
	%>
	</table>
	<h2>3x4</h2>
	<table>
	<%
	for(int cnt=1;cnt<=12;cnt++){
		if(cnt%4==1) out.print("<tr>");
		out.print("<td style='background:"+(cnt%2==0?"yellow":"pink")+"'>"+cnt*4+"</td>");
		if(cnt%4==0)out.print("</tr>");
	}
	%>
	</table>
	<h2>5x2</h2>
	<table>
	<%
	for(int cnt=1;cnt<=10;cnt++){
		if(cnt%2==1) out.print("<tr>");
		out.print("<td style='background:"+(cnt%2==0?"yellow":"pink")+"'>"+cnt*5+"</td>");
		if(cnt%2==0)out.print("</tr>");
	}
	%>
	</table>
	
</body>
<script type="text/javascript">

</script>
</html>