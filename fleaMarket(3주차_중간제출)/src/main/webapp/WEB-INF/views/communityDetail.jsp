<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
 <!--
=========================================================
* Argon Dashboard 2 PRO - v2.0.5
=========================================================

* Product Page:  https://www.creative-tim.com/product/argon-dashboard-pro 
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

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
  .dropdown{
  display: flex;
    justify-content: space-between;
  }
  .dstep{
  display:flex;
  justify-content:center;
  gap: 40px;
  margin-top: 15px;
  }
  </style>
</head>

<body class="g-sidenav-show   bg-gray-100">
  
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              
              <div class="dropdown">
              <h5 class="mb-4">~ 님의 게시물</h5>
  <a href="#" class="btn bg-gradient-white dropdown-toggle " data-bs-toggle="dropdown" id="navbarDropdownMenuLink2">
       <i class="ni ni-settings"></i>
  </a>
  <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink2">
      <li>
          <a class="dropdown-item" href="#">
            <i class="ni ni-bulb-61"></i> 신고하기
          </a>
      </li>
      <li>
          <a class="dropdown-item" href="#">
             <i class="ni ni-fat-add"></i> 수정하기
          </a>
      </li>
      <li>
          <a class="dropdown-item" href="#">
             <i class="ni ni-fat-delete"></i> 삭제하기
          </a>
      </li>
  </ul>
</div>
              <div class="row">
                <div class="col-xl-5 col-lg-6 text-center">
                  <img class="w-100 border-radius-lg shadow-lg mx-auto" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb.jpg" alt="chair">
                  <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery">
                    <figure class="ms-2 me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-1.jpg" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-1.jpg" alt="Image description" />
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
                  <!-- Root element of PhotoSwipe. Must have class pswp. -->
                  <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                    <!-- Background of PhotoSwipe.
