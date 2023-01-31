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
		$("#schBtn").click(function(){
			search();
		});
	});
	function search(){
		$.ajax({
			url:"${path}/salgradeAjax.do",
			type:"post",
			data:$("#frm01").serialize(),
			dataType:"json",
			success:function(data){
				var slist = data.slist
				var show=""
				$(slist).each(function(idx,salgrade){
					console.log(salgrade)
					show+="<tr ondblclick='goPage("+salgrade.grade+")'>"
					show+="<td>"+salgrade.grade+"</td>"
					show+="<td>"+salgrade.losal+"</td>"
					show+="<td>"+salgrade.hisal+"</td>"
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
	function goPage(grade){
		console.log(grade)
		$.ajax({
			url:"${path}/getSalgradeSearch.do",
			type:"get",
			data:"grade="+grade,
			dataType:"json",
			success:function(data){
				var salgrade=data.salgrade
				$("#modal01").click() // 모달 로딩
				$("#frm02 [name=grade]").val(salgrade.grade)
				$("#frm02 [name=losal]").val(salgrade.losal)
				$("#frm02 [name=hisal]").val(salgrade.hisal)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">급여등급정보</h2>

</div>
<div class="container">
	<form id="frm01" onSubmit="return false;" class="form"  method="post"> 
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	     <button id="schBtn" class="btn btn-info" type="button">조회</button>
 	</nav>
	</form>
   <table id="dataTab" class="table table-hover table-striped">
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
    
    </tbody>
	</table>    
    
</div>
<p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" ></p>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">급여정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="등급" name="grade">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="시작급여" name="losal">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="마지막급여" name="hisal">
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