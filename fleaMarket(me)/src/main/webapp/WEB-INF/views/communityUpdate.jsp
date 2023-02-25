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
<meta charset="UTF-8">
<title>커뮤니티 게시글 수정</title>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
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
  <link href="${path}/resource/css/Community/CommunityBoard.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show bg-gray-100">
      <div class="row mt-4">
         <div class="card h-100">
           <div class="card-body">
             <h5 class="font-weight-bolder" style="text-align:center; font-size:20pt;">카테고리 게시글 변경</h5>
             <div class="row">
               <div class="col-12">
                 <div class="card-body">
              <div class="row">
                  <img class="border-radius-lg shadow-lg mx-auto" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb.jpg" alt="chair" style="width:600px; height:400px;">
                  <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery" style="margin:24px 32% 0px;">
                    <figure class="ms-2 me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-1.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-1.jpg" alt="Image description"/>
                      </a>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-2.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-2.jpg" itemprop="thumbnail" alt="Image description" />
                      </a>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-3.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-3.jpg" itemprop="thumbnail" alt="Image description" />
                      </a>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-4.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-4.jpg" itemprop="thumbnail" alt="Image description" />
                      </a>
                    </figure>
                    <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-5.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-5.jpg" itemprop="thumbnail" alt="Image description" />
                      </a>
                    </figure>
                  </div>
             </div>
           </div>
        </div>
        <div class="row mt-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder"></h5>
              <div class="row" style="--bs-gutter-x:0;">
                <div class="col-12 col-sm-6">
                   <label class="postUpdateTitle" style="width:90%;">카테고리</label>
	                  <select class="form-control" name="choices-category" style="width:90%;">
	                    <option value="Choice 1" selected="">Furniture</option>
	                    <option value="Choice 2">Real Estate</option>
	                    <option value="Choice 3">Electronics</option>
	                    <option value="Choice 4">Clothing</option>
	                    <option value="Choice 5">Others</option>
	                  </select>	
                </div>
                <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                  <label class="postUpdateTitle">작성자</label>
                  <input class="form-control" value="ID값" type="text" readonly style="width:90%;"/>
                </div>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">제목</label>
                <input class="form-control" type="text" value="Summer" />
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">내용</label>
                <div id="edit-deschiption-edit" style="height:500px;">
                  Long sleeves black denim jacket with a twisted design. Contrast stitching. Button up closure. White arrow prints on the back.
                </div>
              </div>
            <div class="row" style="--bs-gutter-x:0;">
               <label class="mt-4 postUpdateTitle">태그(#)</label>
                <select class="form-control" name="choices-tags" id="choices-tags-edit" multiple>
                  <option value="Choice 1" selected>In Stock</option>
                  <option value="Choice 2">Out of Stock</option>
                  <option value="Choice 3">Sale</option>
                  <option value="Choice 4">Black Friday</option>
                </select>
            </div>
          </div>
             <button class="btn btn-primary" type="button" name="button" style="margin-top:2%; margin-left:28%; width:50%; font-size:18pt;">수정</button>
        </div>
      </div>
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/quill.min.js"></script>
  
  <script>
    if (document.getElementById('edit-deschiption-edit')) {
      var quill = new Quill('#edit-deschiption-edit', {
        theme: 'snow' // Specify theme in configuration
      });
    };

    if (document.getElementById('choices-category-edit')) {
      var element = document.getElementById('choices-category-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-color-edit')) {
      var element = document.getElementById('choices-color-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-currency-edit')) {
      var element = document.getElementById('choices-currency-edit');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-tags-edit')) {
      var tags = document.getElementById('choices-tags-edit');
      const examples = new Choices(tags, {
        removeItemButton: true
      });

      examples.setChoices(
        [{
            value: 'One',
            label: 'Expired',
            disabled: true
          },
          {
            value: 'Two',
            label: 'Out of Stock',
            selected: true
          }
        ],
        'value',
        'label',
        false,
      );
    }
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