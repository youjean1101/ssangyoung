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
<title>팔로우 회원 조회</title>
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
	  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			if($("#index").keycode==13){
				$("#indextform").submit()
			}
			
			var login = "${Login.email}"
			if(login==""){
				alert("[안내메시지]로그인을 하셔야 이용이 가능합니다.")
				location.href="${path}/SignIn.do"
			}
			
			var msg = "${msg}"
			if(msg=="언팔로우"){
				location.href="${path}/communityFollowMember.do?myemail="+login
			}
		});
		
	</script>

</head>

<body class="g-sidenav-show  bg-gray-100">
  <jsp:include page="header.jsp"></jsp:include>
  <main class="main-content position-relative border-radius-lg" style="margin-top:10%;">
    <!-- End Navbar -->
          <div class="card" style="width:95%; margin-left:2.5%; margin-top:10%;">
          <div class="card-header p-3">
		       <h6 style="font-size:20pt;">${Login.nickname}님의 팔로우 회원목록</h6>
		       <form id="indexform">
		       	<input type="hidden" name="myemail" value="${Login.email}" />
		       	<input type="text" id="index" name="keyword" class="form-control" placeholder="회원검색(닉네임/이메일)" />
		       </form>
	      </div>
            <div class="table-responsive">
              <table class="table align-items-center mb-0">
                <thead>
                  <tr>
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7">프로필&닉네임</th>
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">구분</th>
                    <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">이메일</th>
                    <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">room이동</th>
                    <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">채팅하기</th>
                    <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">언팔로우</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="followers" items="${follower}">
                  <tr><!-- onclick="goEmail('${followers.email}')" -->
                    <td>
                      <div class="d-flex px-2 py-1">
                        <div>
                          <img src="${path}/resource/img/Member/profileimg/${followers.profileimg}" 
                          	class="avatar avatar-sm me-3" alt="avatar image">
                        </div>
                        <div class="d-flex flex-column justify-content-center">
                          <h6 class="mb-0 text-sm">${followers.nickname}</h6>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p class="text-sm text-secondary mb-0">${followers.authority}</p>
                    </td>
                    <td class="align-middle text-center text-sm">
                      <p class="text-secondary mb-0 text-sm">${followers.email}</p>
                    </td>
                    <td class="align-middle text-center">
                    	<a href="communityMemberRoom.do?email=${followers.email}" ><i class="ni ni-shop"></i></a>
                      <!-- <button type="button" id="roomGo" class="text-secondary text-sm roomGo" style="border:none; background:none;"><i class="ni ni-shop"></i></button> -->
                    </td>
                    <td class="align-middle text-center">
                     <%--  <a href="chatting.do?myemail=${followers.email}" ><i class="ni ni-chat-round"></i></a> --%>
                      <button type="button" id="chatGo" class="text-secondary text-sm chatGo" 
                      	style="border:none; background:none;"
                      	data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="ni ni-chat-round"></i>
                      </button>
                    </td>
                    <td class="align-middle text-center">
                      <a href="communityFollowDelete.do?myemail=${Login.email}&following=${followers.email}" >
                      		<i class="ni ni-scissors"></i></a>
                      <!-- <button type="button" id="unfollowGo" class="text-secondary text-sm unfollowGo" style="border:none; background:none;">
                      		<i class="ni ni-scissors"></i>
                      </button> -->
                    </td>
                  </tr>
           		 </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
  </main>
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
  <script src="${path}/assets/js/plugins/chartjs.min.js"></script>
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