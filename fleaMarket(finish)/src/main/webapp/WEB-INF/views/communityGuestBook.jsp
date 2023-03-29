<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
 <!--

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
  <link rel="apple-touch-icon" sizes="76x76" href="../../../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../../../assets/img/favicon.png">
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
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
</head>

<body class="g-sidenav-show   bg-gray-100">
 <div class="col-md-4">
    <!-- Button trigger modal -->
    

    <!-- Modal --><!-- 방명록 작성 -->
    <div class="modal fade" id="exampleModalMessage" tabindex="-1" role="dialog" aria-labelledby="exampleModalMessageTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">방명록을 작성해봐요!</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="message-text" class="col-form-label">Message:</label>
                <textarea class="form-control" id="message-text"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn bg-gradient-secondary" data-bs-dismiss="modal">취소</button>
            <button id = "insert" type="button" class="btn bg-gradient-primary">작성하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
 <div>
    <!-- End Navbar -->
    <!-- 방명록 조회  -->
  <div class="card-group" style = "gap: 10px;flex-direction: column;padding: 65px">
  <button style = "width:300px;"type="button" class="btn bg-gradient-success btn-block mb-3" data-bs-toggle="modal" data-bs-target="#exampleModalMessage">
      방명록 작성하기
    </button>
  <c:forEach var = "book" items="${ booklist}">
  <div class="card">
  
    <div class="card-body pt-2">
    
      <span class="text-gradient text-primary text-uppercase text-xs font-weight-bold my-2">방명록</span>
      <div style ="
    display: inline-flex;
    float: right;
    /* align-content: stretch; */
    
      ">
   
     <button style = "height:38px;"type="button" class="btn bg-gradient-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    수정맨
  </button>
  <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownMenuButton">
    <li onclick = "updateItem(${book.guestBookid})" class="dropdown-item border-radius-md">수정하기</li>
    <li onclick = "deleteItem(${book.guestBookid})"class="dropdown-item border-radius-md">삭제하기</li>   
  </ul>

  </div>
      <p style = "margin-top: 38px;"class="card-description mb-4">
         ${book.message }
      </p>
      <div class="author align-items-center">
        <img src="${path}/resource/img/Member/profileimg/${book.profileimg}" alt="..." class="avatar shadow">
        <div class="name ps-3">
          <span>${book.nickname }</span>
          <div class="stats">
            <small>${book.registDate }</small>
          </div>
        </div>
      </div>
    </div>
  </div>
  <form id = "upGuestForm${book.guestBookid}" method = "post" action = "updateGuestBook.do">
                    <input type="hidden" name = "guestBookid" value = "${book.guestBookid }">
                    <input type="hidden" name = "guestemail" value = "${book.guestemail }"/>
                    <input type="hidden" name = "message"/>
                               
  </form>
  <form id= "deleteForm${book.guestBookid }" method = "post" action = "deleteGuestBook.do">
  <input type= "hidden" name = "guestBookid" value= ${book.guestBookid }/>
  <input type= "hidden" name = "email" value ="${book.email }"/>
  <input type="hidden" name = "guestemail" value = "${book.guestemail }"/>
  </form>
  </c:forEach>
  </div>
</div>
<nav aria-label="Page navigation example" style = "margin-top: 20px;">
							<ul class="pagination pagination-white justify-content-center" id="pageInfo">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link pagingnum"
										href="${pageMaker.startPage-1}" tabindex="-1"> <i
											class="fa fa-angle-left"></i> <span class="sr-only">Previous</span>
									</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
										<a class="page-link" href="${num }">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item"><a class="page-link pagingnum"
										href="${pageMaker.endPage+1}"> <i
											class="fa fa-angle-right"></i> <span class="sr-only">Next</span>
									</a></li>
								</c:if>
							</ul>
						</nav>         
  
        <form id="moveForm" method="get">
                     <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
                     <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                        <input type= "hidden" name = "email" value ="${pageMaker.cri.email}">
        </form>
        <form id = "insertForm" method = "post" action="insertGuestBook.do">
                    <input type="hidden" name = "email" value = "${email}"/>
                    <input type="hidden" name = "guestemail"/>
                    <input type="hidden" name = "message"/>
        </form>
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
  <!--   Core JS Files   -->
  <script src="${path}/assets/js/core/popper.min.js"></script>
  <script src="${path}/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
<script>

var moveForm = $('#moveForm');
$(".page-item a").on("click", function(e) {

    e.preventDefault(); //기본 동작 제한    
    
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.submit();
 });



//방명록 등록 ! 
var insertForm = $('#insertForm');


