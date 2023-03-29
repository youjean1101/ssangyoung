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
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <title>
    콘티고 로그인
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
  <link href="${path}/resource/css/Req1000/SignIn.css" rel="stylesheet" />
  <%@include file="header.jsp" %> 

</head>
<script type="text/javascript">

var Loginemail = '${mem.email}'

$(document).ready(function(){
	
});
var msg = "${LoginMsg}";
if (msg !== '') {
	  Swal.fire({
	    text: msg,
	    icon: 'error'
	  });
	}	
</script>
<body class="">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
		<%--여기에 navbar들어가야함 --%>
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-start">
                  <h4 class="font-weight-bolder">Sign In</h4>
                  <p class="mb-0">아이디와 비밀번호를 입력해주세요.</p>
                </div>
                <div class="card-body">
                  <form role="form" id="LoginForm" action="Login.do" method="post">
                    <div class="mb-3">
                      <input type="email" name="email" class="form-control form-control-lg"
                       		placeholder="Email" aria-label="Email" required>
                    </div>
                    <div class="mb-3">
                      <input type="password" name="password" class="form-control form-control-lg"
                      		 placeholder="Password" aria-label="Password" required>
                    </div>
                    <div class="row">
	                    <div class="form-check form-switch col-6">
	                    </div>
                        <div class="col-6" id="Memberfind_Wrap">
                           <button type="button" onclick="MemberFindModal('id')">아이디 찾기</button>	
                           <button type="button" onclick="MemberFindModal('pass')">비밀번호찾기</button>	
                        </div>
                    </div>
                    
                    <div class="text-center">
                      <button type="submit" class="btn btn-primary btn-md w-75 mt-4 mb-0">로 그 인</button>
                       <div class="row mt-3">
                       <input type="hidden" name="snsemail">
	                       <div class="col-6">
	 							<img src="${path}/resource/img/Member/SignIn/kakao_login_medium_narrow.png" style="height:41px;" onclick="kakaoLogin()">
	                       
	                       </div>
	                       <div class="col-6 ms-n3">
	                          <div id="naver_id_login"></div>
	                       </div>
					   </div>
                    </div>
                  </form>
                </div>
                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-4 text-sm mx-auto">
                    아직 계정이 없으신가요?&nbsp;&nbsp;
                    <a href="SignUp.do" class="text-primary text-gradient font-weight-bold">회원가입</a>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 end-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/signin-ill.jpg');
          background-size: cover;">
                <span class="mask bg-gradient-primary opacity-6"></span>
                <h4 class="mt-5 text-white font-weight-bolder position-relative">" 여러분이 할 수 있는 가장 큰 모험은 <br>바로 여러분이 꿈꿔오던 삶을 사는 것입니다."</h4>
                <p class="text-white position-relative">The biggest adventure you can ever take is to live the life of your dreams.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!-- SNS연동 모달 창 -->
  <div data-bs-toggle="modal" data-bs-target="#SnsresultModal" id="SnsresultModalbtn"></div>
	<div class="modal fade" id="SnsresultModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content SnsresultModalContent" style="top:119px;">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5 text-center" id="staticBackdropLabel">연동 결과</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">닫기</button>
	      </div>
	     
	      <div class="modal-body">
			<div class="mb-3">
			  <textarea class="form-control" rows="3" id="SNSLoginTextArea"></textarea>
			</div>
			<div class="mb-3 mt-3" style="color:red; font-weight:bold" id="SNSLoginTextAreaAfter"></div>
			<div class="mb-3">
				<input type="hidden" id="snsemail">
				<input type="hidden" id="snsname">
				<button type="button" class="btn btn-primary" id="SNSLoginbnt"></button>
			</div>
	      </div>
	      
	      <div class="modal-footer">
	        회사소개 | 이용약관 | <strong>개인정보처리방침</strong>
	      </div>
	     
	    </div>
	  </div>
	</div> <!-- sns확인모달 모달끝 -->
	
<!-- 아이디 비밀번호 찾기 모달창 -->
  <div data-bs-toggle="modal" data-bs-target="#MemberFindModal" id="MemberFindModalbtn"></div>
	<div class="modal fade" id="MemberFindModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="top:119px;">
	      <div class="modal-header" style="background-color: #596cff;">
	        <h3 class="modal-title fs-6 text-center" id="MemberFindTitle" style="color: white;">아이디 찾기</h3>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	     
	      <div class="modal-body">
			<div class="card multisteps-form__panel p-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <div class="multisteps-form__content">
                      <div class="row mt-3 mb-3">
                        <div class="col-12 col-sm-6">
                          <label>성함</label>
                          <input class="multisteps-form__input form-control" name="name" type="text" placeholder="홍길동" />
                        </div>
                        <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                          <label>주민등록번호 (-포함)</label>
                          <input class="multisteps-form__input form-control" name="personalnumber" type="text" placeholder="950101-1234567" />
                        </div>
                      </div>
                      <div class="row mt-3 MemberFindEmail_Wrap">
                        <div class="col-12 mt-3 mt-sm-0">
                          <label>이메일</label>
                          <input class="multisteps-form__input form-control mb-5" type="email" name="email" placeholder="Contigo@contigo.com" />
                        </div>
                      </div>
                      <div id="MemberFindResult"></div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn ms-auto me-3" type="button" style="background-color:#596cff; color:white;" onclick="MemberFindHandler()">찾기</button>
                    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                      </div>
                    </div>
                  </div>
                  <!--single form panel-->
	      </div>
	      
	      <div class="modal-footer">
	        회사소개 | 이용약관 | <strong>개인정보처리방침</strong>
	      </div>
	     
	    </div>
	  </div>
	</div> <!-- sns확인모달 모달끝 -->
  <!--   Core JS Files   -->
 
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
   <script src="${path}/resource/js/Req1000/SignIn.js"></script>	
</body>

</html>