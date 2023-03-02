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
<title>내가 쓴 1:1문의</title>
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
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<aside
		class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
		id="sidenav-main">
		<div class="sidenav-header">
			<i
				class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
				aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
				href=" https://demos.creative-tim.com/argon-dashboard-pro/pages/dashboards/default.html "
				target="_blank"> <img src="${path}/assets/img/logo2.png"
				class="navbar-brand-img h-100" alt="main_logo"> <span
				class="ms-1 font-weight-bold">CONTIGO 당신과 함께</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">
		<div class="collapse navbar-collapse  w-auto h-auto"
			id="sidenav-collapse-main">
			<ul class="navbar-nav">
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#dashboardsExamples" class="nav-link "
					aria-controls="dashboardsExamples" role="button"
					aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-shop text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">마이페이지</span>
				</a>
					<div class="collapse " id="dashboardsExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/dashboards/landing.html"> <span
									class="sidenav-mini-icon"> L </span> <span
									class="sidenav-normal"> Landing </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/dashboards/default.html"> <span
									class="sidenav-mini-icon"> D </span> <span
									class="sidenav-normal"> Default </span>
							</a></li>
							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/dashboards/automotive.html"> <span
									class="sidenav-mini-icon"> A </span> <span
									class="sidenav-normal"> Automotive </span>
							</a></li>


							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/dashboards/crm.html"> <span
									class="sidenav-mini-icon"> C </span> <span
									class="sidenav-normal"> CRM </span>
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
							<li class="nav-item "><a class="nav-link "
								href="${path}/pages/pages/pricing-page.html"> <span
									class="sidenav-mini-icon"> P </span> <span
									class="sidenav-normal"> 사업자인증요청</span>
							</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a data-bs-toggle="collapse"
					href="#applicationsExamples" class="nav-link active"
					aria-controls="applicationsExamples" role="button"
					aria-expanded="false">
						<div
							class="icon icon-shape icon-sm text-center d-flex align-items-center justify-content-center">
							<i class="ni ni-ui-04 text-info text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">게시글</span>
				</a>
					<div class="collapse " id="applicationsExamples">
						<ul class="nav ms-4">
							<li class="nav-item "><a class="nav-link active"
								href="${path}/pages/applications/wizard.html"> <span
									class="sidenav-mini-icon"> W </span> <span
									class="sidenav-normal"> 1:1문의 </span>
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
		<!-- Navbar -->
		<!-- 상단 -->
		<nav
			class="navbar navbar-main navbar-expand-lg  px-0 mx-4 shadow-none border-radius-xl z-index-sticky "
			id="navbarBlur" data-scroll="false">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a class="text-white"
							href="javascript:;"> <i class="ni ni-ui-04"></i>
						</a></li>
						<li class="breadcrumb-item text-sm text-white"><a
							class="opacity-5 text-white" href="javascript:;">게시글</a></li>
						<li class="breadcrumb-item text-sm text-white active"
							aria-current="page">작성한 1:1문의</li>
					</ol>
				</nav>
				<div
					class="sidenav-toggler sidenav-toggler-inner d-xl-block d-none ">
					<a href="javascript:;" class="nav-link p-0">
						<div class="sidenav-toggler-inner">
							<i class="sidenav-toggler-line bg-white"></i> <i
								class="sidenav-toggler-line bg-white"></i> <i
								class="sidenav-toggler-line bg-white"></i>
						</div>
					</a>
				</div>
				<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4"
					id="navbar">
					<div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
				</div>
				<ul class="navbar-nav  justify-content-end">
					<li class="nav-item d-flex align-items-center"><a
						href="${path}/pages/authentication/signin/illustration.html"
						class="nav-link text-white font-weight-bold px-0" target="_blank">
							<i class="fa fa-user me-sm-1"></i> <span
							class="d-sm-inline d-none">${Login.nickname}</span>
					</a></li>
					<li class="nav-item d-xl-none ps-3 d-flex align-items-center">
						<a href="javascript:;" class="nav-link text-white p-0"
						id="iconNavbarSidenav">
							<div class="sidenav-toggler-inner">
								<i class="sidenav-toggler-line bg-white"></i> <i
									class="sidenav-toggler-line bg-white"></i> <i
									class="sidenav-toggler-line bg-white"></i>
							</div>
					</a>
					</li>
					<li class="nav-item px-3 d-flex align-items-center"><a
						href="javascript:;" class="nav-link text-white p-0"> <i
							class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
					</a></li>
					<li class="nav-item dropdown pe-2 d-flex align-items-center">
						<a href="javascript:;" class="nav-link text-white p-0"
						id="dropdownMenuButton" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa fa-bell cursor-pointer"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4"
							aria-labelledby="dropdownMenuButton">
							<li class="mb-2"><a class="dropdown-item border-radius-md"
								href="javascript:;">
									<div class="d-flex py-1">
										<div class="my-auto">
											<img src="${path}/assets/img/team-2.jpg"
												class="avatar avatar-sm  me-3 " alt="user image">
										</div>
										<div class="d-flex flex-column justify-content-center">
											<h6 class="text-sm font-weight-normal mb-1">
												<span class="font-weight-bold">New message</span> from Laur
											</h6>
											<p class="text-xs text-secondary mb-0">
												<i class="fa fa-clock me-1"></i> 13 minutes ago
											</p>
										</div>
									</div>
							</a></li>
							<li class="mb-2"><a class="dropdown-item border-radius-md"
								href="javascript:;">
									<div class="d-flex py-1">
										<div class="my-auto">
											<img src="${path}/assets/img/small-logos/logo-spotify.svg"
												class="avatar avatar-sm bg-gradient-dark  me-3 "
												alt="logo spotify">
										</div>
										<div class="d-flex flex-column justify-content-center">
											<h6 class="text-sm font-weight-normal mb-1">
												<span class="font-weight-bold">New album</span> by Travis
												Scott
											</h6>
											<p class="text-xs text-secondary mb-0">
												<i class="fa fa-clock me-1"></i> 1 day
											</p>
										</div>
									</div>
							</a></li>
							<li><a class="dropdown-item border-radius-md"
								href="javascript:;">
									<div class="d-flex py-1">
										<div
											class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
											<svg width="12px" height="12px" viewBox="0 0 43 36"
												version="1.1" xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none"
													fill-rule="evenodd">
                            <g
													transform="translate(-2169.000000, -745.000000)"
													fill="#FFFFFF" fill-rule="nonzero">
                              <g
													transform="translate(1716.000000, 291.000000)">
                                <g
													transform="translate(453.000000, 454.000000)">
                                  <path class="color-background"
													d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
													opacity="0.593633743"></path>
                                  <path class="color-background"
													d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
										</div>
										<div class="d-flex flex-column justify-content-center">
											<h6 class="text-sm font-weight-normal mb-1">Payment
												successfully completed</h6>
											<p class="text-xs text-secondary mb-0">
												<i class="fa fa-clock me-1"></i> 2 days
											</p>
										</div>
									</div>
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- Card header -->
						<div class="card-header pb-0">
							<div class="d-lg-flex">
								<div>
									<h5 class="mb-0">작성한 1:1문의</h5>
									<p class="text-sm mb-0">작성한 1:1 문의글 입니다.</p>
								</div>
								<div class="ms-auto my-auto mt-lg-0 mt-4">
									<div class="ms-auto my-auto">
										<a href="./new-product.html"
											class="btn bg-gradient-primary btn-sm mb-0" target="_blank">+&nbsp;
											New Product</a>
										<button type="button"
											class="btn btn-outline-primary btn-sm mb-0"
											data-bs-toggle="modal" data-bs-target="#import">
											Import</button>
										<div class="modal fade" id="import" tabindex="-1"
											aria-hidden="true">
											<div class="modal-dialog mt-lg-10">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="ModalLabel">Import CSV</h5>
														<i class="fas fa-upload ms-3"></i>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p>You can browse your computer for a file.</p>
														<input type="text" placeholder="Browse file..."
															class="form-control mb-3">
														<div class="form-check">
															<input class="form-check-input" type="checkbox" value=""
																id="importCheck" checked=""> <label
																class="custom-control-label" for="importCheck">I
																accept the terms and conditions</label>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button"
															class="btn bg-gradient-secondary btn-sm"
															data-bs-dismiss="modal">Close</button>
														<button type="button"
															class="btn bg-gradient-primary btn-sm">Upload</button>
													</div>
												</div>
											</div>
										</div>
										<button
											class="btn btn-outline-primary btn-sm export mb-0 mt-sm-0 mt-1"
											data-type="csv" type="button" name="button">Export</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-0">
							<div class="table-responsive">
								<table class="table table-flush" id="products-list">
									<thead class="thead-light">
										<tr>
											<th width="10%">
												<div class="d-flex">
													<div class="form-check my-auto">
														<input class="form-check-input" type="checkbox"
															id="customCheck3">
													</div>
												</div>
											</th>
											<th width="10%">글 번호</th>
											<th width="40%">제목</th>
											<th width="20%">등록일</th>
											<th width="20%">수정일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="d-flex">
													<div class="form-check my-auto">
														<input class="form-check-input" type="checkbox"
															id="customCheck3">
													</div>
												</div>
											</td>
											<td class="text-sm">1</td>
											<td class="text-sm">사업자 인증 관련 문의입니다.</td>
											<td class="text-sm">2023-02-20</td>
											<td class="text-sm">2023-02-25</td>
										</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<footer class="footer pt-3  ">
				<div class="container-fluid">
					<div class="row align-items-center justify-content-lg-between">
						<div class="col-lg-6 mb-lg-0 mb-4">
							<div
								class="copyright text-center text-sm text-muted text-lg-start">
								©
								<script>
                  document.write(new Date().getFullYear())
                </script>
								, made by <a href="https://www.creative-tim.com"
									class="font-weight-bold" target="_blank">CONTIGO</a> for a
								better FleaMarket.
							</div>
						</div>
						<div class="col-lg-6">
							<ul
								class="nav nav-footer justify-content-center justify-content-lg-end">
								<li class="nav-item"><a href="https://www.creative-tim.com"
									class="nav-link text-muted" target="_blank">Creative Tim</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/presentation"
									class="nav-link text-muted" target="_blank">About Us</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/blog"
									class="nav-link text-muted" target="_blank">Blog</a></li>
								<li class="nav-item"><a
									href="https://www.creative-tim.com/license"
									class="nav-link pe-0 text-muted" target="_blank">License</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</main>
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
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

</html>