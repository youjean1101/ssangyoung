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
// 5번
var orcnts = [0,0,0] //  클릭시 마다, 함수 전역적으로 주문갯수를 증가
function cal(cIdx, ch){
	var menus = ["짜장면", "짬뽕", "탕수육"]
	var prices = [6000, 7000, 12000]
	if(ch=="+"){
		orcnts[cIdx]++;
	}else{
		if(orcnts[cIdx]<=0){
			alert("0 이하는 감소되지 않습니다.")
		}else{
			orcnts[cIdx]--;
		}
	}
	
	var showList = "" //하단에 메뉴 내용 출력
	var tot=0; // 총비용 출력..
	for(var idx=0; idx<orcnts.length;idx++){ // orcnts = [0,0,0] 주문량이 있을 때만 반복해서 출력
		if(orcnts[idx]>0){
			showList+=menus[idx]+"("+prices[idx]+"원)"+orcnts[idx]+"<br>"
			tot += prices[idx]*orcnts[idx]
		}
	}
	showList+="총비용:"+tot+"원"
	document.querySelector("#show").innerHTML = showList
}
// 6번 정답
	// js 유효성 check
	 //js 유효성 check
   function calPlus(){
      var num01Ob = document.querySelector("[name=num01]")
      var num01 = num01Ob.value
      var num02Ob = document.querySelector("[name=num02]")
      var num02 = num02Ob.value
      if(num01=="" || isNaN(num01)){
         alert("공백이거나 숫자가 아닙니다.")
         num01Ob.value="";num01Ob.focus()
         return; //특정 조건에 따라 프로세스를 중단 처리 ..
      }
      if(num02=="" || isNaN(num02)){
         alert("공백이거나 숫자가 아닙니다.")
         num02Ob.value="";num02Ob.focus()
         return;
      }
      document.querySelector("form").submit();//submit 버튼을 클릭한 것과 동일한 효과
   }

</script>

