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
<title>1:1문의 답변</title>
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
	


<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>	
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<%@include file="sideheader.jsp" %>	
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
							aria-current="page">작성한 1:1문의 답변</li>
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
					<div class="ms-md-auto pe-md-3 d-flex align-items-center">
						<div class="input-group">
						</div>
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
									<h5 class="mb-0">작성한 1:1문의 답변</h5>
									<p class="text-xs mb-0">검색할 1:1문의 답변을 상단 검색창에 제목을 입력해주세요</p>
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
							
							<div class="input-group mb-3">
  <button class="btn btn-outline-primary mb-0" type="submit" id="button-addon1">　검색　</button>
  <input type="text" class="form-control"  name="nickname" value="${sch.nickname}" placeholder="　제목(내용)을 입력하세요">
</div>
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
											<td class="text-sm">문의사항 답변입니다.</td>
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
								, made by <a
									href="https://www.creative-tim.com" class="font-weight-bold"
									target="_blank">CONTIGO</a> for a better FleaMarket.
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
</body>

</html>