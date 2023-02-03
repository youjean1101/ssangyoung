<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
2023-02-02
[1단계:개념] 1. 양방향 디렉티브의 기본처리형식을 기술하세요.
[1단계:확인] 2. 양방향 디렉티브를 활용하여 타석과 안타를 입력하여 타율이 출력되게 하세요
[2단계:확인] 3. 양방향 디렉티브를 활용하여 임의의 구구단 문제의 정답을 입력했을 때, 정답인지 여부를 출력되게 하세요
               5 X 7 = [정답입력]  정답/오답
[1단계:확인]* 4. v-if 조건문을 활용하여 입력한 아이디와 패스워드가 맞으면 로그인성공/로그인실패/아이디와패스워드를 입력하세요로
               구분하여 출력하세요.
           1) 모델 데이터 선언
           2) UI화면 구성
           3) 디렉티브 선언(양방향/단방향 선언)
           4) 조건문 디렉티브 
           
[1단계:개념] 5. v-if와 v-show의 차이점을 기술하세요.
[1단계:확인] 6. v-for의 객체단위 사용을 이용하여 모델명으로 컴퓨터(com01), 모델객체로 제조사, 가격, CPU사양으로 속성으로 설정하여
               테이블에 속성 : 속성값 형식으로 출력하세요.
[1단계:확인] 7. v-for와 단일형태 배열 데이터(2호선 지역철역명)을 선언하고, ol의 리스트로 출력하세요.
[1단계:확인] 8. v-for와 객체형 배열데이터(프리미어리그팀-팀명,승,무,패,승점)을 선언하고, 테이블로 출력하세요.

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{id:"",pass:""}
		})
	});
</script>
</head>

<body>
<div class="container">

	<div class="jumbotron text-center">
	  <!-- <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2> 
	  로그인성공/로그인실패/아이디와패스워드를 입력하세요로
	  -->
		<h2>로그인</h2>
		<h3 v-if="id=='himan' && pass=='7777'">로그인성공</h3>
		<h3 v-else-if="id=='' || pass==''">아이디와패스워드를 입력하세요</h3>
		<h3 v-else>로그인 실패</h3>
	</div>
	
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input v-model="id" class="form-control mr-sm-2" placeholder="아이디입력" />
	    <input v-model="pass" class="form-control mr-sm-2" placeholder="패스워드입력" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>