</head>
<body>
	<h2>[1단계:확인] 1. [js] 가변매개변수 arguments를 활용하여 가변적으로 구매 정보를 매개변수로 처리하여 출력하게 하세요.</h2>
		<h3>구매정보</h3>
		<h4 onclick="buy()">구매안함</h4>
		<h4 onclick="buy('사과','3000원','3개')">사과</h4>
		<h4 onclick="buy('바나나','7000원','1개')">바나나</h4>
		<h4 onclick="buy('딸기','12000원','10개')">딸기</h4>
		<p id="first"></p>
	
	<h2>[1단계:확인] 2. [js] ... 가변매개변수에 따라 등록할 물건의 이름 1/2/3개 다른 매개변수로 설정하여 하단에 p태그로 클릭시 마다 처리되게 하세요</h2>
		<p onclick="product('마우스','30000원')">1. 마우스 정보</p>
		<p onclick="product('키보드','90000원')">2. 키보드 정보</p>
		<p onclick="product('노트북','2000000원')">3. 노트북 정보</p>
		<p onclick="product()">4. 보고싶은게 없음</p>
		<h3>물건 정보</h3>
		<p id="second"></p>
	
	<h2>[1단계:확인] 3. [js] default 가변매개변수를 활용하여 사원번호, 사원명, 부서번호를 클릭시 마다, 처리하는 내용을 하단에 테이블로 추가 하여 출력하세요
               login(), login(7780) login(7880,'오길동') login(8000,'이영자','인사')</h2>
				<div onclick="login()">사원정보없음</div>
				<div onclick="login(7780)">사원번호</div>
				<div onclick="login(7880,'오길동')">사원명</div>
				<div onclick="login(8000,'이영자','인사')">부서번호</div>
				
				<table id="third">
				
				</table>
	
	<h2>[1단계:확인] 4. [js] 화살표 함수를 활용하여 사칙연산을 처리 및 출력하세요.</h2>
		<h3>'12'와 '2'의 계산결과</h3>
		<div onclick="this.innerText=plus(12,2)">덧셈</div>
		<div onclick="this.innerText=minus(12,2)">뺄셈</div>
		<div onclick="this.innerText=multiply(12,2)">곱셈</div>
		<div onclick="this.innerText=division(12,2)">나눗셈</div>
		
	
	<h2>[1단계:확인]* 5. [js] 키오스크 메뉴판(3가지)과 동일하게 메뉴가 나오고 +/-에 따라서 갯수가 선택되게 하여 아래에 메뉴내용과 총금액이 나오게 처리하세요.</h2>
		<style>
		input[name="cntplus"]{
			position:absolute;
			left:18%;
			border:1px solid black;
			background :white;
			color : red;
			font-weight:800;
		}
		input[name="cntminus"]{
			position:absolute;
			left:22%;
			border:1px solid black;
			background :white;
			color : red;
			font-weight:800;
		}
		</style>
		
		<h3>돈까스 7000원 <span id="count1"></span>개
			<input type="button" name="cntplus" value="+" onclick="cntplus1()">
			<input type="button" name="cntminus" value="-" onclick="cntminus1()"></h3>
		<h3>라면 5000원 <span id="count2"></span>개
			<input type="button" name="cntplus" value="+" onclick="cntplus2()">
			<input type="button" name="cntminus" value="-" onclick="cntminus2()"></h3>
		<h3>김밥 3000원 <span id="count3"></span>개
			<input type="button" name="cntplus" value="+" onclick="cntplus3()">
			<input type="button" name="cntminus" value="-" onclick="cntminus3()"></h3>
		<input type="button" value="주문하기" onclick="showsum()"/>
		<h2>주문내역</h2>
		<p id="order"></p>
		<div id="fifth"></div>
		
		<h2>정답</h2>
		<!-- 
		1) 화면구성
		2) +/- 에 대한 이벤트 핸들러 함수 선언 과 이벤트 처리
		3) 메뉴내용과 총금액 처리.
		 -->
		 <h2>주문하세요</h2>
		 <style>
		 	span{border:1px solid blue; border-radius:5px; display:inline-block; width:20px;}
		 </style>
		<table>
		<tr><td>짜장면(6000원)<span onclick="cal(0,'+')">+</span> 
							<span onclick="cal(0,'-')"> - </span></td></tr>
		<tr><td>짬뽕(7000원)<span onclick="cal(1,'+')">+</span> 
							<span onclick="cal(1,'-')"> - </span></td></tr>
		<tr><td>탕수육(12000원)<span onclick="cal(2,'+')">+</span> 
							<span onclick="cal(2,'-')"> - </span></td></tr>
		</table>
		<p id="show" align="center"></p>
	
	<h2>[1단계:확인]* 6. [jsp] jsp에서 숫자형 데이터가 요청값이 없더라도 숫자형 데이터가 에러 나지 않게 할려고 한다.
                 아래 화면을 입력값이 없더라도 전송시 에러 발생하지 않게
                첫번째 숫자 : [   ]
                두번째 숫자 : [   ]  [합산]
               1) javascript 단 처리 부분
               2) jsp 처리 부분을 나누어서 처리하세요</h2>
           		
           <%-- <%!
           int chInt(String req){
        		int ret = 0;
        		if(req!=null){
        			try{
        			ret = Integer.parseInt(req);
        			}catch(Exception e){
        				log("에러발생:"+e.getMessage());
        			}
        		}
        		return ret;
        	}
           %>
    		<form>
               <h2>첫번째 숫자: <input type="text" name="num01"/></h2>
               <h2>두번째 숫자: <input type="text" name="num02"/></h2>
               <input type="submit" value="합산" />
            </form>
          	<% 
			int num01 = chInt(request.getParameter("num01"));
			int num02 = chInt(request.getParameter("num02"));
			int plusTot = num01+num02;
			%>
			<h3>합산: <%=plusTot %></h3> --%>
			<%
			   String num01S = request.getParameter("num01");
			   String num02S = request.getParameter("num02");
			   int num01 = 0; int num02 = 0; int sum = 0; 
			   boolean isValid1 = false;
			   boolean isValid2 = false;
			   if(num01S!=null&&!num01S.equals("")){ //초기화면이 아니고 요청값을 입력했을 때,
			      try{
			         num01 = Integer.parseInt(num01S);//형변환 처리
			      }catch(Exception e){} //숫자형태 데이터가 아닐 떄, 0으로 처리
			      isValid1=true;
			   }
			   if(num02S!=null&&!num02S.equals("")){ //초기화면이 아니고 요청값을 입력했을 때,
			      try{
			         num02 = Integer.parseInt(num02S);//형변환 처리
			      }catch(Exception e){} //숫자형태 데이터가 아닐 떄, 0으로 처리
			      isValid2=true;
			   }
			%>

			<h2>정답</h2>
			  <form>
			      첫번째 숫자:<input type="text" name="num01"/><br>
			      두번째 숫자:<input type="text" name="num02"/><br>
			      <input type=button" onclick="calPlus()" value="합산"/><br>
			      <%=isValid1&&isValid2? num01+"+"+num02+"="+(num01+num02):"" %>
			  </form>
			  
	<h2>[1단계:확인]* 7. [jsp] script의 declare를 활용하여, 입력값이 70이상 일때, 
			합격 그외 불합격 처리하는 기는 메서드를 선언하고, expression으로 호출하여 처리하세요.</h2>
	     <%!
           int chInt2(String req){
        		int ret = 0;
        		if(req!=null){
        			try{
        			ret = Integer.parseInt(req);
        			}catch(Exception e){
        				log("에러발생:"+e.getMessage());
        			}
        		}
        		return ret;
        	}
           %>
		<form>
		입력값: <input type="text" name="score"/>
		<input type="submit" value="점수입력"/>
		</form>
		
		<%
		int scoreInt = chInt2(request.getParameter("score"));
		String pass = null;
		if(scoreInt>=70){
			pass = "합격";
			
		}else{
			pass = "불합격";
		} 
		%>
		<h2>합격여부:<%=pass %></h2>
		<h2>정답</h2>
		<%!
			String chPass(String pt){
				String re = "";
				if(pt!=null && pt.trim().equals("")){
					try{
						int point = Integer.parseInt(pt);
						if(point>=70){
							re="결과:합격";
						}else{
							re="결과:불합격";
						}
					}catch(Exception e){
						re = "입력데이터이상(입력, 숫자형)";
					}
				}
				return re;
			}
		%>
		<%
			String pt = request.getParameter("pt");
		%>
		<form>
			점수 : <input type="text" nmae="pt" />
			<input type="submit" />
		</form>
		<h3><%=chPass(pt) %></h3>
