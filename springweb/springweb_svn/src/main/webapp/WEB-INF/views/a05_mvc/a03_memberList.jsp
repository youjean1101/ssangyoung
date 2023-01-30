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
		<%-- m=auth]").val("${sch.auth}")
		--%>
		$("#frm01 [name=auth]").val("${sch.auth}")
		$("#frm02 [name=auth]").val("${mem.auth}")
		var proc = "${param.proc}"
		if(proc!=""){
			// 요청값으로 단일 검색을 받았을 때, 모달창 로딩
			$("#modal01").click();
		}
		if(proc=="upt"){
			if(confirm("수정성공!\n조회화면이동하시겠습니까?")){
				$("#frm01").submit()
			}
		}
		if(proc=="del"){
			alert("삭제성공!\n조회화면이동!")
			$("#frm01").submit()
			
		}
		if(proc=="ins"){
			alert("등록성공!\n조회화면이동!")
			$("#frm01").submit()
			
		}
		
		// <p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" ></p># id="uptBtn" ")
		//  id="uptBtn" 
		// uptBtn
		$("#uptBtn").click(function(){
			console.log("#1")
			var passVal=$("#frm02 [name=pass]").val()
			var passFrmVal = $("#frm02 #passFrm").val()
			if(passVal!=passFrmVal){
				alert("패스워드 패드워드 확인 동일하여야 합니다.")
				return;
			}
			console.log("#2")
			var authVal = $("#frm02 [name=auth]").val()
			if(authVal==""){
				alert("권한을 선택하여야 합니다.")
				return;
			}
			console.log("#3")
			if(confirm("수정하시겠습니까?")){
				$("#frm02 [name=proc]").val("upt");
				$("#frm02").attr("action","${path}/memberUpt.do");
				$("#frm02").submit();
			}
		})
		
		
		// /memberUpt.do /memberDel.do
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("#frm02 [name=proc]").val("del");
				$("#frm02").attr("action","${path}/memberDel.do");
				$("#frm02").submit();
			}			
		})
		
		$("#insBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("#frm02 [name=proc]").val("ins");
				$("#frm02").attr("action","${path}/memberIns.do");
				$("#frm02").submit();
			}			
		})
				
	});
	function goPage(id){
		location.href="${path}/memberMy.do?id="+id+"&proc=schOne"
	}	
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >회원리스트</h2>
</div>
<div class="container">
	<form id="frm01" class="form" action="${path}/memberListMy.do" method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="id" value="${sch.id}" class="form-control mr-sm-2" placeholder="아이디" />
	    <input name="name" value="${sch.name}"  class="form-control mr-sm-2" placeholder="이름" />
	    <select name="auth" class="form-control mr-sm-2">
	    	<option value="">권한선택</option>
	    	<c:forEach var="selAuth" items="${authCom}">
	    	<option >${selAuth}</option>
	    	</c:forEach>
	    </select>
	    <%-- $("[name=auth]").val("${sch.auth}") --%>
	    
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
   	<col width="25%">
    <thead>
    
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>이름</th>
        <th>권한</th>
        <th>포인트</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="mem" items="${mlist}">
    	<tr onDblclick="goPage('${mem.id }')"><td>${mem.id}</td><td>${mem.name}</td>
    		<td>${mem.auth}</td><td>${mem.point}</td></tr>
    	</c:forEach>
    </tbody>
	</table>   
	<script type="text/javascript">

		/*
		id    name
		pass  pass확인
		point auth
		*/
	</script>
	 
    
</div>
<p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" ></p>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원상세</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- 
      	/*
		id    name
		pass  pass확인
		point auth
		*/
       -->
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
			<input type="hidden" name="proc"/>
	     <div class="row">
	      <div class="col">
	        <input name="id" value="${mem.id}" type="text" class="form-control" placeholder="아이디 입력" >
	      </div>
	      <div class="col">
	        <input name="name" value="${mem.name}"  type="text" class="form-control" placeholder="이름 입력" >
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input  name="pass" value="${mem.pass}" type="password" class="form-control" placeholder="패스워드 입력" >
	      </div>
	      <div class="col">
	        <input id="passFrm" value=""  type="password" class="form-control" placeholder="패스워드 확인">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input name="point" value="${mem.point}" type="text" class="form-control" placeholder="포인트명 입력">
	      </div>
	      <div class="col">
	        <select name="auth" class="form-control mr-sm-2">
	    	<option value="">권한선택</option>
	    	<c:forEach var="selAuth" items="${authCom}">
	    	<option >${selAuth}</option>
	    	</c:forEach>
	       	</select>
	        
	      </div>
	     </div>	     	     
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="uptBtn" type="button" class="btn btn-primary">수정</button>
        <button id="delBtn" type="button" class="btn btn-warning">삭제</button>
        <button id="insBtn" type="button" class="btn btn-warning">등록</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>