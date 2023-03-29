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
<%@include file="header.jsp" %>
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
        <div class="container SignUp_container mt-n8 ms-10">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto" style="margin-top: -36px;">
              <div class="card card-plain">
                <div class="card-header pb-0 text-left">
                  <h4 class="font-weight-bolder mt-n3">Sign Up </h4>
                  <p class="mb-0 Signup_infomation"><span class="font-weight-bolder">step 1/3&nbsp;&nbsp;&nbsp;다음 정보를 입력해주세요.</p>
                  
                </div>
                <div class="card-body pb-3 SignUp_wrap">
                  <form id="SignUpForm"  action="insSignUp.do" method="post" enctype="multipart/form-data">
                  <div class="container animate__animated" id="SignUp_1Section">              
	                    <span class="SignUp_MustSpan"> *</span><label>이메일</label>
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
	                    <span class="SignUp_MustSpan"> *</span><label>비밀번호(8자 이상 / 16자리 이하)</label>
	                    <div id="passHelp" class="form-text mt-n1" style="font-size:10px; font-weight:bold;">숫자/영문/특수문자 중 2가지 이상 혼합</div>
	                    <div class="mb-1">
	                      <input type="password" name="password" class="form-control form-control mb-3 " placeholder="비밀번호" aria-label="password">
	                      <div class="invalid-feedback" id="pass1feedback"></div>
	                    </div>
	                   <span class="SignUp_MustSpan"> *</span> <label>비밀번호 확인</label>
	                    <div class="mb-1">
	                      <input type="password" name="password2" class="form-control form-control mb-3" placeholder="비밀번호확인" aria-label="password2">
	                      <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
	                    </div>
	                    <span class="SignUp_MustSpan"> *</span><label>이름</label>
	                    <div class="mb-1">
	                      <input type="text" name="name" class="form-control form-control mb-3" placeholder="홍길동" aria-label="name">
	                      <div class="invalid-feedback">이름은 2글자이상 적어주세요.</div>
	                    </div>
	                    <span class="SignUp_MustSpan"> *</span><label>주민등록번호</label>
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
						  <input class="form-control form-control-sm mb-4 w-100" type="file" id="profileimg" name="profileimg" onchange="RenderImg(this);">
						</div>
						<div class="col-4">
							<img id="SignUp_Profileimg" src="https://cdn-icons-png.flaticon.com/512/8053/8053055.png" style="border:1px solid #e3dee4;border-radius:50%" class="img-circle" width="70px" height="70px">
						</div>
						</div>
                  		<label>닉네임(2자이상)</label>
	                    <div class="mb-1">
	                      <input type="text" name="nickname" class="form-control form-control mb-3" placeholder="미기재시, 이메일의 아이디로 활동됩니다.">
	                    </div>
	                     <span class="SignUp_MustSpan"> *</span><label>핸드폰번호</label>
	                    <div class="mb-2">
	                      <input type="text" name="phonenumber" class="form-control form-control mb-3" placeholder="010-1234-1234">
	                      <div class="invalid-feedback">13자리가 아닙니다.</div>	
	                    </div>
	                    <span class="SignUp_MustSpan"> *</span><label>주소</label>
	                    <div class="mb-1">
	                       <div class="row">
	                       	<div class="col-4">
	                        	<input type="text" class="form-control form-control-sm" id="sample6_postcode" placeholder="우편번호" readonly>
	                        </div>
	                        <div class="col-8">
	                        	<input type="button" class="btn btn-primary w-50" style="font-size: x-small;background: #8451ce;"  onclick="AddressApi()" value="우편번호 찾기"><br>
	                        </div>
	                       </div>
							<input type="text" name="FAddress" class="form-control form-control-sm mt-n1" id="sample6_address" placeholder="주소" readonly><br>
							<input type="text" class="form-control form-control-sm  mt-n3" id="sample6_extraAddress" placeholder="참고항목" readonly><br>
							<input type="text" name="DAddress" class="form-control form-control-sm  mt-n3 mb-5" id="sample6_detailAddress" placeholder="상세주소">
	                    	<input type="hidden" name="address"/> <%--실제 주소로 입력될 input --%>
	                    </div>        
	                    
	                    <div class="text-center SecondSectionBtnWrap">
	                      <button type="button" id="SignUp_prevBtn" onclick="CheckStepHandler(-1)" class="btn btn-primary w-50 mt-4 me-3 mb-0">이전 단계</button><br>
	                      <button type="button" onclick="CheckStepHandler(2)" class="btn btn-primary w-50 mt-4 mb-0">최종단계 Go!</button>
	                    </div>
                  </div>
                  <div class="container animate__animated" id="SignUp_3Section">
	                    <label id="Signup_authSpan" style="font-size:large;"><span class="SignUp_MustSpan"> *</span>&#60;가입 용도 선택해주세요&#62;</label>
	                    <div class="card-group SignUp_cardgroup">
						  <div class="card" id="SignUp_SellerCard">
						    <img id="AuthImg" src="https://cdn-icons-png.flaticon.com/512/3981/3981072.png" class="card-img-top" alt="...">
						    <img id="AuthCheckImg" src="https://cdn-icons-png.flaticon.com/512/390/390973.png" class="" alt="...">				    						    
						    <div class="card-body">
						      <h6 class="card-title">일반회원(셀러)</h5>
						      <p class="card-text">일반 회원으로 <span>플리마켓 홍보글 작성외</span>에는 플랫폼을 자유로이 이용가능합니다.
						      <br><br> 가입 이후에도,<br><span>사업자 전환 신청<span>이 가능합니다!</p>
						    </div>
						  </div>
						  <div class="card" id="SignUp_buisnessmanCard">		  	
						    <img id="AuthImg" src="https://cdn-icons-png.flaticon.com/512/1378/1378542.png" class="card-img-top" alt="...">			
						    <img id="AuthCheckImg" src="https://cdn-icons-png.flaticon.com/512/390/390973.png" class="" alt="...">				    
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
						<input type="hidden" name="authority" value="일반셀러"/>
						
						
	                    <div class="SignUp_ProfileWrap" style="margin-left: 26px;">
						  <label for="formFile" class="form-label" style="color:red;">사업자등록번호 확인(-제외)</label>
						   <div class="row mb-n2">
	                    	<div class="col-8">
		                    	 <input type="text" name="businessnumber" class="form-control form-control mb-3" placeholder="사업자번호 (-제외)"
		                    	 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		                    	 <div id="buisnessnumberfeedback" class="invalid-feedback">등록되지않은 사업자 번호입니다.</div>
	                    	</div>
		                    	<div class="col-4">
		                    	<input type="button" class="btn btn-primary w-100" style="font-size: x-small;background: #8451ce;" onclick="exp0101()" value="사업자인증"><br>
	                    	</div>                     
	                    </div>
						</div>
	                    <label style="font-size:large; margin:21px 0 -1px 32px;"><span class="SignUp_MustSpan"> *</span>&#60;셀러님의 주 판매 용품이 무엇인가요?&#62;</label>
	                    <label style="font-size:5px; color:#7c6da1; margin-left:30px; width: 350px;">통계에 활용됩니다. 통계창에서 최근 유행하는 상품 카테고리를 확인해보세요!</label>
	                    <div class="mb-2" >
	                      <select name="category" class="form-select form-select-sm mb-3 ms-4" aria-label=".form-select-lg example">
							  <option selected>카테고리 선택</option>
							  <option>여성의류</option>
							  <option>남성의류</option>
							  <option>공통의류</option>
							  <option>아동복</option>
							  <option>잡화(지비츠,키링 등)</option>
							  <option>쥬얼리</option>
							  <option>수공예품(뜨개상품 등)</option>
							  <option>수제식품</option>
							  <option>캔들/디퓨저/향수</option>
							  <option>리빙(컵,그릇)</option>
							  <option>공방체험</option>			  
							  <option>기타</option>
							</select>
	                    </div>
	                    <div class="form-check form-check-info text-left">
	                      <input class="form-check-input" type="checkbox"  value="" id="TotTermCheck" data-bs-toggle="modal" data-bs-target="#SignUpTurmsModal" id="SignUpTurmsModalBtn" class="text-dark font-weight-bolder" onclick="return false;">
	                      <label class="form-check-label" for="flexCheckDefault" data-bs-toggle="modal" data-bs-target="#SignUpTurmsModal" id="SignUpTurmsModalBtn" class="text-dark font-weight-bolder">
	                        <b>이용약관<b>에 동의합니다.
	                      </label>
	                    </div>
	                    <div class="text-center SecondSectionBtnWrap">
	                      <button type="button" id="SignUp_prevBtn" onclick="CheckStepHandler(-2)" class="btn btn-primary w-50 mt-4 me-3 mb-0">이전 단계</button><br>
	                      <button type="button" onclick=" SignUp_Ok()" class="btn btn-primary w-50 mt-4 mb-0">가입완료</button>
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
                <h4 class="mt-5 text-white font-weight-bolder position-relative">
              콘티고와 함께하는 <br>새로운 여정의 시작을 환영합니다.
                </h4>
                <p class="text-white position-relative">Nothing great in the world has been accomplished without passion.</p>
              </div>
                <div class="card-footer text-center pt-0 px-sm-4 px-1" id="SignUp_Login">
                  <p class="mb-4 mx-auto">
                    이미 계정이 있으신가요??
                    <a href="SignIn.do" class="text-primary font-weight-bold">로그인</a>
                  </p>
                </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
  <%-- 이용약관 모달창 --%>
  <div class="modal fade" id="SignUpTurmsModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="left:-60px;top:-23px; width:700px;">
	      <div class="modal-header" style="background-color: #596cff;">
	        <h3 class="modal-title fs-6 text-center" id="MemberFindTitle" style="color: white;">이용 약관</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	     
	      <div class="modal-body">
			<b>총칙</b>
			<div style="overflow-y:scroll; height: 106px; border: 1px solid #d8cece;">
			<b>< 콘티고(주) >('Contigo.com'이하 '콘티고(Contigo)')</b>은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.<br>
			○ 이 개인정보처리방침은 2023년 3월 22부터 적용됩니다.
			</div>	
			<br>

			<b>서비스 이용계약</b>
			<div style="overflow-y:scroll; height: 150px; border: 1px solid #d8cece;">		
			<b>제1조(개인정보의 처리 목적)</b>
			< 콘티고(주) >('Contigo.com'이하 '콘티고(Contigo)')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
			1. 홈페이지 회원가입 및 관리
			회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인 목적으로 개인정보를 처리합니다.
			2. 재화 또는 서비스 제공
			서비스 제공, 콘텐츠 제공, 맞춤서비스 제공, 본인인증을 목적으로 개인정보를 처리합니다.
			3. 마케팅 및 광고에의 활용
			신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 서비스의 유효성 확인 등을 목적으로 개인정보를 처리합니다.
			<br>
			<b>제2조(개인정보의 처리 및 보유 기간)</b>
			① < 콘티고(주) >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
			② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
			1.&#60;홈페이지 회원가입 및 관리&#62;
			&#60;홈페이지 회원가입 및 관리&#62;와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다.
			보유근거 : 재가입 이용
			관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년
			예외사유 : 없음
			<br>
			<b>제3조(처리하는 개인정보의 항목)</b>
			① < 콘티고(주) >은(는) 다음의 개인정보 항목을 처리하고 있습니다.
			1< 홈페이지 회원가입 및 관리 >
			필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 이름
			선택항목 : 없음
			<br>
			<b>제4조(개인정보의 제3자 제공에 관한 사항)</b>
			① < 콘티고(주) >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
			② < 콘티고(주) >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
			1. < 콘티고(Contigo) >
			개인정보를 제공받는 자 : 콘티고(Contigo)
			제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 이름
			제공받는 자의 보유.이용기간: 3년
			<br>
			<b>제5조(개인정보처리의 위탁에 관한 사항)</b>
			① < 콘티고(주) >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
			③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
			</div>
			<br>
			<b>서비스 제공 및 이용</b>
			<div class="mb-3" style="overflow-y:scroll; height: 150px; border: 1px solid #d8cece;">	
			<b>제6조(개인정보의 파기절차 및 파기방법)</b>
			① < 콘티고(주) > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
			② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
			1. 법령 근거 :
			2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜
			③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
			1. 파기절차
			< 콘티고(주) > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 콘티고(주) > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
			2. 파기방법
			전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
			종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다
			<br>
			<b>제7조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)</b>
			① 정보주체는 콘티고(주)에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
			② 제1항에 따른 권리 행사는콘티고(주)에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 콘티고(주)은(는) 이에 대해 지체 없이 조치하겠습니다.
			③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
			④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
			⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
			⑥ 콘티고(주)은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
			<br>
			<b>제8조(개인정보의 안전성 확보조치에 관한 사항)</b>
			< 콘티고(주) >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
			1. 개인정보 취급 직원의 최소화 및 교육
			개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.
			2. 개인정보의 암호화
			이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.
			3. 개인정보에 대한 접근 제한
			개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.
			<br>
			<b>제9조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)</b>
			① 콘티고(주) 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.
			② 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
			가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
			나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
			다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
			제10조(행태정보의 수집·이용·제공 및 거부 등에 관한 사항)
			행태정보의 수집·이용·제공 및 거부등에 관한 사항			
			&#60;개인정보처리자명&#62;은(는) 온라인 맞춤형 광고 등을 위한 행태정보를 수집·이용·제공하지 않습니다.					
			<br>
			<b>제11조(추가적인 이용·제공 판단기준)</b>
			< 콘티고(주) > 은(는) ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다.
			이에 따라 < 콘티고(주) > 가(이) 정보주체의 동의 없이 추가적인 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.
			▶ 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부
			▶ 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부
			▶ 개인정보의 추가적인 이용·제공이 정보주체의 이익을 부당하게 침해하는지 여부
			▶ 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부
			※ 추가적인 이용·제공 시 고려사항에 대한 판단기준은 사업자/단체 스스로 자율적으로 판단하여 작성·공개함

			
			
			</div>
			 
 
	      </div>
	      
	      <div class="checkbox_group form-check form-check-info Trems_Wrap ms-3">
			  <label for="check_all" style="font-size: 17px;">전체 동의</label>
			  <input class="form-check-input" type="checkbox" id="cbx_chkAll" >
			  <hr style="border:1px solid gray;">
			  <label for="check_1" style="font-size: 15px;">개인정보 처리방침 동의(필수)</label>
			  <input class="form-check-input" name="Sucb" type="checkbox" id="Trem_1" class="Trem text-dark font-weight-bolder"/>
			  
			  <br>
			  <label for="check_2" style="font-size: 15px;">서비스 이용약관 동의(필수)</label>
			  <input class="form-check-input" name="Sucb" type="checkbox" id="Trem_2" class="Trem text-dark font-weight-bolder"/>
			  <br>
			  <label for="check_3" style="font-size: 15px;">마케팅 수신 동의(선택)</label>
			  <input class="form-check-input" name="Sucb" type="checkbox" id="Trem_3" class="Trem text-dark font-weight-bolder"/>
		</div>
	      <div class="modal-footer d-flex justify-content-center">
	      		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="width: 100px; background-color: #5920eb;"></button>
	      </div>
	     
	    </div>
	  </div>
	</div> <!-- sns확인모달 모달end -->
  
  

 
  <%--회원단 js파일 --%>
  <script src="${path}/resource/js/Req1000/SignUp.js"></script>
</body>

</html>