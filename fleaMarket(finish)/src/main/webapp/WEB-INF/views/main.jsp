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
ds

 --%>
<html>
<head>
 <%@ include file="/WEB-INF/views/header.jsp" %>
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
  

   	<!-- 배너  -->
	<div class="mask bg-gradient-primary" style=" width:100%; height:1px; margin-top:8%;"></div>
       <!-- 메인 이미지 변경할 것 z-index참고 -->
   
        <div id="carouselExampleIndicators" class="carousel slide slidew" data-bs-ride="carousel"  style="margin-top:10%;">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="${path}/assets/img/test4.jpg" style="width:100%; height:700px;" alt="First slide">
        </div>
        
        <div class="carousel-item">
          <img src="${path}/assets/img/test1.png" style="width:100%; height:700%" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img src="${path}/assets/img/test2.png" style="width:100%; height:700px;" alt="Third slide">
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

  
      <!--날씨넣기  -->
      <div class="row" style="height:400px;">
        <div class="col-lg-6 mb-4 mb-lg-0">
          <div class="card z-index-2 h-100">
	<iframe src="http://localhost:7080/fleaMarket/dongeun/wether.jsp" style="width:100%;height:100%;">
							    <p>현재 사용 중인 브라우저는 iframe 요소를 지원하지 않습니다!</p>
    </iframe>
          </div>
        </div>
        
      
        
        
        
        <div class="col-lg-5"  style="width:50%;">
          <div class="card card-carousel overflow-hidden h-100 p-0" >
            <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
              <div class="carousel-inner border-radius-lg h-100">
                <div class="carousel-item h-100 active" style="background-image: url('${path}/assets/img/middle1.jpg');
      background-size: cover;">
                  <div class="ms-5">
                    <div class="text-center border-radius-md mb-3">
                    </div>
                    <!-- 
                    <h5 class="text-white mb-1">콘티고</h5>
                    <p class="text-white">플리마켓, 커뮤니티 하나의 플랫폼</p>
                     -->
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('${path}/assets/img/middle2.jpg');
      background-size: cover;">
                  <div class=" ms-5">
                    <div class="text-center border-radius-md mb-3">
                    </div>
                    <!-- 
                    <h5 class="text-white mb-1">플리마켓</h5>
                    <p class="text-white">플리마켓 셀러 참가 모집 및 신청</p>
                     -->
                  </div>
                </div>
                <div class="carousel-item h-100" style="background-image: url('${path}/assets/img/middle3.jpg');
      background-size: cover;" >
                  <div class="ms-5">
                    <div class="text-center border-radius-md mb-3">
                    </div>
                    <!-- 
                    <h5 class="text-white mb-1">커뮤니티</h5>
                    <p class="text-white">홍보, 정보 공유, 셀러들간 1:1 채팅</p>
                     -->
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
      
         <!-- 
            <div class="row"> 
              	<h4 style= v"text-align:center;">지도<br> 플리마켓 열리는 장소 좌표 찍을거임</h4>
             </div> 
     	--> 

  <!-- 커뮤니티/플리마켓 미리보기 -->
  <!-- 
  <div class="row" style="margin-top:5%;">
        <div class="col-xl-11"  style="width:100%;">
          <div class="card" >
            <div class="card-header d-flex pb-0 p-3" >
              <h6 class="my-auto" > image</h6>
              <div class="nav-wrapper position-relative ms-auto">
                <ul class="nav nav-pills nav-fill p-1" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link mb-0 px-0 py-1 active" data-bs-toggle="tab" href="#cam1" role="tab" aria-controls="cam1" aria-selected="true">
                      click! 
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#cam2" role="tab" aria-controls="cam2" aria-selected="false">
                      click!
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
                <div class="tab-pane fade show position-relative active height-600 border-radius-lg" id="cam1" role="tabpanel" aria-labelledby="cam1" style="background-image: url('${path}/assets/img/footer.png'); background-size:cover;">
                  <div class="position-absolute d-flex top-0 w-100">
                    <p class="text-white p-3 mb-0">contigo</p>
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
      -->
         <img src="${path}/assets/img/semifooter.png" style="width:100%; height:750px;">
         <img src="${path}/assets/img/footer.png" style="width:100%; height:750px;">
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
      </footer>
     
  <!--   Core JS Files   -->
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="${path}/assets/js/plugins/leaflet.js"></script>
  <script src="${path}/assets/js/plugins/nouislider.min.js"></script>
  <script>
 /*     var ctx1 = document.getElementById("chart-line").getContext("2d"); 

    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
    new Chart(ctx1, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
          label: "Mobile apps",
          tension: 0.4,
          borderWidth: 0,
          pointRadius: 0,
          borderColor: "#5e72e4",
          backgroundColor: gradientStroke1,
          borderWidth: 3,
          fill: true,
          data: [50, 40, 300, 220, 500, 250, 400, 230, 500],
          maxBarThickness: 6
        }],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          }
        },
        interaction: {
          intersect: false,
          mode: 'index',
        },
        scales: {
          y: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              padding: 10,
              color: '#fbfbfb',
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#ccc',
              padding: 20,
              font: {
                size: 11,
                family: "Open Sans",
                style: 'normal',
                lineHeight: 2
              },
            }
          },
        },
      },
    }); */
  </script>
  


</body>
</html>