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
  <script src="${path}/resource/js/Req4002/commonfunction.js"></script>
  <script type="text/javascript">
	  $(document).ready(function(e){
		  
		  // 카테고리에 따른 selcted 처리
		  var categoryVal="${category}"
		  $("#categorySelect").val(categoryVal).prop("selected",true);
			
		  // 글자수 갯수
		   var expeditor=$('#edit-deschiption .ql-editor')
		  $("#edit-deschiption").keyup(function(){
			 $("#textCnt").text(expeditor.text().length)
		  })

		  $('#edit-deschiption .ql-editor').keyup(function(){
			  if(($('#edit-deschiption .ql-editor').html().indexOf('<img src='))!=-1){
				 alert("[안내메시지] 이미지는 따로 등록하셔야 합니다.")
				 $('#edit-deschiption .ql-editor').text("")
			  }
		  })
		  
		  // 등록 버튼 클릭 시,
		  $("#insert").click(function(){
			  // 유효성체크
			  if($("input[name='title']").val()==""){
				  alert("[안내메시지] 제목을 입력하여야 게시글 등록이 가능합니다.")
				 contentfocus("title")
			  }else if($("input[name='title']").val().length>150){
				  alert("[안내메시지] 제목은 150자 이하로 입력하셔야 게시글 등록이 가능합니다.")
				  contentfocus("title")
			  }else if(expeditor.text().length<10){
				 alert("[안내메시지] 내용을 10자 이상 작성해주셔야 게시글 등록이 가능합니다.")
				 contentfocus("content")
			  }else if(expeditor.text().length>600){
				 alert("[안내메시지] 내용을 600자 이하로 작성해주셔야 게시글 등록이 가능합니다.")
				 contentfocus("content")
			  }else{
				  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서)
				  $('input[name=content]').val(expeditor.html());
				  $("form").submit()
			  }
		  })
		  
		console.log($('#productImg').val())
		$('#uploadFile2').hide()
	  	$('#uploadFile3').hide()
	  	$('#uploadFile4').hide()
	  	$('#uploadFile5').hide()
	  	$('#uploadFile6').hide()
	  	$('#uploadFile7').hide()
		  //div 내용 비워주기
		      //$('#preview').empty();
	  	var fileCnt = 0
	    $("input[type='file']").change(function(e){
			if($('#uploadFile1').val()!=""){
				  $('#uploadFile1').hide()
				  $('#uploadFile2').show()
			 }
			 if($('#uploadFile2').val()!=""){
				  $('#uploadFile2').hide()
				  $('#uploadFile3').show()
			 }
			 if($('#uploadFile3').val()!=""){
				  $('#uploadFile3').hide()
				  $('#uploadFile4').show()
			 }
			 if($('#uploadFile4').val()!=""){
				  $('#uploadFile4').hide()
				  $('#uploadFile5').show()
			 }
			  
			 if($('#uploadFile5').val()!=""){
				  $('#uploadFile5').hide()
				  $('#uploadFile6').show()
			 }
			 
			 if($('#uploadFile6').val()!=""){
				 $('#uploadFile6').hide()
				 $('#uploadFile7').show()
				 
				 $('#uploadFile7').click(function(){
					 alert("[안내메시지]사진은 6장이상 등록이 불가합니다.")
					 $('#uploadFile7').attr("readonly",true)
			 	 })
			 }
			  
		      var files = e.target.files;
		      var arr =Array.prototype.slice.call(files);
		      
		      
		      fileCnt += files.length
		      
		      //업로드 가능 파일인지 체크
		      for(var i=0;i<files.length;i++){
		        if(!checkExtension(files[i].name,files[i].size)){
		        	return false;
		        }
		      }
		      preview(arr);
		    });//file change
		 
		  // 사진 용량에 따른 유효성체크
		  function checkExtension(fileName,fileSize){
			  
			  var regex = new RegExp("(.*?)\.(jpg|png|jpeg|jpe|jfif|gif|webp)$");
		      var maxSize = 20971520;  //20MB
		      
		      if(!regex.test(fileName)){
		    	  alert('[안내메시지]이미지 파일만 등록 가능합니다.');
		        $("input[type='file']").val("");  //파일 초기화
		        return false;
		      }
		      
		      if(fileSize >= maxSize){
		    	alert('[안내메시지] 파일 사이즈가 초과되었습니다. 다시 넣어주세요.');
		        $("input[type='file']").val("");  //파일 초기화
		        return false;
		      }
		      if (fileCnt >6){
		    	  alert('[안내메시지]사진은 6장이상 등록이 불가합니다.');
		    	  fileCnt=0 // 전에 입력받은 파일갯수 초기화해줘야함
		    	  return false;
		      }
		      return true;
		    }
		  //이미지 넣기
		  function preview(arr){
			  //alert(arr.length)
		      arr.forEach(function(f){
		        //파일명이 길면 파일명...으로 처리
		        var fileName = f.name;
		        if(fileName.length > 10){
		          fileName = fileName.substring(0,7)+"...";
		        }
		        //div에 이미지 추가
		        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
		        str += '<span>'+fileName+'</span><br>';
		        //이미지 파일 미리보기
		        if(f.type.match('image.*')){
		          	var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          		reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            	str += '<img src="'+e.target.result+'" title="'+f.name+'" width=auto height=100 />';
	            	str += '</li></div>';
	            $(str).appendTo('#preview');
		          } 
		          reader.readAsDataURL(f);
		        }else{
		          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		          $(str).appendTo('#preview');
		        }
		      });//arr.forEach
		    }
		    
	  })
		   //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
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
                    <span>1. 게시글 등록</span>
                  </button>
                  <button class="multisteps-form__progress-btn" type="button" title="Media">2. 이미지 등록</button>
                </div>
              </div>
            </div>
            <!--form panels-->
            <div class="row">
              <div class="col-12 col-lg-8 m-auto">
                <form class="multisteps-form__form mb-8" method="post" enctype="multipart/form-data" action="${path}/communityInsert.do"><!-- action="${path}/communityInsert.do"  -->
                  <!--single form panel-->
                  <div class="card multisteps-form__panel r-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <h5 class="font-weight-bolder mt-4" style="text-align:center; font-size:20pt;">커뮤니티 게시글 등록</h5>
                    <div class="multisteps-form__content">
                      <div class="row" style="padding:5px; margin-top:2%;">
                        <div class="col-12 col-sm-6">
                         <label class="postInsertTitle">카테고리</label>
                          <select class="form-control" name="category" id="categorySelect">
                            <option>홍보글</option>
                            <option>사업아이디어</option>
                            <option>사는이야기</option>
                            <option>꿀팁</option>
                          </select>
                        </div>
                        <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                          <label class="postInsertTitle">작성자</label>
                          <input class="multisteps-form__input form-control" name="email" type="text" value="${Login.email}" readonly/><!--  -->
                        </div>
                      </div>
                      <div class="row mt-3" style="width:99%; margin-left:0.5%;">
                          <label class="postInsertTitle" style="margin-left:-0.5%;">제목</label>
                          <input class="multisteps-form__input form-control" name="title" type="text" placeholder="제목을 작성해주세요." />
                       </div>
                      <div class="row" style="width:99%; margin-left:0.5%;">
                         <label class="mt-4 postInsertTitle" style="margin-left:-0.5%;">게시글 내용 
                         				<span style="font-color:grey; font-weight:normal; font-size:12pt;">(<span id="textCnt" style="color:red"></span> / 600자)</span></label>
                         <div id="edit-deschiption" style="height:400px;">
                         <!-- 	<p class="ql-editor"></p> -->
                         </div>
                         <input type="hidden" id="contentInput" name="content" />
                      </div>
                      <div class="row">
                        <div class="col-12">
                          <label class="mt-4 form-label postInsertTitle">태그(#)</label><!--태그 기능 넣기 #클릭시 드롭다운하기/아니면 입력값넣기  -->
                          <select class="form-control" name="hashtag" id="choices-tags" multiple>
                            <option selected>#홍보</option>
                            <option selected>#맛집</option>
                            <option selected>#3대학원</option>
                            <option selected>#재테크</option>
                            <option selected>#나를 이기자</option>
                            <option selected>#장수</option>
                            <option selected>#건강</option>
                          </select>
                        </div>
                      </div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn bg-gradient-dark ms-auto mb-2 me-2 js-btn-next" type="button" title="Next" id="next">다음</button>
                      </div>
                    </div>
                  </div>
                  <!--single form panel-->
                  <div class="card multisteps-form__panel p-3 border-radius-xl bg-white" data-animation="FadeIn" style="height:400px;">
                    <h5 class="font-weight-bolder postInsertTitle" style="text-align:center; font-size:20pt;">커뮤니티 게시글 이미지 등록</h5>
                    <div class="multisteps-form__content" >
                      <div class="row mt-3">
                        <div class="col-2" style="height:120px;">
                          <label class="postInsertTitle">게시글 이미지</label>
                          <table>
						    <tr >
						      <td align="center">
						        <input type="file" name="mediaFile" id="uploadFile1" class="form-control" multiple="multiple" style="width:780px;">
						        <input type="file" name="mediaFile" id="uploadFile2" class="form-control" multiple style="width:780px;">
						        <input type="file" name="mediaFile" id="uploadFile3" class="form-control" multiple style="width:780px;">
						        <input type="file" name="mediaFile" id="uploadFile4" class="form-control" multiple style="width:780px;">
						        <input type="file" name="mediaFile" id="uploadFile5" class="form-control" multiple style="width:780px;">
						        <input type="file" name="mediaFile" id="uploadFile6" class="form-control" multiple style="width:780px;">
						        <input type="file" id="uploadFile7" class="form-control" multiple style="width:780px;">
						        <div id="preview" style="width:100%;"></div>
						      </td>
						    </tr>
						  </table>
                          <!-- <input type="file" name="report" class="form-control" style="width:230px"
                          		id="productImg" accept="image/*" onchange="setThumbnail(event);" multiple> -->
                        </div>
                      </div>
                      <div class="button-row d-flex mt-4">
                        <button class="btn bg-gradient-secondary mb-0 js-btn-prev mt-8"  type="button" title="Prev">이전</button>
                        <button class="btn bg-gradient-dark ms-auto mb-0 mt-8" type="button" title="Send" id="insert">등록</button>
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