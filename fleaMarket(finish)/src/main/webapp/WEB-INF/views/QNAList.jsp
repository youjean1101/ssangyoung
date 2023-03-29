<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="ko">
<!-- exp3전체조회페이지 exp2상세조회페이지 -->
<head>
<%@include file="header.jsp" %>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>고객센터</title>
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
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
<link href="${path}/resource/css/Req1001/QNAList.css" rel="stylesheet" />
<script type="text/javascript">
var SessionAuth = '${Login.authority}' //권한
var SessionEmail = '${Login.email}'
</script>
</head>
<body class="g-sidenav-show bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<div class="position-absolute w-100 min-height-300 top-0"
		style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/profile-layout-header.jpg'); background-position-y: 50%;">
		<span class="mask bg-primary opacity-6"></span>
	</div>
	<div class="main-content position-relative max-height-vh-100 h-100">
		
	<div class="card shadow-lg mx-4 card-profile-bottom">
		<div class="card-body p-3">
			<div class="row gx-4">
				<div class="col-auto"></div>
				<div class="col-auto my-auto">
					<div class="h-100">

						<p class="mb-0 font-weight-bold text-sm"></p>
					</div>
				</div>
				<!-- 바디 -->
				<div class="container-fluid py-4">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<!-- Card header -->
								<div class="card-header pb-0">
									<div class="d-lg-flex">
										<div>
											<h5 class="mb-0">공지사항 및 문의글 조회</h5>
											<p class="text-sm mb-0">검색창에 검색할 제목이나 작성자 이메일을 입력해주세요</p>
										</div>
										
										<div class="ms-auto my-auto mt-lg-0 mt-4">
										<form id="SeachQNAForm" action="QNAList.do" method="post">
											<div class="input-group mb-3">
												<input type="text" name="title" class="form-control" placeholder="제목/작성자/답변상태" >
												<input type="hidden" name="curPage" value="${sch.curPage}"/>
												<button class="btn btn-outline-primary mb-0" type="submit" >검색</button>
											</div>
										</form>
										</div>
									</div>
									<c:if test="${Login.authority=='관리자'}">
									<div class="d-flex justify-content-end me-3" style="font-weight:bold; color:red;">미답변 : ${NoAnswerQnaList }</div>
									</c:if>
									<div class="card-body px-0 pb-0">

										<div class="table-responsive">
												
												<table class="table table-flush" id="QnAListTable" style="cursor:pointer"> 
												 <colgroup> 
											   	<col width="5%">
											   	<col width="5%">
											   	<col width="30%">
											   	<col width="15%">
											   	<col width="20%">
											   	<col width="15%">
											   	<col width="10%">
											   	</colgroup>
												<thead class="thead-light">
													<tr style="background-color: #ebebeb;">
														<th>No</th>
														<th>문의 번호</th>
														<th>제목</th>
														<th>등록일</th>
														<th>작성자</th>
														<th>분류</th>
														<th>답변상태</th>
													</tr>
												</thead>
												<tbody>
															<c:forEach var="QNAListNotics" items="${QNAListNotics}">
															
																<tr onclick="goDetail(${QNAListNotics.qnano})" style="font-weight:bold;">
																	<td>-</td>
																	<td>-</td>
																	<td style="text-align:left; padding-left:20px;"><span style="color:red;">&#60;공지&#62;</span>${QNAListNotics.title}</td>
																	<td>${QNAListNotics.regdate}</td>
																	<td>${QNAListNotics.email}</td>
																	<td>공지사항</td>
																	<td>${QNAListNotics.status }</td>
																</tr>
															</form>
															</c:forEach>
															<c:forEach var="QNA" items="${QNAList}">
																<tr onclick="goDetail(${QNA.qnano})">
																	<td>
																		${QNA.cnt}
																	</td>
																	<td>${QNA.qnano}</td>
																	<td style="text-align:left;  padding-left:20px;">
																		<c:if test="${QNA.method=='a'}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↪</c:if>
																		<c:if test="${QNA.secretwhether=='y'}">  
																		<img src="${path}/resource/img/lock.png" style="width:18px; height:18px;"></c:if>
																		 ${QNA.title}
																		 <c:if test="${not empty QNA.qfilecnt}">
																		 <img src="${path}/resource/img/file.png" style="width:13px; height:13px;"></c:if>
																	 </td>
																	<td>${QNA.regdate}</td>
																	<td>${QNA.email}</td>
																	<td>
																	<c:choose>
																		<c:when test="${QNA.method=='q'}">문의(${QNA.category})</c:when>
																		<c:otherwise>${QNA.category}</c:otherwise>
																	</c:choose>
																	</td>
																	<td>${QNA.status }</td>
																</tr>
															</c:forEach>
														</tbody>
											</table>
											<c:if test="${ empty QNAList}">
											    <img src="/fleaMarket/resource/img/nosearchPage/t1.png" class="mx-auto d-block" alt="이미지가 없음" style="width:200px;">
											    <h4 style="text-align:center;">검색된 문의글이 없습니다.</h4>
											</c:if>
											<nav aria-label="Page navigation example">
											  <ul class="pagination justify-content-center">
											    <li class="page-item">
											      <a class="page-link" href="javascript:goPage(${sch.startBlock-1});">
											        <i class="fa fa-angle-left"></i>
											        <span class="sr-only">Previous</span>
											      </a>
											    </li>
											    <c:forEach var="cnt" begin="${sch.startBlock}" end="${sch.endBlock}">
											    	<li class="page-item ${sch.curPage==cnt?'active':''}">
											    		<a class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
											    	</li>
											    </c:forEach>
											    <li class="page-item">
											      <a class="page-link" href="javascript:goPage(${sch.endBlock+1});">
											        <i class="fa fa-angle-right"></i>
											        <span class="sr-only">Next</span>
											      </a>
											    </li>
											  </ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<br>
					<button type="button" id="regBtn" class="btn btn-outline-primary btn-sm mb-0" style="float:right; cursor:pointer;">등록</button>
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
	<script src="${path}/resource/js/Req1001/QNAList.js"></script>
</body>

</html>