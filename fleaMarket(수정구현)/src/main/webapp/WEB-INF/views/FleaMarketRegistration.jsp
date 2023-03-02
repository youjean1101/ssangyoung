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
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <title>
    플리마켓 등록
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
<!-- jquery cdn -->
<script
  src="https://code.jquery.com/jquery-3.6.3.min.js"
  integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
  crossorigin="anonymous"></script>


<%-- gps --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=491d6062da8be4de279d8ef2a5a72e75"></script>
<script src="${path}/assets/js/plugins/fullcalendar.min.js"></script>
<%--모달창 --%>
<script>
$(document).ready(function(){

$('#editor .ql-editor').keyup(function(){

 	var expeditor=$(this).html() 
	console.log("dd",expeditor);
	$('input[name=content]').val(expeditor); 
})
});


function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("checkForm");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}

</script>
</head>
<link href="${path}/resource/css/FleaMarketRe/FleaMarketRe.css" rel="stylesheet" />
<style>
#callendar01{
   display:none;
}
</style>
<%@include file="header.jsp" %>  
<body class="g-sidenav-show   bg-gray-100">

  <div class="min-height-300 bg-primary position-absolute w-100"></div>
 
  <main class="main-content position-relative border-radius-lg ">
<!--     Navbar
    <nav class="navbar navbar-main navbar-expand-lg  px-0 mx-4 shadow-none border-radius-xl z-index-sticky " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm">
              <a class="text-white" href="javascript:;">
                <i class="ni ni-box-2"></i>
              </a>
            </li>
            <li class="breadcrumb-item text-sm text-white"><a class="opacity-5 text-white" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">New Project</li>
          </ol>
          <h6 class="font-weight-bolder mb-0 text-white">New Project</h6>
        </nav> -->
        <div class="sidenav-toggler sidenav-toggler-inner d-xl-block d-none ">
          <a href="javascript:;" class="nav-link p-0">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line bg-white"></i>
              <i class="sidenav-toggler-line bg-white"></i>
              <i class="sidenav-toggler-line bg-white"></i>
            </div>
          </a>
        </div>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
            <div class="input-group">
              <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
              <input type="text" class="form-control" placeholder="Type here...">
            </div>
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-flex align-items-center">
              <a href="${path}/pages/authentication/signin/illustration.html" class="nav-link text-white font-weight-bold px-0" target="_blank">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Sign In</span>
              </a>
            </li>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                  <i class="sidenav-toggler-line bg-white"></i>
                </div>
              </a>
            </li>
            <li class="nav-item px-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
              </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-bell cursor-pointer"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${path}/assets/img/team-2.jpg" class="avatar avatar-sm  me-3 " alt="user image">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New message</span> from Laur
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          13 minutes ago
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="mb-2">
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="my-auto">
                        <img src="${path}/assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 " alt="logo spotify">
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          <span class="font-weight-bold">New album</span> by Travis Scott
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          1 day
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
                <li>
                  <a class="dropdown-item border-radius-md" href="javascript:;">
                    <div class="d-flex py-1">
                      <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                        <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                          <title>credit-card</title>
                          <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                            <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                              <g transform="translate(1716.000000, 291.000000)">
                                <g transform="translate(453.000000, 454.000000)">
                                  <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                  <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                </g>
                              </g>
                            </g>
                          </g>
                        </svg>
                      </div>
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="text-sm font-weight-normal mb-1">
                          Payment successfully completed
                        </h6>
                        <p class="text-xs text-secondary mb-0">
                          <i class="fa fa-clock me-1"></i>
                          2 days
                        </p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-lg-9 col-12 mx-auto">
        
        <form  action="/file-upload.do" method="post" id="aform" name="aform" enctype="multipart/form-data">
          <div class="card card-body mt-4">
            <h6 class="mb-0 fleamarket">플리마켓 등록</h6>
            <hr class="horizontal dark my-3">
            <label for="title" class="form-label labelFont" >제목</label>
            <input type="text" class="form-control" id="projectName" name="title">
         
            
             <div class="row">
              <div class="col-6">
                <label class="form-label labelFont" >플리마켓 시작일</label>
                <input class="form-control datetimepicker" type="text" placeholder="시작일을 선택해주세요" name="openDate" data-input>
              </div>
              <div class="col-6">
                <label class="form-label labelFont" >플리마켓 종료일</label>
                <input class="form-control datetimepicker" type="text" placeholder="종료일을 선택해주세요" name="closeDate" data-input>
              </div>
           </div>
            
            <!-- 캘린더 -->
            <div class="card card-calendar">
			  <div class="card-body p-3">
			    <div class="calendar" data-bs-toggle="calendar" id="calendar"></div>
			  </div>
            </div>
            
            <div class="row">
              <div class="col-6">
                <label class="form-label labelFont">모집 인원</label>
                <input class="form-control" type="text"  name="approvalMaxCnt">
              </div>
           </div>
            
                     
           <div class="row">
              <div class="col-6">
                <label class="form-label labelFont" >모집 시작일</label>
                <input class="form-control datetimepicker" type="text" placeholder="시작일을 선택해주세요" name="recruitmentStartDate" data-input>
              </div>
              <div class="col-6">
                <label class="form-label labelFont" >모집 종료일</label>
                <input class="form-control datetimepicker" type="text" placeholder="종료일을 선택해주세요" name="recruitmentEndDate" data-input>
              </div>
           </div>
           
           <div class="row">
              <div class="col-6">
                <label class="form-label labelFont" >장소</label>
                
              </div>
            
