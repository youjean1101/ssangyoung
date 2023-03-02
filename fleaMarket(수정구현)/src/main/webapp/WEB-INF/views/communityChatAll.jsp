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
<title>채팅하기</title>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
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

<body class="g-sidenav-show bg-gray-100">
  <jsp:include page="header.jsp"></jsp:include>
  <div class="main-content position-relative max-height-vh-100 h-100" style="margin-top:10%;">
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-lg-4 col-md-5 col-12">
          <div class="card blur shadow-blur max-height-vh-70 overflow-auto overflow-x-hidden mb-5 mb-lg-0">
            <div class="card-header p-3">
              <h6>로그인한 닉네임님의 채팅목록</h6>
              <input type="email" class="form-control" placeholder="대화상대 검색" aria-label="Email">
            </div>
            <div class="card-body p-2">
              <a href="javascript:;" class="d-block p-2 border-radius-lg bg-gradient-primary">
                <div class="d-flex p-2">
                  <img alt="Image" src="${path}/assets/img/team-2.jpg" class="avatar shadow">
                  <div class="ms-3">
                    <div class="justify-content-between align-items-center">
                      <h6 class="text-white mb-0">Charlie Watson
                        <span class="badge badge-success"></span>
                      </h6>
                      <p class="text-white mb-0 text-sm">Typing...</p>
                    </div>
                  </div>
                </div>
              </a>
              <a href="javascript:;" class="d-block p-2">
                <div class="d-flex p-2">
                  <img alt="Image" src="${path}/assets/img/team-1.jpg" class="avatar shadow">
                  <div class="ms-3">
                    <h6 class="mb-0">Jane Doe</h6>
                    <p class="text-muted text-xs mb-2">1 hour ago</p>
                    <span class="text-muted text-sm col-11 p-0 text-truncate d-block">Computer users and programmers</span>
                  </div>
                </div>
              </a>
              <a href="javascript:;" class="d-block p-2">
                <div class="d-flex p-2">
                  <img alt="Image" src="${path}/assets/img/team-3.jpg" class="avatar shadow">
                  <div class="ms-3">
                    <h6 class="mb-0">Mila Skylar</h6>
                    <p class="text-muted text-xs mb-2">24 min ago</p>
                    <span class="text-muted text-sm col-11 p-0 text-truncate d-block">You can subscribe to receive weekly...</span>
                  </div>
                </div>
              </a>
              <a href="javascript:;" class="d-block p-2">
                <div class="d-flex p-2">
                  <img alt="Image" src="${path}/assets/img/team-5.jpg" class="avatar shadow">
                  <div class="ms-3">
                    <h6 class="mb-0">Sofia Scarlett</h6>
                    <p class="text-muted text-xs mb-2">7 hours ago</p>
                    <span class="text-muted text-sm col-11 p-0 text-truncate d-block">It’s an effective resource regardless..</span>
                  </div>
                </div>
              </a>
              <a href="javascript:;" class="d-block p-2">
                <div class="d-flex p-2">
                  <img alt="Image" src="${path}/assets/img/team-4.jpg" class="avatar shadow">
                  <div class="ms-3">
                    <div class="justify-content-between align-items-center">
                      <h6 class="mb-0">Tom Klein</h6>
                      <p class="text-muted text-xs mb-2">1 day ago</p>
                    </div>
                    <span class="text-muted text-sm col-11 p-0 text-truncate d-block">Be sure to check it out if your dev pro...</span>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-8 col-md-7 col-12">
          <div class="card blur shadow-blur max-height-vh-70">
            <div class="card-header shadow-lg">
              <div class="row">
                <div class="col-lg-10 col-8">
                  <div class="d-flex align-items-center">
                    <img alt="Image" src="${path}/assets/img/team-2.jpg" class="avatar">
                    <div class="ms-3">
                      <h6 class="mb-0 d-block">Charlie Watson</h6>
                      <span class="text-sm text-dark opacity-8">last seen today at 1:53am</span>
                    </div>
                      <!-- Button trigger modal -->
                    <button type="button" class="btn bg-gradient-success btn-block mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left:10%;">
					  대화 자세히보기>
					</button>
                  </div>
                </div>
                <div class="col-lg-1 col-2 my-auto pe-0">
                  <button class="btn btn-icon-only shadow-none text-dark mb-0 me-3 me-sm-0" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Video call">
                    <i class="ni ni-camera-compact"></i>
                  </button>
                </div>
                <div class="col-lg-1 col-2 my-auto ps-0">
                  <div class="dropdown">
                    <button class="btn btn-icon-only shadow-none text-dark mb-0" type="button" data-bs-toggle="dropdown">
                      <i class="ni ni-settings"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end me-sm-n2 p-2" aria-labelledby="chatmsg">
                      <li>
                        <a class="dropdown-item border-radius-md" href="javascript:;">
                          Profile
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-item border-radius-md" href="javascript:;">
                          Mute conversation
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-item border-radius-md" href="javascript:;">
                          Block
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-item border-radius-md" href="javascript:;">
                          Clear chat
                        </a>
                      </li>
                      <li>
                        <a class="dropdown-item border-radius-md text-danger" href="javascript:;">
                          Delete chat
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body overflow-auto overflow-x-hidden">
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        It contains a lot of good lessons about effective practices
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>3:14am</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Can it generate daily design links that include essays and data visualizations ?<br>
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mt-4">
                <div class="col-md-12 text-center">
                  <span class="badge text-dark">Wed, 3:27pm</span>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Yeah! Responsive Design is geared towards those trying to build web apps
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:31pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Excellent, I want it now !
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        You can easily get it; The content here is all free
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Awesome, blog is important source material for anyone who creates apps? <br>
                        Beacuse these blogs offer a lot of information about website development.
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-5">
                  <div class="card ">
                    <div class="card-body p-2">
                      <div class="col-12 p-0">
                        <img src="https://images.unsplash.com/photo-1602142946018-34606aa83259?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1762&q=80" alt="Rounded image" class="img-fluid mb-2 border-radius-lg">
                      </div>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:47pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        At the end of the day … the native dev apps is where users are
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        Charlie is Typing...
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer d-block">
              <form class="align-items-center">
                <div class="d-flex">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type here" aria-label="Message example input">
                  </div>
                  <button class="btn bg-gradient-primary mb-0 ms-2">
                    <i class="ni ni-send"></i>
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	
	
  <!-- Modal 창-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content"  style="width:900px;">
	      <div class="modal-header">
              <div class="row">
                 <div class="d-flex align-items-center">
                   <img alt="Image" src="${path}/assets/img/team-2.jpg" class="avatar">
                   <div class="ms-3">
                     <h6 class="mb-0 d-block">Charlie Watson</h6>
                     <span class="text-sm text-dark opacity-8">last seen today at 1:53am</span>
                   </div>
                    <button class="btn btn-icon-only shadow-none text-dark mb-0 me-3 me-sm-0" type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Video call">
                   <i class="ni ni-camera-compact"></i>
                 </button>
	               <div class="col-lg-1 col-2 my-auto ps-0">
	                 <div class="dropdown">
	                   <button class="btn btn-icon-only shadow-none text-dark mb-0" type="button" data-bs-toggle="dropdown">
	                     <i class="ni ni-settings"></i>
	                   </button>
	                   <ul class="dropdown-menu dropdown-menu-end me-sm-n2 p-2" aria-labelledby="chatmsg">
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Profile
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Mute conversation
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Block
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md" href="javascript:;">
	                         Clear chat
	                       </a>
	                     </li>
	                     <li>
	                       <a class="dropdown-item border-radius-md text-danger" href="javascript:;">
	                         Delete chat
	                       </a>
	                     </li>
	                   </ul>
	                 </div>
	               </div>
                 </div>
             </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color:black; font-size:20pt; font-weigth:bold;">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
          <div class="card blur shadow-blur max-height-vh-70">
            <div class="card-body overflow-auto overflow-x-hidden">
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        It contains a lot of good lessons about effective practices
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>3:14am</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Can it generate daily design links that include essays and data visualizations ?<br>
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row mt-4">
                <div class="col-md-12 text-center">
                  <span class="badge text-dark">Wed, 3:27pm</span>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Yeah! Responsive Design is geared towards those trying to build web apps
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:31pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Excellent, I want it now !
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        You can easily get it; The content here is all free
                      </p>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-1">
                        Awesome, blog is important source material for anyone who creates apps? <br>
                        Beacuse these blogs offer a lot of information about website development.
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start mb-4">
                <div class="col-5">
                  <div class="card ">
                    <div class="card-body p-2">
                      <div class="col-12 p-0">
                        <img src="https://images.unsplash.com/photo-1602142946018-34606aa83259?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1762&q=80" alt="Rounded image" class="img-fluid mb-2 border-radius-lg">
                      </div>
                      <div class="d-flex align-items-center text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:47pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-end text-right mb-4">
                <div class="col-auto">
                  <div class="card bg-gray-200">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        At the end of the day … the native dev apps is where users are
                      </p>
                      <div class="d-flex align-items-center justify-content-end text-sm opacity-6">
                        <i class="ni ni-check-bold text-sm me-1"></i>
                        <small>4:42pm</small>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-start">
                <div class="col-auto">
                  <div class="card ">
                    <div class="card-body py-2 px-3">
                      <p class="mb-0">
                        Charlie is Typing...
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer d-block">
              <form class="align-items-center">
                <div class="d-flex">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type here" aria-label="Message example input">
                  </div>
                  <button class="btn bg-gradient-primary mb-0 ms-2">
                    <i class="ni ni-send"></i>
                  </button>
                </div>
              </form>
            </div>
        </div>
	      </div>
	    </div>
	  </div>
	</div>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
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