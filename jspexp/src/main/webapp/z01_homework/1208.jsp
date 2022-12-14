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
	<h2>[1단계:확인]* 2. 회원아이디를 입력하고 옆에 유효 CHECK 버튼을 클릭시,
               글자수가 8~16이고, himan가 아닐 때만 유효여부 checkbox표기하고, readOnly 속성으로 설정하세요.
               회원아이디 [    ] [유효check]  []유효여부</h2>
    회원아이디:<input type="text" name="id" size="2"/>
    <input type="button" value="유효check" onclick="chbox()" />
    <input type="checkbox" name="checks" value="[]유효여부"/>유효여부

    <script>
    function chbox(obj){
    	var id=document.querySelector("[name=id]")
    	var checks=document.querySelector("[name=checks]")
    	
    		if(id.value.length>=8&&id.value.length<=16&&id.value!="himan"){
    			checks.checked=true
    			if(id.readOnly){
    				id.readOnly=false
    			}else{
    				id.readOnly=true
    			}
    		}
   	 }
    </script>
    <hr>
    <h2>정답</h2>
    <h2>회원 아이디 유효성 check</h2>
    회원아이디:<input type="text" name="id2" />
    <input type="button" value="유효check" onclick="ckValid(this)"/>
    <input type="checkbox" id="isValid" />유효여부
    <script type="text/javascript">
    	var idOb = document.querySelector("[name=id2]")
    	var ckValOb = document.querySelector("#isValid")
    	function ckValid(obj){
    		if(obj.value=="유효check"){
	    		var len = idOb.value.length
	    		if(len>=8 && len<=16 && idOb.value!='himan'){
	    			ckValOb.checked = true
	    			idOb.readOnly = true
	    			obj.value="아이디재입력"
	    			// 실무적으로 입력내용과 패턴만 유효성 check 하고
	    			// 데이터에 대한 확인은 ajax(비동기적으로 서버 접근) 처리하세요.
	    			// 유효 여부를 확인한다.
    			}
    		}else{
    			ckValOb.checked = false
    			idOb.readOnly = false
    			idOb.value="";idOb.focus()
    			obj.value="유효check"
    		}
    	}
    </script>
    
    <hr>
    
	<h2>[1단계:확인] 4. checkbox와 월드컵 출전팀을 리스트하고, check 후, 16강진출 버튼 클릭시, 선택된 팀만 하단에 리스트하게 하세요.</h2>
	<ol type="A">
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="네덜란드"/>네덜란드
				<li><input type="checkbox" name="country" value="세네갈"/>세네갈
				<li><input type="checkbox" name="country" value="에콰도르"/>에콰도르
				<li><input type="checkbox" name="country" value="카타르"/>카타르
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="잉글랜드"/>잉글랜드
				<li><input type="checkbox" name="country" value="미국"/>미국
				<li><input type="checkbox" name="country" value="이란"/>이란
				<li><input type="checkbox" name="country" value="웨일스"/>웨일스
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="아르헨티나"/>아르헨티나
				<li><input type="checkbox" name="country" value="폴란드"/>폴란드
				<li><input type="checkbox" name="country" value="멕시코"/>멕시코
				<li><input type="checkbox" name="country" value="사우디아라비아"/>사우디아라비아
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="프랑스"/>프랑스
				<li><input type="checkbox" name="country" value="호주"/>호주
				<li><input type="checkbox" name="country" value="튀니지"/>튀니지
				<li><input type="checkbox" name="country" value="덴마크"/>덴마크
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="일본"/>일본
				<li><input type="checkbox" name="country" value="스페인"/>스페인
				<li><input type="checkbox" name="country" value="독일"/>독일
				<li><input type="checkbox" name="country" value="코스트리카"/>코스트리카
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="모로코"/>모로코
				<li><input type="checkbox" name="country" value="크로아티아"/>크로아티아
				<li><input type="checkbox" name="country" value="벨기에"/>벨기에
				<li><input type="checkbox" name="country" value="캐나다"/>캐나다
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="브라질"/>브라질
				<li><input type="checkbox" name="country" value="스위스"/>스위스
				<li><input type="checkbox" name="country" value="카메룬"/>카메룬
				<li><input type="checkbox" name="country" value="세르비아"/>세르비아
			</ul>
		<li>조
			<ul>
				<li><input type="checkbox" name="country" value="포루투갈"/>포루투갈
				<li><input type="checkbox" name="country" value="대한민국"/>대한민국
				<li><input type="checkbox" name="country" value="우루과이"/>우루과이
				<li><input type="checkbox" name="country" value="가나"/>가나
			</ul>
	</ol>
	<input type="button" value="16강진출" onclick="up()"/>
	<h3>16강 진출나라 : <span id="ex4"></span></h3>
	<script>
		var ex4 = document.querySelector("#ex4")
		var country = document.querySelectorAll("[name=country]")
		var show=""
		function up(){
			for(var idx=0;idx<country.length;idx++){
	 			if(country[idx].checked){
	 				show += country[idx].value+","
	 			}
	 		}
			ex4.innerText += show
		}
	</script>
	
	<h2>[1단계:확인] 5. radio를 이용해서 현재 해결해야 할 문제(3가지) 중에 가장 중요한 것을 클릭시, 하단에 표현되게 하세요.</h2>
		
		<input type="radio" name="do" value="오늘과제" />오늘과제
		<input type="radio" name="do" value="내일발표자료제출" />내일발표자료제출
		<input type="radio" name="do" value="발표준비" />발표준비
		<div id="container" ></div>
		
		<script type="text/javascript">
			var vdo = document.querySelectorAll("[name=do]")
			var con = document.querySelector("#container")
			
			for(var idx=0;idx<vdo.length;idx++){
				vdo[idx].onclick=function(){
					var ck = ""
					if(this.checked){
						ck=this.value
					}
					con.innerText=ck
				}
			}
		</script>
	
	<h2>[1단계:확인]* 6. 물건명, 가격select(1000단위~9000), 갯수(select 1~9) 가격나 갯수를 선택시, 하단에 구매한 물건과 총비용을 출력되게 하세요</h2>
	물건명:<input type="text" name="pname" onchange="pnamefun(this)"/>
	가격: <select name="price" onchange="pricefun(this)">
			<%for(int idx=1000;idx<=9000;idx+=1000){ %>
			<option><%=idx %></option>
			<%} %>
		 </select>	
	갯수 : <select name="cnt" onchange="cntfun(this)">
			<%for(int idx=1;idx<=9;idx++){ %>
			<option><%=idx %></option>
			<%} %>
		 </select>	
		 <h3>물건정보- <span id="ex6"></span></h3>
	<script>
		var ex6 = document.querySelector("#ex6")
		var pname = ""
		var price = "0"
		var cnt = "0"
		
		function pnamefun(obj){
			pname=obj.value;
			tot();
		}
		
		function pricefun(obj){
			price=obj.value;
			tot();
		}
		
		function cntfun(obj){
			cnt=obj.value;
			tot();
		}
		function tot(){
			ex6.innerHTML = "물건명 : "+pname
			ex6.innerHTML += "/가격 :  "+price
			ex6.innerHTML += "/갯수 : "+cnt
			ex6.innerHTML += "/총가격 : "+(price*cnt)
		}
	</script>
	<hr>
	<h2>정답</h2>
	<h2>구매</h2>
	물건명:<input type="text" name="pname2" />
	가격:<select  name="price2" onchange="cal()"></select>
	갯수:<select  name="cnt2" onchange="cal()"/></select>
	<h3 id="shwBuy"></h3>
	<script>
	var pnameOb = document.querySelector("[name=pname2]")
	var priceOb = document.querySelector("[name=price2]")
	var cntOb = document.querySelector("[name=cnt2]")
	var shwBuyOb = document.querySelector("#shwBuy")
	var add1=""
	var add2=""
	for(var cnt=1;cnt<=9;cnt++){
		add1+="<option>"+cnt*1000+"</option>"
		add2+="<option>"+cnt+"</option>"
	} 
	priceOb.innerHTML = add1;
	cntOb.innerHTML = add2;
	function cal(){ // 주의 : 반드시 선택할 당시 value를 가져오게 처리
		var tot=priceOb.value*cntOb.value
		shwBuyOb.innerText="구매물건: "+pnameOb.value+", 총비용:"+tot
	}
	</script>
	<hr>
	
	<h2>[1단계:확인]* 8. Emp Vo로 세션을 설정하고, 세션이 없을 때, 세션설정하는 페이지로 이동하게 하되, 세션 확인하는 페이지에서
                   10/20/30/40  테이블 리스트에서 클릭시, 해당 부서만 접근가능 alert() 그 외는 접근 불가능 alert()로딩되게 처리하세요.</h2>
	<%
	Emp e = new Emp("홍길동",2500,10);
	session.setAttribute("emp",e);
	%>
	<h2>세션 생성 완료</h2>
	<h3 id="ex8">세션 확인하러 갑시다.</h3>
	<script type="text/javascript">
		var ex8 = document.querySelector("#ex8");
		ex8.onclick=function(){
			location.href="1208_sessionshow.jsp"
		}
	</script>
	<h3>정답</h3>
	<%--
		1) 세션 처리 페이지 및 리스트 페이지 이동(ex) 로그인 후, 세션 설정 후 리스트 페이지)
		z43_makeSession.jsp
		2) 1208.jsp
			- 세션가져오기(
			- 현재 페이지에서 테이블 리스트 출력
				메뉴 리스트를 클릭 시, 지정된 메뉴의 권한 내용과 세션에 있는 권한과 비교하여 같으면 접근,
				다르면 접근 불가능 경고창 처리
	--%>
	
	<%
	Emp emp = (Emp)session.getAttribute("emp");
	boolean hasSess = emp!=null; // null이 아니면 true
	// 세션이 있을 때만 메서드 호출, 없을 때는 0으로 할당.
	// js 코드로 넘겨서 메뉴 check시 활용..
	int deptno = hasSess?emp.getDeptno():0;
	
	List<Dept> dlist = new ArrayList<Dept>();
	dlist.add(new Dept(10,"인사",""));
	dlist.add(new Dept(20,"회계",""));
	dlist.add(new Dept(30,"네트웤",""));
	dlist.add(new Dept(40,"총무",""));
	%>
	<table>
		<tr><th>부서리스트</th></tr>
		<%for(Dept d:dlist){ %>
		<tr><td onclick="ckAuth('<%=d.getDeptno()%>')"><%=d.getDname() %></td></tr>
		<%} %>
	</table>
	
</body>
<script type="text/javascript">
var hasSess = <%=hasSess%>
if(!hasSess){
	alert("세션이 없습니다. \n세션 설정 페이지로 이동하겠습니다.")
	location.href="z43_makeSession.jsp"
}

var sesNo = <%=deptno%> //주의 세션이 없으면 sesNo=
function ckAuth(deptno){
	// 세션에 있는 deptno와 부서리스트에서 전달하는 deptno가 같을 때는 
	// 권한이 있기 때문에 이동 가능
	if(sesNo==deptno){ //< %=emp.getEmpno %>100퍼에러
		alert("권한이 있습니다. 이동 성공")
	}else{
		alert("메뉴사용권한이 없습니다.")
	}
	
}

/*
 z43_makeSession.jsp
 	<h2>세션 설정</h2>
*/

</script>
</html>