<!-- gps -->          
   <div class="map_wrap">
    <div id="map" style="width:580px;height:300px;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
     
	        <span id="centerAddr2">  </span>
	        <span id="centerAddr3">  </span>
	    </div>
	     <input Type="text" name="address" value="">    
	<!--      <input Type="text" name="daddressval" placeholder="상세주소">     -->
       
     </div>  
            
            <label class="mt-4 labelFont">내용</label>
        
            <div id="editor">
          <!--     <p>Hello World!</p>
              <p>Some initial <strong>bold</strong> text</p> -->
              <p id="contents"><br></p>
            </div>
        <input type="hidden" name="content" id="content"value="">
        
         <div class="row">
              <div class="col-6">
                <label class="form-label labelFont" >첨부파일 유무</label>
                  <div class="card">
		        <!-- 양식유무 -->
		         <div class="form-check"> 
		             <input class="form-check-input" name="checkForm" type="checkbox" value="N" onclick='checkOnlyOne(this)'>
		             <label>첨부파일x</label>
		         </div> 
		         <div class="form-check"> 		         
		             <input class="form-check-input" name="checkForm" type="checkbox" value="P" onclick='checkOnlyOne(this)'>
		             <label>개인 첨부파일</label>
		         </div> 
		         <div class="form-check"> 
		             <input class="form-check-input" name="checkForm" type="checkbox" value="C" onclick='checkOnlyOne(this)'>
		             <label>공통 첨부파일</label>
		          
		         </div>
		      </div>
             </div>
         </div>
         
            <label class="mt-4 form-label labelFont">첨부파일</label>
            <div class="form-control dropzone" id="dropzone">
              <div class="fallback">
                <input name="filePath" type="file" multiple />
              </div>
            </div>
            </form>
        
            <div class="d-flex justify-content-end mt-4">
              <button type="submit" name="button" class="btn bg-gradient-primary m-0 ms-2">등록하기</button>
            </div>
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
                made with <i class="fa fa-heart"></i> by
                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
                for a better web.
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
        </div>
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
<!-- Button trigger modal -->
<button type="button" class="btn bg-gradient-primary" id="callendar01" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>


  <!--   Core JS Files   -->
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/quill.min.js"></script>
  <script src="${path}/assets/js/plugins/flatpickr.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script>
  <script>

    
   //템플릿
  
    if (document.getElementById('editor')) {
      var quill = new Quill('#editor', {
        theme: 'snow' // Specify theme in configuration
      });
    }

    if (document.getElementById('choices-multiple-remove-button')) {
      var element = document.getElementById('choices-multiple-remove-button');
      const example = new Choices(element, {
        removeItemButton: true
      });

      example.setChoices(
        [{
            value: 'One',
            label: 'Label One',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Label Two',
            selected: true
          },
          {
            value: 'Three',
            label: 'Label Three'
          },
        ],
        'value',
        'label',
        false,
      );
    }

    if (document.querySelector('.datetimepicker')) {
      flatpickr('.datetimepicker', {
        allowInput: true
      }); // flatpickr
    }

    Dropzone.autoDiscover = false;
    var drop = document.getElementById('dropzone')
    var myDropzone = new Dropzone(drop, {
      url: "/file/post",
      addRemoveLinks: true

    });
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
<script>
var toDay = new Date().toISOString().split("T")[0];
var calendar = new FullCalendar.Calendar(document.getElementById("calendar"), {
    initialView: "dayGridMonth",
    headerToolbar: {
      start: 'title', // will normally be on the left. if RTL, will be on the right
      center: '',
      end: 'today prev,next' // will normally be on the right. if RTL, will be on the left
    },
    selectable: true,
    editable: true,
    initialDate: toDay,
    //캘린더 정보 불러오기 
    events:function(info, successCallback, failureCallback){
		$.ajax({
			type:"post",
			url:"/springweb/calendarAjax.do",
			dataType:"json",
			success:function(data){
				console.log(data.callist)
				successCallback(data.callist)
			},
			error:function(err){
				console.log(err)
			}
		})
	}

  });

  calendar.render();


  //gps 
