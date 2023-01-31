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
[2단계:확인] 2. 오늘 처리한 회원관리 화면에서 회원등록 처리를 다이얼로그 박스를 활용해 처리 해보세요.
	1) DB 처리
		- sql insert into member200 values('goodman','9999','정수라','normal',3000);
		- vo 확인
		- mybatis 공통 점검 member
		- dao public void insertMember(Member ins);
		- mapper
			<insert id="insertMember" parameterType="member">
				INSERT INTO member200 values(#{id},#{pass},#{name},#{auth},#{point})
		- service 호출.
	2) view 처리
		- 등록 버튼 추가 - 모달창 로딩 (form데이터에 데이터가 없어야 함)
		- 모달창 안에 form데이터
			타이틀 : 회원등록, ps) 상세화면에서 회원상세정보로 처리
			form데이터에 데이터가 없어야 함.
			버튼 : 등록버튼/닫기 ps) 상세화면에서는 수정/삭제버튼만 있게 처리.
			모달창안에 등록 버튼 클릭 시, 
				입력여부 및 유효성 처리.. 권한 추가시를 위해 고려?
				$("#frm02 [name=proc]").val("ins");
				$("#frm02").attr("action","${path}/insertMember.do")
	
	3) controller 처리
		- @PostMapping("insertMember.do")
		public String insertMember(Member ins, Model d){
			service.insertMember(ins);
			d.addAttribute("mem", service.getMember(ins.getId());
			return "";
		}
	4) view단
		if(proc=="ins"){
			alert("등록완료");
			//if(confirm("등록완료\n조회화면으로 이동하시겠습니까?"))
			//	location.href="${path}/memberList.do"		
		}
	
[1단계:확인] 6. select * from emp으로 데이터 처리(dao,mapper에 추가)하여 json view로 출력하세요.
	vo Emp
	dao public List<Emp> getEmpAll();
	mapper
		<select id="getEmpAll" resultType="emp">
			select * from emp100
		</select>
		
	service 호출
	
	controller
		@RequestMapping("/getEmpAll.do")
		public String getEmpAll(Model d){
			d.addAttribute("empList", service,getEmpAll()");
			return "pageJsonReport";
		}
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
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

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