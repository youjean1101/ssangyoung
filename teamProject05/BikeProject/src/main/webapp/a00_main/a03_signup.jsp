<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
.fs-1{
	font-size: 2.3rem;
	font-weight: bolder;
	padding: 0 0 0 2.5%;
}
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
}
input[type="radio"]{display: none;}
input[type="radio"] + label{
	display: inline-block;
	width:35%;
	padding: 10px 20px 10px 20px;
	background: white;
	color:black;
	font-size: 0.9rem;
	border: #24384a solid 1px;
	text-align: center;
	margin-left: 0; margin-right: 0;
	font-weight: bold;
}
input[type="radio"]:checked + label {
	background: #24384a;
	color: white;
	font-weight: bold;
}
.conbox{
	width: 100%;
	margin: 0 auto;
	display: none;
}
input[id="tab01"]:checked ~ .con1{
	display:block;
}
input[id="tab02"]:checked ~ .con2{
	display:block;
}
.alink, .alink:hover{
	color: black;
	font-weight: bold;
	text-decoration: none;
}
.adiv{
	padding-bottom: 8px;
}
.anexttext{
	font-size: 0.8rem;
}
.form-control{
	width: 89% !important;
	display: inline-block !important;
	height: 30.4px !important;
}
.form-control.email{
	width: 40% !important;
}
.btn-primary{
	font-size: 0.7rem !important;
	padding: 0.32rem 0.6rem !important;
}
.form-control::placeholder {
	font-size: 0.7rem !important;
}
.form-select{
	display: inline-block !important;
	width: 40% !important;
	font-size: 0.7rem;
	color: gray;
}
.col.left{
	width: 3% !important;
	text-align:right;
	font-size:0.7rem;
	font-weight:bold;
	padding: 0;
	justify-content: center;
	align-content: center;
}
.col.right{
	width: 3% !important;
	padding: 0;
	justify-content: flex-start;
	align-content: flex-start;
	text-align: left;
}
.formLabel{
	padding-top: 3%;
}
.row{
	margin-top: 1%;
}
#cerficationMsg{
	font-size: 0.6rem;
	color:red;
	font-weight: bold;
	padding-left: 5px;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript">
	$(document).ready(function(){
		console.log("@2")
		
	});
	console.log('##')
</script>

</head>

