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
<title>회원목록조회</title>
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
<link href="${path}/resource/css/Req1001/AdminSearch.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
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
									<h5 class="mb-0">게시물신고횟수 조회</h5>
							</div>
						</div>
							<div class="card-body px-0 pb-0">
							</div>
							
							<div class="table-responsive mt-3">
								<form id="DeleteMembersForm" action="DeleteMembers.do" class="form"  method="post">
								<table class="table table-flush" id="MembersListTable" style = "margin-left:auto;margin-right:auto;">
									<thead class="thead-light">
										<tr style="background-color: #ebebeb;">
											
											<th width="40%" style = "text-align:center;">게시글번호</th>
											<th width="10%">이메일</th>
											<th width="5%">스팸/도배</th>
											<th width="5%">음란/욕</th>
											<th width="5%">정치/혐오</th>
											<th width="5%">개인정보</th>
											<th width="5%">total</th>
											<th width="10">삭제</th>
										</tr>
									</thead>
									<tbody style = "text-align:center;">
									
										<c:forEach var="irrs" items="${irr}">
										
							    		<tr style = "c;cursor:pointer;" 
							    		>
							    		
							    		
							    		
							    		<td onclick="location.href='${path}/CommunityDetail.do?communityNumber=${irrs.communityNumber}&category=${irrs.category}'" 
							    		width = "40%">${irrs.communityNumber}</td>
							    		<td>${irrs.email}</td>
							    		<td>${irrs.spam}</td>
							    		<td>${irrs.cuss}</td>
							    		<td>${irrs.politics}</td>
							    		<td>${irrs.info }</td>
							    		<td>${irrs.total }</td>
							    		<td onclick ="location.href='${path}/deleteIrr.do?communityNumber=${irrs.communityNumber}&email=${irrs.email}'"><i class="ni ni-scissors"></i></td>
							    		</tr>
							    		
							    		
							    		</c:forEach>
										
									 </tbody>
									 
								</table>
								
								</form>
								<c:if test="${empty irr}">
								<img src="/fleaMarket/resource/img/nosearchPage/t1.png" class="mx-auto d-block" alt="이미지가 없음" style="width:200px;">
								<h4 style="text-align:center;">신고된 게시물 정보가 없습니다.</h4>
								</c:if>
							 <div class="d-flex justify-content-center"> 
							 <nav aria-label="Page navigation example">
                     <ul class="pagination justify-content-center" id="pageInfo">
                        <c:if test="${pageMaker.prev}">
                           <li class="page-item"><a class="page-link pagingnum"
                              href="${pageMaker.startPage-1}" tabindex="-1"> <i
                                 class="fa fa-angle-left"></i> <span class="sr-only">Previous</span>
                           </a></li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}"
                           end="${pageMaker.endPage}">
                           <li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
                              <a class="page-link" href="${num }">${num }</a>
                           </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next }">
                           <li class="page-item"><a class="page-link pagingnum"
                              href="${pageMaker.endPage+1}"> <i
                                 class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
                           </a></li>
                        </c:if>
                     </ul>
                  </nav>
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
	</main>
	<form id="moveForm" method="get">
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                     <input type="hidden" name="amount" value="${pageMaker.cri.amount}">                                         
   </form>
   
<script>
console.log('gd');


const Result = '${msg}'
	 if(Result==='성공'){
		 Swal.fire({
			 icon: 'success',
		     title: '삭제 성공',
		 })
	 }
	 if(Result==='삭제'){
		 Swal.fire({
			 icon: 'success',
		     title: '삭제 완료',
		 })
	 }

	 
var moveForm = $("#moveForm");
//페이징 처리 
$(".page-item a").on("click", function(e) {

   e.preventDefault(); //기본 동작 제한    
   
   moveForm.find("input[name='pageNum']").val($(this).attr("href"));
   moveForm.submit();
});



</script>

</body>
</html>