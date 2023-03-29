<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>플리마켓 수정</title>
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
<link id="pagestyle"
	href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>

<%--jquery ui css --%>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%-- gps --%> 
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75"></script> 
	
<script src="${path}/assets/js/plugins/fullcalendar.min.js"></script>
<%--주소 설정해주기 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>



$(document).ready(function(){

	//주소버튼
	$("#request").click(function(){
/* 		var addrs1=$('input[name=addrs1]').val();  */
		
        $.ajax({
            type :"POST",            // HTTP method type(GET, POST) 형식이다.
            url :"calendar.do",      // 컨트롤러에서 대기중인 URL 주소이다.    
            data:'addrs1='+$('input[name=addrs1]').val(), 
            success : function(){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                // 응답코드 > 0000
               /*  alert(res.code); */
            },
            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신 실패.")
            }
        });
	});
	
	
	//내용
	$('#editor .ql-editor').keyup(function(){
	
	 	var expeditor=$(this).html() 
		console.log("dd",expeditor);
		$('input[name=content]').val(expeditor); 
	})

	
});

</script>

</head>
<link href="${path}/resource/css/FleaMarketRe/FleaMarketRe.css"
	rel="stylesheet" />
<style>
#callendar01 {
	display: none;
}
</style>
<%@include file="header.jsp"%>
<body class="g-sidenav-show   bg-gray-100">

	<div class="min-height-300 bg-primary position-absolute w-100"></div>

	<main class="main-content position-relative border-radius-lg ">

		<!-- End Navbar -->
		<div class="container-fluid py-4"  style="margin-top:100px;">
			<div class="row">
				<div class="col-lg-9 col-12 mx-auto">
					<form  method="post"  action="FleaMarketUpt.do" id="aform" onsubmit="return checkForm1()"
						name="aform" enctype="multipart/form-data">
						<div class="card card-body mt-4">
							<h6 class="mb-0 fleamarket">플리마켓 수정하기</h6>
							<hr class="horizontal dark my-3"><%--value="${Login.email}" --%>
							<input type="hidden" name="postingNumber" value="${fleamarket.postingNumber}">
							<input type="hidden" name="email" value="${Login.email}">
							<input type="hidden" name="bisenessNumber" value="${Login.businessnumber}">
			
							
							<label for="title" class="form-label labelFont"><span style="color:red;">*</span>제목</label> 
							<input type="text" class="form-control" id="projectName" name="title" value="${fleamarket.title}" style="width:50%;" minlength='2'>

			                <br>
                            <!-- 주소지정해주기 -->
							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont"><span style="color:red;">*</span>행사/플리마켓 진행 장소 선택</label> 
									<div class = "s_form">
									   <input type="button" name="addrs0" class="btn btn-primary" onclick="execDaumPostcode()" style="margin-bottom: 9px;" value="장소 검색"><br>									  
									   <input name = "addrs1" type="text"   id="sample6_address"  class="form-control soooo2" style="width:102%;" placeholder="주소" readonly>
									   <br>	
									   				
                                    </div>
							     </div>
							</div>
							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont">진행장소 상세설정<span style="color:red;">(클릭!!)</span></label><br>
									<label class="form-label labelFont">( 참가 인원들이 알 수 있도록 상세한 위치를 조절해주세요! ^^ )</label>

								</div>

								<!-- gps -->
								<div class="map_wrap">
									<div id="map"
										style="width: 580px; height: 300px; position: relative; overflow: hidden;"></div>
									<div class="hAddr">

										<span id="centerAddr2"> </span> <span id="centerAddr3">
										</span>
									</div>
									<input Type="hidden" name="address" value="${fleamarket.address}">
									
								</div>
								</div>
							
							
									<div class="row">
								<div class="col-6">
									<label class="form-label labelFont"><span style="color:red;">*</span>모집 인원</label> <input
										class="form-control" type="text" name="approvalMaxCnt" 
										oninput="this.value = this.value.replace(/[^0-50.]/g, '');"
										value="${fleamarket.approvalMaxCnt}">
								</div>
							</div>


							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont"><span style="color:red;">*</span>모집 시작일</label> <input
										 class="form-control datetimepicker" type="date"
										placeholder="시작일을 선택해주세요" name="recruitmentStartDate"
										id="recruitmentStartDate"
										data-input value="${fleamarket.recruitmentStartDate}">
								</div>
								<div class="col-6">
									<!-- class="form-control datetimepicker" -->
									<label class="form-label labelFont"><span style="color:red;">*</span>모집 종료일</label> <input
									 class="form-control datetimepicker" type="date"
										placeholder="종료일을 선택해주세요" name="recruitmentEndDate" 
										id="recruitmentEndDate"
										data-input value="${fleamarket.recruitmentEndDate}">
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label class="form-label labelFont"><span style="color:red;">*</span>플리마켓 시작일</label> 
									<input  class="form-control datetimepicker" type="date"
										placeholder="시작일을 선택해주세요" name="openDate" id="openDate" data-input
										value="${fleamarket.openDate}">
								</div>
									            
							
								<div class="col-6">
									<label class="form-label labelFont"><span style="color:red;">*</span>플리마켓 종료일</label><input
									 class="form-control datetimepicker" type="date"
										placeholder="종료일을 선택해주세요" name="closeDate" id="closeDate" onkeyup="keyevent(this)" data-input
										value="${fleamarket.closeDate}">
								</div>
							</div>
							

							<iframe src="http://localhost:7080/fleaMarket/calendar.do" style="height: 500px;">
							    <p>현재 사용 중인 브라우저는 iframe 요소를 지원하지 않습니다!</p>
							</iframe>
 

					

								<label class="mt-4 labelFont"><span style="color:red;">*</span>내용</label>

								<div id="editor" style="height:294px;">

									<p id="contents">
										${fleamarket.content}<br>
									</p>
								</div>
								<input type="hidden" name="content" id="content" value="${fleamarket.content}">

								<div class="row">
									<div class="col-sm-4 col-6">
										<label class="form-label mt-4"><span style="color:red;">*</span>첨부파일 유무</label> 
										<select	class="form-control" name="checkForm" id="choices-gender" value="${fleamarket.checkForm}">
								<option value="" selected="selected">첨부파일 선택</option>
											<option  value="N">필요없음</option>
											<option id="P" value="P">개인양식(사진+첨부양식)</option>
											<option  value="C">공통파일(사진)</option>
										</select>
									</div>
								</div>
                                
						<div class="div1">
	                 
	                       <label class="mt-4 form-label labelFont">첨부파일</label>
	                         <p class="text-sm mb-0" style="width:236px;">*이미지 파일은 최소 1장 이상입니다.</p>
								<div class="row mt-3">
		                          <div class="col-2" style="height:120px;"> 
		                        
                                  <input type="file" name="pro" class="form-control" 
                                  style="width:230px" id="isFile" multiple  accept="">
		                      </div> 
		                      </div>
                        </div>
		             							
					</form>
					<div class="d-flex justify-content-end mt-4">
						<button type="submit"
							class="btn bg-gradient-primary m-0 ms-2">수정하기</button>
							
					</div>
				</div>
			</div>
		</div>


	</main>




	<!--   Core JS Files   -->
	<script src="${path}/assets/js/plugins/choices.min.js"></script>
	<script src="${path}/assets/js/plugins/quill.min.js"></script>
	<script src="${path}/assets/js/plugins/flatpickr.min.js"></script>
	<script src="${path}/assets/js/plugins/dropzone.min.js"></script>
	
	<script src="${path}/resource/js/Req3000/template.js"></script>
  <script>

  

 
	$('input[name=title]').keyup(function(){
		
		//데이터가 들어왔을 경우
		  if($(this).val()!=''){
			  $(this).removeClass('is-invalid')
			  $(this).addClass('is-valid')
			  
	    //데이터가 없을 경우 		  
		  }else{
				 $(this).removeClass('is-valid')
				 $(this).addClass('is-invalid')
			  
		  }	
	});	
	
	$('input[name=openDate]').on({ 
		change: function() {
			console.log("change")
			if($(this).val()!=''){
				  $(this).removeClass('is-invalid')
				  $(this).addClass('is-valid')
			  }
		},
		keyup: function() {
			console.log("ku")
			if($(this).val().length!=10){
				  $(this).removeClass('is-valid')
				  $(this).addClass('is-invalid')
			  }
		} 
	});
		
	$('input[name=closeDate]').on({ 
		change: function() {
			console.log("change")
			if($(this).val()!=''){
				  $(this).removeClass('is-invalid')
				  $(this).addClass('is-valid')
			  }
		},
		keyup: function() {
			console.log("ku")
			if($(this).val().length!=10){
				  $(this).removeClass('is-valid')
				  $(this).addClass('is-invalid')
			  }
		} 
	});
	
	
	
	$('input[name=approvalMaxCnt]').keyup(function(){
		
		//데이터가 들어왔을 경우
		  if($(this).val()!=''){
			  $(this).removeClass('is-invalid')
			  $(this).addClass('is-valid')
			  
	    //데이터가 없을 경우 		  
		  }else{
				 $(this).removeClass('is-valid')
				 $(this).addClass('is-invalid')
			  
		  }	
	});	

	$('input[name=recruitmentStartDate]').on({ 
		change: function() {
			console.log("change")
			if($(this).val()!=''){
				  $(this).removeClass('is-invalid')
				  $(this).addClass('is-valid')
			  }
		},
		keyup: function() {
			console.log("ku")
			if($(this).val().length!=10){
				  $(this).removeClass('is-valid')
				  $(this).addClass('is-invalid')
			  }
		} 
	});
	$('input[name=recruitmentEndDate]').on({ 
		change: function() {
			console.log("change")
			if($(this).val()!=''){
				  $(this).removeClass('is-invalid')
				  $(this).addClass('is-valid')
			  }
		},
		keyup: function() {
			console.log("ku")
			if($(this).val().length!=10){
				  $(this).removeClass('is-valid')
				  $(this).addClass('is-invalid')
			  }
		} 
	});
	
	
	
	
  </script>
  
  
	<!-- Kanban scripts -->
	<script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
	<script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>



	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>


<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->


<script src="${path}/resource/js/Req3000/address.js"></script>
<%--gps --%>
<script src="${path}/resource/js/Req3000/gps2.js"></script>  

<script>
/* 
var now_utc = Date.now()
var timeOff = new Date().getTimezoneOffset()*60000;
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
$('input[name=openDate]').attr("min", today);
$('input[name=closeDate]').attr("min", today);
$('input[name=recruitmentStartDate]').attr("min", today);
$('input[name=recruitmentEndDate]').attr("min", today);
 */
  


</script>






</html>