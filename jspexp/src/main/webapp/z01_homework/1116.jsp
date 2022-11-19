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
<script>
	
</script>

</head>
<body>
	<h2>[1단계:확인] 2. [js] ``(백틱)으로 선언된 버스번호와 목적지를 변수로 선언하고 console.log로 줄바꾸어 출력하세요.</h2>
		
	<h2>[1단계:확인] 4. [js] prompt창으로 두개의 숫자를 입력받아, 사칙연산을 처리한 결과를 p태그로 출력하세요. </h2>
		 
		<p id="plus"> </p>
		<p id="minus">  </p>
		<p id="multi"> </p>
		<p id="division"> </p>
		
		<p id = "show"></p>
		
	<h2>[1단계:확인] 9. [js] 배열1에는 아이디 3개, 배열2에는 이름 3개를 선언하고, 반복문을 이용해서 테이블 리스트로 출력하세요</h2>
		<table>
			<tr id="id"><th>아이디</th></tr>
			<tr id="name"><th>이름</th></tr>
		</table>
		<h2 onclick="createInfo()">회원정보 출력</h2>
		<table id="tab01"></table>
		
    <h2>[1단계:확인] 11. [jsp]form화면에 도서관에서 빌린책명, 대출일, 대출자명을 요청값으로 넘겨 테이블 형식 화면에 출력하게 하세요(null처리)</h2>
    	<form>
    		빌린책명 : <input type="text" name="bookName" />
    		대출일 : <input type="date" name="rentalDate"/><br>
    		대출자명 : <input type="text" name="rentalMember" />
    		<input type="submit" value="대출" />
    	</form>
    	<% 
	    	String bookName = request.getParameter("bookName");
			String rentalDate = request.getParameter("rentalDate");
			String rentalMember = request.getParameter("rentalMember");
		%>
		<table>
			<col width="40%">
			<tr><th>빌린책명</th><td><%=bookName %></td></tr>
			<tr><th>대출일</th><td><%=rentalDate %></td></tr>
			<tr><th>대출자명</th><td><%=rentalMember %></td></tr>
		</table>
    
	<h2>[1단계:확인] 12. [jsp]form화면에 구매 물건 3개의 (물건명/가격)을 입력하게하고, 구매 눌렀을 때, 구매 물건 리스트와
           총비용을 출력하게 하세요.</h2>
           <form>
           	물건명1:<input type="text" name="pname1" />
           	물건명1 가격:<input type="text" name="price1" />
           	물건명2:<input type="text" name="pname2" />
           	물건명2 가격:<input type="text" name="price2" />
           	물건명3:<input type="text" name="pname3" />
           	물건명3 가격:<input type="text" name="price3" />
           	<input type="submit" value="구매" />
           </form>
          
        	<% 
	           String pname1= request.getParameter("pname1");
	           String price1= request.getParameter("price1");
	           String pname2= request.getParameter("pname2");
	           String price2= request.getParameter("price2");
	           String pname3= request.getParameter("pname3");
	           String price3= request.getParameter("price3");
	         %>
	          
			<h2>구매목록 : <%=pname1%>,<%=pname2%>,<%=pname3%></h2>
			
			<h2>구매물건(정답)</h2>
			<!-- action 속성이 있으면 해당 화면 jsp에 데이터를 넘기고, 없으면 현재 jsp에 요청데이터를 넘긴다. -->
