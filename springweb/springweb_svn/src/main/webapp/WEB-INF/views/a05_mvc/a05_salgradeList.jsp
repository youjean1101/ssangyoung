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
		search()
	});
	function search(){
		$.ajax({
			url:"${path}/salgradeList.do",
			type:"post",
			dataType:"json",
			success:function(data){
				var slist = data.slist
				console.log(slist)
				var show=""
				$(slist).each(function(idx, sal){
					show+="<tr onclick='goPage("+sal.grade+")'>"
					show+="<td>"+sal.grade+"</td>"
					show+="<td>"+sal.hisal+"</td>"
					show+="<td>"+sal.losal+"</td>"
					show+="</tr>"
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
				console.log(sal)
				$("#frm02 [name=grade]").val(sal.grade);
				$("#frm02 [name=hisal]").val(sal.hisal);
				$("#frm02 [name=losal]").val(sal.losal);
			}
		})		
	}		
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >급여등급리스트</h2>
  

</div>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="33%">
   	<col width="33%">
   	<col width="33%">
    <thead>
    
      <tr class="table-success text-center">
        <th>등급</th>
        <th>시작</th>
        <th>마지막</th>
      </tr>
    </thead>	
    <tbody>
    </tbody>
	</table>    
    
</div>
<h2 id="modal01" data-toggle="modal" data-target="#exampleModalCenter"></h2>
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
	        <input type="text" class="form-control" placeholder="등급 입력" name="grade">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="시작 입력" name="losal">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="끝 입력" name="hisal">
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