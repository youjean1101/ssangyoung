<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8" />
  <title>커뮤니티 게시글 등록</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link rel="icon" type="image/png" href="${path}/assets/img/favicon.png">
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <link href="${path}/resource/css/Community/CommunityBoard.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  <script type="text/javascript">
	  $(document).ready(function(){
		 	var fname = ""
			 $("#productImg").on("click",function(){
				console.log($('.dz-filename span').text())
				fname += $('.dz-filename span').text()
				fname += "&SEP&"
				//$("#fileposition").innerHTML ="<input type='file' name='report' class='form-control' accept='image/*' value='"+fname+"'>"
			  })
			    fname += $('.dz-filename span').text()
			    
			// 등록 버튼 클릭 시,
		    //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
			  var expeditor=$('#edit-deschiption .ql-editor').html()
			  //$('input[name=content]').val(expeditor)
			  	  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
			  //var expeditor=$('#edit-deschiption .ql-editor').html()
			 // $('input[name=content]').val(expeditor);
			  //$("form").submit()
		   $("#insert").click(function(){
		
			  goInsert(fname, expeditor);
		  }) 
	  });
	  var qstr = "category="+$("select[name='category']").val()+"&email"+$("input[name='email' ]").val()
				+"&title="+$("input[name='title']").val()+"&content="+ $('input[name=content]').val(expeditor)
				+"&hashgtag="+$("select[name='hashtag']").val()+"&report="+fname,
		  
	 function goInsert(fname, expeditor){
			$.ajax({
				url:"${path}/communityInsert.do",
				type:"post",
				data:qstr
				dataType:"json",
				success:function(data){
					alert("등록이 성공하였습니다.")
				},
				error:function(err){
					console.log(err)
				}
			})
		} 
  </script>
</head>

<body class="g-sidenav-show bg-gray-100">
	<jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid py-4" style="margin-top:8%;">
      <div class="row">
        <div class="col-12">
          <div class="multisteps-form">
            <div class="row">
              <div class="col-12 col-lg-8 mx-auto mt-4 mb-sm-5 mb-3">
                <div class="multisteps-form__progress">
                  <button class="multisteps-form__progress-btn js-active" type="button" title="Product Info">
                    <span style="">1. 게시글 등록</span>
                  </button>
                  <button class="multisteps-form__progress-btn" type="button" title="Media">2. 이미지 등록</button>
                </div>
              </div>
            </div>
            <!--form panels-->
            <div class="row">
              <div class="col-12 col-lg-8 m-auto">
                <form class="multisteps-form__form mb-8" method="get"  enctype="multipart/form-data" ><!--action="${path}/communityInsert.do"  -->
                  <!--single form panel-->
                  <div class="card multisteps-form__panel r-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <h5 class="font-weight-bolder mt-4" style="text-align:center; font-size:20pt;">커뮤니티 게시글 등록</h5>
                    <div class="multisteps-form__content">
                      <div class="row" style="padding:5px; margin-top:2%;">
                        <div class="col-12 col-sm-6">
                         <label class="postInsertTitle">카테고리</label>
                          <select class="form-control" name="category" id="choices-category">
                            <option selected="">홍보글</option>
                            <option>사업아이디어</option>
                            <option>사는이야기</option>
                            <option>꿀팁</option>
                          </select>
                        </div>
                        <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                          <label class="postInsertTitle">작성자</label>
                          <input class="multisteps-form__input form-control" name="email" type="text" value="${Login.email}" readonly/>
                        </div>
                      </div>
                      <div class="row mt-3" style="width:99%; margin-left:0.5%;">
                          <label class="postInsertTitle" style="margin-left:-0.5%;">제목</label>
                          <input class="multisteps-form__input form-control" name="title" type="text" placeholder="제목을 작성해주세요." />
                       </div>
                      <div class="row" style="width:99%; margin-left:0.5%;">
                         <label class="mt-4 postInsertTitle" style="margin-left:-0.5%;">게시글 내용</label>
                         <div id="edit-deschiption" style="height:400px;">
                         <!-- 	<p class="ql-editor"></p> -->
                         </div>
                         <input type="hidden" id="contentInput" name="content" />
                      </div>
                      <div class="row">
                        <div class="col-12">
                          <label class="mt-4 form-label postInsertTitle">태그(#)</label><!--태그 기능 넣기 #클릭시 드롭다운하기/아니면 입력값넣기  -->
                          <select class="form-control" name="hashtag" id="choices-tags" multiple>
                            <!-- <option selected>#구분자로 있는 태그들로 드롭다운시키기</option> -->
                          </select>
                        </div>
                      </div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn bg-gradient-dark ms-auto mb-2 me-2 js-btn-next" type="button" title="Next" id="next">다음</button>
                      </div>
                    </div>
                  </div>
                  <!--single form panel-->
                  <div class="card multisteps-form__panel p-3 border-radius-xl bg-white" data-animation="FadeIn" >
                    <h5 class="font-weight-bolder postInsertTitle" style="text-align:center; font-size:20pt;">커뮤니티 게시글 이미지 등록</h5>
                    <div class="multisteps-form__content" >
                      <div class="row mt-3">
                        <div class="col-12">
                          <label>등록할 이미지</label>
                          <div action="/file-upload" class="form-control dropzone" id="productImg"></div>
                          <div id="fileposition"></div>
                         
                        </div>
                      </div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn bg-gradient-secondary mb-0 js-btn-prev mt-2"  type="button" title="Prev">이전</button>
                        <button class="btn bg-gradient-dark ms-auto mb-0 mt-2" type="button" title="Send" id="insert">등록</button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!--   Core JS Files   -->
  <%-- <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script> --%>
  <script src="${path}/assets/js/plugins/choices.min.js"></script>
  <script src="${path}/assets/js/plugins/dropzone.min.js"></script>
  <script src="${path}/assets/js/plugins/quill.min.js"></script>
  <script src="${path}/assets/js/plugins/multistep-form.js"></script>
  <script>
    if (document.getElementById('edit-deschiption')) {
      var quill = new Quill('#edit-deschiption', {
        theme: 'snow' // Specify theme in configuration
      });
    };

    if (document.getElementById('choices-category')) {
      var element = document.getElementById('choices-category');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-sizes')) {
      var element = document.getElementById('choices-sizes');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-currency')) {
      var element = document.getElementById('choices-currency');
      const example = new Choices(element, {
        searchEnabled: false
      });
    };

    if (document.getElementById('choices-tags')) {
      var tags = document.getElementById('choices-tags');
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
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

</html>