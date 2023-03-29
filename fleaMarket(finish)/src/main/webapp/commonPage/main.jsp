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
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    CONTIGO
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
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			<%-- 
			
			--%>	
		});
	</script>
</head>

<body class="g-sidenav-show   bg-gray-100">

   <%@ include file="/WEB-INF/views/header.jsp" %>

   	<!-- 배너  -->
	<div class="mask bg-gradient-primary" style="background:white; width:100%; height:300px; margin-top:8%; border-top:0.5px solid grey; border-bottom:0.5px solid grey;"></div>
       <!-- 메인 이미지 변경할 것 z-index참고 -->
        <div id="carouselExampleIndicators" class="carousel slide slidew" data-bs-ride="carousel"  style="margin-top:10%;">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block h-80 w-100" src="${path}/assets/img/intro.jpg" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block h-80 w-100" src="${path}/assets/img/intro.jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block h-80 w-100" src="${path}/assets/img/intro.jpg" alt="Third slide">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
      <!- 사이트 소개글 -->
      <h5 style="text-align:center;">
		</h5>
	

      <!--달력넣기  -->
      <div class="row" style="height:400px;">
        <div class="col-lg-6 mb-4 mb-lg-0">
          <div class="card z-index-2 h-100">
          	<h4 style="text-align:center; margin-top:20%; width:50%;">
          	사이트소개글
	콘티고는 플리마켓 플랫폼을 제공 어쩌고 하면서
	지역사회와 함께 성장하는 올바른 가치를 추구합니다.
          	</4>
          </div>
        </div>
        <div class="col-lg-5"  style="width:50%;">
          <div class="card card-carousel overflow-hidden h-100 p-0" >
            <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
              <div class="carousel-inner border-radius-lg h-100">
                <div class="carousel-item h-100 active" style="background-image: url('${path}/assets/img/img-2.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-camera-compact text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">Get started with Argon</h5>
                    <p>There’s nothing I really wanted to do in life that I wasn’t able to get good at.</p>
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('${path}/assets/img/img-1.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-bulb-61 text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">Faster way to create web pages</h5>
                    <p>That’s my skill. I’m not really specifically talented at anything except for the ability to learn.</p>
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('${path}/assets/img/img-3.jpg');
      background-size: cover;">
                  <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                    <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                      <i class="ni ni-trophy text-dark opacity-10"></i>
                    </div>
                    <h5 class="text-white mb-1">Share with us your design tips!</h5>
                    <p>Don’t be afraid to be wrong because you can’t learn anything from a compliment.</p>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      </div>
      
      
        <!-- 날씨 -->

      <div class="row">
        <div class="col-xl-4 h-500" style="width:20%; ">
          <div class="row">
            <div class="col-12">
              <div class="card" >
                <div class="card-body p-3">
                  <div class="row">
                    <div class="col-8 my-auto">
                      <div class="numbers">
                        <p class="text-sm mb-0 text-capitalize font-weight-bold opacity-7">Wheather today</p>
                        <h5 class="font-weight-bolder mb-0">
                         날씨 위치 고민 <br>San Francisco - 29°C
                        </h5>
                      </div>
                    </div>
                    <div class="col-4 text-end">
                      <img class="w-50" src="${path}/assets/img/small-logos/icon-sun-cloud.png" alt="image sun">
                      <h5 class="mb-0 text-end me-1">Cloudy</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
         </div>
            <div class="row"> 
              	<h4 style="text-align:center;">지도<br> 플리마켓 열리는 장소 좌표 찍을거임<br>근데 가능할까?</h4>
             </div> 
      
  <!-- 커뮤니티/플리마켓 미리보기 -->
  <div class="row" style="margin-top:5%;">
        <div class="col-xl-11"  style="width:100%;">
          <div class="card" >
            <div class="card-header d-flex pb-0 p-3" >
              <h6 class="my-auto" >게시글 정보는</h6>
              <div class="nav-wrapper position-relative ms-auto">
                <ul class="nav nav-pills nav-fill p-1" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link mb-0 px-0 py-1 active" data-bs-toggle="tab" href="#cam1" role="tab" aria-controls="cam1" aria-selected="true">
                      커뮤니티
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#cam2" role="tab" aria-controls="cam2" aria-selected="false">
                      플리마켓
                    </a>
                  </li>
                </ul>
              </div>
              <div class="dropdown pt-2">
                <a href="javascript:;" class="text-secondary ps-4" id="dropdownCam" data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="fas fa-ellipsis-v"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-end me-sm-n4 px-2 py-3" aria-labelledby="dropdownCam">
                  <li><a class="dropdown-item border-radius-md" href="javascript:;">Pause</a></li>
                  <li><a class="dropdown-item border-radius-md" href="javascript:;">Stop</a></li>
                  <li><a class="dropdown-item border-radius-md" href="javascript:;">Schedule</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><a class="dropdown-item border-radius-md text-danger" href="javascript:;">Remove</a></li>
                </ul>
              </div>
            </div>
            <div class="card-body p-3 mt-2">
              <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show position-relative active height-400 border-radius-lg" id="cam1" role="tabpanel" aria-labelledby="cam1" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/smart-home-1.jpg'); background-size:cover;">
                  <div class="position-absolute d-flex top-0 w-100">
                    <p class="text-white p-3 mb-0">17.05.2021 4:34PM</p>
                    <div class="ms-auto p-3">
                      <span class="badge badge-secondary">
                        <i class="fas fa-dot-circle text-danger"></i>
                        Recording</span>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade position-relative height-400 border-radius-lg" id="cam2" role="tabpanel" aria-labelledby="cam2" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/smart-home-2.jpg'); background-size:cover;">
                  <div class="position-absolute d-flex top-0 w-100">
                    <p class="text-white p-3 mb-0">17.05.2021 4:35PM</p>
                    <div class="ms-auto p-3">
                      <span class="badge badge-secondary">
                        <i class="fas fa-dot-circle text-danger"></i>
                        Recording</span>
                    </div>
                  </div>
                </div>
              </div>
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
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
     
</body>
</html>