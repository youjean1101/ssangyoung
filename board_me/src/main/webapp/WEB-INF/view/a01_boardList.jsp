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
		no, subject, writer, regdte, readcnt
		번호, 제목, 작성자, 등록일, 조회수
		--%>
		$("#regBtn").click(function(){
			location.href="${path}/insertFrm.do"
		})
	});
	
	function insertFrm(){
		location.href="${path}/insertFrm.do"
	}
	
	function goDetail(no){
		location.href="${path}/board.do?no="+no
	}
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 >게시판</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="subject" value="${sch.subject}" class="form-control mr-sm-2" placeholder="제목" />
	    <input name="writer" value="${sch.writer}" class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-info" type="button" data-toggle="modal" data-target="#exampleModalCenter">등록</button>
 		<button class="btn btn-success" id="regBtn" type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="45%">
   	<col width="15%">
   	<col width="15%">
   	<col width="15%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="board" items="${list}">
    	<tr ondblclick="goDetail(${board.no})">
    		<td>${board.no}</td>
    		<td>${board.subject}</td>
    		<td>${board.writer}</td>
    		<td><fmt:formatDate value="${board.regdte}"/></td>
    		<td>${board.readcnt}</td></tr>
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
	     <div class="row"><%-- #{refno}, #{subject},#{content},#{writer}, --%>
	        답글번호 : <input type="text" class="form-control" placeholder="답글번호 입력" name="refno">
	      </div>
	      <div class="row">
	        제목 : <input type="text" class="form-control" placeholder="제목 입력" name="subject">
	      </div>
	      <div class="row">
	        내용 : <textarea class="form-control" placeholder="내용입력" name="content" style="height:300px;"></textarea>
	      </div>
	       <div class="row">
	        작성자 : <input type="text" class="form-control" placeholder="작성자 입력" name="writer">
	      </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="insertFrm()">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>