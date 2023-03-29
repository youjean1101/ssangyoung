<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="sideheader.jsp" %>	
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>회원목록조회</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
<link href="${path}/resource/css/Req1001/QNAInsert.css" rel="stylesheet" />
</head>
<script type="text/javascript">
$(document).ready(function(){
	//글쓰기 부분ㅇㅇ
	
	
	$('#editor .ql-editor').on({ 
		keyup: function(e) {
			
	        	 var expeditor=$('#editor .ql-editor').html()
			 	
				$('input[name=content]').val(expeditor);
	         }
		
	});
	
})

function triggerback(){
	var e = jQuery.Event( "keydown", { keyCode: 13 } );
	$('#editor .ql-editor').trigger( e );
}

function CheckQNAInsert(){
	var sesAuthority='${Login.authority}'
		if(sesAuthority!='관리자' && $('select[name=category]').val()=='none'){
			alert('문의유형을 선택바랍니다.'); return false;
			}
		if($('input[name=title]').val()==''){alert('문의제목을 입력바랍니다.');
			return false;
		}
		if($('input[name=content]').val()==''||$('input[name=content]').val()=='<p><br></p>'){
			alert('문의내용을 입력부탁드립니다.');
			return false;
		}
		return true;
	}
</script>
<style>
input[type=file]::file-selector-button {
  width: 130px;
  height: 40px;
  background-image: linear-gradient(90deg,#7F69D5,#5E72E4);
/* background-image: linear-gradient(-20deg, #2b5876 0%, #4e4376 100%);
 */color:white;
  border: 1px solid rgb(77,77,77);
  border-radius: 8px;
  cursor: pointer;
  
}
</style>
<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>

	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<!-- 상단 -->
		
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- Card header -->
						<div class="card-header pb-0 mb-4">
							<div class="d-lg-flex">
								<div>
								<c:if test="${Login.authority!='관리자'}">	
									<h5 class="mb-0">문의글등록</h5>
									<p class="text-sm mb-0">소중한 문의의견에 감사드립니다.</p>
								</c:if>
								<c:if test="${Login.authority == '관리자' && empty qna.title}">
								    <h5 class="mb-0">공지사항등록</h5>
								</c:if>
								<c:if test="${!empty qna.title}">
								    <h5 class="mb-0">문의답변등록</h5>
								</c:if>
								</div>
							</div>
						</div>
						<form action="QNAInsert.do" method="post" enctype="multipart/form-data" onsubmit="return CheckQNAInsert()">
							<input type="hidden" name="refno" value="${empty qna.refno?0:qna.refno}"/>							
							<div class="row ms-2 mb-3">
							<c:choose>
								<c:when test="${empty qna.method}">
									<input name="method" type="hidden" value="${Login.authority=='관리자'?'n':'q'}"/>
								</c:when>
								<c:otherwise>
									<input name="method" type="hidden" value="${qna.method}"/>
								</c:otherwise>
							</c:choose>
							<c:if test="${Login.authority!='관리자'}">	
								<div class="col-2">
									<label class="postInsertTitle" style="margin-left: -0.5%;">문의종류</label>
									<select class="form-select" aria-label="Default select example" name="category">
									  <option value="none" selected>문의종류</option>
									  <option>등업</option>
									  <option>판매</option>
									  <option>커뮤니티</option>
									  <option>유저신고</option>
									  <option>플리마켓신고</option>
									  <option>커뮤니티신고</option>
									</select>
								</div>
								<div class="col-2">
									 <div class="checkbox_group form-check form-check-info Trems_Wrap ms-3" style="margin-top:15%;">
										  <label class="postInsertTitle" style="margin-left: -0.5%;">비밀글</label>
										  <input class="form-check-input" type="checkbox" id="secretBtn" class="Trem text-dark font-weight-bolder"/>
									</div>
								</div>
							</c:if>
							<input type="hidden" name="secretwhether" value="${empty qna.secretwhether?'n':qna.secretwhether}"/>
							
							<%-- <c:choose>
										<c:when test="${empty qna.secretwhether}">
										</c:when>
										<c:otherwise>
											<input type="hidden" name="secretwhether" value="${qna.secretwhether}"/>
										</c:otherwise>
									</c:choose> --%>
							</div>
							<div class="row ms-3 mb-4">
								<div class="col-2 ms-n2 me-2">
									<label class="postInsertTitle">작성자</label>
							 		<input class="multisteps-form__input form-control" name="email" type="text" value="${Login.email}" readonly />
								</div>
							</div>
							<div class="mb-3" style="margin-left: 26px;">
									<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
								<c:choose>	
									<c:when test="${empty qna.title}">
										<input class="multisteps-form__input form-control w-50" name="title" type="text" placeholder="제목을 작성해주세요." />
									</c:when>
									<c:otherwise>
										<input class="multisteps-form__input form-control w-50" name="title" type="text" value="re:${qna.title}"/>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="mb-7" style="width: 98%; margin-left: 23px; height: 300px;">
								<label class="mt-4 postInsertTitle" style="margin-left: -0.5%;">게시글내용</label>
								<div id="editor"></div>
							</div>
								<input type="hidden" id="contentInput" name="content"/>
							<div class="mb-3" style="margin-left: 26px;">
								<label class="postInsertTitle" class="mt-3">이미지파일 이외는 첨부 되지않습니다.<span style="color:red;">!!</span></label><br>
								 <input class="" name="qnafiles" type="file" id="${Login.authority=='관리자'?'qnafilesadmin':'qnafiles'}"
								   multiple/>
							</div>
							<label class="postInsertTitle">이미지 미리보기 <span style="color:red;">(x버튼 클릭시 해당 파일만 제거)</span></label>
							 <div id="imgs_wrap" style="display:flex;">
   							 </div>
   							
							<button type="button" style="float: right;" class="btn btn-secondary btn-md mb-0">취소</button>	
							<button type="submit" style="float: right;" class="btn btn-primary btn-md mb-0 me-2">등록</button>
						</form>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer pt-3  ">
				<div class="container-fluid">
					<div class="row align-items-center justify-content-lg-between">
						<div class="col-lg-6 mb-lg-0 mb-4">
							<div
								class="copyright text-center text-sm text-muted text-lg-start">
								©
								<script>
                  document.write(new Date().getFullYear())
                </script>
								, made by <a
									href="https://www.creative-tim.com" class="font-weight-bold"
									target="_blank">CONTIGO</a> for a better FleaMarket.
							</div>
						</div>
						<div class="col-lg-6">
							<ul
								class="nav nav-footer justify-content-center justify-content-lg-end">
								<li class="nav-item"><a href="https://www.creative-tim.com"
									class="nav-link text-muted" target="_blank">Creative Tim</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/presentation"
									class="nav-link text-muted" target="_blank">About Us</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/blog"
									class="nav-link text-muted" target="_blank">Blog</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/license"
									class="nav-link pe-0 text-muted" target="_blank">License</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
	</main>
<script>
//---------세션처리된 변수 할당 전용 구역----------
var SesAuthority = '${Login.authority}' //권한
//---------------------------------------

var quill = new Quill('#editor', {
  modules: { toolbar: true },
  theme: 'snow'
});


$('#secretBtn').click(function(){
	
	if($(this).is(':checked')){$('input[name=secretwhether]').val('y')}
	else{$('input[name=secretwhether]').val('n')}
})


</script>
<script src="${path}/resource/js/Req1000/fileupload.js"></script>
</body>
</html>