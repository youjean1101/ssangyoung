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
<script src="${path}/resource/js/Req4002/room.js"></script>

<script type="text/javascript">
	$(document).ready(function(e){
		 // 내용값 넣기(value)
		$(".ql-editor").append("${boardInfo.content}")
		console.log($('#edit-deschiption-edit .ql-editor').text())
		// 글자수 갯수
		//$("#textCnt").text(expeditor.text().length)
		$("#edit-deschiption-edit").keyup(function(){
			$("#textCnt").text(expeditor.text().length)
		})
		
		// 해시태그
		$("#tagHide").hide()
		$("#hashTagCancel").hide()
		/* var hashTagshow = ""
		hashTagshow += "<select class='form-control' name='hashtag' id='choices-tags-edit' multiple >"
		hashTagshow += "<option selected>#홍보</option>"
		hashTagshow += "<option selected>#맛집</option>"
		hashTagshow += "<option selected>#3대학원</option>"
		hashTagshow += "<option selected>#재테크</option>"
		hashTagshow += "<option selected>#나를 이기자</option>"
		hashTagshow += "<option selected>#장수</option>"
		hashTagshow += "<option selected>#건강</option>"
		hashTagshow += " </select>" */
		
		$("#hashTag").click(function(){
			$("#regHashTag").hide()
			//$("#tagHide").html(hashTagshow)
			$("#tagHide").show()
			$(this).hide()
			$("#hashTagCancel").show()
			
		})
		
		$("#hashTagCancel").click(function(){
			$(this).hide()
			$("#hashTag").show()
			$("#tagHide").hide()
			$("#regHashTag").show()
		})
		 $('#edit-deschiption .ql-editor').keyup(function(){
			 alert($('#edit-deschiption .ql-editor').html().indexOf('<img src='))
			  if(($('#edit-deschiption .ql-editor').html().indexOf('<img src='))!=-1){
				 alert("[안내메시지] 이미지는 따로 등록하셔야 합니다.")
				 $('#edit-deschiption .ql-editor').text("")
			  }
		 })
		
		var expeditor=$('#edit-deschiption-edit .ql-editor')
		$("#update").click(function(){
			/* if($("input[name='indexNo']").is(":checked")==false){
				$("#notchecked").attr("checked",true)
			}
			수정내용에 따라 인덱스번호 전송
			*/ 
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
				  //내용 입력에 따른 content Input에 데이터 넣기(내용입력란이 input태그가 아니라서))
				  $('input[name=content]').val(expeditor.html());
				  $("form").submit()
			  }
  		})
  		
  		
  		/* 
  		// 큰사진 클릭 시, file값 클릭
  		$("#bigphoto").click(function(){
  			$("#fileClick1").click()
  			$("#fileClick1").change(function(){
  				// 큰사진 숨기기
  				//$("#bigphoto").hide()
  				$("#index0").prop("checked", true)
  			})
  		})
  		// 작은사진
  		$("#imgTab td").eq(0).click(function(e){
  			$("#fileClick2").click()
  			$("#fileClick2").change(function(e){
  				//$(".regimg").eq(1).hide()
  				$("#index1").prop("checked", true)
  			})
  		})
  		$("#imgTab td").eq(1).click(function(e){
  			$("#fileClick3").click()
  			$("#fileClick3").change(function(e){
  				//$(".regimg").eq(2).hide()
  				$("#index2").prop("checked", true)
  			})
  		})
  		$("#imgTab td").eq(2).click(function(e){
  			$("#fileClick4").click()
  			$("#fileClick4").change(function(e){
  				//$(".regimg").eq(3).hide()
  				$("#index3").prop("checked", true)
  			})
  		})
  		$("#imgTab td").eq(3).click(function(e){
  			$("#fileClick5").click()
  			$("#fileClick5").change(function(e){
  				//$(".regimg").eq(4).hide()
  				$("#index4").prop("checked", true)
  			})
  		})
  		$("#imgTab td").eq(4).click(function(e){
  			$("#fileClick6").click()
  			$("#fileClick6").change(function(e){
  				//$(".regimg").eq(5).hide()
  				$("#index5").prop("checked", true)
  			})
  		}) */
  		$("#imgChange").click(function(){
  			$("#bigphoto").hide()
  			$("#imgTab").hide()
  			$('#fileClick1').show()
  		}) //하나씩 선택 시, hide 미리보기 처리를 위한 기능
  		// 이미지 변경
  		$('#fileClick1').hide()
	  	$('#fileClick2').hide()
	  	$('#fileClick3').hide()
	  	$('#fileClick4').hide()
	  	$('#fileClick5').hide()
	  	$('#fileClick6').hide()
	  	$('#fileClick7').hide()
		  //div 내용 비워주기
		      //$('#preview').empty();
	  	var fileCnt = 0
	    $("input[type='file']").change(function(e){
			if($('#uploadFile1').val()!=""){
				  $('#fileClick1').hide()
				  $('#fileClick2').show()
			 }
			 if($('#fileClick2').val()!=""){
				  $('#fileClick2').hide()
				  $('#fileClick3').show()
			 }
			 if($('#fileClick3').val()!=""){
				  $('#fileClick3').hide()
				  $('#fileClick4').show()
			 }
			 if($('#fileClick4').val()!=""){
				  $('#fileClick4').hide()
				  $('#fileClick5').show()
			 }
			  
			 if($('#fileClick5').val()!=""){
				  $('#fileClick5').hide()
				  $('#fileClick6').show()
			 }
			 
			 if($('#fileClick6').val()!=""){
				 $('#fileClick6').hide()
				 $('#fileClick7').show()
				 
				 $('#fileClick7').click(function(){
					 alert("[안내메시지]사진은 6장이상 등록이 불가합니다.")
					 $('#fileClick7').attr("readonly",true)
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
  <script src="${path}/resource/js/Req4002/commonfunction.js"></script>
</head>

<body class="g-sidenav-show bg-gray-100">
	<jsp:include page="header.jsp"></jsp:include>
	<form method="post" enctype="multipart/form-data" action="${path}/communityUpdate.do"><!--  -->
	  <input type="hidden" name="communitynumber" value="${boardInfo.getCommunitynumber()}">
	  <input type="hidden" name="photoUptwh">
      <div class="row mt-4">
         <div class="card h-100" style="margin-top:8%;">
           <div class="card-body" >
             <h5 class="font-weight-bolder" style="text-align:center; font-size:20pt;"><span>${boardInfo.category}</span> 게시글 변경</h5>
             <div class="row">
               <div class="col-12">
                 <div class="card-body">
      				<input type="file" name="updateFile" class="form-control" id="fileClick1" multiple>
                	<input type="file" name="updateFile" class="form-control" id="fileClick2" multiple>
                	<input type="file" name="updateFile" class="form-control" id="fileClick3" multiple>
                	<input type="file" name="updateFile" class="form-control" id="fileClick4" multiple>
                	<input type="file" name="updateFile" class="form-control" id="fileClick5" multiple>
                	<input type="file" name="updateFile" class="form-control" id="fileClick6" multiple>
                	<input type="file"  id="fileClick7" class="form-control" multiple>
                	<div id="preview"></div>
		             <div class="row" style="margin-left:35%;">
			              <!-- <label style="border:1px solid black" >  -->
			              		<c:if test="${not empty boardImgArrOne}">
					               <img id="bigphoto" class="border-radius-lg shadow-lg ms-4 regimg" src="${path}/resource/community/${boardImgArrOne}" 
					                  			alt="이미지 없음" style="width:auto; height:400px;">
					                <span id="noImg" class="ms-5" style="color:red;"></span>
				                </c:if>
				                <c:if test="${empty boardImgArrOne}">
				                	<img id="bigphoto" class="border-radius-lg shadow-lg ms-4 regimg" src="${path}/resource/community/default_Img.png" 
					                  			alt="이미지 없음" style="width:auto; height:400px;">
					                <span id="noImg" class="ms-5" style="color:red;"></span>
				                </c:if>
				                
			              <!--  </label> -->
		                  					
		                 <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery" >
			                    <table id="imgTab">
			                    	<tbody>
				                    	<tr>
				                    		<c:forEach var="boardImg" items="${boardImgArr}">
						                    	<td style="border:30px solid white;">
						                    		<img class="min-height-100 max-height-100 border-radius-lg shadow ms-2 regimg" 
									                        		 src="${path}/resource/community/${boardImg}" alt="이미지 없음" style="width:auto; height:150px;" />
									           		<div id="preview1"></div>
									           	</td>
								           	</c:forEach>
					                    </tr>
					                    <tr>
					                    	<td colspan="5"><button type="button" id="imgChange" class="btn btn-outline-primary" style="margin-left:40%;" >사진 수정</button></td>
					                    	<!-- <td colspan="5" style="color:red; text-align:center;">※ 사진을 클릭하시면 수정이 가능합니다.</td> -->
					                    </tr>
				                    </tbody>
			                    </table>
		                  </div>
		             </div>
           		</div>
        	</div>
        	  		
                	<!-- 
                	
                	<input type="checkbox" name="indexNo" id="notchecked" value="6">
                	<input type="checkbox" name="indexNo" id="index0" value="0" >
                	<input type="checkbox" name="indexNo" id="index1" value="1" >
                	<input type="checkbox" name="indexNo" id="index2" value="2" >
                	<input type="checkbox" name="indexNo" id="index3" value="3" >
                	<input type="checkbox" name="indexNo" id="index4" value="4" >
                	<input type="checkbox" name="indexNo" id="index5" value="5" > -->
                	
        <div class="row mt-4">
          <div class="card">
            <div class="card-body">
              <h5 class="font-weight-bolder"></h5>
              <div class="row" style="--bs-gutter-x:0;">
                <div class="col-12 col-sm-6">
                   <label class="postUpdateTitle" style="width:90%;">카테고리</label>
	               <input name="category" class="form-control" onclick="updateImpossible('카테고리')" value="${boardInfo.category}" type="text" readonly style="width:90%;"/>
                </div>
                <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                  <label class="postUpdateTitle">작성자</label>
                  <input class="form-control" onclick="updateImpossible('작성자')" value="${Login.email}" type="text" readonly style="width:90%;"/><!--  -->
                </div>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">제목</label>
                <input name="title" class="form-control" type="text" value="${boardInfo.title}"/>
              </div>
              <div class="row" style="--bs-gutter-x:0;">
                <label class="mt-4 postUpdateTitle">내용
                	<span style="font-color:grey; font-weight:normal; font-size:12pt;">(<span id="textCnt" style="color:red"></span> / 600자)</span></label>
                <div id="edit-deschiption-edit" style="height:500px;">
                	<div class=".ql-editor"></div>
                </div>
                <input type="hidden" id="contentInput" name="content"/>
              </div>
            
            <div class="row" style="--bs-gutter-x:0;">
               <label class="mt-4 postUpdateTitle">해시 태그(#)
               <button type="button" class="btn btn-outline-primary" id="hashTag" style="width:130px; height:40px;">해시태그 수정</button>
               <button type="button" class="btn btn-outline-primary" id="hashTagCancel" style="width:160px; height:40px;">해시태그 수정취소</button>
               </label><!-- 선택된값을 select되어있게 설정해야함..  -->
               <c:if test="${not empty boardInfo.hashtag}">
               		<input id="regHashTag" type="text" name="hashtag" class="form-control" value="${boardInfo.hashtag}" readonly>
               </c:if>
               <c:if test="${empty boardInfo.hashtag}">
               		<input id="regHashTag" type="text" name="hashtag" class="form-control" value="등록하신 해시태그가 없습니다." readonly>
               </c:if>
               <div id="tagHide">
	                <select class="form-control" name="hashtag" id="choices-tags-edit" multiple >
		                    <option selected>#홍보</option>
		                    <option selected>#맛집</option>
		                    <option selected>#3대학원</option>
		                    <option selected>#재테크</option>
		                    <option selected>#나를 이기자</option>
		                    <option selected>#장수</option>
		                    <option selected>#건강</option><!-- 태그 테이블에서 콤보박스 생성  -->
	                </select>
                </div>
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