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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>내 정보 조회 및 수정</title>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
 <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" /> 
</head>
<script type="text/javascript">
$(document).ready(function(){

})
var SessEmail = '${Login.email}'
/* window.onmousewheel = function(e){
	console.log(e)
	var SHLB = $('.sideheadernav').width()
	
	
	$('.sideheadernavLogoutBtn').css("width",SHLB)
	
} */

</script>
<style>
main{
  padding-left: 275px;
}
li{
    list-style:none;
 } 
</style>
<body>
	
	<aside
		class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href="callmain.do"> <img src="${path}/assets/img/logo2.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold">CONTIGO 당신과 함께</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto h-auto"
			id="sidenav-collapse-main">
			<ul class="navbar-nav sideheadernav">
				<li class="nav-item"><a href="MemberInfo.do" class="nav-link "
					aria-controls="dashboardsExamples" role="button"
					aria-expanded="false">
						<div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-shop text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">${Login.name}님 </span>
				</a>
				<li class="nav-item mt-3">
					<h6 class="ps-4  ms-2 text-uppercase text-xs font-weight-bolder opacity-6">PAGES</h6>
				</li>
				<li class="nav-item active">
				<a data-bs-toggle="collapse" href="#pagesExamples" class="nav-link" aria-controls="pagesExamples" role="button" aria-expanded="false">
					<div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
						<i class="ni ni-single-02 text-warning text-sm opacity-10"></i>
					</div>
					<span class="nav-link-text ms-1">회원</span>
				</a>
				<c:choose>
				<%--관리자로 들어오면 나오는 메뉴 --%>
				<c:when test="${Login.authority!='관리자'}">
					<div class="collapse " id="pagesExamples">
						<ul class="nav ms-4">
							<li class="nav-item active">
								<a class="nav-link" href="MemberInfo.do">
								  <span class="sidenav-normal">내 정보 조회<b class="caret"></b></span>
								</a>
							</li>	
						</ul>
					</div>		
				</c:when>
				<%--회원으로 들어오면 나오는 메뉴들 --%>
				<c:otherwise>
					<div class="collapse" id="pagesExamples">
						<ul class="nav ms-4">
							<li class="nav-item active">
								<a class="nav-link" href="AdminSearch.do">
								  <span class="sidenav-normal">회원목록조회<b class="caret"></b></span>
								</a>
							</li>	
						</ul>
						<ul class="nav ms-4">
							<li class="nav-item active">
								<a class="nav-link" href="show.do">
								  <span class="sidenav-normal">커뮤니티 신고관리<b class="caret"></b></span>
								</a>
							</li>	
						</ul>
					</div>
				</c:otherwise>
				</c:choose>
				
				
				</li>
				<c:if test="${Login.authority!='관리자'}">
				<li class="nav-item">
				<a data-bs-toggle="collapse" href="#applicationsExamples" class="nav-link" aria-controls="applicationsExamples" role="button" aria-expanded="false">
						<div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-ui-04 text-info text-sm opacity-10"></i>
						</div> 
						
						<span class="nav-link-text ms-1">내가 쓴 글</span>
				</a>
					<div class="collapse " id="applicationsExamples">
						<ul class="nav ms-4">
								<!--관리자 일 때 추가하기-->
								<!-- 사업자일때 -->
						<c:if test="${Login.authority=='사업자'}">
							<li class="nav-item ">
								<a class="nav-link " href="MemberFmReg.do?title=${Login.email}"> 
									<span class="sidenav-normal">플리마켓 모집</span>
								</a>
							</li>
					</c:if>
							<li class="nav-item ">
								<a class="nav-link " href="appMyList.do"> 
									<span class="sidenav-normal">내 신청 조회</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link " href="appReceivedList.do"> 
									<span class="sidenav-normal">받은 신청 조회</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link " href="MemberInquire.do?title=${Login.email}"> 
									<span class="sidenav-normal">문의하기</span>
								</a>
							</li>
						</ul>
					</div>
			</li>
				</c:if>
				<%--nav-item --%>
			
				<li class="nav-item">
				<a data-bs-toggle="collapse" href="#PageMove" class="nav-link" aria-controls="applicationsExamples" role="button" aria-expanded="false">
						<div class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
 							<i class="ni ni-single-copy-04 text-danger text-sm opacity-10"></i>						</div> 
						<span class="nav-link-text ms-1">사이트</span>
				</a>
					<div class="collapse " id="PageMove">
						<ul class="nav ms-4">
							<li class="nav-item ">
								<a class="nav-link " href="totalSearch.do"> 
									<span class="sidenav-normal">플리마켓</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link " href="QNAList.do"> 
									<span class="sidenav-normal">고객센터</span>
								</a>
							</li>
							<c:if test="${Login.authority=='관리자'}">
							<li class="nav-item ">
								<a class="nav-link" href="MemberQnAreg.do"> 
									<span class="sidenav-normal">공지사항 등록</span>
								</a>
							</li>
							</c:if>
							<c:if test="${Login.authority!='관리자'}">
							<li class="nav-item ">
								<a class="nav-link" href="MemberQnAreg.do"> 
									<span class="sidenav-normal">문의사항 등록</span>
								</a>
							</li>
							</c:if>
							<c:if test="${Login.authority!='관리자'}">
							<li class="nav-item ">
								<a class="nav-link" href="${path}/communityMemberRoom.do?email=${Login.email}"> 
									<span class="sidenav-normal">마이룸</span>
								</a>
							</li>
							<li class="nav-item ">
								<a class="nav-link" href="${path}/communityFollowMember.do?myemail=${Login.email}"> 
									<span class="sidenav-normal">나의 팔로워</span>
								</a>
							</li>
							</c:if>
						</ul>
						
					</div>
						
				</li>			
			</ul>
				<a class="btn sideheadernavLogoutBtn" style="position:absolute;width:250px; background:#e45e72;color:white;" onclick="kakaoLogOut()">로그아웃</a>
			
			<%--nav-item --%>
				
				</div>
			</li>
		</ul>
	</div>
	</li>
			</ul>
		</div>
	
	
	</aside> 
	<div class="fixed-plugin">
		<a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
			<i class="fa fa-cog py-2"> </i>
		</a>
		<div class="card shadow-lg">
			<div class="card-header pb-0 pt-3 bg-transparent ">
				<div class="float-start">
					<h5 class="mt-3 mb-0">Argon Configurator</h5>
					<p>See our dashboard options.</p>
				</div>
				<div class="float-end mt-4">
					<button
						class="btn btn-link text-dark p-0 fixed-plugin-close-button">
						<i class="fa fa-close"></i>
					</button>
				</div>
				<!-- End Toggle Button -->
			</div>
			<hr class="horizontal dark my-1">
			<div class="card-body pt-sm-3 pt-0 overflow-auto">
				<!-- Sidebar Backgrounds -->
				<div>
					<h6 class="mb-0">Sidebar Colors</h6>
				</div>
				<a href="javascript:void(0)" class="switch-trigger background-color">
					<div class="badge-colors my-2 text-start">
						<span class="badge filter bg-gradient-primary active"
							data-color="primary" onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-dark" data-color="dark"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-info" data-color="info"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-success" data-color="success"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-warning" data-color="warning"
							onclick="sidebarColor(this)"></span> <span
							class="badge filter bg-gradient-danger" data-color="danger"
							onclick="sidebarColor(this)"></span>
					</div>
				</a>
				<!-- Sidenav Type -->
				<div class="mt-3">
					<h6 class="mb-0">Sidenav Type</h6>
					<p class="text-sm">Choose between 2 different sidenav types.</p>
				</div>
				<div class="d-flex">
					<button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2"
						data-class="bg-white" onclick="sidebarType(this)">White</button>
					<button class="btn bg-gradient-primary w-100 px-3 mb-2"
						data-class="bg-default" onclick="sidebarType(this)">Dark</button>
				</div>
				<p class="text-sm d-xl-none d-block mt-2">You can change the
					sidenav type just on desktop view.</p>
				<!-- Navbar Fixed -->
				<div class="d-flex my-3">
					<h6 class="mb-0">Navbar Fixed</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="navbarFixed" onclick="navbarFixed(this)">
					</div>
				</div>
				<hr class="horizontal dark mb-1">
				<div class="d-flex my-4">
					<h6 class="mb-0">Sidenav Mini</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="navbarMinimize" onclick="navbarMinimize(this)">
					</div>
				</div>
				<hr class="horizontal dark my-sm-4">
				<div class="mt-2 mb-5 d-flex">
					<h6 class="mb-0">Light / Dark</h6>
					<div class="form-check form-switch ps-0 ms-auto my-auto">
						<input class="form-check-input mt-1 ms-auto" type="checkbox"
							id="dark-version" onclick="darkMode(this)">
					</div>
				</div>
				<a class="btn btn-primary w-100"
					href="https://www.creative-tim.com/product/argon-dashboard-pro">Buy
					now</a> <a class="btn btn-dark w-100"
					href="https://www.creative-tim.com/product/argon-dashboard">Free
					demo</a> <a class="btn btn-outline-dark w-100"
					href="https://www.creative-tim.com/learning-lab/bootstrap/overview/argon-dashboard">View
					documentation</a>
				<div class="w-100 text-center">
					<a class="github-button"
						href="https://github.com/creativetimofficial/ct-argon-dashboard-pro"
						data-icon="octicon-star" data-size="large" data-show-count="true"
						aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
					<h6 class="mt-3">Thank you for sharing!</h6>
					<a
						href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20PRO%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard-pro"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
					</a> <a
						href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard-pro"
						class="btn btn-dark mb-0 me-2" target="_blank"> <i
						class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="${path}/assets/js/core/popper.min.js"></script>
	<script src="${path}/assets/js/core/bootstrap.min.js"></script>
	<script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="${path}/assets/js/plugins/datatables.js"></script>
	<script src="${path}/assets/js/plugins/quill.min.js"></script>
	<script src="${path}/assets/js/plugins/choices.min.js"></script>
	<script src="${path}/assets/js/plugins/dropzone.min.js"></script>
		<script src="${path}/assets/js/plugins/flatpickr.min.js"></script>
	<script>
    if (document.getElementById('products-list')) {
      const dataTableSearch = new simpleDatatables.DataTable("#products-list", {
        searchable: true,
        fixedHeight: false,
        perPage: 7
      });

      document.querySelectorAll(".export").forEach(function(el) {
        el.addEventListener("click", function(e) {
          var type = el.dataset.type;

          var data = {
            type: type,
            filename: "soft-ui-" + type,
          };

          if (type === "csv") {
            data.columnDelimiter = "|";
          }

          dataTableSearch.export(data);
        });
      });
    };
  </script>
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
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
	<script src="${path}/resource/js/Req1000/sideheader.js"></script>
</body>

</html>