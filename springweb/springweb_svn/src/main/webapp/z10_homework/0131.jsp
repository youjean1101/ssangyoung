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
<%-- 
[1단계:확인] 2. 사원 아이디로 사원 정보를 json데이터로 로딩을 위한 DB및 controller단 get방식 처리를 하세요
			1) sql
			2) vo확인
			3) mybatis공통 vo
			4) dao
			5) mapper
			6) service
			===========
			7) controller
			
[1단계:확인] 3. salgrade 테이블을 ajax로 로딩된 데이터를 출력하고, 행별 등급을 클릭시, 등급상세화면이 ajax로 로딩되게 처리하세요.
	sql
		select * from salgrade
		select * from salgrade where grade = #{grade}
	vo Salgrade
	공통my salgrade, SalMapper.xml
	dao 
		public List<Salgrade> getSalList();
		public Salgrade getSalgrade(int grade);
	mapper
		<select id="getSalList" resultType="salgrade">
			select * from salgrade
		<select id="getSalList" parameterType="int" resultType="salgrade">
			select * from salgrade where grade = #{grade}
	service
	controller
		/salgradeInit.do
		/salgradeList.do
		/salgrade.do
	view a05_salgradeList.jsp
	
	search()
	function search(){
		$.ajax({
			url:"${path}/salgradeList.do",
			type:"post",
			dataType:"json",
			success:function(data){
				var slist = data.slist
				var show =""
				$(slist).each(function(idx,sal){
					show +="<tr onclick='goPage("+sal.grade+")'>"
					show +="<td>"+sal.grade+"</td>"
					show +="<td>"+sal.hisal+"</td>"
					show +="<td>"+sal.losal+"</td>"
					show +="</tr>"
				})
				$("table tbody").html(show)
			}
		})
	}
	function goPage(grade){
		$("#modal01").click()
		$.ajax({
			url:"${path}/salgrade.do",
			type:"get",
			data:"grade="+grade,
			dataType:"json",
			success:function(data){
				var sal = data.sal
				$("#frm02 [name=grade]").val(sal.grade);
				$("#frm02 [name=hisal]").val(sal.hisal);
				$("#frm02 [name=losal]").val(sal.losal);
			}
		})
	}
	
[1단계:확인] 4. 부서 상세화면에서 ajax로 부서정보를 수정/삭제 처리하세요.
	1) DB처리
		sql 
			update dept100
				set dname=#{ename},
					loc=#{loc}
			where deptno=#{deptno}
			
			delete
			from dept100
			where deptno=#{deptno}
			
		vo Dept
		공통	dept
		dao
			public void updateDept(Dept upt);
			public void deleteDept(int deptno);
			
		service
		controller
			/updateDept.do
			/deleteDept.do
		정리 및 구현
		
	2) 화면구현
		다이얼로그 화면에 
			수정
			삭제버튼 추가
		$("#uptBtn").click(function(){
			// 유효성 check..
			$.ajax({
				url:"${path}/updateDept.do",
				type:"get",
				data:$("#frm02").serialize()
				dataType:"json",
				success:function(data){
					var dept = data.dept
					if(dept!=null){
						alert("수정완료");
					}
					// 리스트 데이터 update
					var dlist = data.dlist
				}
			})
		})
		$("#delBtn").click(function(){
			$.ajax({
				url:"${path}/deleteDept.do",
				type:"get",
				data:$("#frm02").serialize()
				dataType:"json",
				success:function(data){
						alert("수정완료");
					}
					// 리스트 데이터 update
					var dlist = data.dldist
				}
			})
		})

[1단계:확인] 6. vue의 MVVM패턴을 이용하여 모델로 선언한 name, age, loc를 통해서 화면에 이름 나이 사는 곳에 출력되게하세요.
	
--%>
		//2. 모델
		var model = {name:"홍길동", age:25, loc:"서울"}
		//3. 뷰모델
		var vm = new Vue({
			el:"#show",	// view범위 선언
			data:model	// 모델데이터 선언
		})
	});
</script>
</head>

<body>
<!-- 1. view -->
<div id="show" class="jumbotron text-center">
	<h1>이름:{{name}}</h1>
	<h1>나이:{{age}}</h1>
	<h1>사는곳:{{loc}}</h1>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
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