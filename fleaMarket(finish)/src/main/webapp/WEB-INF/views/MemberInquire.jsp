<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="sideheader.jsp" %>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${path}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
<title>내가 쓴 문의글</title>
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
<link href="${path}/resource/css/Req1001/MemberFmReg.css" rel="stylesheet" />
</head>
<script type="text/javascript">
</script>
<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
		
	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<!-- 상단 -->
		
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- Card header -->
						<div class="card-header pb-0">
							<div class="d-lg-flex">
								<div>
									<h5 class="mb-0" style="margin-top: 15%;">내가 쓴 문의글</h5>
									<p class="text-sm mb-0">회원님께서 작성하신 고객센터 문의글 목록입니다.</p>
								</div>
								<div class="ms-auto my-auto mt-lg-0 mt-4">
									<div class="ms-auto my-auto">
										<div class="modal fade" id="import" tabindex="-1"
											aria-hidden="true">
											<div class="modal-dialog mt-lg-10">
												<div class="modal-content">
													<div class="modal-header">
														<i class="fas fa-upload ms-3"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body px-0 pb-0"></div>
						<form id="frm01" class="form" method="post">
						<input type="hidden" name="curPage" />
							<div class="row">
								<div class="table-responsive mt-3">
									<table class="table table-flush" id="QnAListTable" style="cursor:pointer">
										<col width="20%">
										<col width="40%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<thead class="thead-light">
											<tr style="background-color: #ebebeb;">
												<th>글 번호</th>
												<th>제목</th>
												<th>등록일</th>
												<th>수정일</th>
												<th>분류</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="QNA" items="${MemberQNAList}">
												<tr onclick="goDetail(${QNA.qnano})">
													<td>${QNA.qnano}</td>
													<td>${QNA.title}</td>
													<td>${QNA.regdate}</td>
													<td>${QNA.uptdate}</td>
													<c:if test="${QNA.method=='q'}">
													<td>문의사항</td>
													</c:if>
													<c:if test="${QNA.method!='q'}">
													<td>공지사항</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</form>
							<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link"
									href="javascript:goPage(${sch.startBlock-1});"> <i
										class="fa fa-angle-left"></i> <span class="sr-only">Previous</span>
								</a></li>
								<c:forEach var="cnt" begin="${sch.startBlock}"
									end="${sch.endBlock}">
									<li class="page-item ${sch.curPage==cnt?'active':''}"><a
										class="page-link" href="javascript:goPage(${cnt});">${cnt}</a>
									</li>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									href="javascript:goPage(${sch.endBlock+1});"> <i
										class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
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
									target="_blank">CONTIGO</a> for a better Community.
							</div>
						</div>
					</div>
				</div>
			</footer>
	</main>
	<script src="${path}/resource/js/Req1001/MemberInquire.js"></script>
</body>
</html>