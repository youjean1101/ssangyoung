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
  
  <link rel="apple-touch-icon" sizes="76x76" href="../../../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../../assets/img/favicon.png">
  <title>
    회원가입
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../../../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../../../assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>
<style>

#SignUp_secondSection{
	display:none;
	position: absolute;
	top: 80px;
}
.SignUp_wrap{ /* 회원가입틀 wrap */
	margin-top: -5px;
}
.Signup_infomation{ /* step1/2 글자 위치 */
	position: absolute;
    top: 17px;
    right: -50px;
}
.SecondSectionBtnWrap{ /* 2번째 섹션 버튼그룹 wrap */
	display:flex;
	margin-top: -20px;
	margin-left: 22px;
    width: 351px;
}
.SignUp_container{ /* 회원가입 틀 위치조정 */
	margin-top: -10px;
	margin-left: 141px;
}
.SignUp_cardgroup{ /* 사업자/셀러 카드그룹 크기 */
	width: 553px;
	margin-left: -76px;
}
.SignUp_cardgroup .card{
	border:1px solid;
}
.SignUp_cardgroup .card img{
	width: 57px;
    margin-left: 112px;
    margin-top: 17px;
}
.SignUp_cardgroup .card p{
	font-size:12px;
}
.SignUp_cardgroup .card p span{
	font-weight:bold;
}
#Signup_authSpan{
	margin-left: 108px;
    margin-top: 22px;
}
#SignUp_nextBtn{
    position: absolute;
    top: 44%;
    right: -38%;
    background-color: #a28adf;
}
#SignUp_nextBtn img{
   width: 24px;
}
#SignUp_prevBtn{
	background-color: #a28adf;
}
</style>
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
                  <h4 class="font-weight-bolder">Sign Up </h4>
                  <p class="mb-0 Signup_infomation"><span class="font-weight-bolder">step 1/2</span><br>가입하실 회원님의 정보를 입력해주세요.</p>
                  
                </div>
                <div class="card-body pb-3 SignUp_wrap">
                  <form role="form">
                  <div class="container animate__animated" id="SignUp_firstSection">              
	                     <label>이메일</label>
	                    <div class="mb-1">
	                      <input type="email" class="form-control form-control-sm" placeholder="example@doamin.com" aria-label="email">
	                    </div>
	                    <label>비밀번호</label>
	                    <div class="mb-1">
	                      <input type="password" class="form-control form-control-sm " placeholder="비밀번호" aria-label="password">
	                    </div>
	                    <label>비밀번호 확인</label>
	                    <div class="mb-1">
	                      <input type="password" class="form-control form-control-sm" placeholder="비밀번호확인" aria-label="password2">
	                    </div>
	                    <label>이름</label>
	                    <div class="mb-1">
	                      <input type="text" class="form-control form-control-sm" placeholder="홍길동" aria-label="name" name="name">
	                    </div>
	                    <label>주민등록번호</label>
	                    <div class="mb-1">
	                      <input type="text" class="form-control form-control-sm" placeholder="123456-1234567" aria-label="personalNumber" name="personalnumber">
	                    </div>	
	                    <label>핸드폰번호</label>
	                    <div class="mb-2">
	                      <input type="text" class="form-control form-control-sm" placeholder="PhoneNumber" aria-label="PhoneNumber" name=phonenumber>
	                    </div>
	                    <label>주소</label>
	                    <div class="mb-1">
	                       <div class="row">
	                       	<div class="col-4">
	                        	<input type="text" class="form-control form-control-sm" id="sample6_postcode" placeholder="우편번호">
	                        </div>
	                        <div class="col-8">
	                        	<input type="button" class="btn btn-primary w-50" style="font-size: x-small"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	                        </div>
	                       </div>
							<input type="text" class="form-control form-control-sm mt-n1" id="sample6_address" placeholder="주소"><br>
							<input type="text" class="form-control form-control-sm  mt-n3" id="sample6_extraAddress" placeholder="참고항목"><br>
							<input type="text" class="form-control form-control-sm  mt-n3" id="sample6_detailAddress" placeholder="상세주소">
	                    </div>                    
	                    <div class="text-center">
	                      <button type="button" id="SignUp_nextBtn" onclick="SignUpNext()" class="btn btn-primary w-25 mt-4 mb-0">다음 단계<img src="${path}/resource/img/Member/SignUp/next_w.png"/></button>
	                    </div>	        
                  </div>
                  
                  
                  <div class="container animate__animated" id="SignUp_secondSection">
	                    <label id="Signup_authSpan" style="font-size:large;">가입 용도 선택해주세요</label>
	                    <div class="card-group SignUp_cardgroup">
						  <div class="card">
						    <img src="https://cdn-icons-png.flaticon.com/512/3981/3981072.png" class="card-img-top" alt="...">
						    <div class="card-body">
						      <h6 class="card-title">일반회원(셀러)</h5>
						      <p class="card-text">일반 회원으로 <span>플리마켓 홍보글 작성외</span>에는 플랫폼을 자유로이 이용가능합니다.</p>
						    </div>
						  </div>
						  <div class="card">
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
	                    <label style="font-size:large; margin:21px 0 -1px 55px;">셀러님의 주 판매 용품이 무엇인가요?</label>
	                    <label style="font-size:5px; color:#7c6da1; margin-left:30px; width: 350px;">통계에 활용됩니다. 통계창에서 최근 유행하는 상품 카테고리를 확인해보세요!</label>
	                    <div class="mb-2" >
	                      <select class="form-select form-select-md mb-3 ms-4" aria-label=".form-select-lg example">
							  <option selected>카테고리 선택</option>
							  <option value="1" title="http://www.w3.org/2000/svg">여성의류</option>
							  <option value="1" title="">남성의류</option>
							  <option value="1" title="">공통의류</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
	                    </div>
	                    <div class="form-check form-check-info text-left">
	                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
	                      <label class="form-check-label" for="flexCheckDefault">
	                        <a href="../../../pages/privacy.html" class="text-dark font-weight-bolder">이용약관</a>에 동의합니다.
	                      </label>
	                    </div>
	                    <div class="text-center SecondSectionBtnWrap">
	                      <button type="button" id="SignUp_prevBtn" onclick="SignUpNext()" class="btn btn-primary w-50 mt-4 me-3 mb-0">이전 단계</button><br>
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
  <script src="../../../assets/js/core/popper.min.js"></script>
  <script src="../../../assets/js/core/bootstrap.min.js"></script>
  <script src="../../../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../../../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="../../../assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="../../../assets/js/plugins/jkanban/jkanban.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    
    //회원가입 양식 애니메이션
    const firstSection = document.querySelector('#SignUp_firstSection');
	const secondSection = document.querySelector('#SignUp_secondSection');
	secondSection.style.display ='none';
	//다음버튼눌렀을 때,
    function SignUpNext(){
    firstSection.classList.add('animate__fadeOutLeft'); // 엘리먼트에 애니메이션 클래스 부여
    }
    firstSection.addEventListener('animationend', () => {
    	secondSection.style.display ='block';
    	secondSection.classList.add('animate__fadeInRight');
    });
    
    
    
    function SignUp_Ok(){
    	console.log($('[name=name]').val()+":"+$('[name=rrn]').val())
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../../../assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

</html>