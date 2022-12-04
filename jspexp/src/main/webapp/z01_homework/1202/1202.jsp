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
	<h2>[1단계:확인] 2. [jsp] 물건명:[   ][재고여부] 클릭시, form으로 submit 처리하여 
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
    
    
	<h2>[2단계:확인] 3. [jsp] form으로 물건명 가격 갯수를 입력해서 전송했을 때, 
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
	 	
	<h2>
	[3단계:확인] 3. [jsp] id:[   ][등록여부] 클릭시, form으로 submit 처리하여 a51_check.jsp에 이동해서 DB에 있을 때와 
	없을 때는 나누어 request setAttribute("hasId","Y"/"N")로 설정하여 등록가능 여부를 처리하세요</h2>

	<h2>[1단계:확인] 5. [js] 2022/12/01와 2023/01/01의 사이의 시간과 날짜수를 출력하세요.</h2>
	<h3 id="ex5"></h3>
	<script>
	var lastYear = new Date(2022,12,01,0,0)
	var newYear = new Date(2023,01,01,0,0)
	var diff = newYear.getTime()-lastYear.getTime()
	document.querySelector("#ex5").innerHTML += "12월과 1월사이 시간: "+parseInt(diff/1000/60/60)+"시간<br>"
	document.querySelector("#ex5").innerHTML += "12월과 1월사이 날짜: "+parseInt(diff/1000/60/60/24)+"일<br>"
	</script>
	
	
	<h2>[2단계:확인] 5. [js] 오늘로 부터 몇일? [@@@@-@@-@@][날짜 확인] 날짜를 @@@-@@-@@ 형식으로 입력하고, 
	날짜 확인 버튼을 클릭시, 며칠되었지 출력하세요.</h2>
	
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
	
	
	<h2>3단계:확인] 8. [js] 월드컵 조별팀의 기본속성(나라,승,무,패)로 특정조의 팀들을 현재 성적으로 등록시키고, 승수를 한번에 1씩 올리고, 
	해당 팀들을 테이블로 출력하고, 이중 승률이 50%이상인 팀만 추출하여 배열 출력하세요</h2>

</body>
<script type="text/javascript">

</script>
</html>