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
		// # 이전에 선택했던 combo(select) 선택
		// 1. frm01 : 조회된 내용
		$("#frm01 [name=auth]").val("${sch.auth}")
		// 2. frm02 : 상세 화면 모달창
		$("#frm02 [name=auth]").val("${mem.auth}")
		
		// # 진행하는 프로세스에 대한 처리에 따라 화면단에서 처리할 내용
		// 1. 현재 화면에서 전체조회, 상세화면, 수정, 삭제를 다 처리해야 하기에
		//		프로세스에 대한 요청값을 기준으로 메시지 처리나 다음 프로세스
		//      처리 필요성에 의해서 처리된다.
		// 2. proc의 값 -팝업 필요X : 리스트처리(""), 삭제("del"), 
		//				팝업 필요: 등록("ins"),  수정("upt"), 상세화면("schOne")
		$("#modal01").hide()
		var proc = "${param.proc}"
		// 3. 리스트 화면 이외에는 모달창을 로딩이 필요하다.
		if(proc=="ins" || proc=="upt" || proc=="schOne" ){
			// 요청값으로 단일 검색을 받았을 때, 모달창 로딩
			$("#modal01").click();
			// 1. 모달창 로딩 방법
			// 		1) 모달창 로딩을 위한 클릭 요소객체(버튼 등)
			//      2) 모달창 로딩
		}
		if(proc=="upt"){
			alert("수정완료");
		}
		if(proc=="del"){
			alert("삭제성공!")
		}
		if(proc=="ins"){
			alert("등록완료");
		}		
		// <p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" ></p># id="uptBtn" ")
		//  id="uptBtn" 
		// uptBtn
		$("#uptBtn").click(function(){
			checkValid(); 
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
		
		$("#regBtn").hide() // 초기화면에서는 보이지 않게 처리
		$("#frm02 [name=id]").attr("readonly",true)
		$("#regLdBtn").click(function(){
			//타이틀 : 회원등록, ps) 상세화면에서 회원상세정보로 처리
			$("#modalTitle").text("회원등록")
			//form데이터에 데이터가 없어야 함
			$("#frm02 [name=id]").attr("readonly",false)
			$("#frm02 [name]").val("")
			//버튼 : 등록버튼/닫기  ps) 상세화면에서는 수정/삭제버튼만 있게 처리.
			// <button id="regBtn">등록</button>
			$("#uptBtn, #delBtn, #insBtn").hide()
			$("#regBtn").show()
		})
		$("#regBtn").click(function(){
			//모달창안에 등록 버튼 클릭시, 
			//	입력여부 및 유효성 처리.. 권한 추가시를 위해 고려?
			checkValid(); 
			$("#frm02 [name=proc]").val("ins");
			$("#frm02").attr("action","${path}/insertMember.do")				
			$("#frm02").submit();
		})
				
	});
	function goPage(id){
		location.href="${path}/memberMy.do?id="+id+"&proc=schOne"
	}	
	function checkValid(){
		var passVal=$("#frm02 [name=pass]").val()
		var passFrmVal = $("#frm02 [name=passFrm]").val()
		if(passVal!=passFrmVal){
			alert("패스워드 패드워드 확인 동일하여야 합니다.")
			return;
		}
		var authVal = $("#frm02 [name=auth]").val()
		if(authVal==""){
			alert("권한을 선택하여야 합니다.")
			return;
		}		
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
	    
	    <button id="regLdBtn" class="btn btn-success" type="button"  
	    	data-toggle="modal" data-target="#exampleModalCenter" >등록</button>
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
<!-- 모달 창로딩을 위한 요소 객체 속성 설정 -->
<p id="modal01" data-toggle="modal" data-target="#exampleModalCenter" >클릭!!</p>
<!-- 현재는 요청 프로세스에 의해 이벤트 강제 수행에 의해 모달창이 로딩되게 처리하였다.
	$("#modal01").click();
위 요소객체 클릭시 로딩할 모달창 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">회원상세</h5>
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
			<!--이 요청값으로 다음 프로세스에 대한 처리를 위해 설정, 굳이 보일 필요는 없지만
			반드시 필요..-->
	     <div class="row">
	      <div class="col">
	        <input name="id" value="${mem.id}"  type="text" class="form-control" placeholder="아이디 입력" >
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
	        <input name="passFrm" value="${mem.pass}"  type="password" class="form-control" placeholder="패스워드 확인">
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
	    <script>
	    	
	    </script>
      </div>
      <div class="modal-footer">
        <button id="regBtn" type="button" class="btn btn-success">등록</button>
        <button id="uptBtn" type="button" class="btn btn-primary">수정</button>
        <button id="delBtn" type="button" class="btn btn-warning">삭제</button>
        <button id="insBtn" type="button" class="btn btn-success">등록</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>