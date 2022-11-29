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
/*
 
*/
</script>

</head>
<body>
	<h2>[1단계:확인] 2. [jsp] 물건가격과 갯수를 pageContext로 저장하고, 
	저장된 내용을 출력하되, 총계까지 출력하세요.
	</h2>
	<% 
	pageContext.setAttribute("price",3000); 
	pageContext.setAttribute("cnt",3); 
	%>
	<h3>물건 가격 : <%=pageContext.getAttribute("price") %></h3>
	<h3>물건 갯수 : <%=pageContext.getAttribute("cnt") %></h3>
	<h3>물건 총계 : <%=((Integer)pageContext.getAttribute("price")*(Integer)pageContext.getAttribute("cnt"))%></h3>
	
	<h2>[1단계:확인] 3. [jsp] Dept정보를 pageContext범위로 저장하고 호출하세요.</h2>
	
	<%
		pageContext.setAttribute("부서정보",new Dept(20,"인사팀","서울"));
		Dept deptinfo=(Dept)pageContext.getAttribute("부서정보");
	%>
	<h2>부서정보</h2>
	<h3>부서번호: <%=deptinfo.getDeptno() %></h3>
	<h3>부서이름: <%=deptinfo.getDname() %></h3>
	<h3>부서지역: <%=deptinfo.getLoc() %></h3>
	
	<h2>
[1단계:개념] 4. [jsp] application 범위를 설명하고 회원 아이디와 권한 이름을 설정하고 다른 페이지에서 호출하세요.</h2>
	<%
	application.setAttribute("id","yujin"); 
	application.setAttribute("auth", "관리자"); 
	%>

	<a href="1128_show_4.jsp">다른 페이지에서 확인</a>
	<h2>
	[1단계:확인] 5. [js] json형식의 객체로 월드컵의 팀명 소속조 승 무 패의 속성을 선언하고, for in 구문 테이블로 출력하세요.</h2>
	<h3 id="ex5"></h3>
	<script> 
	var teamsList = {nation:"대한민국",part:"H조",win:0,eq:1,def:0}
					
	for(var teamcolumn in teamsList){
		document.querySelector("#ex5").innerHTML+=teamcolumn +":"+teamsList[teamcolumn]+"<br>"
	}
	</script>
	<h2>[1단계:확인] 6. [js] 월드컵의 날짜와 시간별 팀1, 팀2의 일정을 출력하는 생성자형 객체를 선언하고, 오늘 한국/가나팀 일정계획을 출력하세요.</h2>
	<h3 id="ex6"></h3>
	<script>
	function TodayPlay(team1,team2,date,time){
		this.team1=team1;
		this.team2=team2;
		this.date=date;
		this.time=time;
		this.relay = function(){
			document.querySelector("#ex6").innerHTML+= this.team1+" VS "+this.team2+"경기 "+this.date+" "+this.time+" 시작<br>";
		}
	}
	var game = new TodayPlay("한국","가나","2022-11-28","10:00")
	//game.relay();
	</script>
	
	<h2>[1단계:확인] 7. [js] 위 내용을 내일일정 기준으로 여러 경기를 배열로 추가해서 출력하게 하세요.</h2>
	<script>
	var games = []
	games.push(game)
	games.push(new TodayPlay("포루투갈","우루과이","2022-11-29","04:00"))
	games.push(new TodayPlay("대한민국","포루투갈","2022-12-03","00:00"))
	games.push(new TodayPlay("가나","우루과이","2022-12-03","00:00"))
	games.forEach(function(g01){
		g01.relay()
	})
	</script>
	
	<h2>[1단계:확인] 8. [js] class Product에 물건명과 가격을 선언하여 생성자를 통해 초기화하고 
			set get 메서드를 통해서 호출하고 저장하는  필드를 은닉하여 처리하게 하세요.</h2>
	<h3 id="ex8"></h3>
	<script>
		class Product{
			constructor(pname,price){
				this._pname = pname
				this._price = price
			}
			set pname(input1){
				return this._pname=input1
			}
			get pname(){
				return this._pname;
			} 
			set price(input2){
				return this._price=input2
			}
			get price(){
				return this._price;
			} 
		}
		var pro1 = new Product("사과",5000)
		document.querySelector("#ex8").innerHTML+= "물건명:"+pro1.pname+" 가격:"+pro1.price+"<br>"
		pro1.price = 3000
		document.querySelector("#ex8").innerHTML+= "물건명:"+pro1.pname+" 가격:"+pro1.price
	</script>
	
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>