var container = document.getElementById('map');// 지도를 표시할 div 
var options = {
   center: new kakao.maps.LatLng(33.450701, 126.570667),// 지도의 중심좌표
   level: 3 // 지도의 확대 레벨
};

//지도를 생성합니다    
var map = new kakao.maps.Map(container, options);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
    infowindow = new kakao.maps.InfoWindow({zindex:1}); 

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});
function searchAddrFromCoords(coords, callback) {// 좌표로 주소 정보를 요청합니다
   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {// 좌표로 상세 주소 정보를 요청합니다
   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   
}


//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
   if (status === kakao.maps.services.Status.OK) {
     var infoDiv = document.getElementById('centerAddr');

       for(var i = 0; i < result.length; i++) {
           // 행정동의 region_type 값은 'H' 이므로
           if (result[i].region_type === 'H') {
               infoDiv.innerHTML = result[i].address_name;
               break;
           }
       }
   }    
} 

/* function serar */
//동에 대한 default 
geocoder.addressSearch('판교', function(result, status) {
   var infoDiv2 = document.getElementById('centerAddr2'); 
   var infoDiv3 = document.getElementById('centerAddr3'); 

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
           content: '<div style="width:150px;text-align:center;padding:6px 0;">요기!</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        var infoDiv = document.getElementById('centerAddr'); 

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }
     kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
           searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
               if (status === kakao.maps.services.Status.OK) {
                   var detailAddr2 = !!result[0].road_address ? result[0].road_address.address_name : '';
                   detailAddr3 = result[0].address.address_name;
                        
                         
                      /* console.log("도로명주소:"+result[0].road_address.address_name)
                      console.log("지번주소:"+result[0].address.address_name) */
                   
                   var content = '<div class="bAddr">' +
                                   '<span class="title">주소정보</span>' + 
                                   detailAddr2 + 
                               '</div>';

                   // 마커를 클릭한 위치에 표시합니다 
                   marker.setPosition(mouseEvent.latLng);
                   marker.setMap(map);

                   // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                   infowindow.setContent(content);
                   infowindow.open(map, marker);
                   infoDiv=detailAddr2;
                   infoDiv2.innerHTML=detailAddr2;
                   infoDiv3.innerHTML=detailAddr3;
                   
                   // 지도 선택한 부분 input 들어감 
                   var aform = document.querySelector("#aform")
                   aform.address.value = document.getElementById("centerAddr3").innerText;
              /*      var address =$("#centerAddr3").val()
                   $("input[name=addressval]").val()=address; */
                   //aform.addressval2.value = document.getElementById("centerAddr3").innerText;
                   
               }   
           });
       });
});    





  
</script>


</html>