$("#insert").on("click",function(){
	var guestemail = '${session}';
	var email = moveForm.find("input[name='email']").val();
	var message = $('#message-text').val();
	if(message.length<10){
		Swal.fire({
		    icon:'warning',
	        text:'10글자 이상 입력해주세요 ! ',	        
	        confirmButtonText:'확인',
		})
	}else if(guestemail!=''){
	insertForm.find("input[name='message']").val(message);
	insertForm.find("input[name='email']").val(email);
	insertForm.find("input[name='guestemail']").val(guestemail);
	insertForm.submit();
	}else{
		Swal.fire({
		    icon:'warning',
	        text:'로그인 후에 이용하실 수 있습니다.',
	        confirmButtonColor: '#5e72e4',
	        confirmButtonText:'로그인하러가기',
	        showCancelButton: true,
	        cancelButtonText:'취소',
	 }).then((result) =>{
		 if(result.isConfirmed){
			 location.href = "${path}/SignIn.do";
			 }
	 })
	}
})
function updateItem(idx){
	    var upd = $("#upGuestForm"+idx);
	    var content = upd.find("input[name='message']").val();
	    var guestemail = upd.find("input[name='guestemail']").val();
	    var email = '${session}';
	    var guestBookid = upd.find("input[name='guestBookid']").val();
	    
	    console.log(guestemail);
	    console.log(email);
	    if(email==''){
			 Swal.fire({
				    icon:'warning',
			        text:'로그인 후에 이용하실 수 있습니다.',
			        confirmButtonColor: '#5e72e4',
			        confirmButtonText:'로그인하러가기',
			        showCancelButton: true,
			        cancelButtonText:'취소',
			 }).then((result) =>{
				 if(result.isConfirmed){
				 location.href = "${path}/SignIn.do";
				 }
			 })
		 }
	    else if(guestemail == email){
	    Swal.fire({
			  title: '수정 내용을 적어주세요!',
			  input: 'textarea',
		      inputValue:content,
		      confirmButtonText:'수정',
		      showCancelButton: true,
		      cancelButtonText:'취소',
		      
		}).then(function(result) { 
			if(result.isConfirmed){
			    upd.find("input[name='guestBookid']").val(guestBookid);
			    upd.find("input[name='guestemail']").val(guestemail);
			    upd.find("input[name='message']").val(result.value);
			    upd.submit();
			}
			
			
		});
		
}else{			
	 Swal.fire({
			icon:'warning',
			text:'작성자가 아닙니다.',
			
	})
	 
					 
}
 }

function deleteItem(idx){
    var dpd = $("#deleteForm"+idx);
    
    var guestemail = dpd.find("input[name='guestemail']").val();
    var email = '${session}';
    var guestBookid = dpd.find("input[name='guestBookid']").val();
    var emails = dpd.find("input[name='email']").val();
    if(email==''){
		 Swal.fire({
			    icon:'warning',
		        text:'로그인 후에 이용하실 수 있습니다.',
		        confirmButtonColor: '#5e72e4',
		        confirmButtonText:'로그인하러가기',
		        showCancelButton: true,
		        cancelButtonText:'취소',
		 }).then((result) =>{
			 if(result.isConfirmed){
			 location.href = "${path}/SignIn.do";
			 }
		 })
	 }
    else if(guestemail == email){
    	Swal.fire({
    	      title: '정말 삭제하시겠습니까?',
    	      text: "다시 되돌릴 수 없습니다. 신중하세요.",
    	      icon: 'warning',
    	      showCancelButton: true,
    	      confirmButtonColor: '#3085d6',
    	      cancelButtonColor: '#d33',
    	      confirmButtonText: '삭제',
    	      cancelButtonText: '취소',
    	      reverseButtons: false, //버튼 순서 거꾸로
    	      
    	    }).then((result) => {
    	    	if (result.isConfirmed) {
    	    		dpd.find("input[name='guestBookid']").val();
    	    		dpd.submit();
    	    	}
    	    })
      }
    	//삭제조건이 맞을때, 작성자 == 세션
    	else if(emails == email){
    		Swal.fire({
      	      title: '정말 삭제하시겠습니까?',
      	      text: "다시 되돌릴 수 없습니다. 신중하세요.",
      	      icon: 'warning',
      	      showCancelButton: true,
      	      confirmButtonColor: '#3085d6',
      	      cancelButtonColor: '#d33',
      	      confirmButtonText: '삭제',
      	      cancelButtonText: '취소',
      	      reverseButtons: false, //버튼 순서 거꾸로
      	      
      	    }).then((result) => {
      	    	if (result.isConfirmed) {
      	    		dpd.find("input[name='guestBookid']").val();
      	    		dpd.submit();
      	    	}
      	    })
    	   
    	}else{
    		Swal.fire({
    				icon:'warning',
    				text:'작성자가 아닙니다.',
    				
    		})
    	}        
      }




</script>
  <!-- Kanban scripts -->
  <script src="${path }/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="${path }/assets/js/plugins/jkanban/jkanban.js"></script>
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