<%-- 			<form>
				<table>
					<col width="10%">
					<tr><th>no</th><th>물건명</th><th>가격</th></tr>
					<%for(int cnt=1;cnt<=3;cnt++) {%>
					<tr><td><%=cnt %></td>
					<td><input type="text" name="pname" /></td>
					<td><input type="text" name="price" /></td>
					</tr>
					<%} %>
					<tr><td colspan="3"><input type="submit" value="구매" /></td></tr>
				</table>
			</form>
			
			<%
			int tot=0;
			String buyList="";
			for(int cnt=0; cnt<=3; cnt++){ 
				String pname = request.getParameter("pname"+cnt);
				String price = request.getParameter("price"+cnt);
				if(pname!=null) buyList+=pname+", ";
				if(price!=null) tot+=Integer.parseInt(price);
			}
			if(tot!=0){
			%>	
			<h2>구매목록리스트:<%=buyList %></h2>
			<h2>총비용:<%=tot %></h2>
			<%} %>
			<form> --%>
      <table>
         <tr><td>no</td><th>물건명</th><th>가격</th></tr>
         <%for(int cnt=1; cnt<=3;cnt++){ %>
         <tr><td><%=cnt%><td><input type="text" name="pname<%=cnt%>"/>
         </td><td><input type="text" name="price<%=cnt%>"/></td></tr>
         
         <%} %>
         <tr><td colspan="3"><input type="submit" value="구매"></td></tr>
      </table>
   </form>

   <%
   int tot=0;
   String buyList="";
   for(int cnt=0; cnt<=3;cnt++){
      String pname=request.getParameter("pname"+cnt);
      String price=request.getParameter("price"+cnt);
      if(pname!=null) buyList+=pname+", ";
      if(price!=null) tot+=Integer.parseInt(price);
   }
   if(tot!=0){
   %>
      <h2>구매목록리스트:<%=buyList %></h2>
      <h2>총비용:<%=tot %></h2>
   <%} %>
			
</body>

<script>
	/* var busno=1500; var destination="홍대입구"
	
	console.log(`\${busno}번 버스는 
				\${destination}을 갑니다.`) */
				
	// 정답
	var busno = 25
	var target = '서울'
	console.log(`
	버스번호 : \${busno}
	목적 : \${target}
	`)
				
	/* var num01 = prompt("첫번째숫자를 입력하세요.", "첫번째숫자(여기에)");
	var num02 = prompt("두번째숫자를 입력하세요.", "두번쨰숫자(여기에)");
	document.querySelector('#plus').innerHTML = num01+","+num02+"덧셈: "+(Number(num01)+Number(num02));
	document.querySelector('#minus').innerHTML = num01+","+num02+"뺄셈: "+(Number(num01)-Number(num02));
	document.querySelector('#multi').innerHTML = num01+","+num02+"곱셈: "+Number(num01)*Number(num02);
	document.querySelector('#division').innerHTML = num01+","+num02+"나눗셈: "+Number(num01)/Number(num02); */
	// 정답
	/*
	var num01 =prompt("첫번째 숫자입력","0")
	var num02 =prompt("두번째 숫자입력","0")
	var show = document.querySelector('#show')
	show.innerHTML +=num01+" + "+num02+ "="+(parseInt(num01)+parseInt(num02))+"<br>"
	show.innerHTML +=num01+" - "+num02+ "="+(num01-num02)+"<br>"
	show.innerHTML +=num01+" * "+num02+ "="+(num01*num02)+"<br>"
	show.innerHTML +=num01+" / "+num02+ "="+parseInt(num01/num02)+"<br>"
	*/
	
	//정답
	function createInfo(){
		//ajax를 이용하면 js단에서 서버에 접근해서 데이터를 가져와서 동적인 로딩처리가 가능해짐
		var tab01 = document.querySelector("#tab01")
		var ids = ['himan','goodman','badgirl']
		var names = ['홍길동','김길동','김영자']
		var addHTML = "<tr><th>아이디</th><th>이름</th></tr>";
		for(var idx=0; idx<ids.length;idx++){
			addHTML+= "<tr><td>"+ids[idx]+"</td><td>"+names[idx]+"</td></tr>"
		}
		tab01.innerHTML = addHTML;
	}
	
	
	var array1 = ['himan']
	array1.push("goodman")
	array1.push("higirl")
	var array2 = ['홍길동']
	array2.push("김길동")
	array2.push("이길동")
 	var idSh = document.querySelector('#id');
 	var nameSh = document.querySelector('#name');
 	
	
 	 for(var idx in array1){
 		idSh.innerHTML += "<td>"+array1[idx]+"</td>"
 	 }
 	 for(var idx in array2){
 		nameSh.innerHTML += "<td>"+array2[idx]+"</td>"
 	 }
	
</script>
</html>