</body>
<script type="text/javascript">
	var first = document.querySelector("#first")
	function buy(){
		if(arguments.length==0){
			first.innerHTML="구매없음<br>"
		}else{
			var add = ""
			for(var idx in arguments){
				add += arguments[idx]+" "
			}
			first.innerHTML+=add+"<br>"
		}
	}
	var second = document.querySelector("#second")
	function product(){
		if(arguments.length==0){
			second.innerHTML="상품정보없음"
		}else{
			var addpro = ""
			for(var idx in arguments){
				addpro += arguments[idx]+" "
			}
			second.innerHTML+=addpro+"<br>"
		}
	}
	var third = document.querySelector("#third")
		third.innerHTML+="<tr><th>사원번호</th><th>사원명</th><th>부서번호</th></tr>"
	
	function login(empno="입력없음", ename="입력없음",deptno="무명"){	
			third.innerHTML+="<tr><td>"+empno+"</td><td>"+ename+"</td>"+"<td>"+deptno+"</td></tr>"
	}
		
	 const plus = (num01, num02) => num01+num02
	 const minus = (num01, num02) => num01-num02
	 const multiply = (num01, num02) => num01*num02
	 const division = (num01, num02) => num01/num02
	 
	var order = document.querySelector("#order");	
	var fifth = document.querySelector("#fifth")
	var cnt1 = 0;
	var cnt2 = 0;
	var cnt3 = 0;
	var sum1 = 0;
	var sum2 = 0;
	var sum3 = 0;
	var cntresult1 = 0;
	var cntresult2 = 0;
	var cntresult3 = 0;
	
	function cntplus1(){
		cnt1++;
		showcnt1();
	}
	function cntminus1(){
		cnt1--;
		showcnt1();
		
	}
	function cntplus2(){
		cnt2++;
		showcnt2();
	}
	function cntminus2(){
		cnt2--;
		showcnt2();
	}
	function cntplus3(){
		cnt3++;
		showcnt3();
	}
	function cntminus3(){
		cnt3--;
		showcnt3();
	}
	function showcnt1(){
		var count1 = document.querySelector("#count1");
		for(let cnt=1;cnt<=cnt1;cnt++){
			count1.innerText = cnt1;
			sum1 = cnt1*7000
			cntresult1 = cnt1
		}
	}
	function showcnt2(){
		var count2 = document.querySelector("#count2");
		for(let cnt=1;cnt<=cnt2;cnt++){
			count2.innerText = cnt2;
			sum2 = cnt2 *5000
			cntresult2 = cnt2
			
		}
	}
	function showcnt3(){
		var count3 = document.querySelector("#count3");
		for(let cnt=1;cnt<=cnt3;cnt++){
			count3.innerText = cnt3;
			sum3 = cnt3 *3000
			cntresult3 = cnt3
			
		}
	}
	
	 function showsum(){
		order.innerHTML = "음식명 : 돈까스, 가격:7000, 갯수:"+cntresult1+"<br>"
		order.innerHTML += "음식명 : 라면, 가격:5000, 갯수:"+cntresult2+"<br>"
		order.innerHTML += "음식명 : 김밥, 가격:3000, 갯수:"+cntresult3+"<br>"
		fifth.innerHTML = "총합계:"+(sum1+sum2+sum3)
	 }
</script>
</html>