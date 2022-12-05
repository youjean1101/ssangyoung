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
	<h2>[1단계:확인]* 2. [jsp] 물건명:[   ][재고여부] 클릭시, form으로 submit 처리하여 
               a50_check.jsp에 이동해서 a53_main.jsp(재고 있음),  a54_main.jsp(재고 없음),  </h2>
    <form>
    	물건명:<input type="text" name="pname"/>
    	<input type="submit" value="재고여부" />
    </form>
    
    <%
    String pname = request.getParameter("pname");
 	if(pname!=null){
 		String page03 = "a50_check.jsp";
 		 request.setAttribute("pname",pname);
	 %>
	 <jsp:forward page="<%=page03%>"/>
	<%
 	}%>
 	<h3>정답</h3>
 	<%-- 
 	1. 화면구성/파일만들기.
 	2. 요청값 처리
 		1) 요청값에 따라, 요청범위로 설정
 		2) 요청페이지 처리..(forward)
 		a50_check.jsp
 		 String pname2 = request.getParameter("pname2");
		if(pname2!=null){
			String page05="";
			if(pname2.equals("사과")){
				request.setAttribute("msg", "재고 있음");
				page05="a53_main.jsp";
			}else{
				request.setAttribute("msg", "재고 없음");
				page05="a54_main.jsp";
			}
			RequestDispatcher rd = request.getRequestDispatcher(page05);
			rd.forward(request,response);
		}
 	3. 최종페이지 가져오기. 
 	 a53_main.jsp(재고 있음),  <h2><%=request.getAttribute("msg")%></h2> <h2><%=request.getParameter("pname2")%>재고</h2>
 	 a54_main.jsp(재고 없음)	<h2><%=request.getAttribute("msg")%></h2>
 	 --%>
 	 
    <form method="post" action="a50_check.jsp">
    	물건명 : <input type="text" name="pname2" />
    	<input type="submit" value="재고여부" />
    </form>
    
	<h2>[2단계:확인]* 3. [jsp] form으로 물건명 가격 갯수를 입력해서 전송했을 때, 
		두번째 페이지(z40_cal.jsp)에서 총비용이 100000이상이면 MVP페이지(z41_mvp.jsp)로
	 	forward처리 그렇지 않으면 Normal페이지(z42_normal.jsp)로 이동하게 하세요.</h2>
	 	<form>
	 	물건명:<input type="text" name="pname2"/>
	 	가격:<input type="text" name="price" value="0"/>
	 	갯수:<input type="text" name="cnt" value="0"/>
	 	<input type="submit" name="전송"/>
	 	</form>
	 	<%
	 	String pname2 = request.getParameter("pname2"); 
	 	String sPrice = request.getParameter("price"); 
	 	String sCount = request.getParameter("cnt");
	
	 	if(pname2!=null && sPrice!=null && sCount!=null){
	 		String page04 = "z40_cal.jsp";
			
		 	int price = Integer.parseInt(sPrice);
		 	int count = Integer.parseInt(sCount);
		 	
	 		request.setAttribute("pname2",pname2);
	 		request.setAttribute("price",sPrice);
	 		request.setAttribute("count",sCount);
	 		request.setAttribute("tot", price*count);
	 	%>
	 	<jsp:forward page ="<%=page04 %>"/>
	 	<%
	 	}
	 	%>
	 	<%-- 
	 	z40_cal.jsp
	 		String price5 = request.getParameter("price5"); if(price5==null) price5="0";
	 		String cnt5 = request.getParameter("cnt5"); if(cnt5==null) cnt5="0";
	 		int priceI = Integer.parseInt(price5);
	 		int cntI = Integer.parseInt(cnt5)
	 		int tot2 = priceI*cntI
	 		request.setAttribute("tot2",tot2);
	 		String page05 = "z42_normal.jsp";
	 		if(tot2>=100000){
	 			page05 = "z41_mvp.jsp";
	 		}
	 		<jsp:forward page="<%=page05%>" />
	 		
	 		z41_mvp.jsp
	 			<h2><%= request.getParameter("name5") %>구매 MVP 페이지</h2>
	 			<h3><%= request.getAttribute("tot2") %></h3>
	 		z42_normal.jsp
	 			<h2><%= request.getParameter("name5") %>구매 일반 페이지</h2>
	 			<h3><%= request.getAttribute("tot2") %></h3>
	 	--%>
	 	<h3>정답</h3>
	 	<h2>구매 처리에 따른 등급페이지 이동</h2>
	 	<form method="post" action="z40_cal.jsp">
	 	물건명 : <input type="text" name="name5" />
	 	가격 : <input type="text" name="price5" />
	 	갯수 : <input type="text" name="cnt5" />
	 	<input type="submit" value="구매" />
	 	</form>
	<h2>
	[3단계:확인]* 3. [jsp] id:[   ][등록여부] 클릭시, form으로 submit 처리하여 a51_check.jsp에 이동해서 DB에 있을 때와 
	없을 때는 나누어 request setAttribute("hasId","Y"/"N")로 설정하여 등록가능 여부를 처리하세요</h2>
	<%--
	1. 화면구현
		name="id"
	2. a51_check.jsp
		String id = request.getParameter("id");
		if(id!=null){
			A06_PareparedDao dao = new A06_PareparedDao();
			request.setAttrubute("hasId",dao.checkId()?"Y":"N");
		%>
			<jsp:forward page="1202.jsp" />
		<%
		}
	3. 현재페이지
		String hasId = request.setAttribute("hasId");
		boolean isFirst=false;
		if(hasId!=null){ // 초기 페이지와 구분..
			isCheck=true;
		}
		<script>
		var isFirst = <%=isFirst%>
		if(isFirst){ // 입력을 받아서 forward되었을 때..
			var hasId = "<%=hasId%>"
			if(hasId=="Y"){
				alert("등록된 아이디가 있습니다.");
			}else{
				alert("등록 가능합니다.")
				document.querySelector("[name=id]").value="<%=id%>"
			}
		}
	 --%>
	<h3>정답</h3>
	<h2>아이디 등록 유효 check</h2>
	<form method="post" action="a51_check.jsp">
		아이디:<input type="text" name="id4" />
		<input type="submit" value="등록여부"/>
	</form>
	<%
	String hasId = (String)request.getAttribute("hasId");
	boolean isCheck=false;
	if(hasId!=null){
		isCheck=true;
	}
	String id = request.getParameter("id4");
	%>
	<script type="text/javascript">
		var isCheck = <%=isCheck%>
		if(isCheck){
			var hasId = "<%=hasId%>"
			if(hasId=="Y"){
				alert("등록된 아이디가 있습니다.");
			}else{
				alert("등록 가능합니다.")
				document.querySelector("[name=id4]").value="<%=id%>"
			}
		}
	</script>	
	<h2>[1단계:확인] 5. [js] 2022/12/01와 2023/01/01의 사이의 시간과 날짜수를 출력하세요.</h2>
	<h3 id="ex5"></h3>
	<script>
	var lastYear = new Date(2022,12,01,0,0)
	var newYear = new Date(2023,01,01,0,0)
	var diff = newYear.getTime()-lastYear.getTime()
	document.querySelector("#ex5").innerHTML += "12월과 1월사이 시간: "+parseInt(diff/1000/60/60)+"시간<br>"
	document.querySelector("#ex5").innerHTML += "12월과 1월사이 날짜: "+parseInt(diff/1000/60/60/24)+"일<br>"
	</script>
	
	
	<h2>[2단계:확인]* 5. [js] 오늘로 부터 몇일? [@@@@-@@-@@][날짜 확인] 날짜를 @@@-@@-@@ 형식으로 입력하고, 
	날짜 확인 버튼을 클릭시, 며칠되었지 출력하세요.</h2>
	
	<h3>정답</h3>
	오늘로부터 몇일?<input type="date" name="indate" />
	<input type="button" value="날짜 확인" onclick="calDate()"/>
	<h3 id="showDt"></h3>
	<script>
		function calDate(){
			var toDay = new Date() //오늘날짜.
			var inDate = document.querySelector("[name=indate]").value.split("-")
			
			var stDay = new Date(inDate[0], inDate[1]-1,inDate[2])
			var diff = toDay.getTime()-stDay.getTime()
			// 날짜수만 나올수 있게 내림처리..
			var dayCnt = Math.floor(diff/1000/60/60/24)
			console.log(dayCnt)
			// Math.abs(dayCnt) : 오늘 이전은 +, 오늘 이후는 -값 절대값 처리
			// ((dayCnt>0)?"전":"이후" : 오늘 이후는 - 이므로 이후로 그외는 전)
			document.querySelector("#showDt").innerText=Math.abs(dayCnt)+"일 "+((dayCnt>0)?"전":"이후")
		}
	</script>
	
	
	<h2>[1단계:확인] 8. [js] 0~100점의 임의의 국어점수 5명을 만들고 출력하고, 
	이 점수를 15% 점수를 올린 배열과 60점이상인 배열을 출력하세요.</h2>
	<h3 id="ex8"></h3>
	<script>
		var korArr = []
		for(var idx=1;idx<=5;idx++){
			korArr.push(Math.floor(Math.random()*101))+"점,"
		}
		document.querySelector("#ex8").innerHTML +="국어점수 램덤: "+korArr+"<br>"
		var korArrhigh = korArr.map(function(score){return Math.round(score+(score*0.15))})
		document.querySelector("#ex8").innerHTML +="국어 15%올린 점수 : "+korArrhigh+"<br>"
		var cutLine = korArrhigh.filter(function(score){ return score>=60})
		document.querySelector("#ex8").innerHTML +="15%올린 국어점수 60점이상: "+cutLine+"<br>"
	</script>
	
	
	<h2>3단계:확인]* 8. [js] 월드컵 조별팀의 기본속성(나라,승,무,패)로 특정조의 팀들을 현재 성적으로 등록시키고, 승수를 한번에 1씩 올리고, 
	해당 팀들을 테이블로 출력하고, 이중 승률이 50%이상인 팀만 추출하여 배열 출력하세요</h2>
	<table id="pipa">
		<thead><tr><th>팀</th><th>승</th><th>무</th><th>패</th><th>승률</th></tr></thead>
		<tbody></tbody>
	</table>
	<script>
		var hgrp = []
		hgrp.push({nat:"포루투갈",win:2,eq:0,def:1})
		hgrp.push({nat:"한국",win:1,eq:1,def:1})
		hgrp.push({nat:"우루과이",win:1,eq:1,def:1})
		hgrp.push({nat:"가나",win:0,eq:0,def:2})
		console.log(hgrp)
		hgrp.map(function(team){
			team.win = team.win+1
			team.winRatio = Math.round(team.win/(team.win+team.def)*100)
			return team
		})
		// 새로운 배열에 할당.
		var hgrp = hgrp.filter(function(team){
			return team.winRatio>=50
		})
		console.log(hgrp)
		var show = ""
		hgrp.forEach(function(t){
			show+="<tr><td>"+t.nat+"</td><td>"+t.win+"</td><td>"+t.eq+"</td><td>"
						+t.def+"</td><td>"+t.winRatio+"</td></tr>"
		})
		document.querySelector("#pipa tbody").innerHTML=show
		console.log(hgrp)
	</script>

</body>
<script type="text/javascript">

</script>
</html>