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
<%-- 
# 주요 기본 객체
1. request : 클라이언트의 요청정보를 저장한다.
2. response : 응답 정보를 저장한다.
3. pageContext : jsp 페이지에 대한 정보를 저장한다.
4. session : HTTP 세션 정보를 저장한다.
5. application : 웹 어플리케이션에 대한 정보를 저장한다.
	- 웹서버 전체에 대한 저장 정보를 처리할 수 있다.
6. out : jsp 페이지가 생성하는 결과를 출력할 때 사용되는 출력 스트림이다.
7. config : jsp 페이지에 대한 설정 정보를 저장한다.
8. page : JSP 페이지를 구현한 자바 클래스 인스턴스이다.
9. exception : 예외 객체, 에러 페이지에서만 사용된다.

# session 범위에 따른 객체 : 웹에서 저장되는 페이지와 시간적인 범위에 따라 설정
0. 아래 객체들으 공통 메서드를 통해서 저장되고 호출된다.
	setAttribute("저장키","저장값")
	getAttribute("저장키")
1. pageContext : 한페이지 안에서만 사용 가능
2. request : 요청범위까지만 사용가능
3. session : 세션이 지정한 만료시간까지 사용가능
4. application : 웹서버가 기동할떄까지 (재기동 전까지)사용가능

# out 기본 객체
1. jsp 페이지가 생성되는 모든 내용은 out 기본 객체를 통해서 전송할 수 있다.
2. 복잡한 if-else 사용시, out 기본 객체 사용하면 편리하다.
	1) scriptlet, expresion의 복잡한 사용보다. out 으로 활용할 때
		더 효율적일 때가 많다.
3. 출력 메서드
	1) out.print() : 데이터를 출력만 한다.
	2) out.println() : 데이터를 출력하고 줄바꿈처리까지 한다.
	3) out.newLine() : 줄바꿈 처리를 한다.
--%>
<h2>안녕하세요</h2>


<h3>
<%for(int cnt=0;cnt<=10;cnt++) {%>
	<%=cnt %>,
<%} %>
</h3>
<h2>out객체 사용</h2>
<h3>
<%
	for(int cnt=0;cnt<=10;cnt++){
		out.print(cnt+",");
	}
