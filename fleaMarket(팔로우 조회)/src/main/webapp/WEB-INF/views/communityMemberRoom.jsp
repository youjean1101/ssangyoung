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
<title>팔로우 회원room</title>
<meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${path}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
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
</head>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body class="g-sidenav-show   bg-gray-100">
  <main class="main-content position-relative border-radius-lg">
  	<jsp:include page="header.jsp"></jsp:include>
    <!-- End Navbar -->
     <div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto">
            <div class="avatar avatar-xl position-relative">
              <img src="${path}/assets/img/team-1.jpg" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
            </div>
          </div>
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
               	들어올 값
              </h5>
              <p class="mb-0 font-weight-bold text-sm">
                님의 Room  <i class="ni ni-shop"></i>
              </p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3">
            <div class="nav-wrapper position-relative end-0">
              <ul class="nav nav-pills nav-fill p-1" role="tablist">
                <li class="nav-item">
                  <a class="nav-link mb-0 px-0 py-1 active d-flex align-items-center justify-content-center " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="true">
                    <i class="ni ni-fat-add"></i>
                    <!--<i class="ni ni-fat-delete"></i>  -->
                    <span class="ms-2">팔로우</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link mb-0 px-0 py-1 d-flex align-items-center justify-content-center  active " data-bs-toggle="tab" href="javascript:;" role="tab" aria-selected="false">
                    <i class="ni ni-chat-round"></i>
                    <span class="ms-2">채팅하기</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="container-fluid py-4">
      <div class="d-flex m-3">
	      <div class="col-lg-4">
		      <div class="card" style="width:600px;">
		        <div class="card-body" style="margin-left:2%;">
		          <div class="d-flex">
		            <p class="mb-0">정보 미노출/노출</p>
		            <div class="form-check form-switch ms-auto">
		              <input class="form-check-input ms-0" type="checkbox" checked id="flexSwitchCheckDefault00">
		            </div>
		          </div>
		          <img class="img-fluid pt-3 pb-2" src="${path}/assets/img/small-logos/icon-bulb.svg" alt="bulb_icon">
		          <p class="mb-0">e-mail:</p>
		          <p class="mb-0">phone-number:</p>
		          <p class="mb-0">사업자정보:</p>
		        </div>
		      </div>
		  </div>
		  <div class="col-lg-2">
          	<div class="card" style="width:300px;">
	            <div class="card-body">
	              <div class="icon icon-shape bg-gradient-primary shadow text-center">
	                <i class="ni ni-favourite-28" aria-hidden="true"></i>
	              </div>
	              <h5 class="mt-3 mb-0">754 <span class="text-secondary text-sm">개</span></h5>
	              <p class="mb-0">게시글 좋아요 갯수</p>
	            </div>
	          </div>
	        </div>
		  <div class="col-lg-2">
          	<div class="card" style="width:300px;">
	            <div class="card-body">
	              <div class="icon icon-shape bg-gradient-primary shadow text-center">
	                <i class="ni ni-favourite-28" aria-hidden="true"></i>
	              </div>
	              <h5 class="mt-3 mb-0">754 <span class="text-secondary text-sm">개</span></h5>
	              <p class="mb-0">댓글 좋아요 갯수(뭐넣을지 생각)</p>
	            </div>
	          </div>
	        </div>
	  	<div class="col-lg-2">
	        <div class="card" style="width:300px;">
	           <div class="card-body">
	             <p>팔로워 수</p>
	             <h3>18명</h3>
	             <span class="badge badge-success">+1(하루에 팔로우한 회원)</span>
	           </div>
	        </div>
        </div>
        <div class="ms-auto d-flex">
          <div class="pe-4 mt-1 position-relative" >
            <p class="text-black text-s font-weight-bold mb-2">팔로우한 회원들:</p>
            <div class="d-flex align-items-center justify-content-center">
              <div class="avatar-group">
                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland">
                  <img alt="Image placeholder" src="${path}/assets/img/team-1.jpg">
                </a>
                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="Audrey Love">
                  <img alt="Image placeholder" src="${path}/assets/img/team-2.jpg" class="rounded-circle">
                </a>
                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis">
                  <img alt="Image placeholder" src="${path}/assets/img/team-3.jpg" class="rounded-circle">
                </a>
                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="Lucia Linda">
                  <img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle">
                </a>
                <a href="javascript:;" class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="Ronald Miller">
                  <img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class="rounded-circle">
                </a>
              </div>
            </div>
            <hr class="vertical light mt-0">
          </div>
          <div class="ps-4">
            <button class="btn bg-gradient-info btn-icon-only mb-0 mt-3" data-toggle="modal" data-target="#new-board-modal">
              <i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
      </div>
      <!-- 통계 -->
     <div class="row">
        <div class="col-lg-4 col-sm-6" style="height:300px;">
          <div class="card h-100">
            <div class="card-header pb-0 p-3">
              <div class="d-flex justify-content-between">
                <h6 class="mb-0">커뮤니티 카테고리별 게시물 갯수</h6>
                <button type="button" class="btn btn-icon-only btn-rounded btn-outline-secondary mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="See traffic channels">
                  <i class="fas fa-info" aria-hidden="true"></i>
                </button>
              </div>
            </div>
            <div class="card-body pb-0 p-3 mt-4">
              <div class="row">
                <div class="col-7 text-start">
                  <div class="chart">
                    <canvas id="chart-pie" class="chart-canvas" height="200"></canvas>
                  </div>
                </div>
                <div class="col-5 my-auto">
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-info"></i>
                    <span class="text-dark text-xs">홍보글</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-primary"></i>
                    <span class="text-dark text-xs">사업아이디어</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-dark"></i>
                    <span class="text-dark text-xs">사는이야기</span>
                  </span>
                  <span class="badge badge-md badge-dot me-4 d-block text-start">
                    <i class="bg-secondary"></i>
                    <span class="text-dark text-xs">꿀팁</span>
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-8 col-sm-6 mt-sm-0 mt-4" style="height:300px;">
          <div class="card">
            <div class="card-header pb-0 p-3">
              <div class="d-flex justify-content-between">
                <h6 class="mb-0">월별 게시글 등록 갯수</h6>
                <button type="button" class="btn btn-icon-only btn-rounded btn-outline-secondary mb-0 ms-2 btn-sm d-flex align-items-center justify-content-center" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="See which ads perform better">
                  <i class="fas fa-info" aria-hidden="true"></i>
                </button>
              </div>
              <div class="d-flex align-items-center">
                <span class="badge badge-md badge-dot me-4">
                  <i class="bg-dark"></i>
                  <span class="text-dark text-xs">팔로우한회원닉네임님이 게시한 게시글 </span>
                </span>
              </div>
            </div>
            <div class="card-body p-3">
              <div class="chart">
                <canvas id="chart-line" class="chart-canvas" height="200"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="mt-3 kanban-container" style="width:100%;">
        <div class="py-2 min-vh-100 d-inline-flex">
          <div id="myKanban"></div>
        </div>
      </div>
      
      <!-- 게시글내역  -->
      <div class="modal fade" id="new-board-modal" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="h5 modal-title">너의 게시물명을 입력해라</h5>
              <button type="button" class="btn close pe-1" data-dismiss="modal" data-target="#new-board-modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="pt-4 modal-body">
              <div class="mb-4 input-group">
                <span class="input-group-text">
                  <i class="far fa-edit"></i>
                </span>
                <input class="form-control" placeholder="Board Name" type="text" id="jkanban-new-board-name" />
              </div>
              <div class="text-end">
                <button class="m-1 btn btn-primary" id="jkanban-add-new-board" data-toggle="modal" data-target="#new-board-modal">
                  Save changes
                </button>
                <button class="m-1 btn btn-secondary" data-dismiss="modal" data-target="#new-board-modal">
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="hidden opacity-50 fixed inset-0 z-40 bg-black" id="new-board-modal-backdrop"></div>
      <div class="modal fade" id="jkanban-info-modal" style="display: none" tabindex="-1" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="h5 modal-title">게시물 상세보기</h5>
              <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="pt-4 modal-body">
              <input id="jkanban-task-id" class="d-none" />
              <div class="mb-4 input-group">
                <span class="input-group-text">
                  <i class="far fa-edit"></i>
                </span>
                <input class="form-control" placeholder="Task Title" type="text" id="jkanban-task-title" />
              </div>
              <div class="mb-4 input-group">
                <span class="input-group-text">
                  <i class="fas fa-user"></i>
                </span>
                <input class="form-control" placeholder="Task Assignee" type="text" id="jkanban-task-assignee" />
              </div>
              <div class="form-group">
                <textarea class="form-control" placeholder="Task Description" id="jkanban-task-description" rows="4"></textarea>
              </div>
              <div class="alert alert-success d-none">Changes saved!</div>
              <div class="text-end">
                <button class="m-1 btn btn-primary" id="jkanban-update-task" data-toggle="modal" data-target="#jkanban-info-modal">
                  Save changes
                </button>
                <button class="m-1 btn btn-secondary" data-dismiss="modal" data-target="#jkanban-info-modal">
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="hidden opacity-50 fixed inset-0 z-40 bg-black" id="jkanban-info-modal-backdrop"></div>
    </div>
  </main>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
  <!-- Kanban scripts -->
  <script src="${path}/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path}/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="${path}/assets/js/plugins/chartjs.min.js"></script>
  <!-- 차트 기능 -->
  <script>
    var ctx1 = document.getElementById("chart-line").getContext("2d");
    var ctx2 = document.getElementById("chart-pie").getContext("2d");

    var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke1.addColorStop(1, 'rgba(94, 114, 228,0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228,0.0)');
    gradientStroke1.addColorStop(0, 'rgba(94, 114, 228,0)'); //purple colors

    var gradientStroke2 = ctx1.createLinearGradient(0, 230, 0, 50);

    gradientStroke2.addColorStop(1, 'rgba(20,23,39,0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(72,72,176,0.0)');
    gradientStroke2.addColorStop(0, 'rgba(20,23,39,0)'); //purple colors

    // Line chart
    new Chart(ctx1, {
      type: "line",
      data: {
        labels: ["Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "커뮤니티 게시글 갯수",
            tension: 0.4,
            borderWidth: 0,
            pointRadius: 2,
            pointBackgroundColor: "#3A416F",
            borderColor: "#3A416F",
            borderWidth: 3,
            backgroundColor: gradientStroke2,
            fill: true,
            data: [0, 10, 20, 30, 40, 50, 60, 70, 80],
            maxBarThickness: 6
          }
        ],
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
              color: '#9ca2b7'
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: true,
              drawOnChartArea: true,
              drawTicks: true,
              borderDash: [5, 5]
            },
            ticks: {
              display: true,
              color: '#9ca2b7',
              padding: 10
            }
          },
        },
      },
    });


    // Pie chart
    new Chart(ctx2, {
      type: "pie",
      data: {
        labels: ['홍보글', '사업아이디어', '사는이야기', '꿀팁'],
        datasets: [{
          label: "Projects",
          weight: 9,
          cutout: 0,
          tension: 0.9,
          pointRadius: 2,
          borderWidth: 2,
          backgroundColor: ['#17c1e8', '#5e72e4', '#3A416F', '#a8b8d8'],
          data: [15, 20, 12, 60],
          fill: false
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
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              display: false
            }
          },
          x: {
            grid: {
              drawBorder: false,
              display: false,
              drawOnChartArea: false,
              drawTicks: false,
            },
            ticks: {
              display: false,
            }
          },
        },
      },
    });
  </script>
  <script>
    // 게시물 기능

    (function() {
      if (document.getElementById("myKanban")) {
        var KanbanTest = new jKanban({
          element: "#myKanban",
          gutter: "5px",
          widthBoard: "340px",
          click: el => {
            let jkanbanInfoModal = document.getElementById("jkanban-info-modal");

            let jkanbanInfoModalTaskId = document.querySelector(
              "#jkanban-info-modal #jkanban-task-id"
            );
            let jkanbanInfoModalTaskTitle = document.querySelector(
              "#jkanban-info-modal #jkanban-task-title"
            );
            let jkanbanInfoModalTaskAssignee = document.querySelector(
              "#jkanban-info-modal #jkanban-task-assignee"
            );
            let jkanbanInfoModalTaskDescription = document.querySelector(
              "#jkanban-info-modal #jkanban-task-description"
            );
            let taskId = el.getAttribute("data-eid");

            let taskTitle = el.querySelector('p.text').innerHTML;
            let taskAssignee = el.getAttribute("data-assignee");
            let taskDescription = el.getAttribute("data-description");
            jkanbanInfoModalTaskId.value = taskId;
            jkanbanInfoModalTaskTitle.value = taskTitle;
            jkanbanInfoModalTaskAssignee.value = taskAssignee;
            jkanbanInfoModalTaskDescription.value = taskDescription;
            var myModal = new bootstrap.Modal(jkanbanInfoModal, {
              show: true
            });
            myModal.show();
          },
          buttonClick: function(el, boardId) {
            if (
              document.querySelector("[data-id='" + boardId + "'] .itemform") ===
              null
            ) {
              // create a form to enter element
              var formItem = document.createElement("form");
              formItem.setAttribute("class", "itemform");
              formItem.innerHTML = `<div class="form-group">
          <textarea class="form-control" rows="2" autofocus></textarea>
          </div>
          <div class="form-group">
              <button type="submit" class="btn bg-gradient-success btn-sm pull-end">댓글쓰기</button>
              <button type="button" id="kanban-cancel-item" class="btn bg-gradient-light btn-sm pull-end me-2">취소</button>
          </div>`;

              KanbanTest.addForm(boardId, formItem);
              formItem.addEventListener("submit", function(e) {
                e.preventDefault();
                var text = e.target[0].value;
                let newTaskId =
                  "_" + text.toLowerCase().replace(/ /g, "_") + boardId;
                KanbanTest.addElement(boardId, {
                  id: newTaskId,
                  title: text,
                  class: ["border-radius-md"]
                });
                formItem.parentNode.removeChild(formItem);
              });
              document.getElementById("kanban-cancel-item").onclick = function() {
                formItem.parentNode.removeChild(formItem);
              };
            }
          },
          addItemButton: true,
          boards: [{
              id: "_backlog",
              title: "홍보글",
              item: [{
                  id: "_task_1_title_id",
                  title: '<img src="${path}/assets/img/home-decor-1.jpg" class="w-100"><span class="mt-3 badge badge-sm bg-gradient-success">Done</span><p class="text mt-2">Redesign for the home page</p><div class="d-flex"><div> <i class="fa fa-paperclip me-1 text-sm"></i><span class="text-sm">8</span></div><div class="avatar-group ms-auto"><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland"><img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class=""></a><a href="javascript:;" class="avatar avatar-xs rounded-circle me-2" data-toggle="tooltip" data-original-title="Audrey Love"><img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class="rounded-circle"></a><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis"><img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle"></a></div></div>',
                  assignee: "Done Joe",
                  description: "This task's description is for something, but not for anything",
                  class: ["border-radius-md"]
                }
              ]
            },
            {
              id: "_progress",
              title: "사업아이디어",
              item: [{
                  id: "_task_3_title_id",
                  title: '<img src="${path}/assets/img/home-decor-1.jpg" class="w-100"><span class="mt-3 badge badge-sm bg-gradient-success">Done</span><p class="text mt-2">Redesign for the home page</p><div class="d-flex"><div> <i class="fa fa-paperclip me-1 text-sm"></i><span class="text-sm">8</span></div><div class="avatar-group ms-auto"><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland"><img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class=""></a><a href="javascript:;" class="avatar avatar-xs rounded-circle me-2" data-toggle="tooltip" data-original-title="Audrey Love"><img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class="rounded-circle"></a><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis"><img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle"></a></div></div>',
                  assignee: "Done Joe",
                  description: "This task's description is for something, but not for anything",
                  class: ["border-radius-md"]
                }
              ]
            },
            {
              id: "_working",
              title: "사는 이야기",
              item: [{
                  id: "_task_do_something_2_id",
                  title: '<img src="${path}/assets/img/home-decor-1.jpg" class="w-100"><span class="mt-3 badge badge-sm bg-gradient-success">Done</span><p class="text mt-2">Redesign for the home page</p><div class="d-flex"><div><i class="fa fa-paperclip me-1 text-sm"></i><span class="text-sm">8</span></div><div class="avatar-group ms-auto"><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland"><img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class=""></a><a href="javascript:;" class="avatar avatar-xs rounded-circle me-2" data-toggle="tooltip" data-original-title="Audrey Love"><img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class="rounded-circle"></a><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis"><img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle"></a></div></div>',
                  assignee: "Done Joe",
                  description: "This task's description is for something, but not for anything",
                  class: ["border-radius-md"]
                }
              ]
            },
            {
              id: "_done",
              title: "꿀팁",
              item: [{
                  id: "_task_all_right_id",
                  title: '<img src="${path}/assets/img/home-decor-1.jpg" class="w-100"><span class="mt-3 badge badge-sm bg-gradient-success">Done</span><p class="text mt-2">Redesign for the home page</p><div class="d-flex"><div> <i class="fa fa-paperclip me-1 text-sm"></i><span class="text-sm">8</span></div><div class="avatar-group ms-auto"><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland"><img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class=""></a><a href="javascript:;" class="avatar avatar-xs rounded-circle me-2" data-toggle="tooltip" data-original-title="Audrey Love"><img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class="rounded-circle"></a><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis"><img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle"></a></div></div>',
                  assignee: "Done Joe",
                  description: "This task's description is for something, but not for anything",
                  class: ["border-radius-md"]
                },
                {
                  id: "_task_ok_id",
                  title: '<span class="mt-2 badge badge-sm bg-gradient-success">Done</span><p class="text mt-2">Schedule winter campaign</p><div class="d-flex"><div> <i class="fa fa-paperclip me-1 text-sm"></i><span class="text-sm">2</span></div><div class="avatar-group ms-auto"><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Laurence"><img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class=""></a><a href="javascript:;" class="avatar avatar-xs me-2 rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis"><img alt="Image placeholder" src="${path}/assets/img/team-4.jpg" class="rounded-circle"></a></div></div>',
                  assignee: "Done Joe",
                  description: "This task's description is for something, but not for anything",
                  class: ["border-radius-md"]
                }
              ]
            }
          ]
        });

        var addBoardDefault = document.getElementById("jkanban-add-new-board");
        addBoardDefault.addEventListener("click", function() {
          let newBoardName = document.getElementById("jkanban-new-board-name")
            .value;
          let newBoardId = "_" + newBoardName.toLowerCase().replace(/ /g, "_");
          KanbanTest.addBoards([{
            id: newBoardId,
            title: newBoardName,
            item: []
          }]);
          document.querySelector('#new-board-modal').classList.remove('show');
          document.querySelector('body').classList.remove('modal-open');

          document.querySelector('.modal-backdrop').remove();
        });

        var updateTask = document.getElementById("jkanban-update-task");
        updateTask.addEventListener("click", function() {
          let jkanbanInfoModalTaskId = document.querySelector(
            "#jkanban-info-modal #jkanban-task-id"
          );
          let jkanbanInfoModalTaskTitle = document.querySelector(
            "#jkanban-info-modal #jkanban-task-title"
          );
          let jkanbanInfoModalTaskAssignee = document.querySelector(
            "#jkanban-info-modal #jkanban-task-assignee"
          );
          let jkanbanInfoModalTaskDescription = document.querySelector(
            "#jkanban-info-modal #jkanban-task-description"
          );
          KanbanTest.replaceElement(jkanbanInfoModalTaskId.value, {
            title: jkanbanInfoModalTaskTitle.value,
            assignee: jkanbanInfoModalTaskAssignee.value,
            description: jkanbanInfoModalTaskDescription.value
          });
          jkanbanInfoModalTaskId.value = jkanbanInfoModalTaskId.value;
          jkanbanInfoModalTaskTitle.value = jkanbanInfoModalTaskTitle.value;
          jkanbanInfoModalTaskAssignee.value = jkanbanInfoModalTaskAssignee.value;
          jkanbanInfoModalTaskDescription.value = jkanbanInfoModalTaskDescription.value;
          document.querySelector('#jkanban-info-modal').classList.remove('show');
          document.querySelector('body').classList.remove('modal-open');
          document.querySelector('.modal-backdrop').remove();
        });
      }
    })();
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>
</html>