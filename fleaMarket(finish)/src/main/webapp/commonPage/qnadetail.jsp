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
  <title>고객센터 등록</title>
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
    	 $(".ql-link").hide()
        $('#edit-deschiption .ql-editor').keyup(function(){
           console.log($(this).html())
        })
        
       
         // 등록 버튼 클릭 시,
        $("#insert").click(function(){
           //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
           var expeditor=$('#edit-deschiption .ql-editor').html()
           $('input[name=content]').val(expeditor);
           $("form").submit()
        })
        
        
        
        
     });
  </script>
</head>
<!-- nano regdate uptdate text칸 두개로 나누기 ... -->
<body class="g-sidenav-show bg-gray-100">
   <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid py-4" style="margin-top:8%;">
            <!--form panels-->
            <div class="row">
              <div class="col-12 col-lg-8 m-auto">
							<form class="multisteps-form__form mb-8" method="post"
								enctype="multipart/form-data"
								action="${path}/QNAInsert.do">
								<!--single form panel-->
									<h5 class="font-weight-bolder mt-8"
										style="text-align: center; font-size: 20pt;">고객센터 게시글 상세조회</h5>
										<div class="row" style="padding: 5px; margin-top:2%;">
											<div class="col-12 col-sm-6">
												<label class="postInsertTitle">분류</label> <select
													class="form-control" name="method" id="choices-category">
													<option value="n" selected="">공지사항</option>
													<option value="q">문의하기</option>
													<option value="a">답변하기</option>
												</select>
											</div>
											<div class="col-12 col-sm-6 mt-3 mt-sm-0">
												<label class="postInsertTitle">작성자</label> <input
													class="multisteps-form__input form-control" name="email"
													type="text" value="${Login.email}" readonly />
											</div>
										</div>
										
						
										 <div class="row">
            <div class="col-md-6 mb-3">
              	<label class="postInsertTitle">등록일</label>
             
              <input type="text"  class="form-control" 
              		value='<fmt:formatDate pattern='yyyy-MM-dd' value="${qna.regdte}"/>' >
            </div>
            <div class="col-md-6 mb-3">
             	<label class="postInsertTitle">수정일</label>
              <input type="text"  class="form-control"  
              		value='<fmt:formatDate pattern='yyyy-MM-dd'  value="${qna.uptdte}"/>'  >
            </div>
          </div> 
        
										
										
										<div class="row mt-3" style="width: 99%; margin-left: 0.5%;">
											<label class="postInsertTitle" style="margin-left: -0.5%;">제목</label>
											<input class="multisteps-form__input form-control"
												name="title" type="text" placeholder="제목을 작성해주세요." />
										</div>
										<div class="row" style="width: 99%; margin-left: 0.5%;">

											<label class="mt-4 postInsertTitle"
												style="margin-left: -0.5%;">게시글 내용</label>
											<div id="edit-deschiption" style="height: 400px;">
												<p class="ql-editor"></p>
											</div>
											<input type="hidden" id="contentInput" name="content" />
										</div>
										<div class="row" style="width: 99%; margin-left: 0.5%;">
											<label class="mt-4 form-label labelFont">첨부파일</label>
											<div class="form-control dropzone" id="dropzone">
												<div class="fallback">
													<input name="filePath" type="file" id="QNAFile" multiple />

												</div>
											</div>
										</div>
									</form>
							<button type="button" style="float:right;" class="btn btn-primary btn-md mb-0">수정</button>
							<button type="button" style="float:right;" class="btn btn-primary btn-md mb-0">등록</button>

						</div>
					</div>
					

                 
                    </div>
                  </div>
              </div>
            </div>
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