%>
</h3>
<%--
ex) cnt를 1~16까지하여 테이블을 번호가 있는 테이블(4X4)을 만들어 보세요. 
	( 조건문 쓰기 곤란한분들은 이중 for문 쓰셔도 됩니다.)
 --%>
 <table>
 	 <%
	 	 int cnt = 0;
	 	 for(int row=1;row<=4;row++){
	 	 	out.print("<tr>");
	 	 	for(int col=1;col<=4;col++){
	 	 		out.print("<td>"+(++cnt)+"</td>");
	 	 	}
	 	 	out.print("</tr>");
	 	 } 	 
 	 %>
 </table>
 <h2>테이블2</h2>
 <table>
 	 <%
	 	 for(int cel=1;cel<=16;cel++){
	 		 if(cel%4==1) out.print("<tr>");
	 	 		out.print("<td>"+cel+"</td>");
	 	 		if(cel%4==0) out.print("</tr>");
 	 	}
 	 %>
 </table>
 <%-- ex1) ul의 리스트로 배열로 선언된 과일명 출력하기--%>
 	<h2>ex1)</h2>
 	<ul>
 	<%
 		String []fruits = {"사과","바나나","딸기","포도"};
 		for(int idx=0;idx<fruits.length;idx++){
 			out.print("<li>"+fruits[idx]);
 		}
 	%>
 	</ul>
 <%-- ex1-1)ol로 물건의 가격 5개 리스트 배열 선언 후, 출력 --%>
 	<ol>
 		<%
 			String []products = {"노트북","키보드","마우스","스피커","의자"};
 			for(String pro:products){
 				out.print("<li>"+pro+"</li>"); 			
 			}
 		%>
 	</ol>
 	
 <%-- ex2) select의 option의 value 출력내용을 부서번호 배열, 부서명 배열 출력--%>
 	<h2>ex2)</h2>
 	부서정보: <select name ="deptno" onchange="alert(this.value)"><!-- 선택한 값을 경고창으로 로딩 -->
 	
 		<% 
 		int []deptnos={10,20,30};
 		String []dnames={"인사팀", "회계팀","마케팅팀"};
 		for(int idx=0;idx<deptnos.length;idx++){
 			out.print("<option value='"+deptnos[idx]+"'>"+dnames[idx]+"</option>");
 		}
 		%>
 			<option value='50'>아이티사업</option>
 	</select>
 <%-- ex2-1) 사원번호와 사원명을 배열로 선언하고, select로 선언하여 value에서 사원번호 레이블에는 사원명으로 처리되게 하세요.--%>
	 <select name="eno" onchange="alert(this.value)">
	<%
		int []empnos2 = {7000,7001,7002,7003};
		String []enames2 = {"홍길동", "마길동", "이길동","김길동"};
		for(int idx=0; idx<empnos2.length; idx++){
			out.print("<option value='"+empnos2[idx]+"'>"+enames2[idx]+"</option>");
		}
	%>
	</select> 
	
	<%
	int []empnos = {7000,7001,7002,7003};
	String []enames = {"홍길동", "마길동", "이길동","김길동"};
	%>
	<h2>사원정보</h2>
	<select name="empno" onchange="alert(this.value)">
	<% for(int idx=0;idx<empnos.length;idx++){%>
	<option value="<%=empnos[idx]%>"><%=enames[idx] %><option>
	<%} %>
	</select>	

	<h2>사원정보2</h2>
	<select onchange="alert(this.value)">
		<%
			List<Code> clist = new ArrayList<Code>();
			clist.add(new Code("7780","홍길동"));
			clist.add(new Code("7781","김길동"));
			clist.add(new Code("7782","신길동"));
			for(Code c:clist){
				out.print("<option value='"+c.getKey()+"'>"+c.getVal()+"</option>");
			}
		%>
	</select>
 <%-- ex3) h3로 7가지 무지개색 배경색상과 함께 출력하기(무지개 배경색상-배열선언) --%>
 	
 	<%
 		String []rainbow = {"red","orange","yellow","green","blue","navy","purple"};
 		for(String color:rainbow){
 			out.print("<h3 style='background-color:"+color+"'>"+color+"</h3>");
 		}
 	%>
 	<%
 	String[] colorsH={"빨강","주황","노랑","초록","파랑","남","보라"};
 	String[] colorsE={"red","orange","yellow","green","blue","navy","purple"};
 	for(int idx=0;idx<colorsH.length;idx++){
 		out.print("<h3 style='background-color:"+colorsE[idx]+"'>"+colorsH[idx]+"</h3>");
 	}
 	%>
 	<%--ex3-1)span 태그로 물건명을 3개 출력하되 테두리 색상을 초록색, 글자색은 파랑색/노랑색/보라색으로 처리하되
 		해당 색상의 변수는 자바로 선언하고 처리하세요. --%>
 	<%
	 	String []pname = {"apple","banana","tomato"}; 
	 	String []color = {"blue","yellow","purple"}; 
	 	for(int idx=0;idx<pname.length;idx++){
	 		out.print("<span style='color:"+color[idx]+"'>"+pname[idx]+"</span><br>");
	 	}
	 %>
	 <%
	 	String []pnames = {"사과","바나나","딸기"}; 
	 	String []fcolor = {"blue","yellow","purple"};
	 	String bkColor = "green";
	 	for(int idx=0;idx<pnames.length;idx++){
	 %>
	 <span style='padding:15px;border-radius:10px;border:1px solid <%=bkColor %>;color:<%=fcolor[idx]%>'><%=pnames[idx] %></span>
 	<%}
 	%>
 <%-- ex4) table로(2X3) 3의 배수를 출력, 배경색상 짝수 cel마다 pink색--%>
 	<table>
 	<tr>
 	<% 
    int number=0;
 	int tot = 0;
    for(int row=0; row<=1;row++){
       out.print("<tr>");
       for(int col=0; col<=2;col++){
          tot += number+3;
          if(tot%2==0){
        	  out.print("<td style='background-color:pink'>"+tot+"</td>");
          }else {
        	  out.print("<td>"+tot+"</td>");
          }
       }
       out.print("</tr>");
       }   
 	%>
 	</tr>
 	</table>
 	<h2>테이블 생성연습(2X3)</h2>
 	<table>
 	<%
 	for(cnt=1;cnt<=6;cnt++){
 		if(cnt%3==1) out.print("<tr>");
 		out.print("<td style='background:"+(cnt%2==0?"pink":"")+"'>"+cnt*3+"</td>");
 		if(cnt%3==0) out.print("</tr>");
 	}
 	%>
 	</table>
 
 
 <%-- ex5) table 타이틀로 물건명 가격 갯수 선언, 5개 row로 각 cel마다 물건명/가격은 input, 갯수는 0~9까지 있는 select
 	1) 기본화면 구성
 	2) java List 선언(Dao로 가져온 데이터 리스트)
 	3) 반복문과 html 코드로 처리
 	4) script 처리가 필요한 부분 처리
 --%>
 	<h2>입력하는 테이블 리스트</h2>
 	<%
 	List<Product> plist = new ArrayList<Product>();
 	plist.add(new Product("사과",3000,2));
 	plist.add(new Product("바나나",4000,3));
 	plist.add(new Product("딸기",12000,5));
 	plist.add(new Product("딸기",12000,5));
 	plist.add(new Product("딸기",12000,5));
 	plist.add(new Product("딸기",12000,5));
 	plist.add(new Product("딸기",12000,5));
 	%>
 	<table>
 		<tr><th>선택</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
 		<%for(int idx=0;idx<plist.size();idx++) {
 			Product p = plist.get(idx);
 		%>
 		<tr><td><input type="checkbox" name="ch" value="<%=idx%>"
 						<%=idx%2==0?"checked":"" %>/></td>
	 		<td><input type="text" name="name" value="<%=p.getPname()%>"/></td>
	 		<td><input type="text" name="price" value="<%=p.getPrice()%>"/></td>
	 		<td><select name="cnt"/>
	 			<%for(cnt=0;cnt<=9;cnt++){ %>
	 			<option <%=cnt==p.getCnt()?"selected":"" %>><%=cnt %></option>
	 			<%} %>
	 		</select></td></tr>
	 	<%} %>
 	</table>
 		<br>
 	 	<select>
	 		<option>사과</option>
	 		<option>바나나</option>
	 		<option selectrd>딸기</option>
	 		<option>오렌지</option>
	 	</select>
	 	<%-- ex) 사원번호, 사원명, 급여, 부서명(select) 테이블 form 요소객체로 출력 --%>
	 	<h2>사원정보</h2>
	 	<table>
	 	<col width="10%">
	 	<col width="20%">
	 	<col width="25%">
	 	<col width="20%">
	 	<col width="25%">
	 	<tr><th>선택</th><th>사원번호</th><th>사원명</th><th>급여</th><th>부서명(select)</th></tr>
	 	<%
	 	// public Emp(int empno, String ename, double sal, int deptno) 
	 	List<Emp> elist = new ArrayList<Emp>();
	 	elist.add(new Emp(7781,"홍길동",3000,10));
	 	elist.add(new Emp(7782,"김길동",4000,20));
	 	elist.add(new Emp(7783,"신길동",3500,10));
	 	elist.add(new Emp(7784,"오길동",5000,40));
	 	%>
	 	
	 	<%for(int idx=0;idx<elist.size();idx++){ 
	 		Emp e = elist.get(idx);
	 	%>
	 	<tr><td><input type="checkbox" name="ck" value="<%=idx%>"/></td>
	 		<td><input type="text" name="empno" value="<%=e.getEmpno()%>"/></td>
		 	<td><input type="text" name="ename" value="<%=e.getEname()%>"/></td>
		 	<td><input type="text" name="sal" value="<%=e.getSal()%>"/></td>
		 	<td><select name="deptno">
			 		<option value="10" <%=e.getDeptno()==10?"selected":"" %>>인사</option>
			 		<option value="20" <%=e.getDeptno()==20?"selected":"" %>>재무</option>
			 		<option value="30" <%=e.getDeptno()==30?"selected":"" %>>회계</option>
			 		<option value="40" <%=e.getDeptno()==40?"selected":"" %>>기획</option>
	 			</select>
		 	</td></tr>
		 	<%} %>
	 	</table>
	 
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>