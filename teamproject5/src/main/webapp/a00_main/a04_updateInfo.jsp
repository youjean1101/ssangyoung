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
.nextbutton{
	width:28%;
	padding: 10px 20px 10px 20px;
	background: #24384a;
	color: white;
	font-size: 0.9rem;
	border: #24384a solid 1px;
	text-align: center;
	margin-left: 0; margin-right: 0;
	font-weight: bold;
	margin-left: 40%;
}
th{
	text-align: center;
	background: #d2d2d2;
}
.form-control{
	width: 20% !important;
	display: inline-block !important;
}
.form-control::placeholder {
	font-size: 0.7rem !important;
}
.form-select{
	display: inline-block !important;
	width: 15% !important;
	height : 2rem;
	font-size: 0.7rem;
	color: gray;
}
#checkmsg, #checkmsg2, #checkmsg3{
	font-size: 0.6rem; 
	font-weight:bold;
	color:red;
	padding-left: 5px;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

</head>

<body>
	
	<form >
	<table class="table table-bordered">
	<col width="30%">
	<tr><th>아이디</th><td>현재 아이디</td></tr>
	<tr><th>비밀번호</th><td><button id="passBtn" class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#passModal">비밀번호 변경</button></td></tr>
	<tr><th>이메일주소</th><td><input type="text" id="emailInput" class="form-control email" name="email1" placeholder="현재 이메일 아이디">
				<span>@ </span><input type="text" id="emailInput2" class="form-control email" name="email2" placeholder="이메일 주소 입력" value="gmail.com">
				 <select class="form-select" aria-label="Default select example" name="email2" id="emailsel">
				  <option value="0" selected>선택</option>
				  <option>naver.com</option>
				  <option>gmail.com</option>
				  <option>hanmail.net</option>
				  <option>yahoo.co.kr</option>
				  <option value="1">직접입력</option>
				</select></td></tr>
	<tr><th>휴대전화번호</th><td>현재 핸드폰 번호&nbsp;&nbsp;<button id="phoneBtn" class="btn btn-success" type="button" data-bs-toggle="modal" data-bs-target="#phoneModal">휴대전화 변경</button></td></tr>
	<tr><th>체중</th><td><input type="text" id="weightInput" class="form-control" name="weight" placeholder="65"> kg</td></tr>
	</table>
	<input type="hidden" name="pass" id="newpassFin"> 
	<input type="hidden" name="phone" id="newphoneFin"> 
	<button class="nextbutton" type="button" style="margin-top: 2%;">수정</button>
	</form>
	
		<!-- Modal 비밀번호 -->
		<div class="modal fade" id="passModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
		      </div>
		      <div class="modal-body">
		      	<form>
		        현재 비밀번호 입력 : <input type="password" name="pass" id="originPass"> <button type="button" id="passCheck" class="btn btn-primary">확인</button><span id="checkmsg"></span><br>
		        </form>
		        <form>
		        <div class="newpass">
		        변경할 비밀번호 입력 : <input type="password" name="newpass1"><br>
		        비밀번호 확인 : <input type="password" name="newpass2"><span id="checkmsg2"></span><br>
		        </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-close" data-bs-dismiss="modal">닫기</button>
		         <button type="button" id="passCheck2" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- Modal 휴대전화-->
		<div class="modal fade" id="phoneModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">휴대전화번호 변경</h5>
		      </div>
		      <div class="modal-body">
		        변경할 전화번호 입력 : <input type="text" name="newPhone"><br><span id="checkmsg3"></span>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary btn-close" data-bs-dismiss="modal">닫기</button>
		         <button type="button" id="phoneCheck" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#passBtn").click(function(){
			$('#passModal').modal("show")
			$("#originPass").val("")
			$("[name=newpass1]").val("")
			$("[name=newpass2]").val("")
			$("#checkmsg").text("")
			$("#checkmsg2").text("")
			$(".newpass").hide()
		})
		$("#phoneBtn").click(function(){
			$('#phoneModal').modal("show")
			$("[name=newPhone]").val("")
		})
		$(".btn-close").click(function(){
			$('#passModal').modal("hide")
			$('#phoneModal').modal("hide")
		})
		
		$(".newpass").hide()
		$("#passCheck").click(function(){
			$("#checkmsg2").text("")
			// ajax로 로그인한 회원의 비밀번호 가져와서 비교하기
			if($("#originPass").val()==1111){	
				$("#checkmsg").text("일치")
				$(".newpass").show()
			}else{
				$("#checkmsg").text("불일치")
				$("[name=pass]").val("")
				$("[name=pass]").focus()
			}
		})
		let newPass=""
		$("#passCheck2").click(function(){
			if( $("[name=newpass1]").val()==$("[name=newpass2]").val() ){
				$('#passModal').modal("hide")
				newPass = $("[name=newpass1]").val()
				$("#newpassFin").val(newPass)
				
			}else{
				$("#checkmsg2").text("불일치")
				$("[name=newpass1]").val("")
				$("[name=newpass2]").val("")
				$("[name=newpass1]").focus()
			}
		})
		
		
		
		$("#phoneCheck").click(function(){
			let newPVal = $("[name=newPhone]").val()
			if(newPVal.length==11 && newPVal.substring(0,3)=='010'){
				$('#phoneModal').modal("hide")
				$("#newphoneFin").val(newPVal)
			}else{
				$("#checkmsg3").text("유효하지 않은 번호입니다.")
				$("[name=newPhone]").val("")
				$("[name=newPhone]").focus()
				
			}
		})
		$("#emailsel").change(function(){
			if($(this).val()==1){
				$("#emailInput2").val("")
				$("#emailInput2").focus()
			}else if($(this).val()==0){
				
			}else{
				$("#emailInput2").val($(this).val())
			}
		})
		
		$(".nextbutton").click(function(){ // 수정 완료 버튼 누를 때
			console.log($("#newpassFin").val())
			console.log($("#newphoneFin").val())
		})
	});
</script>
</html>