<body>
<div class="container">
	<jsp:include page="${path }/a00_main/a00_header.jsp"></jsp:include>
	<br><br>
	<p class="fs-1 text-lg-start">회원가입</p>
	<br><br>
	<div class="justify-content-center text-center">
		<input type="radio" id="tab01" name="tabmenu" checked>
		<label for="tab01">약관동의</label>
		<input type="radio" id="tab02" name="tabmenu">
		<label for="tab02">정보입력</label>
		
		<div class="conbox con1">
		<br><br><br>
		<div class="adiv"><a class="alink" href="*">(필수) 서비스 이용약관 동의 (상세내용 보기)</a>&nbsp; <input type="checkbox" class="check"><br></div>
		<div class="adiv"><a class="alink" href="*">(필수) 개인정보 수집ㆍ이용 동의 (상세내용 보기)</a>&nbsp; <input type="checkbox" class="check"><br></div>
		<div class="adiv"><a class="alink" href="*">(필수) 위치기반 서비스 이용약관에 동의 (상세내용 보기)</a>&nbsp; <input type="checkbox" class="check"><br></div>
		<div class="adiv"><a class="alink" href="*">(선택) 수집한 개인정보의 제 3자 정보제공 동의 (상세내용 보기)</a>&nbsp; <input type="checkbox" class="check"><br></div>
		<div class="adiv"><a class="alink" href="*">(선택) 마켓팅 및 이벤트 정보 수신 동의</a>&nbsp; <input type="checkbox" class="check"><br></div>
		<p class="anexttext">에 동의하여 가입합니다.</p><br><br>
		
		<input type="checkbox" id="allcheck">&nbsp;위 약관을 모두 읽었으며 이에 동의합니다.<br><br><br>
		<button class="nextbutton" id="nextbutton" type="button">다음</button>
		</div>
		
		<div class="conbox con2">
		<form>
		<div class="row">
		<div class="col left"><label class="formLabel" for="idInput">아이디</label></div>
		<div class="col center"><input type="text" id="idInput" class="form-control" name="id" placeholder="영문, 숫자 포함 6~12자리"></div>
		<div class="col right"><button class="btn btn-primary" type="button">중복확인</button></div>
		</div>
		<div class="row">
		<div class="col left"><label class="formLabel" for="passInput">비밀번호</label></div>
		<div class="col center"><input type="password" id="passInput" class="form-control" name="pass" placeholder="영문, 숫자, 특수문자 포함 8~12자리"></div>
		<div class="col right"></div>
		</div>
		<div class="row">
		<div class="col left"></div>
		<div class="col center"><input type="password" class="form-control" name="pass2" placeholder="비밀번호 확인"></div>
		<div class="col right"></div>
		</div>
		<div class="row">
		<div class="col left"><label class="formLabel" for="nameInput">이름</label></div>
		<div class="col center"><input type="text" id="nameInput" class="form-control" name="name" placeholder="이름 입력"></div>
		<div class="col right"></div>
		</div>
		<div class="row">
		<div class="col left"><label class="formLabel" for="phoneInput">휴대전화</label></div>
		<div class="col center"><input type="text" id="phoneInput" class="form-control" name="phone" placeholder="휴대전화번호 입력"></div>
		<div class="col right"><button class="btn btn-primary" id="callCertification" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button">인증요청</button></div>
		</div>
		<div class="row">
		<div class="col left"></div>
		<div class="col center"><input type="text" id="certificationInput" class="form-control" name="certification" placeholder="인증번호 입력"></div>
		<div class="col right"><button class="btn btn-primary" id="checkCertification" type="button">확인</button> <span id="cerficationMsg"></span></div>
		</div>
		<div class="row">
		<div class="col left"><label class="formLabel" for="emailInput">이메일</label></div>
		<div class="col center" style="justify-content: center;"><input type="text" id="emailInput" class="form-control email" name="email1" placeholder="이메일 아이디">
				<span>@</span> <select class="form-select" aria-label="Default select example" name="email2">
				  <option value="0" selected>선택</option>
				  <option>naver.com</option>
				  <option>gmail.com</option>
				  <option>hanmail.net</option>
				  <option>yahoo.co.kr</option>
				</select>
		</div>
		<div class="col right"></div>
		</div>
		<div class="row">
		<div class="col left"><label class="formLabel" for="weightInput">몸무게</label></div>
		<div class="col center"><input type="text" id="weightInput" class="form-control" name="weight" placeholder="입력하지 않으면 자동으로 65kg으로 설정됩니다"></div>
		<div class="col right"></div>
		</div>
		<button class="nextbutton" type="button" style="margin-top: 2%;">완료</button>
		</form>
		</div>
		
		</div>
		
		
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">인증번호</h5>
		        <button type="button" class="btn-close" id="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		    </div>
		  </div>
		</div>
		
</div>	
</body>
<script>
	$("#allcheck").click(function(){
		if($("#allcheck").prop("checked")){
			$(".check").prop("checked",true);
		}else{
			$(".check").prop("checked",false);
		}
	})
	$("#nextbutton").click(function(){
		if($(".check").eq(0).prop("checked")&&$(".check").eq(1).prop("checked")&&$(".check").eq(2).prop("checked")){
			$("#tab02").attr("checked",true);	
		}else{
			alert("필수 항목을 체크해주세요")
		}
	})
	let ranNum = 0;
	$("#callCertification").click(function(e){
			e.preventDefault();
			$("#cerficationMsg").text("")
			$('#exampleModal').modal("show");
			ranNum = parseInt(Math.random()*8999+1000)
			$('.modal-body').text(ranNum)
	})

	$("#btn-close").click(function(){
		$('#exampleModal').modal("hide");
		
		$("#checkCertification").click(function(){
			if($("#certificationInput").val()==ranNum){
				alert("확인되었습니다.")
				// 인증번호랑 같은 번호를 입력했을 때 input hidden 만들어서 true가 되도록 하기
			}else{
				console.log("불일치")
				$("#cerficationMsg").text("인증번호가 일치하지 않습니다.")
			}
			
		})
	})
	
</script>
</html>