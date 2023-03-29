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
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    Argon Dashboard 2 PRO by Creative Tim
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

  <script type="text/javascript">
	function goDetail(postingNumber){
		location.href="${path}/fmView.do?postingNumber="+postingNumber
	}	
  </script>
</head>
<style>
/*페이지네이션*/
.pagination_wrap{
	display: flex;
    justify-content: center;
    align-items: center;
    height: 50px;
}

.pagination{
	background: #fff;
    padding-top: 9px;
    text-align: center;
    display: flex;
    justify-content: center;
    height: 37px;
    width: 400px;
}
#numbers{
	padding:0;
	margin: 0 2rem;
	list-style-type:none;
	display:flex; 
}
#numbers li a{
	color:#333;
	padding: .5rem 1rem;
	text-decoration:none;
	opacity:0.7;
}
#numbers li a:hover{
	opacity:1;
}
#numbers li a.active{
	opacity:1;
	color:#fff;
	border-radius: 50%;
    background: #e45e72;
}

.pagination i{
	color:#333;
	font-size:1.2em;
}

</style>
<%@include file="header.jsp"%>
<body class="g-sidenav-show bg-gray-100">
  <div class="position-absolute w-100 min-height-300 top-0" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/profile-layout-header.jpg'); background-position-y: 50%;">
    <span class="mask bg-primary opacity-6"></span>
  </div>
  
  <div class="main-content position-relative max-height-vh-100 h-100">
   
    <!-- End Navbar -->
    <div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
           <h6 class="mb-1">플리마켓 조회</h6>
           <br><br>
           <pre>
           플리마켓(flea market)은 벼룩시작이라는 뜻합니다. flea가 벼룩이라는 뜻으로 중고품을 파는 프랑스의 노천시장을 뜻합니다.
           벼룩이 들끓을 정도로 오래된 물건을 팔기 때문에 이런 이름이 붙었다고 합니다. 
           유럽의 플리마켓에서는 가구,보석,옷,골동품,그림 등 단독 몇 유로에서 수만 유로에 이르기까지 가격도 천차만별이라고 해요,
           프랑스 외에도 유럽의 대도시에 플리마켓이 있는데요
           런던 노팅힐의 포토벨로 마켓도 플리마켓이라는 알고 계셨나요? 작년에 저도 유럽여행을 갔을 때 포토벨로 마켓을 갔었어요.
           </pre>
						<div class="ms-auto my-auto mt-lg-0 mt-4">
						
								<form  action="totalSearch.do" method="post">
									<div class="input-group mb-3" style="float: right;width: 25%;">
										<input type="text" name="title" class="form-control"
											placeholder="　제목을 입력하세요" value="${sch.title}"> 
										<button class="btn btn-outline-primary mb-0" type="submit">검색</button>
										
									</div>
								</form>
							</div>
						</div>
 
        </div>
      </div>
    </div>
    
    <div class="container-fluid py-4">
     
      <div class="row mt-4">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0 p-3">
            <div class="card-body p-3">
            
            
          
              <div class="row" style="justify-content: center;">
              <c:choose>    
                  <c:when test="${not empty fmap}">
            
              <c:forEach var="fm" items="${fmap}">
              <br><br>
                <div class="col-xl-3 col-md-6 mb-xl-0 mb-4 TotList">
                  <div class="card card-blog card-plain">                 
                    <div class="position-relative">
                      <a class="d-block shadow-xl border-radius-xl">                    
                       <img src="${path }/resource/img/fleaMarket/${fm.fnolist }" alt="img-blur-shadow" class="img-fluid shadow border-radius-xl" style="width:350px;height:200px;">
                    </a>
                    </div>
       
                     
                    
                     
                  <div class="card-body px-1 pb-0">
                    
                
                        <h5>
                       	${fm.fno.title }
                        </h5>
               
                      <p class="mb-4 text-sm">
                         ${fm.fno.address}
                      </p>
                      <div class="d-flex align-items-center justify-content-between">
                        <button onclick="goDetail(${fm.fno.postingNumber})" type="button" class="btn btn-primary">구경하기</button>
                      </div>
                    </div>
                  </div>
                </div>
                </c:forEach>
                </c:when>
                <c:otherwise>             
                <img src="/fleaMarket/resource/img/nosearchPage/t1.png" alt="이미지가 없음" style="width:200px;">
               <h2 style="text-align:center;">검색된 결과가 없습니다.</h2>
                </c:otherwise>
                </c:choose>
              </div>
            </div>
          
<!--  
페이지네이션  style="margin:auto;"
-->
				    <div class="pagination_wrap">
							<div class="pagination">
								<i class="fa-solid" id="PageNationPrevBtn">이전</i>
								<ol id="numbers">
									<!-- 페이지네이션 번호들이 오는곳 -->
								</ol>

								<i class="fa-solid" id="PageNationNextBtn">다음</i>
							</div>
						</div>
					</div>          
        </div>
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
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
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
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Sidenav Type</h6>
          <p class="text-sm">Choose between 2 different sidenav types.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active me-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2" data-class="bg-default" onclick="sidebarType(this)">Dark</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        <!-- Navbar Fixed -->
        <div class="d-flex my-3">
          <h6 class="mb-0">Navbar Fixed</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
          </div>
        </div>
        <hr class="horizontal dark mb-1">
        <div class="d-flex my-4">
          <h6 class="mb-0">Sidenav Mini</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarMinimize" onclick="navbarMinimize(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
        <div class="mt-2 mb-5 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>m
        <a class="btn btn-primary w-100" href="https://www.creative-tim.com/product/argon-dashboard-pro">Buy now</a>
        <a class="btn btn-dark w-100" href="https://www.creative-tim.com/product/argon-dashboard">Free demo</a>
        <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/overview/argon-dashboard">View documentation</a>
        <div class="w-100 text-center">
          <a class="github-button" href="https://github.com/creativetimofficial/ct-argon-dashboard-pro" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/argon-dashboard on GitHub">Star</a>
          <h6 class="mt-3">Thank you for sharing!</h6>
          <a href="https://twitter.com/intent/tweet?text=Check%20Argon%20Dashboard%20PRO%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fargon-dashboard-pro" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
          </a>
          <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/argon-dashboard-pro" class="btn btn-dark mb-0 me-2" target="_blank">
            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
          </a>
        </div>
      </div>
    </div>
  </div>

<script src="${path}/resource/js/Req3005/fleaMarketSearch.js"></script>


  
  <!--   Core JS Files   -->

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