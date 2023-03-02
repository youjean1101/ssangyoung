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
<<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    Landing
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

<body class="g-sidenav-show  landing bg-gray-100">
  <div class="h-100 bg-gradient-primary position-absolute w-100"></div>
  <aside class="sidenav  box-shadow-none  navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href="callmain.do"
				target="_blank"> <img src="${path}/assets/img/logo.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold">CONTIGO 당신과 함께</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto h-auto"
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#dashboardsExamples" class="nav-link active"
					aria-controls="dashboardsExamples" role="button"
					aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-shop text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">마이페이지</span>
				</a>
					<div class="collapse " id="dashboardsExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link active"
								href="Landing.do"> <span
									class="sidenav-mini-icon"> L </span> <span
									class="sidenav-normal"> Landing </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/dashboards/default.html"> <span
									class="sidenav-mini-icon"> D </span> <span
									class="sidenav-normal"> 마이룸 </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
							onclick="GoToPage('Logout')"> <span
									class="sidenav-mini-icon"> A </span> <span
									class="sidenav-normal"> 로그아웃 </span>
							</a></li>
						</ul>
					</div></li>
				<li class="nav-item mt-3">
					<h6
						class="ps-4  ms-2 text-uppercase text-xs font-weight-bolder opacity-6">PAGES</h6>
				</li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#pagesExamples" class="nav-link"
					aria-controls="pagesExamples" role="button" aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-single-02 text-warning text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">회원</span>
				</a>



					<div class="collapse " id="pagesExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link"
								href="#profileExample"> <span class="sidenav-mini-icon">
										P </span> <span class="sidenav-normal"> 내 정보 조회 <b
										class="caret"></b></span>
							</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#applicationsExamples" class="nav-link"
					aria-controls="applicationsExamples" role="button"
					aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-ui-04 text-info text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">게시글</span>
				</a>
					<div class="collapse " id="applicationsExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link"
								href="${path}/pages/applications/wizard.html"> <span
									class="sidenav-mini-icon"> W </span> <span
									class="sidenav-normal"> 플리마켓 모집 </span>
							</a></li>
						</ul>
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link"
								href="${path}/pages/applications/wizard.html"> <span
									class="sidenav-mini-icon"> W </span> <span
									class="sidenav-normal"> 플리마켓 신청</span>
							</a></li>
						</ul>
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link"
								href="${path}/pages/applications/wizard.html"> <span
									class="sidenav-mini-icon"> W </span> <span
									class="sidenav-normal"> 커뮤니티</span>
							</a></li>
						</ul>
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link"
								href="${path}/pages/applications/wizard.html"> <span
									class="sidenav-mini-icon"> W </span> <span
									class="sidenav-normal"> 1:1문의</span>
							</a></li>
						</ul>
					</div></li>

				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#ecommerceExamples" class="nav-link "
					aria-controls="ecommerceExamples" role="button"
					aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-single-copy-04 text-danger text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">메인페이지</span>
				</a>
					<div class="collapse " id="ecommerceExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link "
								href="AdminIntro.do"> <span class="sidenav-mini-icon">
										O </span> <span class="sidenav-normal"> 회사소개 </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
								href="../../../pages/ecommerce/referral.html"> <span
									class="sidenav-mini-icon"> R </span> <span
									class="sidenav-normal"> 플리마켓 </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
								href="../../../pages/ecommerce/referral.html"> <span
									class="sidenav-mini-icon"> R </span> <span
									class="sidenav-normal"> 커뮤니티 </span>
							</a></li>
							<li class="nav-item "><a class="nav-link " href="QNA.do">
									<span class="sidenav-mini-icon"> R </span> <span
									class="sidenav-normal"> 공지사항 </span>
							</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	</aside>
  <main class="main-content position-relative border-radius-lg ">
    <div class="container-fluid py-4">
      <div class="row min-vh-80">
        <div class="d-none d-lg-block">
          <div class="col-lg-10">
            <div class="position-absolute p-3 border-radius-xl blur shadow-xl perspective-right z-index-3 mt-7">
              <a class="w-100" href="MemberInquire.do">
                <img class="w-100 border-radius-lg" src="${path}/assets/img/default.jpg" alt="default page">
              </a>
            </div>
            <div class="position-absolute p-3 border-radius-xl blur shadow-xl perspective-right-sm z-index-2 mt-3">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/automotive.jpg" alt="default page">
            </div>
            <div class="position-absolute p-3 border-radius-xl blur shadow-xl perspective-right-xs z-index-1">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/crm.jpg" alt="default page">
            </div>
          </div>
        </div>
        <div class="d-lg-none d-none d-md-block">
          <div class="col-lg-10">
            <div class="p-3 border-radius-xl blur shadow-xl z-index-3 mt-5">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/default.jpg" alt="default page">
            </div>
            <div class="p-3 border-radius-xl blur shadow-xl z-index-2 mt-4">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/automotive.jpg" alt="default page">
            </div>
          </div>
        </div>
        <div class="d-lg-none d-md-none">
          <div class="col-lg-10">
            <div class="p-3 border-radius-xl blur shadow-xl z-index-3 mt-5">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/default.jpg" alt="default page">
            </div>
            <div class="p-3 border-radius-xl blur shadow-xl z-index-2 mt-4">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/automotive.jpg" alt="default page">
            </div>
            <div class="p-3 border-radius-xl blur shadow-xl z-index-1 mt-4">
              <img class="w-100 border-radius-lg" src="${path}/assets/img/crm.jpg" alt="default page">
            </div>
          </div>
        </div>
      </div>
    </div>
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
</body>

</html>