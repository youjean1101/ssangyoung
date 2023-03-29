<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
동은아 뜨니 ???
 --%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>



<title>Header</title>
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
	
</script>
</head>
<style>
#HeaderBackground {
	background-color: #5e72e4;
}

li {
	list-style: none;
}
</style>
<body class="">
	<div class="min-height-300 position-absolute w-100"
		id="HeaderBackground"></div>
	<div class="container position-sticky z-index-sticky top-0">
		<div class="row">
			<div class="col-12">
				<!-- Navbar -->
				<nav
					class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
					<div class="container-fluid ps-2 pe-0">
						<a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 "
							href="callmain.do"> <img
							src="${path}/resource/img/fleamarketLOGO3.png" alt="..."
							class="avatar" style="height: 60px; width: 250px;">
						</a>
						<button class="navbar-toggler shadow-none ms-2" type="button"
							data-bs-toggle="collapse" data-bs-target="#navigation"
							aria-controls="navigation" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon mt-2"> <span
								class="navbar-toggler-bar bar1"></span> <span
								class="navbar-toggler-bar bar2"></span> <span
								class="navbar-toggler-bar bar3"></span>
							</span>
						</button>
						<div class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0"
							id="navigation">
							<ul class="navbar-nav navbar-nav-hover mx-auto">
								<li class="nav-item dropdown dropdown-hover ms-n5 me-6"><a
									class="nav-link ps-2 cursor-pointer" href="AdminIntro.do">
										회사소개 </a></li>
								<li class="nav-item dropdown dropdown-hover me-6"><a
									role="button"
									class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center "
									id="dropdownMenuBlocks" data-bs-toggle="dropdown"
									aria-expanded="false"> 플리마켓 <img
										src=" ${path}/assets/img/down-arrow-dark.svg "
										alt="down-arrow" class="arrow ms-1 d-lg-block d-none"> <img
										src="${path}/assets/img/down-arrow-dark.svg" alt="down-arrow"
										class="arrow ms-1 d-lg-none d-block">
								</a>
									<div
										class="dropdown-menu dropdown-menu-animation dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3 shadow-none"
										aria-labelledby="dropdownMenuBlocks">
										<div class="d-none d-lg-block">
											<ul class="list-group">
												<li
													class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
													<a class="dropdown-item py-2 ps-3 border-radius-md"
													href="totalSearch.do">
														<div class="d-flex">
															<div class="icon h-10 me-3 d-flex mt-1">
																<i class="ni ni-single-copy-04 text-primary"></i>
															</div>
															<div
																class="w-100 d-flex align-items-center justify-content-between">
																<div>
																	<p class="dropdown-header text-dark p-0">플리마켓 조회</p>
																</div>
															</div>
														</div>
												</a>
												</li>
												<li
													class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
													<a class="dropdown-item py-2 ps-3 border-radius-md"
													onclick="registration()" href="#">
														<div class="d-flex">
															<div class="icon h-10 me-3 d-flex mt-1">
																<i class="ni ni-laptop text-primary"></i>
															</div>
															<div
																class="w-100 d-flex align-items-center justify-content-between">
																<div>
																	<p class="dropdown-header text-dark p-0">플리마켓 등록</p>
																</div>
															</div>
														</div>
												</a>
												</li>
						                        <c:choose>
						                        	<c:when test="${empty Login}">
													</c:when>
													<c:otherwise>
														<c:if test="${Login.authority!='관리자'}">
															<li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
									                          <a class="dropdown-item py-2 ps-3 border-radius-md" href="appMyList.do">
									                            <div class="d-flex">
									                              <div class="icon h-10 me-3 d-flex mt-1">
									                                <i class="ni ni-single-copy-04 text-primary"></i>
									                              </div>
									                              <div class="w-100 d-flex align-items-center justify-content-between">
									                                <div>
									                                  <p class="dropdown-header text-dark p-0">내 신청 조회</p>
									                                </div>
									                              </div>
									                            </div>
									                          </a>
									                        </li>
									                    </c:if>
														<c:if test="${Login.authority=='사업자'}">
									                        <li class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
									                          <a class="dropdown-item py-2 ps-3 border-radius-md" href="appReceivedList.do">
									                            <div class="d-flex">
									                              <div class="icon h-10 me-3 d-flex mt-1">
									                                <i class="ni ni-single-copy-04 text-primary"></i>
									                              </div>
									                              <div class="w-100 d-flex align-items-center justify-content-between">
									                                <div>
									                                  <p class="dropdown-header text-dark p-0">받은 신청 조회</p>
									                                </div>
									                              </div>
									                            </div>
									                          </a>
									                        </li>
									                   </c:if>
									               </c:otherwise>
								               </c:choose>
											</ul>
										</div>
										<script>
										/* function registration() {
											  if ("${Login.email}" == "") {
											    Swal.fire({
											      title: "로그인을 하셔야 등록할 수 있습니다.",
											      icon: "warning",
											      showCancelButton: true,
											      confirmButtonText: "로그인",
											      cancelButtonText: "취소",
											    }).then((result) => {
											      if (result.isConfirmed) {
											        location.href = "${path}/SignIn.do";
											      }
											    });
											  } else {
												  location.href = "${path}/fRegistration.do?email=${Login.email}";
											  }
											} */
										function registration() {
											var titleval = "로그인을 하셔야 플리마켓 등록 페이지 이용이 가능합니다."
											var path = "${path}/SignIn.do"
											var SessAuth = '${Login.authority}'
											var comfirmval = "로그인"
											//로그인 후 사업자 번호가 없을 때
											if(SessAuth!='' && SessAuth!='사업자'){
												titleval = "사업자 변환 후 이용가능합니다!\n회원정보창 이동하시겠습니까";
												console.log(SessAuth);
												path = "MemberInfo.do";
												comfirmval = '이동'
											}
											//로그인 x
											  if (SessAuth==''|| SessAuth!='사업자') {
											    Swal.fire({
											      title:titleval,
											      icon: "warning",
											      showCancelButton: true,
											      confirmButtonText: comfirmval,
											      cancelButtonText: "취소",
											    }).then((result) => {
											      if (result.isConfirmed) {
											       location.href =path; 
											  
											      }
											    });
											    //사업자 번호 있을때
											  } else {
											    location.href = "${path}/fRegistration.do?email=${Login.email}";
											  }
											} 
										</script>
										<!-- responsive -->
										<div class="row d-lg-none">
											<div class="col-md-12">
												<a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/kanban.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-single-copy-04 text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Kanban</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/wizard.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-laptop text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Wizard</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/datatables.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-badge text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">DataTables</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/calendar.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-notification-70 text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Calendar</p>
															</div>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div></li>
								<li class="nav-item dropdown dropdown-hover me-6"><a
									role="button"
									class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center "
									id="dropdownMenuEcommerce" data-bs-toggle="dropdown"
									aria-expanded="false"> 커뮤니티 <img
										src=" ${path}/assets/img/down-arrow-dark.svg  "
										alt="down-arrow" class="arrow ms-1 d-lg-block d-none"> <img
										src="${path}/assets/img/down-arrow-dark.svg" alt="down-arrow"
										class="arrow ms-1 d-lg-none d-block">
								</a>
									<div
										class="dropdown-menu dropdown-menu-animation dropdown-lg p-3 border-radius-xl mt-0 mt-lg-3 shadow-none"
										aria-labelledby="dropdownMenuEcommerce">
										<div class="row d-none d-lg-block">
											<div class="col-12 px-4 py-2">
												<div class="row">
													<div class="col-6 position-relative">
														<div
															class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-0">
															<i class="ni ni-cart text-primary me-3"></i> 커뮤니티보기
														</div>
														<a href="${path}/CommunityList.do?category=홍보글"
															class="dropdown-item border-radius-md"> <span
															class="ps-3">홍보</span>
														</a> <a href="${path}/CommunityList.do?category=사업아이디어"
															class="dropdown-item border-radius-md"> <span
															class="ps-3">사업아이디어</span>
														</a> <a href="${path}/CommunityList.do?category=사는이야기"
															class="dropdown-item border-radius-md"> <span
															class="ps-3">사는이야기</span>
														</a> <a href="${path}/CommunityList.do?category=꿀팁"
															class="dropdown-item border-radius-md"> <span
															class="ps-3">꿀팁</span>
														</a>
														<script>
															$(document)
																	.ready(
																			function() {
																				if ("${Login.authority}" == '관리자') {
																					$(
																							"#managerHideMenu")
																							.hide()
																				}

																			});
														</script>
														<div id="managerHideMenu">
															<div
																class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-0 mt-3">
																<i class="ni ni-box-2 text-primary me-3"></i> 소통
															</div>
															<%-- <a href="${path}/chatting.do" class="dropdown-item border-radius-md">
	                              <span class="ps-3">채팅목록</span>
	                            </a> --%>
															<a href="#" onclick="myRoomLoginCk()"
																class="dropdown-item border-radius-md"> <span
																class="ps-3">My Room</span>
															</a>
															<script>
															function myRoomLoginCk() {
																  if ("${Login.email}" == "") {
																    Swal.fire({
																      title: "로그인을 하셔야 MyRoom 페이지 이용이 가능합니다.",
																      icon: "warning",
																      showCancelButton: true,
																      confirmButtonText: "로그인",
																      cancelButtonText: "취소",
																    }).then((result) => {
																      if (result.isConfirmed) {
																        location.href = "${path}/SignIn.do";
																      }
																    });
																  } else {
																    location.href = "${path}/communityMemberRoom.do?email=${Login.email}";
																  }
																}
															</script>
															<a
																onclick="followLoginCk()" href="#"
																class="dropdown-item border-radius-md"> <span
																class="ps-3">나의 팔로워 목록</span>
															</a>
																<script>
																function followLoginCk() {
																  if ("${Login.email}" == "") {
																    Swal.fire({
																      title: "로그인을 하셔야 팔로워 목록 페이지 이용이 가능합니다.",
																      icon: "warning",
																      showCancelButton: true,
																      confirmButtonText: "로그인",
																      cancelButtonText: "취소",
																    }).then((result) => {
																      if (result.isConfirmed) {
																        location.href = "${path}/SignIn.do";
																      }
																    });
																  } else {
																    location.href = "${path}/communityFollowMember.do?myemail=${Login.email}";
																  }
																}
															</script>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- responsive -->
										<div class="d-lg-none">
											<div
												class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-0">
												<i class="ni ni-cart text-primary me-3"></i> Orders
											</div>
											<a href="${path}/pages/ecommerce/orders/list.html"
												class="dropdown-item border-radius-md ms-3"> Order List
											</a> <a href="${path}/pages/pages/orders/details.html"
												class="dropdown-item border-radius-md ms-3"> Order
												Details </a>
											<div
												class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-0 mt-3">
												<i class="ni ni-box-2 text-primary me-3"></i> General
											</div>
											<a href="${path}/pages/ecommerce/overview.html"
												class="dropdown-item border-radius-md ms-3"> Overview </a> <a
												href="${path}/pages/ecommerce/referral.html"
												class="dropdown-item border-radius-md ms-3"> Referral </a>
											<div
												class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-0 mt-3">
												<i class="ni ni-planet text-primary me-3"></i> Products
											</div>
											<a href="${path}/pages/ecommerce/products/new-product.html"
												class="dropdown-item border-radius-md ms-3"> New Product
											</a> <a href="${path}/pages/ecommerce/products/edit-product.html"
												class="dropdown-item border-radius-md ms-3"> Edit
												Product </a> <a
												href="${path}/pages/ecommerce/products/product-page.html"
												class="dropdown-item border-radius-md ms-3"> Product
												Page </a> <a
												href="${path}/pages/ecommerce/products/products-list.html"
												class="dropdown-item border-radius-md ms-3"> Products
												List </a>
										</div>
									</div></li>
								<li class="nav-item dropdown dropdown-hover"><a
									role="button"
									class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center "
									id="dropdownMenuBlocks" data-bs-toggle="dropdown"
									aria-expanded="false"> 고객센터 <img
										src=" ${path}/assets/img/down-arrow-dark.svg "
										alt="down-arrow" class="arrow ms-1 d-lg-block d-none"> <img
										src="${path}/assets/img/down-arrow-dark.svg" alt="down-arrow"
										class="arrow ms-1 d-lg-none d-block">
								</a>
									<div
										class="dropdown-menu dropdown-menu-animation dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3 shadow-none"
										aria-labelledby="dropdownMenuBlocks">
										<div class="d-none d-lg-block">
											<ul class="list-group">
												<li
													class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
													<a class="dropdown-item py-2 ps-3 border-radius-md"
													onclick="QnALoginCk()" href="#">
														<div class="d-flex">
															<div class="icon h-10 me-3 d-flex mt-1">
																<i class="ni ni-single-copy-04 text-primary"></i>
															</div>
															<div
																class="w-100 d-flex align-items-center justify-content-between">
																<div>
																	<p class="dropdown-header text-dark p-0">고객센터 조회</p>
																</div>
															</div>
														</div>
												</a>
												</li>
												<script>
												function QnALoginCk() {
													  if ("${Login.email}" == "") {
													    Swal.fire({
													      title: "로그인을 하셔야 고객센터 페이지 이용이 가능합니다.",
													      icon: "warning",
													      showCancelButton: true,
													      confirmButtonText: "로그인",
													      cancelButtonText: "취소",
													    }).then((result) => {
													      if (result.isConfirmed) {
													        location.href = "${path}/SignIn.do";
													      }
													    });
													  } else {
													    location.href = "QNAList.do";
													  }
													}
												</script>
												<li
													class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
													<c:choose>
														<c:when test="${empty Login}">
														</c:when>
														<c:otherwise>
															<a class="dropdown-item py-2 ps-3 border-radius-md"
																href="MemberQnAreg.do">
																<div class="d-flex">
																	<div class="icon h-10 me-3 d-flex mt-1">
																		<i class="ni ni-laptop text-primary"></i>
																	</div>
																	<div
																		class="w-100 d-flex align-items-center justify-content-between">
																		<div>
																			<c:if test="${Login.authority=='관리자'}">
																				<p class="dropdown-header text-dark p-0">공지사항 등록</p>
																			</c:if>
																			<c:if test="${Login.authority!='관리자'}">
																				<p class="dropdown-header text-dark p-0">문의사항 등록</p>
																			</c:if>
																		</div>
																	</div>
																</div>
															</a>
														</c:otherwise>
													</c:choose>
												</li>
											</ul>
										</div>
										<!-- responsive -->
										<div class="row d-lg-none">
											<div class="col-md-12">
												<a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/kanban.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-single-copy-04 text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Kanban</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/wizard.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-laptop text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Wizard</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/datatables.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-badge text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">DataTables</p>
															</div>
														</div>
													</div>
												</a> <a class="py-2 ps-3 border-radius-md"
													href="${path}/pages/applications/calendar.html">
													<div class="d-flex">
														<div class="icon h-10 me-3 d-flex mt-1">
															<i class="ni ni-notification-70 text-primary"></i>
														</div>
														<div
															class="w-100 d-flex align-items-center justify-content-between">
															<div>
																<p class="dropdown-header text-dark p-0">Calendar</p>
															</div>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div></li>
							</ul>
							<ul class="navbar-nav d-lg-block d-none">
								<div class="row">
									<c:choose>
										<c:when test="${not empty Login}">
											<div class="col-3">
												<img
													src="${path}/resource/img/Member/profileimg/${Login.profileimgname}"
													alt="..." class="avatar shadow">
											</div>
											<div class="col-4"
												style="margin-top: 4%; text-align: center;">
												<span>${Login.nickname}</span>
											</div>
											<div class="col-3"
												style="margin-top: 3%; text-align: center;">
												<li class="nav-item dropdown dropdown-hover mx-2"><a
													role="button"
													class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center "
													id="dropdownMenuBlocks" data-bs-toggle="dropdown"
													aria-expanded="false"> <i
														class="fa fa-cog fixed-plugin-button-nav"></i>
												</a>
													<div
														class="dropdown-menu dropdown-menu-animation dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3 shadow-none"
														aria-labelledby="dropdownMenuBlocks">
														<div class="d-none d-lg-block">
															<ul class="list-group">
																<li
																	class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
																	<a class="dropdown-item py-2 ps-3 border-radius-md"
																	onclick="kakaoLogOut()">
																		<div class="d-flex">
																			<div class="icon h-10 me-3 d-flex mt-1">
																				<i class="ni ni-single-copy-04 text-primary"></i>
																			</div>
																			<div
																				class="w-100 d-flex align-items-center justify-content-between">
																				<div>
																					<p class="dropdown-header text-dark p-0"
																						onclick="kakaoLogOut()">로그아웃</p>
																				</div>
																			</div>
																		</div>
																</a>
																</li>
																<li
																	class="nav-item dropdown dropdown-hover dropdown-subitem list-group-item border-0 p-0">
																	<c:choose>
																		<c:when test="${Login.authority=='관리자'}">
																			<a class="dropdown-item py-2 ps-3 border-radius-md"
																				onclick="GoToPage('AdminSearch')">
																		</c:when>
																		<c:otherwise>
																			<a class="dropdown-item py-2 ps-3 border-radius-md"
																				onclick="GoToPage('MemberInfo')">
																		</c:otherwise>
																	</c:choose>
																	<div class="d-flex">
																		<div class="icon h-10 me-3 d-flex mt-1">
																			<i class="ni ni-laptop text-primary"></i>
																		</div>
																		<div
																			class="w-100 d-flex align-items-center justify-content-between">
																			<div>
																				<p class="dropdown-header text-dark p-0">My Page</p>
																			</div>
																		</div>
																	</div> </a>
																</li>
															</ul>
														</div>
													</div></li>
											</div>

											<div class="col-1"
												style="margin-top: 4%; text-align: center;">
												<div class="dropdown">
													<a class="cursor-pointer" type="button"
														id="dropdownMenuButton" data-bs-toggle="dropdown"
														aria-expanded="false"> <i class="fa fa-bell"></i>
													</a>
													<ul
														class="dropdown-menu dropdown-menu-right px-2 py-3 ms-n4"
														aria-labelledby="dropdownMenuButton">
														<li>알람내역
													</ul>
												</div>
											</div>
								</div>
								</c:when>
								<c:when test="${empty Login }">
									<div class="row"
										style="width: 240px; font-size: 14px; font-weight: bold;">
										<div class="col-6">
											<a href="SignIn.do">로그인</a>
										</div>
										<div class="col-6">
											<a href="SignUp.do" id="HeaderSignUp">회원가입</a>
										</div>
									</div>
								</c:when>
								</c:choose>

							</ul>
						</div>
					</div>
				</nav>
				<!-- End Navbar -->
			</div>
		</div>
	</div>
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
	<!-- Kanban scripts -->
	<script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
	<script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}

		//페이지 이동처리
		function GoToPage(page) {
			location.href = page + ".do"
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
	<script src="${path}/resource/js/Req1000/header.js"></script>
</body>
</html>