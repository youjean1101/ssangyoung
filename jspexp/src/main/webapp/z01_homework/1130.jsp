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
<div id="container" ></div>
	<h2>
	[1단계:확인] 2. [js] Math.random(), parseInt()를 이용해서 학생 10명의 국어점수를 임의로 발생하여 배열 할당하여 테이블로 출력하세요.</h2>
	<h3 id="ex2"></h3>
	<script>
	var show = "<h2>학생10명의 국어점수</h2>"
	show+="<table><tr><th>학생번호</th><th>국어점수</th></tr>"
	var korArr = []
	for(var idx=0;idx<10;idx++){
		korArr.push(parseInt(Math.random()*100+1));
		show+="<tr><td>"+(idx+1)+"</td><td>"+korArr[idx]+"</td></tr>"
	}
	show+="</table>"
	document.querySelector("#ex2").innerHTML =show
	</script>

	<h2>[1단계:확인]* 3. [js] 위 2번 문제를 기능메서드를 활용하여 1~3등을 출력하세요.</h2>
	<h3 id="ex3"></h3>
	<script>
	var korRankArr=[]
	for(var idx=0;idx<10;idx++){
		var stu=[]
		stu.no=idx
		stu.kor=parseInt(Math.random()*101+1)
		korRankArr.push(stu)
	}
	korRankArr.sort(function(left,right){
		return right.kor-left.kor;
	})
	var show2 = "<h2>학생10명의 국어점수(1~3등)</h2>"
	show2+="<table><tr><th>학생번호</th><th>국어점수</th></tr>"
	for(var idx=0;idx<2;idx++){
		korRankArr.forEach(function(stu){
			show2+="<tr><td>"+stu.no+"</td><td>"+stu.kor+"</td></tr>"
		})
	}
	show2+="</table>"
	show2 += "<h3>"+korArr.slice(0,3)+"</h3>"
	document.querySelector("#ex3").innerHTML += show2
	</script>
	
	<h2>정답</h2>
	<h3 id="answer3"></h3>
	<script>
	var kors = []
	for(var cnt=1;cnt<=10;cnt++){
		kors.push(parseInt(Math.random()*101))
	} 
	var con = document.querySelector("#answer3")
	con.innerHTML = kors+"<br>"
	kors.sort(function(left, right){
		return right-left; //내림차순 sorting 처리
	})
	var rank3 = kors.slice(0,3)
	con.innerHTML = rank3+"<br>"
	</script>
	
	<h2>[1단계:확인]* 4. [js] 위 2번 문제를 메서드를 활용하여 최대점수와 최저점수를 삭제처리하고 출력하세요.</h2>
	<h3 id="ex4"></h3>
	<script>
		korRankArr.forEach(function(stu){
		show2+="<tr><td>"+stu.no+"</td><td>"+stu.kor+"</td></tr>"
		})
		var show3 = "<h2>["
			
		korRankArr.forEach(function(stu){
			stu.slice(0,3)
			show3+="학생번호: "+stu.no+" 학생국어점수: "+stu.kor+"<br>"
		})
		show3+="]</h2>"
		document.querySelector("#ex4").innerHTML += show3
	</script>
	
	<h2>정답</h2>
	<h3 id="answer4"></h3>
	<!-- 정답 
	내림차순 정렬 후에는
	최대 점수는 첫번째 데이터 : splice(0,1) - 첫번째 위치에 있는 데이터 삭제 처리
	최저 점수는 마지막 데이터 : pop() - 마지막 데이터 삭제
	-->
	<script>
	kors.splice(0,1); kors.pop()
	document.querySelector("#answer4").innerHTML += kors+"<br>"
	</script>
	
	
	<h2>
	[3단계:확인]* 5. [js] 영어점수 10명을 초기화면에 테이블로 만들고 기능버튼에 따라 처리한 테이블 내용을 출력하세요
               [임의점수생성][내림차순][오름차순][상위Rank3]</h2>
      <!-- 정답 
     1) 영어점수 10명 임의 점수 배열 만들기
     2) DOM 테이블에 출력하기
     3) 기능 버튼을 핸들러 함수를 통해 호출해서 출력처리 하기
    -->
    <h2>정답</h2>
	
	<table id="tab01">
		<col width="30%">
    	<thead><tr><th>no</th><th>점수</th></tr></thead>
    	<tbody></tbody>
    </table>
    <input type="button" value="임의점수생성" onclick="funRandom()" />
    <input type="button" value="내림차순" onclick="funDesc()" />
    <input type="button" value="오름차순" onclick="funAsc()" />
    <input type="button" value="Rank3" onclick="funRank3()" />
 
    <script> 
    // 임의의 영어 점수 할당.
    var engs = []
    var tab01 = document.querySelector("#tab01 tbody")
    funRandom(); // 초기에 로딩을 위해 처리
    function show(){
    	var addHTML=""
    		engs.forEach(function(eng,idx){
    	    	addHTML+="<tr><td>"+(idx+1)+"</td><td>"+eng+"</td></tr>"
   	    })
   	    tab01.innerHTML = addHTML
    }
    
    // ex) Rank3데이터 처리(정렬과 추출)
    function funRank3() {
    	engs.sort(function(left,right){
    		return right-left;
    	})
    	
    	engs = engs.splice(0,3);
    	show();
    }
    
    // ex) 오름차순 처리하는 함수 정의하고 기능 처리..
    function funAsc(){
    	engs.sort(function(left,right){
    		return left-right;
    	})
    	show();
    }
    
    function funDesc(){
    	engs.sort(function(left,right){
    		return right-left;
    	})
    	show();
    }
    
    funRandom(); // 초기에 로딩을 위해 처리
    function funRandom(){
    	engs = []
	    for(var cnt=1;cnt<=10;cnt++){
	    	engs.push(parseInt(Math.random()*101))
	    }
    	show();
    }
    
    </script>

	<h2>[1단계:확인]* 7. [js] 월드컵 선수(나라,이름,골,도움)를 3명을 배열로 설정한 후, 초기 화면을 테이블로 출력하고,
                   골기준으로 내림차순 정렬처리하는 화면을 처리하세요.</h2>
    <!-- 정답 -->
    
	<h2>[1단계:개념]* 8. [js] 특정 조의 팀속성(국가, 승점)를 배열로 등록한 후(승점은 임의로 입력), 승점기준으로 내림차순으로 테이블로 출력하세요.
	</h2>
	<h2>정답</h2>
	<!-- 정답 -->
	
	
	<h2>[3단계:개념] 8. [js] 특정 조를 데이터로 넣고, 팀속성(국가,승,무,패,골득실,승점)을 기준으로 테이블로 출력한 후, 테이블 상단항목을 클릭시, 해당 내용의 내림차순으로 정렬되게 하세요.</h2>
	<!-- 정답 -->
	<h2>정답</h2>
	<table id="tab02">
		<thead><tr><th>국가</th><th onclick="ord('win')">승</th>
		<th onclick="ord('eq')">무</th>
		<th onclick="ord('def')">패</th>
		<th onclick="ord('gd')">GD</th>
		<th onclick="ord('pt')">승점</th></tr></thead>
		<tbody></tbody>
	</table>
	<script>
	function Team(nat,win,eq,def,gd,pt){
		this.nat = nat
		this.win = win
		this.eq = eq
		this.def = def
		this.gd = gd
		this.pt = pt
		this.prn = function(){
			return "<tr><td>"+this.nat+"</td><td>"+this.win+"</td><td>"
			+this.eq+"</td><td>"+this.def+"</td><td>"+this.gd+"</td><td>"+this.pt+"</td>"
		}
	}
	var grpA = []
	grpA.push(new Team("네덜란드",2,1,0,4,7))
	grpA.push(new Team("세네갈",2,0,1,1,6))
	grpA.push(new Team("에콰도르",1,1,1,1,4))
	grpA.push(new Team("카타르",0,0,3,-6,0))
	
	var tb02 = document.querySelector("#tab02 tbody")
	function ord(pro){
	grpA.sort(function(left,right){
		// js에서 객체 속성 객체명.속성, 객체명[속성] : 문자열과 변수명 구별 right.변수명
			return right[pro] - left[pro];
		})
		show2() 
	} // ▲ ▼
	show2()
	function show2(){
		var addHTML = ""
		grpA.forEach(function(team){
			addHTML += team.prn()
		})
		tb02.innerHTML = addHTML
	}
	</script>
	
	
</body>
<script type="text/javascript">

var div = document.querySelector("#container")
div.innerHTML=""
</script>
</html>