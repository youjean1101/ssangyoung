<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     

<!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
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
  <style>
  .disflex{
    display:flex;
    gap:10px;
  }
  .insA{
    width:150px;
    height:40px;
  }
  .searIns{
    width:200px;
  }
  .insA1{
    width:100px;
    height:40px;
  }
  .text-sm{
     line-height:3;
  }
  </style>
</head>
<body class="g-sidenav-show   bg-gray-100">
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <!-- Card header -->
            <div class="card-header pb-0">
              <div class="d-lg-flex">
                <div>
                  <h5 class="mb-0">사는 이야기</h5>
                  <p class="text-sm mb-0">
                   나의 이야기를 써주세요
                  </p>
                </div>
                <div class="ms-auto my-auto mt-lg-0 mt-4">
                  <div class="ms-auto my-auto disflex">
                   <div>
                    <button type = "button" class="btn bg-gradient-primary btn-sm mb-0 insA">+ 게시물 등록하기</button>
                    </div>
                    <div>
                    <div class="dropdown">
  <button class="btn bg-gradient-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
    카테고리별 검색
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <li><a class="dropdown-item" href="#">인기순</a></li>
    <li><a class="dropdown-item" href="#">최근 등록순</a></li>
    <li><a class="dropdown-item" href="#">조회수 순</a></li>
  </ul>
</div>
                    
                    </div>
                     <div class="form-group searIns">
        <div class="input-group mb-4 searIns">
          <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span>
          <input class="form-control" placeholder="Search" type="text">
        </div>
      </div>
                     <div class="col-md-6 ">
       <button class="btn btn-outline-primary btn-sm export mb-0 mt-sm-0 mt-1 insA1" type="button" name="button">검색</button>
    </div>
                 </div>
                  
                </div>
              </div>
           
            
          </div>
          <div style = "margin-bottom: -35px;margin-left: 18px;">
             <button type="button" class="btn btn-outline-dark">전체</button>
             <button type="button" class="btn btn-outline-dark">인기글</button>
             
          </div>
            <div class="card-body px-0 pb-0">
              <div class="table-responsive">
                <table class="table table-flush" id="products-list">
                  <thead class="thead-light">
                    <tr>
                      <th>게시물</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>좋아요</th>
                      <th>작성날짜</th>
                      <th>room</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody style="text-align: center">
                    <tr>
                      <td>
                        <div class="d-flex">
                          <div class="form-check my-auto">1</div>
                          <img class="w-10 ms-3" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/soft-ui-design-system/assets/img/ecommerce/adidas-hoodie.jpg" alt="hoodie">
                          <h6 class="ms-3 my-auto">개귀엽죠진심...</h6>
                      </td>
                      <td class="text-sm">Clothing</td>
                      <td class="text-sm">6</td>
                      <td class="text-sm">3</td>
                      <td class="text-sm">2022-12-12</td>
                      <td style="text-align: center;padding-top: 12px;">
                        <span class="badge badge-secondary badge-sm">room 가기</span>
                      </td>
                      <td class="text-sm">
                        <a href="javascript:;" data-bs-toggle="tooltip" data-bs-original-title="Preview product">
                          <i class="fas fa-eye text-secondary"></i>
                        </a>
                        <a href="javascript:;" class="mx-3" data-bs-toggle="tooltip" data-bs-original-title="Edit product">
                          <i class="fas fa-user-edit text-secondary"></i>
                        </a>
                        <a href="javascript:;" data-bs-toggle="tooltip" data-bs-original-title="Delete product">
                          <i class="fas fa-trash text-secondary"></i>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="d-flex">
                          <div class="form-check my-auto">2</div>
                          <img class="w-10 ms-3" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/soft-ui-design-system/assets/img/ecommerce/adidas-hoodie.jpg" alt="hoodie">
                          <h6 class="ms-3 my-auto">개귀엽죠진심...</h6>
                      </td>
                      <td class="text-sm">Clothing</td>
                      <td class="text-sm">6</td>
                      <td class="text-sm">3</td>
                      <td class="text-sm">2022-12-12</td>
                      <td style="text-align: center;padding-top: 12px;">
                        <span class="badge badge-secondary badge-sm">room 가기</span>
                      </td>
                      <td class="text-sm">
                        <a href="javascript:;" data-bs-toggle="tooltip" data-bs-original-title="Preview product">
                          <i class="fas fa-eye text-secondary"></i>
                        </a>
                        <a href="javascript:;" class="mx-3" data-bs-toggle="tooltip" data-bs-original-title="Edit product">
                          <i class="fas fa-user-edit text-secondary"></i>
                        </a>
                        <a href="javascript:;" data-bs-toggle="tooltip" data-bs-original-title="Delete product">
                          <i class="fas fa-trash text-secondary"></i>
                        </a>
                      </td>
                    </tr>
                    
                 
                  </tbody>
                </table>
                <!-- 페이지 네이션  -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="javascript:;" tabindex="-1">
        <i class="fa fa-angle-left"></i>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="javascript:;">1</a></li>
    <li class="page-item active"><a class="page-link" href="javascript:;">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:;">3</a></li>
    <li class="page-item">
      <a class="page-link" href="javascript:;">
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
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/datatables.js"></script>
  <script>
    if (document.getElementById('products-list')) {
      const dataTableSearch = new simpleDatatables.DataTable("#products-list", {
        searchable: true,
        fixedHeight: false,
        perPage: 7
      });

      document.querySelectorAll(".export").forEach(function(el) {
        el.addEventListener("click", function(e) {
          var type = el.dataset.type;

          var data = {
            type: type,
            filename: "soft-ui-" + type,
          };

          if (type === "csv") {
            data.columnDelimiter = "|";
          }

          dataTableSearch.export(data);
        });
      });
    };
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

</html>