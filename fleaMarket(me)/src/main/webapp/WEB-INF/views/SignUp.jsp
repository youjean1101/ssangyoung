<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
 
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    회원가입
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>
<link href="${path}/resource/css/Req1000/SignUp.css" rel="stylesheet" />
<body class="">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
 	
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container SignUp_container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-left">
                  <h4 class="font-weight-bolder mt-n3">Sign Up </h4>
                  <p class="mb-0 Signup_infomation"><span class="font-weight-bolder">step 1/3&nbsp;&nbsp;&nbsp;다음 정보를 입력해주세요.</p>
                  
                </div>
                <div class="card-body pb-3 SignUp_wrap">
                  <form role="form">
                  <div class="container animate__animated" id="SignUp_1Section">              
	                     <label>이메일</label>
	                    <div class="row mb-n2">
	                    	<div class="col-8">
		                    	 <input type="email" name="email" class="form-control form-control mb-3" placeholder="example@doamin.com">
		                    	 <div id="emailfeedback" class="invalid-feedback">이메일 양식이 맞지않습니다.</div>
	                    	</div>
		                    	<div class="col-4">
		                    	<input type="button" class="btn btn-primary w-100" style="font-size: x-small;background: #8451ce;" id="CheckEmailBtn" value="이메일 인증"><br>
	                    	</div>                     
	                    </div>
	                    <div class="mb-3">
	                    <input type="text" class="form-control form-control-sm w-50 mt-3" id="checkEmailCode" placeholder="인증번호"/>
	                    </div>
	                    <label>비밀번호(8자 이상 / 16자리 이하)</label>
	                    <div id="passHelp" class="form-text mt-n1" style="font-size:10px; font-weight:bold;">숫자/영문/특수문자 중 2가지 이상 혼합</div>
	                    <div class="mb-1">
	                      <input type="password" name="password" class="form-control form-control mb-3 " placeholder="비밀번호" aria-label="password">
	                      <div class="invalid-feedback" id="pass1feedback"></div>
	                    </div>
	                    <label>비밀번호 확인</label>
	                    <div class="mb-1">
	                      <input type="password" name="password2" class="form-control form-control mb-3" placeholder="비밀번호확인" aria-label="password2">
	                      <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
	                    </div>
	                    <label>이름</label>
	                    <div class="mb-1">
	                      <input type="text" name="name" class="form-control form-control mb-3" placeholder="홍길동" aria-label="name">
	                      <div class="invalid-feedback">이름은 2글자이상 적어주세요.</div>
	                    </div>
	                    <label>주민등록번호</label>
	                    <div class="row mb-1">
	                    	<div class="col-8">
	                           <input type="text" name="personalnumber" class="form-control form-control mb-3" placeholder="123456-1234567" aria-label="personalNumber" >	                    	
	                    	</div>
	                    	<div class="col-4">
	                    		<input type="button" class="btn btn-primary w-100" style="font-size: x-small;background: #8451ce;" onclick="CheckUser()" value="중복확인"><br>
	                    	</div>
	                    </div>	                 
	                    <div class="text-center">
	                      <button type="button" id="SignUp_nextBtn" onclick="CheckStepHandler(1)" class="btn btn-primary w-100 mt-4 mb-0">다음 단계<img src="${path}/resource/img/Member/SignUp/next_w.png"/></button>
	                    </div>	        
                  </div>
                  
                  
                  <div class="container animate__animated" id="SignUp_2Section">
                  		<div class="row">
                  		<div class="col-8">
						  <label for="profileimg" class="form-label">프로필 사진 등록</label>
						  <input class="form-control form-control-sm mb-4 w-100" type="file" id="profileimg">
						</div>
						<div class="col-4">
							<img src="https://cdn-icons-png.flaticon.com/512/8053/8053055.png" style="border:1px solid #e3dee4;border-radius:50%" class="img-circle" width="70px" height="70px">
						</div>
						</div>
                  		<label>닉네임</label>
	                    <div class="mb-1">
	                      <input type="text" name="nickname" class="form-control form-control mb-3" placeholder="미기재시, 이메일의 아이디로 활동됩니다.">
	                    </div>
	                     <label>핸드폰번호</label>
	                    <div class="mb-2">
	                      <input type="text" name="phonenumber" class="form-control form-control mb-3" placeholder="010-1234-1234">
	                      <div class="invalid-feedback">13자리가 아닙니다.</div>	
	                    </div>
	                    <label>주소</label>
	                    <div class="mb-1">
	                       <div class="row">
	                       	<div class="col-4">
	                        	<input type="text" class="form-control form-control-sm" id="sample6_postcode" placeholder="우편번호">
	                        </div>
	                        <div class="col-8">
	                        	<input type="button" class="btn btn-primary w-50" style="font-size: x-small;background: #8451ce;"  onclick="AddressApi()" value="우편번호 찾기"><br>
	                        </div>
	                       </div>
							<input type="text" name="FAddress" class="form-control form-control-sm mt-n1" id="sample6_address" placeholder="주소"><br>
							<input type="text" class="form-control form-control-sm  mt-n3" id="sample6_extraAddress" placeholder="참고항목"><br>
							<input type="text" name="DAddress" class="form-control form-control-sm  mt-n3 mb-5" id="sample6_detailAddress" placeholder="상세주소">
	                    	<input type="hidden" name="address"/> <%--실제 주소로 입력될 input --%>
	                    </div>        
	                    
	                    <div class="text-center SecondSectionBtnWrap">
	                      <button type="button" id="SignUp_prevBtn" onclick="CheckStepHandler(-1)" class="btn btn-primary w-50 mt-4 me-3 mb-0">이전 단계</button><br>
	                      <button type="button" onclick="CheckStepHandler(2)" class="btn btn-primary w-50 mt-4 mb-0">최종단계 Go!</button>
	                    </div>
                  </div>
                  <div class="container animate__animated" id="SignUp_3Section">
	                    <label id="Signup_authSpan" style="font-size:large;">&#60;가입 용도 선택해주세요&#62;</label>
	                    <div class="card-group SignUp_cardgroup">
						  <div class="card" id="SignUp_SellerCard">
						    <img src="https://cdn-icons-png.flaticon.com/512/3981/3981072.png" class="card-img-top" alt="...">
						    <div class="card-body">
						      <h6 class="card-title">일반회원(셀러)</h5>
						      <p class="card-text">일반 회원으로 <span>플리마켓 홍보글 작성외</span>에는 플랫폼을 자유로이 이용가능합니다.
						      <br><br> 가입 이후에도,<br><span>사업자 전환 신청<span>이 가능합니다!</p>
						    </div>
						  </div>
						  <div class="card" id="SignUp_buisnessmanCard">
						    <img src="https://cdn-icons-png.flaticon.com/512/1378/1378542.png" class="card-img-top" alt="...">
						    <div class="card-body">
						      <h6 class="card-title">사업자(플리마켓 홍보자)</h5>
						      <p class="card-text">
						      셀러 모집 용도로<br><span>플리마켓 홍보글 작성이 가능</span>합니다.
						      <br><br> 단, 회원가입시 <span>사업자등록증이 필요</span>하며
						      <br><span>관리자의 승인 이후 홍보글 등록이 가능</span>
						      <br>합니다
						      <br><span style="color:red; font-size:8px;">가입 후, 승인 이전에도 일반회원과 동일하게<br> 플랫폼 이용이 가능합니다.</span></p>
						    </div>
						  </div>
						</div>
						<input type="hidden" name="authority" value="S"/>
						<input type="hidden" name="authoritycheck" value="false"/>
						
	                    <div class="SignUp_ProfileWrap" style="margin-left: 26px;">
						  <label for="formFile" class="form-label" style="color:red;">사업자등록등 첨부</label>
						  <input class="form-control form-control-sm" type="file" id="formFile">
						</div>
	                    <label style="font-size:large; margin:21px 0 -1px 39px;">&#60;셀러님의 주 판매 용품이 무엇인가요?&#62;</label>
	                    <label style="font-size:5px; color:#7c6da1; margin-left:30px; width: 350px;">통계에 활용됩니다. 통계창에서 최근 유행하는 상품 카테고리를 확인해보세요!</label>
	                    <div class="mb-2" >
	                      <select name="category" class="form-select form-select-sm mb-3 ms-4" aria-label=".form-select-lg example">
							  <option selected>카테고리 선택</option>
							  <option title="">여성의류</option>
							  <option title="">남성의류</option>
							  <option title="">공통의류</option>
							  <option>Two</option>
							  <option>Three</option>
							</select>
	                    </div>
	                    <div class="form-check form-check-info text-left">
	                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
	                      <label class="form-check-label" for="flexCheckDefault">
	                        <a href="" class="text-dark font-weight-bolder">이용약관</a>에 동의합니다.
	                      </label>
	                    </div>
	                    <div class="text-center SecondSectionBtnWrap">
	                      <button type="button" id="SignUp_prevBtn" onclick="CheckStepHandler(-2)" class="btn btn-primary w-50 mt-4 me-3 mb-0">이전 단계</button><br>
	                      <button type="button" onclick="SignUp_Ok()" class="btn btn-primary w-50 mt-4 mb-0">가입완료</button>
	                    </div>
                  </div>
                    
                  </form>
                </div>
                <!-- <div class="card-footer text-center pt-0 px-sm-4 px-1" id="SignUp_Login">
                  <p class="mb-4 mx-auto">
                    이미 계정이 있으신가요??
                    <a href="../../../pages/sign-in/sign-in-cover.html" class="text-primary font-weight-bold">로그인</a>
                  </p>
                </div> -->
              </div>
            </div>
            <%--오른쪽 사진에 있는 그림 --%>
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 end-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signup-ill.jpg');
          background-size: cover;">
                <span class="mask bg-primary opacity-4"></span>
                <h4 class="mt-5 text-white font-weight-bolder position-relative">당신의 <span>플리마켓</span> 여정의 시작을<br> 진심으로 응원합니다.</h4>
                <p class="text-white position-relative">ㅋㅋ!!! 좋은글귀넣기 ㅋㅋㅋ!!!</p>
              </div>
                <div class="card-footer text-center pt-0 px-sm-4 px-1" id="SignUp_Login">
                  <p class="mb-4 mx-auto">
                    이미 계정이 있으신가요??
                    <a href="../../../pages/sign-in/sign-in-cover.html" class="text-primary font-weight-bold">로그인</a>
                  </p>
                </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    

  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
  <%--회원단 js파일 --%>
  <script src="${path}/resource/js/Req1000/SignUp.js"></script>
</body>

</html>