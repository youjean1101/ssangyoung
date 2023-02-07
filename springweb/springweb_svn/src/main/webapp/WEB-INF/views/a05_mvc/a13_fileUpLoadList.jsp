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
		
		--%>
		var msg = "${msg}"
		if(msg!=""){
			alert(msg)
		}
	});
	function download(fname){
		if(confirm(fname+"다운로드 하시겠습니까?")){
			location.href="${path}/download.do?fname="+fname;
		}
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>등록 파일 리스트</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="title" class="form-control mr-sm-2" placeholder="검색할 내용" />
	    <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-secondary" type="button">등록</button>
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
        <th>번호</th>
        <th>파일내용</th>
        <th>파일명</th>
        <th>등록일</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="fObj" items="${flist}">
    		<tr ondblclick="download('${fObj.fname}')"><td>${fObj.no}</td><td>${fObj.title}</td>
    			<td>${fObj.fname}</td>
    			<td><fmt:formatDate value="${fObj.regdte}"/></td></tr>
    	</c:forEach>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">파일등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" action="${path}/fileUpLoad.do" 
				enctype="multipart/form-data"
		class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="내용" name="title">
	      </div>
	     </div>
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="기타정보" name="etc">
	      </div>
	     </div>
	     <div class="col">
	      <div class="custom-file">
	        <input type="file" name="report" class="custom-file-input" id="file01">
	        <label class="custom-file-label" for="file01">파일을 선택하세요!</label>
	      </div>
	     </div>
	     
	    </form> 
      </div>
      <div class="modal-footer">
     	<button id="regBtn" type="button" class="btn btn-success">파일 첨부</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      <script type="text/javascript">
      	$("#regBtn").click(function(){
      		$("#frm02").submit()
      	})
      	$(".custom-file-input").on("change",function(){
      		$(this).next(".custom-file-label").text($(this).val())
      	})
      </script>
    </div>
  </div>
</div>
</body>
</html>