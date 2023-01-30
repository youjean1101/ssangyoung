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
		//alert("${sch.deptno},${sch.mgr},${sch.job}")
		$("[name=deptno]").val("${sch.deptno}");
		$("[name=mgr]").val("${sch.mgr}");
		$("[name=job]").val("${sch.job}");	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >사원정보(spring MVC)</h2>

</div><!-- // deptCom, mgrCom jobCom -->
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="ename" value="${sch.ename}" class="form-control mr-sm-2" placeholder="사원명입력" />
	    <select name="deptno" class="form-control mr-sm-2">
	    	<option value="0">부서선택</option>
	    	<c:forEach var="d" items="${deptCom}">
	    	<option value="${d.deptno}">${d.dname}</option>
	    	</c:forEach>
	    </select>
	    <select name="mgr" class="form-control mr-sm-2">
	    	<option value="0">관리자선택</option>
	    	<c:forEach var="m" items="${mgrCom}">
	    	<option value="${m.key}">${m.val}</option>
	    	</c:forEach>
	    </select>	    
	    <select name="job" class="form-control mr-sm-2">
	    	<option value="">직책선택</option>
	    	<c:forEach var="job" items="${jobCom}">
	    	<option>${job}</option>
	    	</c:forEach>
	    </select>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
    <thead>
    
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>부서명</th>
        <th>관리자명</th>
        <th>직책명</th>
      </tr>
    </thead>
    <!-- 
    사원번호 사원명 부서명 관리자명 직책명 
     -->	
    <tbody>
    	<c:forEach var="emp" items="${empList}">
    	<tr><td>${emp.empno}</td><td>${emp.ename}</td>
    		<td>${emp.dname}</td>
    		<td>${emp.mename}</td>
    		<td>${emp.job}</td>
    		
    		</tr>
    	</c:forEach>
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