It's a separate element, as animating opacity is faster than rgba(). -->
                    <div class="pswp__bg"></div>
                    <!-- Slides wrapper with overflow:hidden. -->
                    <div class="pswp__scroll-wrap">
                      <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
                      <!-- don't modify these 3 pswp__item elements, data is added later on. -->
                      <div class="pswp__container">
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                      </div>
                      <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                      <div class="pswp__ui pswp__ui--hidden">
                        <div class="pswp__top-bar">
                          <!--  Controls are self-explanatory. Order can be changed. -->
                          <div class="pswp__counter"></div>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--close">Close (Esc)</button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--fs">Fullscreen</button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--arrow--left">Prev
                          </button>
                          <button class="btn btn-white btn-sm pswp__button pswp__button--arrow--right">Next
                          </button>
                          <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                          <!-- element will get class pswp__preloader--active when preloader is running -->
                          <div class="pswp__preloader">
                            <div class="pswp__preloader__icn">
                              <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                          <div class="pswp__share-tooltip"></div>
                        </div>
                        <div class="pswp__caption">
                          <div class="pswp__caption__center"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-5 mx-auto">
                <!-- 제목 -->
                  <h3 class="mt-lg-0 mt-4">타이틀ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</h3>
                  <!-- 작성날짜 -->
                  <small class="d-block text-muted">3 days ago</small>
                  <div class="d-flex mt-3">
                  <div class="flex-shrink-0">
                    <img alt="Image placeholder" class="avatar rounded-circle" src="${path}/assets/img/team-5.jpg">
                  </div>
                  <div class="flex-grow-1 ms-3"">
                    <h6 class="h5 mt-0" style = "line-height:2.5">Jessica Stones</h6>
                    </div>
                    <div class="text-end ms-auto">
                <button type="button" class="btn btn-xs btn-primary mb-0">
                  <i class="fas fa-plus pe-2"></i> Follow
                </button>
              </div>
                    </div>
                    <div>
                    <p class="mb-4">
                    Personal profiles are the perfect way for you to grab their attention and persuade recruiters to continue reading your CV because you’re telling them from the off exactly why they should hire you.
                    z
                    zz
                    z
                    z
                    z
                    z
                    z
                    z
                    
                   </p>
                   </div>
       
                </div>
              </div>
              <div class = "dstep">
              <button type="button" class="btn btn-primary"><i class="ni ni-bold-left"></i></button>
              <button type="button" class="btn btn-primary">목록</button>
              <button type="button" class="btn btn-primary"><i class="ni ni-bold-right"></i></button>
              </div>
              <div class="row align-items-center px-2 mt-4 mb-2">
                <div class="col-sm-6">
                  <div class="d-flex">
                    <div class="d-flex align-items-center">
                      <i class="ni ni-like-2 me-1 cursor-pointer opacity-6"></i>
                      <span class="text-sm me-3 ">150</span>
                    </div>
                    <div class="d-flex align-items-center">
                      <i class="ni ni-chat-round me-1 cursor-pointer opacity-6"></i>
                      <span class="text-sm me-3">36</span>
                    </div>
                    <div class="d-flex align-items-center">
                      <i class="ni ni-curved-next me-1 cursor-pointer opacity-6"></i>
                      <span class="text-sm me-2">12</span>
                    </div>
                  </div>
                </div>
                <div class="col-sm-6 d-none d-sm-block">
                  <div class="d-flex align-items-center justify-content-sm-end">
                    <div class="d-flex align-items-center">
                      <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-toggle="tooltip" data-original-title="Jessica Rowland">
                        <img alt="Image placeholder" src="${path}/assets/img/team-5.jpg" class="">
                      </a>
                      <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-toggle="tooltip" data-original-title="Audrey Love">
                        <img alt="Image placeholder" src="${path}/assets/img/team-2.jpg" class="rounded-circle">
                      </a>
                      <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-toggle="tooltip" data-original-title="Michael Lewis">
                        <img alt="Image placeholder" src="${path}/assets/img/team-1.jpg" class="rounded-circle">
                      </a>
                    </div>
                    <small class="ps-2 font-weight-bold">and 30+ more</small>
                  </div>
                </div>
                <hr class="horizontal dark my-3">
              </div>
              <!-- Comments -->
              <div class="mb-1">
                <div class="d-flex">
                  <div class="flex-shrink-0">
                    <img alt="Image placeholder" class="avatar rounded-circle" src="${path}/assets/img/bruce-mars.jpg">
                  </div>
                  <div class="flex-grow-1 ms-3">
                    <h6 class="h5 mt-0">Michael Lewis</h6>
                    <p class="text-sm">I always felt like I could do anything. That’s the main thing people are controlled by! Thoughts- their perception of themselves!</p>
                    <div class="d-flex">
                      <div>
                        <i class="ni ni-like-2 me-1 cursor-pointer opacity-6"></i>
                      </div>
                      <span class="text-sm me-2">3 likes</span>
                      <div>
                        <i class="ni ni-curved-next me-1 cursor-pointer opacity-6"></i>
                      </div>
                      <span class="text-sm me-2">2 shares</span>
                    </div>
                  </div>
                </div>
                <div class="d-flex mt-3">
                  <div class="flex-shrink-0">
                    <img alt="Image placeholder" class="avatar rounded-circle" src="${path}/assets/img/team-5.jpg">
                  </div>
                  <div class="flex-grow-1 ms-3">
                    <h6 class="h5 mt-0">Jessica Stones</h6>
                    <p class="text-sm">Society has put up so many boundaries, so many limitations on what’s right and wrong that it’s almost impossible to get a pure thought out. It’s like a little kid, a little boy.</p>
                    <div class="d-flex">
                      <div>
                        <i class="ni ni-like-2 me-1 cursor-pointer opacity-6"></i>
                      </div>
                      <span class="text-sm me-2">10 likes</span>
                      <div>
                        <i class="ni ni-curved-next me-1 cursor-pointer opacity-6"></i>
                      </div>
                      <span class="text-sm me-2">1 share</span>
                    </div>
                  </div>
                </div>
                <div class="d-flex mt-4">
                  <div class="flex-shrink-0">
                    <img alt="Image placeholder" class="avatar rounded-circle me-3" src="${path}/assets/img/team-4.jpg">
                  </div>
                  <div class="flex-grow-1 my-auto">
                      <form class="align-items-center">
                <div class="d-flex">
                   <textarea class="form-control" placeholder="Write your comment" rows="1"></textarea>
                  <button class="btn bg-gradient-primary mb-0 ms-2" style = "height: 38px;width: 70px;">
                    등록
                  </button>
                </div>
              </form>

  <form>
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
  
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/photoswipe.min.js"></script>
  <script src="${path}/assets/js/plugins/photoswipe-ui-default.min.js"></script>
  <script>
    if (document.getElementById('choices-quantity')) {
      var element = document.getElementById('choices-quantity');
      const example = new Choices(element, {
        searchEnabled: false,
        itemSelectText: ''
      });
    };

    if (document.getElementById('choices-material')) {
      var element = document.getElementById('choices-material');
      const example = new Choices(element, {
        searchEnabled: false,
        itemSelectText: ''
      });
    };

    if (document.getElementById('choices-colors')) {
      var element = document.getElementById('choices-colors');
      const example = new Choices(element, {
        searchEnabled: false,
        itemSelectText: ''
      });
    };

    // Gallery Carousel
    if (document.getElementById('products-carousel')) {
      var myCarousel = document.querySelector('#products-carousel')
      var carousel = new bootstrap.Carousel(myCarousel)
    }


    // Products gallery

    var initPhotoSwipeFromDOM = function(gallerySelector) {

      // parse slide data (url, title, size ...) from DOM elements
      // (children of gallerySelector)
      var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
          numNodes = thumbElements.length,
          items = [],
          figureEl,
          linkEl,
          size,
          item;

        for (var i = 0; i < numNodes; i++) {

          figureEl = thumbElements[i]; // <figure> element
          // include only element nodes
          if (figureEl.nodeType !== 1) {
            continue;
          }

          linkEl = figureEl.children[0]; // <a> element

          size = linkEl.getAttribute('data-size').split('x');

          // create slide object
          item = {
            src: linkEl.getAttribute('href'),
            w: parseInt(size[0], 10),
            h: parseInt(size[1], 10)
          };

          if (figureEl.children.length > 1) {
            // <figcaption> content
            item.title = figureEl.children[1].innerHTML;
          }

          if (linkEl.children.length > 0) {
            // <img> thumbnail element, retrieving thumbnail url
            item.msrc = linkEl.children[0].getAttribute('src');
          }

          item.el = figureEl; // save link to element for getThumbBoundsFn
          items.push(item);
        }

        return items;
      };

      // find nearest parent element
      var closest = function closest(el, fn) {
        return el && (fn(el) ? el : closest(el.parentNode, fn));
      };

      // triggers when user clicks on thumbnail
      var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
          return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if (!clickedListItem) {
          return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
          childNodes = clickedListItem.parentNode.childNodes,
          numChildNodes = childNodes.length,
          nodeIndex = 0,
          index;

        for (var i = 0; i < numChildNodes; i++) {
          if (childNodes[i].nodeType !== 1) {
            continue;
          }

          if (childNodes[i] === clickedListItem) {
            index = nodeIndex;
            break;
          }
          nodeIndex++;
        }



        if (index >= 0) {
          // open PhotoSwipe if valid index found
          openPhotoSwipe(index, clickedGallery);
        }
        return false;
      };

      // parse picture index and gallery index from URL (#&pid=1&gid=2)
      var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
          params = {};

        if (hash.length < 5) {
          return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
          if (!vars[i]) {
            continue;
          }
          var pair = vars[i].split('=');
          if (pair.length < 2) {
            continue;
          }
          params[pair[0]] = pair[1];
        }

        if (params.gid) {
          params.gid = parseInt(params.gid, 10);
        }

        return params;
      };

      var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
          gallery,
          options,
          items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)
        options = {

          // define gallery index (for URL)
          galleryUID: galleryElement.getAttribute('data-pswp-uid'),

          getThumbBoundsFn: function(index) {
            // See Options -> getThumbBoundsFn section of documentation for more info
            var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
              pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
              rect = thumbnail.getBoundingClientRect();

            return {
              x: rect.left,
              y: rect.top + pageYScroll,
              w: rect.width
            };
          }

        };

        // PhotoSwipe opened from URL
        if (fromURL) {
          if (options.galleryPIDs) {
            // parse real index when custom PIDs are used
            // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
            for (var j = 0; j < items.length; j++) {
              if (items[j].pid == index) {
                options.index = j;
                break;
              }
            }
          } else {
            // in URL indexes start from 1
            options.index = parseInt(index, 10) - 1;
          }
        } else {
          options.index = parseInt(index, 10);
        }

        // exit if index not found
        if (isNaN(options.index)) {
          return;
        }

        if (disableAnimation) {
          options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
      };

      // loop through all gallery elements and bind events
      var galleryElements = document.querySelectorAll(gallerySelector);

      for (var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i + 1);
        galleryElements[i].onclick = onThumbnailsClick;
      }

      // Parse URL and open gallery if it contains #&pid=3&gid=1
      var hashData = photoswipeParseHash();
      if (hashData.pid && hashData.gid) {
        openPhotoSwipe(hashData.pid, galleryElements[hashData.gid - 1], true, true);
      }
    };

    // execute above function
    initPhotoSwipeFromDOM('.my-gallery');
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