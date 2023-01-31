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
		function search(){
		$.ajax({
			url:"${path}/deptAjax.do",
			type:"post",
			data:$("#frm01").serialize(),
			dataType:"json",
			success:function(data){
				var dlist = data.dlist
				var show=""
				$(dlist).each(function(idx,dept){
					console.log(dept)
					show+="<tr ondblclick='goPage("+dept.deptno+")'>"
					show+="<td>"+dept.deptno+"</td>"
					show+="<td>"+dept.dname+"</td>"
					show+="<td>"+dept.loc+"</td>"
					show+="</tr>"
				})		
				console.log(show)
				$("#dataTab tbody").html(show)
			},
			error:function(err){
				console.log(err)
			}
		})		
	}
	function goPage(deptno){
		$.ajax({
			url:"${path}/getDept.do",
			type:"get",
			data:"deptno="+deptno,
			dataType:"json",
			success:function(data){
				var dept=data.dept
				$("#modal01").click() // 모달 로딩
				$("#frm02 [name=deptno]").val(dept.deptno)
				$("#frm02 [name=dname]").val(dept.dname)
				$("#frm02 [name=loc]").val(dept.loc)
			},
			error:function(err){
				console.log(err)
			}
			
		})
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
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
    <thead>
      <tr class="table-success text-center">
        <th>등급</th>
        <th>시작급여</th>
        <th>까지</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="salgrade" items="${salgradeList}">
    	<tr><td>${salgrade.grade}</td>
    		<td>${salgrade.losal}</td>
    		<td>${salgrade.hisal}</td></tr>
    	</c:forEach>
    </tbody>
	</table>    
    
</div>
<p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" ></p>
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