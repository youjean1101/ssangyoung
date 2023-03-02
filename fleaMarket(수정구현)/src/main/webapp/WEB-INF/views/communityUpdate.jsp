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
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".ql-editor").append("<h2>될까?</h2><p>되야지그러ㅗㅁ</p>") // 내용값 넣기(value)
		console.log($('#edit-deschiption-edit .ql-editor').text())
		/* $('#edit-deschiption-edit').keyup(function(){
			console.log($($('#edit-deschiption-edit .ql-editor')).html())
		}) */
		
		$("#update").click(function(){
		  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
		  var expeditor=$('#edit-deschiption-edit .ql-editor').html()
		  console.log(expeditor)
		  $('input[name=content]').val(expeditor);
		 $("form").submit()
  		})
	});
	
	function updateImpossible(what){
		if(what==="작성자"){
			alert("[안내메시지]작성자는 변경이 불가합니다.")
		}else{
			alert("[안내메시지]카테고리는 변경이 불가합니다.")
		}
	}
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
	<jsp:include page="header.jsp"></jsp:include>
	<form method="post" enctype="multipart/form-data" action="${path}/communityUpdate.do"><!--  -->
	  <input type="hidden" name="communitynumber" value="comBoard23">
      <div class="row mt-4" >
         <div class="card h-100" style="margin-top:8%;">
           <div class="card-body">
             <h5 class="font-weight-bolder" style="text-align:center; font-size:20pt;"><span>커뮤니티(조건걸어서 무슨커뮤니티인지 넣기)</span> 게시글 변경</h5>
             <div class="row">
               <div class="col-12">
                 <div class="card-body">
              <div class="row">
	              	<label for="fileClick1" style="margin-left:32%;">
	                  <img class="border-radius-lg shadow-lg" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb.jpg" alt="chair" style="width:600px; height:400px;">
	                </label>
                 	<input type="file" id="fileClick1" accept="image/*" onchange="setThumbnail(event);" hidden>
                  <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery" style="margin:24px 32% 0px;">
                    <figure class="ms-2 me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                       	<label for="fileClick2">
                        	<img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-1.jpg" alt="Image description"/>
                   			<!-- <div class="w-100 min-height-100 max-height-100 border-radius-lg shadow" id="image_container"></div> -->
							<!-- 이미지 클릭 시, img 히든처리, 사진 변경 기능넣기 -->
                   		</label>
                   		<input type="file" id="fileClick2" accept="image/*" onchange="setThumbnail(event);" hidden>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                        <label for="fileClick3">
                       	 <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-2.jpg" itemprop="thumbnail" alt="Image description" />
                    	</label>
                    	<input type="file" id="fileClick3" accept="image/*" onchange="setThumbnail(event);" hidden>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                        <label for="fileClick4">
                        	<img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-3.jpg" itemprop="thumbnail" alt="Image description" />
                    	</label>
                    	<input type="file" id="fileClick4" accept="image/*" onchange="setThumbnail(event);" hidden>
                    </figure>
                    <figure class="me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                        <label for="fileClick5">
                        	<img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-4.jpg" itemprop="thumbnail" alt="Image description" />
                    	</label>
                    	<input type="file" id="fileClick5" accept="image/*" onchange="setThumbnail(event);" hidden>
                    </figure>
                    <figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                        <label for="fileClick6">
                        	<img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/product-thumb-5.jpg" itemprop="thumbnail" alt="Image description" />
                    	</label>
                    	<input type="file" id="fileClick6" accept="image/*" onchange="setThumbnail(event);" hidden>
                    </figure>
                  </div>
             </div>
           </div>
        </div>
        <script>
	        function setThumbnail(event) {
	            var reader = new FileReader();
	            reader.onload = function(event) {
	              var img = document.createElement("img");
	              img.setAttribute("src", event.target.result);
	              document.querySelector("#image_container").appendChild(img);
	              img.width=230
	              img.height=180
	            };
	            reader.readAsDataURL(event.target.files[0]);
	          }
	        
        </script>
        <div class="row mt-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder"></h5>
              <div class="row" style="--bs-gutter-x:0;">
                <div class="col-12 col-sm-6">
                   <label class="postUpdateTitle" style="width:90%;">카테고리</label>
	               <input class="form-control" onclick="updateImpossible('카테고리')" value="카테고리값" type="text" readonly style="width:90%;"/>
                </div>
                <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                  <label class="postUpdateTitle">작성자</label>
                  <input class="form-control" onclick="updateImpossible('작성자')" value="로그인한 세션값" type="text" readonly style="width:90%;"/>
                </div>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">제목</label>
                <input name="title" class="form-control" type="text" value="등록된 내용 가져오기" />
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">내용</label>
                <div id="edit-deschiption-edit" style="height:500px;">
                	<div class=".ql-editor"></div>
                </div>
                <input type="hidden" id="contentInput" name="content"/>
              </div>
            <div class="row" style="--bs-gutter-x:0;">
               <label class="mt-4 postUpdateTitle">태그(#)</label>
                <select class="form-control" name="hashtag" id="choices-tags-edit" multiple>
                  <option selected>In Stock</option>
                </select>
            </div>
          </div>
             <button class="btn btn-primary" type="button" id="update" style="margin-top:2%; margin-left:28%; width:50%; font-size:18pt;">수정</button>
        </div>
      </div>
     </div>
    </div>
   </div>
  </div>
  </form>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
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
  <script src="${path}/resource/js/Req4002/InsertContent.js"></script>
</body>
</html>