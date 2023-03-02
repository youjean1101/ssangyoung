<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
   	head
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
  <style>
  .profile{
    display: flex;
    margin-right: 45px;
  }
  .profilename{
    display: flex;
    align-items: center;
  }
  .showli{
    padding-left:200px;
  }
  .lav{
   margin-right:50px;
   flex-wrap: nowrap;
  }
  .showli2{
    padding-right:100px;
  }
  .logo_width{
    width : 60px;
    height : 60px;
  }
  
  </style>
</head>

<body class="">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>

  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
          <div class="container-fluid ps-2 pe-0">
            <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="${path}/pages/dashboards/default.html">
              <img src="${path}/resource/img/fleamarketLOGO.png" alt="..." class="avatar shadow" style="width:220px;">
            </a>
            <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon mt-2">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </span>
            </button>
            <div class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0" id="navigation">
              <ul class="navbar-nav navbar-nav-hover mx-auto showli">
                <li class="nav-item dropdown dropdown-hover mx-2">   
                  <a role="button" class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center " id="dropdownMenuAccount" data-bs-toggle="dropdown" aria-expanded="false">
                    플리마켓
                    <img src="${path}/assets/img/down-arrow-dark.svg " alt="down-arrow" class="arrow ms-1 d-lg-block d-none">
                    <img src="${path}/assets/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-1 d-lg-none d-block">
                  </a>
                  <div class="dropdown-menu dropdown-menu-animation dropdown-lg border-radius-xl p-3 mt-0 mt-lg-3 shadow-none" aria-labelledby="dropdownMenuAccount">
                    <div class="row d-none d-lg-flex">
                      <div class="col-6">
                        <div class="py-6 h-100 w-100 d-flex border-radius-lg position-relative dropdown-image" style="background-image:url('https://images.unsplash.com/photo-1635944095210-23114a1fb7c0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1335&q=80')">
                          <div class="mask bg-gradient-primary border-radius-lg"></div>
                          <div class="d-flex justify-content-center align-items-center text-center text-white font-weight-bold w-100 z-index-1 flex-column">
                            <span class="text-lg">플리마켓<br>알아보기</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-6 ps-0 d-flex justify-content-center flex-column">
                        <ul class="list-group">
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownSignIn">
                              <span>Sign In</span>
                              <img src="${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownSignIn">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/basic.html">
                                <span>Basic</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/cover.html">
                                <span>Cover</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/illustration.html">
                                <span>Illustration</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownSignUp">
                              <span>Sign Up</span>
                              <img src="${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownSignUp">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/basic.html">
                                <span>Basic</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/cover.html">
                                <span>Cover</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/illustration.html">
                                <span>Illustration</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownPasswordReset">
                              <span>Reset Password</span>
                              <img src="${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownPasswordReset">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/reset/basic.html">
                                <span>Basic</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/reset/cover.html">
                                <span>Cover</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/reset/illustration.html">
                                <span>Illustration</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownLock">
                              <span>Lock</span>
                              <img src="${path}/${path}/${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownLock">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/lock/basic.html">
                                <span>Basic</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/lock/cover.html">
                                <span>Cover</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/lock/illustration.html">
                                <span>Illustration</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdown2fa">
                              <span>2-Step Verification</span>
                              <img src="${path}/${path}/${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdown2fa">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/verification/basic.html">
                                <span>Basic</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/verification/cover.html">
                                <span>Cover</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/verification/illustration.html">
                                <span>Illustration</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownError">
                              <span>Error</span>
                              <img src="${path}/${path}/${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownError">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/error/404.html">
                                <span>404</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/error/500.html">
                                <span>500</span>
                              </a>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>               
                  </div>
                </li>
              </ul>
              <ul class="navbar-nav navbar-nav-hover mx-auto showli2">
                <li class="nav-item dropdown dropdown-hover mx-2">
                  <a role="button" class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center " id="dropdownMenuAccount" data-bs-toggle="dropdown" aria-expanded="false">
                    커뮤니티 
                    <img src="${path}/assets/img/down-arrow-dark.svg " alt="down-arrow" class="arrow ms-1 d-lg-block d-none">
                    <img src="${path}/assets/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-1 d-lg-none d-block">
                  </a>
                  <div class="dropdown-menu dropdown-menu-animation dropdown-lg border-radius-xl p-3 mt-0 mt-lg-3 shadow-none" aria-labelledby="dropdownMenuAccount">
                    <div class="row d-none d-lg-flex">
                      <div class="col-6">
                        <div class="py-6 h-100 w-100 d-flex border-radius-lg position-relative dropdown-image" style="background-image:url('https://images.unsplash.com/photo-1635944095210-23114a1fb7c0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1335&q=80')">
                          <div class="mask bg-gradient-primary border-radius-lg"></div>
                          <div class="d-flex justify-content-center align-items-center text-center text-white font-weight-bold w-100 z-index-1 flex-column">
                            <span class="text-lg">커뮤니티<br>알아보기<br></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-6 ps-0 d-flex justify-content-center flex-column">
                        <ul class="list-group">
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownSignIn">
                              <span>커뮤니티보기</span>
                              <img src="${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownSignIn">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/basic.html">
                                <span>홍보</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/cover.html">
                                <span>사는 이야기</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/illustration.html">
                                <span>꿀팁</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signin/illustration.html">
                                <span>사업 아이디어</span>
                              </a>
                            </div>
                          </li>
                          <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
                            <a class="dropdown-item border-radius-md ps-3 d-flex align-items-center justify-content-between mb-1" id="dropdownSignUp">
                              <span>소통</span>
                              <img src="${path}/assets/img/down-arrow.svg" alt="down-arrow" class="arrow">
                            </a>
                            <div class="dropdown-menu mt-0 py-3 px-2" aria-labelledby="dropdownSignUp">
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/basic.html">
                                <span>나의 채팅목록</span>
                              </a>
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/cover.html">
                                <span>my Room</span>
                              </a>                         
                              <a class="dropdown-item ps-3 border-radius-md mb-1" href="${path}/pages/authentication/signup/cover.html">
                                <span>나의 팔로워목록</span>
                              </a>                         
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>
                   </div>
                </li>
              </ul>
              <ul>
			      <img src="${path}/assets/img/kit/pro/team-2.jpg" alt="..." class="avatar shadow">
			      <div class="name ps-3 profilename">
			        <div class="col-2 m-auto">
			        	<span>Mathew Glock</span>
			        </div>
			      </div>
			        <div class="col-1 m-auto">
			          <a class="cursor-pointer">
			            <i class="fa fa-cog fixed-plugin-button-nav"></i>
			          </a>
			        </div>
			        <div class="col-1 m-auto">
			          <div class="dropdown">
			            <a class="cursor-pointer" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			              <i class="fa fa-bell"></i>
			            </a>
			            <ul class="dropdown-menu dropdown-menu-right px-2 py-3 ms-n4" aria-labelledby="dropdownMenuButton">
			              <li>알람내역
			            </ul>
			          </div>
			        </div>
			      </div>
			      </div>
		      </ul>
			</nav>
		</div>
	</div>
	</div>
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
</body>

</html>