<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="sideheader.jsp" %>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    CONTIGO 내 신청 목록
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <link href="${path}/resource/css/Req3008/appList.css" rel="stylesheet" />
  
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"
   integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
   crossorigin="anonymous"></script>
</head>
<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  <main class="main-content position-relative border-radius-lg ">
    <div class="container-fluid py-4">
      <!-- 상단 버튼 추가 시
      <div class="d-sm-flex justify-content-between">
        <div>
          <a href="javascript:;" class="btn btn-icon btn-outline-white">
            New order
          </a>
        </div>
        <div class="d-flex">
          <div class="dropdown d-inline">
            <a href="javascript:;" class="btn btn-outline-white dropdown-toggle " data-bs-toggle="dropdown" id="navbarDropdownMenuLink2">
              Filters
            </a>
            <ul class="dropdown-menu dropdown-menu-lg-start px-2 py-3" aria-labelledby="navbarDropdownMenuLink2" data-popper-placement="left-start">
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Paid</a></li>
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Refunded</a></li>
              <li><a class="dropdown-item border-radius-md" href="javascript:;">Status: Canceled</a></li>
              <li>
                <hr class="horizontal dark my-2">
              </li>
              <li><a class="dropdown-item border-radius-md text-danger" href="javascript:;">Remove Filter</a></li>
            </ul>
          </div>
        </div>
      </div>
       -->
      <div class="row">
        <div class="col-12">
          <div class="card" style="min-height:640px;">
          	<!-- Card header -->
			<div class="card-header pb-0">
				<div class="d-lg-flex">
					<div>
						<h5 class="mb-0" style="margin-top: 15%;">내 신청 조회</h5>
						<p class="text-sm mb-0">회원님께서 신청하신 플리마켓 목록입니다</p>
					</div>
					<div class="ms-auto my-auto mt-lg-0 mt-4"></div>
				</div>
			</div>
            <div class="table-responsive">
              <div class="dataTable-top">
              	<div class="dataTable-search">
              		<form id="frmSch" class="d-flex"  method="post"> 
              			<div class="input-group mb-3">
		              		<input name="title" value="${sch.title}" class="form-control" placeholder="제목을 입력하세요" type="text">
		              		<!-- <button class="btn btn-primary" type="submit">검색</button> -->
		              		<input type="hidden" name="curPage" value="${sch.curPage}"/>
		              		<button class="btn btn-outline-primary mb-0" type="submit">검색</button>
	              		</div>
	              	</form>
              	</div>
              </div>
              <div class="dataTable-container">
	              <table class="table table-flush dataTable-table" id="datatable-search">
	              	<col width="10%">
				   	<col width="20%">
				   	<col width="15%">
				   	<col width="15%">
				   	<col width="15%">
				   	<col width="25%">
	                <thead class="thead-light">
	                  <tr style="background-color: #ebebeb;">
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>등록일</th>
	                    <th>상태</th>
	                    <th>개최자</th>
	                    <th>첨부파일</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <c:forEach var="myfapp" items="${list}" varStatus="s">
		                  <tr onclick="getFiles(${s.count},'${myfapp.applicationNo}')">
		                    <td>
		                      <div class="d-flex align-items-center">
		                      	<p class="text-xs font-weight-bold ms-2 mb-0">${myfapp.cnt}</p>
		                      </div>
		                    </td>
		                    <td class="font-weight-bold">
		                      <span class="my-2 text-xs">${myfapp.title}</span>
		                    </td>
		                    <td class="font-weight-bold">
		                      <span class="my-2 text-xs"><fmt:formatDate pattern='yyyy-MM-dd' value="${myfapp.applicationDate}"/></span>
		                    </td>
		                    <td class="text-xs font-weight-bold">
		                      <div class="d-flex align-items-center">
		                        <c:choose>
				                   <c:when test="${myfapp.approvalWhether == 'a'}">
				                      <button class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-check" aria-hidden="true"></i></button>
	                        		  <span>승인</span>
				                   </c:when>
				                   <c:when test="${myfapp.approvalWhether == 'r'}">
				                      <button class="btn btn-icon-only btn-rounded btn-outline-danger mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-times" aria-hidden="true"></i></button>
	                       			  <span>거부</span>
				                   </c:when>
				                   <c:otherwise>
				                      <button class="btn btn-icon-only btn-rounded btn-outline-dark mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="ni ni-fat-delete" aria-hidden="true"></i></button>		                   
				                   	  <span>대기</span>
				                   </c:otherwise>
				                </c:choose>      
		                      </div>
		                    </td>
		                    <td class="text-xs font-weight-bold">
		                      <div class="d-flex align-items-center">
		                        <img src="${path}/resource/img/Member/profileimg/${myfapp.profileimg}" alt="${path}/resource/img/Member/profileimg/defaultprofile.png" class="avatar avatar-xs me-2">
		                        <span>${myfapp.nickname}</span>
		                      </div>
		                    </td>
		                    <td class="text-xs font-weight-bold">
			                    <c:if test="${myfapp.filename != null}">
			                      <i class="bi bi-paperclip"></i>
			                      <span class="my-2 text-xs">${myfapp.filename}</span>
			                    </c:if>
		                    </td>
		                  </tr>
	                  </c:forEach>
	                </tbody>
	              </table>
	           </div>
            </div>
            
            <!-- 페이지네이션 -->
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
      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                made by
                <a href="" class="font-weight-bold" target="_blank">CONTIGO</a>
                for a better FleaMarket.
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="" class="nav-link text-muted" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="" class="nav-link text-muted" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="" class="nav-link text-muted" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="" class="nav-link pe-0 text-muted" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  
  
  
  
  <!-- 신청 조회 모달창 -->
  <div data-bs-toggle="modal" data-bs-target="#ApplicaionModal" id="ApplicaionModalBtn"></div>
  <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" id="ApplicaionModal" style="display: none" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="h5 modal-title">신청 조회</h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="pt-4 modal-body">
          	<label>첨부파일</label> <!-- 첨부파일 -->
			<form id="downloadAppFileForm" action="downloadAppFile.do" method="get" enctype="multipart/form-data">
				<%-- 여기에 파일리스트 삽입 --%>
			</form>
          <div class="text-end ApprovalBtnWrap">
            <button class="m-1 btn btn-primary" data-bs-dismiss="modal">
              수정
            </button>
            <button class="m-1 btn btn-danger"  data-bs-dismiss="modal">
              삭제
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
 
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script> <!-- file box -->
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="${path}/assets/js/plugins/datatables.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
  <!-- JS -->
  <script src="${path}/resource/js/Req3008/appMyList.js"></script>
</body>
</html>