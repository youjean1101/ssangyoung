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
    Contigo
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${path}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="${path}/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${path}/assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
  <script src="https://kit.fontawesome.com/3aab1ef667.js" crossorigin="anonymous"></script>
  <!-- 삭제하기 알람창  -->
  
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
<%@ include file="header.jsp" %>
<style>
#so1 li{
  list-style:auto;
  }
</style>
<body class="g-sidenav-show   bg-gray-100">
  
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card" style = "margin-top: 150px">
            <div class="card-body">
              <c:forEach var = "detail" items = "${dlist }">
							<div class="dropdown">
								<h5 class="mb-4">${detail.nickname }님의게시물</h5>
								<a class="btn bg-gradient-white dropdown-toggle "
									data-bs-toggle="dropdown" id="navbarDropdownMenuLink2"
									> <i
									class="ni ni-settings"></i>
								</a>
								<ul class="dropdown-menu"
									aria-labelledby="navbarDropdownMenuLink2" style = "display:flex;align-items:center;gap:10px;flex-direction: column;'">
									<li><button class="btn btn-outline-danger" id="promptStart" style = "font-size:12px;"><i class="ni ni-air-baloon"></i>신고하기</button></li>
									<li>
									<!-- Button trigger modal -->
									<button class="btn btn-outline-dark" id="updateStart" style = "font-size:12px;"><i class="fa-solid fa-pencil"></i>수정하기</button>
								</li>
									<li>
									<!-- Button trigger modal -->
									<button class="btn btn-outline-warning" id="confirmStart" style = "font-size:12px;"><i class="ni ni-fat-delete"></i>삭제하기</button>
								</li>
									
								</ul>
							</div>

							<div class="row">
                <div class="col-xl-5 col-lg-6 text-center">
                  <img class="w-100 border-radius-lg shadow-lg mx-auto" src="${path }/resource/community/${imgList[0]}" alt="이미지없음">
                  <div class="my-gallery d-flex mt-4 pt-2" itemscope itemtype="http://schema.org/ImageGallery">
                  <c:forEach var = "img" items = "${imgList}" begin = "1" end = "5">
                    <figure class="ms-2 me-3" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
                      <a href="${path }/resource/community/${img}" itemprop="contentUrl" data-size="500x600">
                        <img class="w-100 min-height-100 max-height-100 border-radius-lg shadow" src="${path }/resource/community/${img}" alt="Image description" />
                      </a>
                    </figure>
                    </c:forEach>
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
                      <div class="pswp__container" style = "margin-top: 50px;">
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
                  <h3 class="mt-lg-0 mt-4">${detail.title }</h3>
                  <!-- 작성날짜 -->
                  <c:if test = "${detail.updateDate eq null }">
                  <small class="d-block text-muted">${detail.registDate }</small>
                  </c:if>
                  <c:if test = "${detail.updateDate ne null }">
                  <small class = "d-block text-muted">${detail.updateDate} 수정됨</small>
                  </c:if>
                  
                  <div class="d-flex mt-3">
                  <div class="flex-shrink-0">
                    <a href = "communityMemberRoom.do?email=${detail.email}&loginEmail=${Login.email}"><img alt="Image placeholder" class="avatar rounded-circle cursor-pointer" src="${path}/resource/img/Member/profileimg/${detail.profileimg}"></a>
                  </div>
                  <div class="flex-grow-1 ms-3">
                    <h6 class="h5 mt-0" style = "line-height:2.5">${detail.nickname }</h6>
                    </div>
                     
                    <div class="text-end ms-auto">
                    <c:set var = "followChecking" value = "${followCheck }"/>
                  
                
                    <c:if test = "${followChecking eq '0' or followChecking eq null}">  
                <button id = "followButton" type="button" class="btn btn-xs bg-gradient-secondary mb-0">
                  + Follow</button>
                </c:if>
                <c:if test = "${followChecking eq '1'}">  
                <button id = "followButton" type="button" class="btn btn-xs bg-gradient-primary mb-0">
                  - Following</button>
                </c:if>
                   
               
              </div>
                    </div>
                    <div id = "so1">
                    <p class="mb-4">
                    ${detail.content }
                   </p>
                   </div>      
                </div>
              </div>
              
              </c:forEach>
              <div class = "dstep">
              <c:if test="${dlist[0].prevNum ne 0 }">
              <a href = "${path}/CommunityDetail.do?communityNumber=${dlist[0].prevNum}&keyword=${keyword}&type=${type}&shift=${shift }&category=${category}">
              <button type="button" class="btn btn-primary"><i class="ni ni-bold-left"></i></button></a>
              </c:if>
              <a href = "${path}/CommunityList.do?keyword=${keyword}&type=${type}&shift=${shift }&category=${category}">
              <button type="button" class="btn btn-primary">목록</button></a>
              
              <c:if test="${dlist[0].nextNum ne 0 }">
              <a href = "${path}/CommunityDetail.do?communityNumber=${dlist[0].nextNum}&keyword=${keyword}&type=${type}&shift=${shift }&category=${category}">
              <button type="button" class="btn btn-primary"><i class="ni ni-bold-right"></i></button></a>
              </c:if>
              </div>
              <div class="row align-items-center px-2 mt-4 mb-2">
                <div class="col-sm-6">
                  <div class="d-flex">
                  
                  <!--  좋아요/댓글개수 부분 -->
                  <div class="d-flex align-items-center" style = "width:50px">
                  <c:set var = "likeChecking" value = "${likeCheck}"/>
                    <c:if test = "${likeChecking eq '0' || likeChecking eq null}">  
                      <i id = "Heart" class="fa-regular fa-heart cursor-pointer Heart" style ="font-size:20px;"></i>
                      </c:if>
                      <c:if test = "${likeChecking eq '1'}">  
                      <i id = "Heart" class="fa-solid fa-heart-circle-minus cursor-pointer Heart" style ="font-size:20px;"></i>
                      </c:if>
                      <span class="text-sm me-3 showId" style = "margin-left: 5px;">${likeCnt }</span>
                    </div>
               
                    <div class="d-flex align-items-center">
                      <i class="ni ni-chat-round me-1 cursor-pointer"></i>
                      <span class="text-sm me-3">${replyCnt }</span>
                    </div>
                  </div>
                </div>
              
                <hr class="horizontal dark my-3">
              </div>
              <!-- Comments -->
            
               <c:if test="${fn:length(replyList) > 0}">	
              <div class="mb-1" style = "gap: 15px">
             						
                <c:forEach var = "rep" items = "${replyList}">
								<div>
									<!-- 부모 글  -->

									<div class="d-flex" style="height: auto; margin-top: 25px;">
										<c:if test="${rep.repclass eq '0'}">
											<div class="flex-shrink-0">
												<img alt="Image placeholder"
													style="width: 40px; height: 40px;"
													class="avatar rounded-circle cursor-pointer"
													onclick="moveroom(${rep.replyNo})"
													src="${path}/resource/img/Member/profileimg/${rep.profileimg}">
											</div>
											<div class="flex-grow-1 ms-3">
												<h6 class="h5 mt-0" style="display: inline-block">${rep.nickname }</h6>
												<c:if test="${rep.repUpdateDate eq null }">
													<b
														style="margin-left: 10px; font-size: 12px; color: #afaaaa;">${rep.repDate }</b>
												</c:if>
												<c:if test="${rep.repUpdateDate ne null }">
													<b
														style="margin-left: 10px; font-size: 12px; color: #afaaaa;">${rep.repUpdateDate }
														수정됨</b>
												</c:if>
												<c:if test="${rep.isDeleted eq 1 }">
													<p class="text-sm">
														<span>삭제된 댓글입니다.</span>
													</p>
												</c:if>
												<c:if test="${rep.isDeleted eq 0 }">
													<p id="cont${rep.replyNo }" class="text-sm">
														<span>${rep.repcontent }</span>
													</p>
													<div class="d-flex" style="gap: 5px;">
														<div>
															<i class="fa-solid fa-pen-to-square cursor-pointer"></i>
														</div>
														<span class="text-sm me-2 cursor-pointer"
															onclick="updateItem(${rep.replyNo})">수정</span>
														<div>
															<i class="fa-solid fa-trash cursor-pointer"></i>
														</div>
														<span id="deleteSpan" class="text-sm me-2 cursor-pointer"
															onclick="deleteItem(${rep.replyNo})">삭제</span>
														<div>
															<i
																class="ni ni-curved-next me-1 cursor-pointer opacity-6"></i>
														</div>
														<span class="text-sm me-2 cursor-pointer"
															onclick="contItem(${rep.replyNo})">댓글 달기</span>
													</div>
												</c:if>

											</div>

										</c:if>

										<c:if test="${rep.repclass eq '1'}">
											<div class="d-flex" style="gap: 5px;">
												<span style="margin-top: -15px; font-size: 35px;">↪</span>

												<div class="flex-shrink-0">
													<img alt="Image placeholder"
														style="width: 40px; height: 40px;"
														class="avatar rounded-circle cursor-pointer"
														onclick="moveroom(${rep.replyNo})"
														src="${path}/resource/img/Member/profileimg/${rep.profileimg}">
												</div>
												<div class="flex-grow-1 ms-3">
													<h6 class="h5 mt-0" style="display: inline-block">${rep.nickname }</h6>
													<c:if test="${rep.repUpdateDate eq null}">
														<b
															style="margin-left: 10px; font-size: 12px; color: #afaaaa;">${rep.repDate }</b>
													</c:if>
													<c:if test="${rep.repUpdateDate ne null}">
														<b
															style="margin-left: 10px; font-size: 12px; color: #afaaaa;">${rep.repUpdateDate }
															수정됨</b>
													</c:if>
													<c:if test="${rep.isDeleted eq 1 }">
														<p class="text-sm">
															<span>삭제된 댓글입니다.</span>
														</p>
													</c:if>
													<c:if test="${rep.isDeleted eq 0 }">
														<p id="cont${rep.replyNo }" class="text-sm"
															style="margin-top: 5px;">
															<span style="font-size: 15px">${rep.repcontent }</span>
														</p>
														<div class="d-flex" style="gap: 5px;">
															<div>
																<i class="fa-solid fa-pen-to-square cursor-pointer"></i>
															</div>
															<span class="text-sm me-2 cursor-pointer"
																onclick="updateItem(${rep.replyNo})">수정</span>
															<div>
																<i class="fa-solid fa-trash cursor-pointer"></i>
															</div>
															<span id="deleteSpan" class="text-sm me-2 cursor-pointer"
																onclick="deleteItem(${rep.replyNo})">삭제</span>
														</div>
													</c:if>
												</div>

											</div>
										</c:if>
									</div>
								</div>
								<div id = "showHide${rep.replyNo}" class="mt-4" style =
                "
                    margin-left: 60px;margin-right: 80px;margin-bottom:25px;display:none"
                >
                <form id = "updateReplyForm${rep.replyNo }" method = "post" action = "${path}/updateReply.do">
                  <input type= "hidden" name = "replyNo" value = "${rep.replyNo }"/>
                  <input type= "hidden" name = "communityNumber" value = "${dlist[0].communitynumber}"/>
                  <input type= "hidden" name = "repcontent" value = "${rep.repcontent }"/>
                  <input type= "hidden" name = "email" value = "${rep.email }"/>
                </form>
                <form id = "deleteReplyForm${rep.replyNo }" method = "post" action = "${path }/deleteReply.do">
                  <input type = "hidden" name = "replyNo" value = "${rep.replyNo}"/>
                  <input type= "hidden" name = "communityNumber" value = "${dlist[0].communitynumber}"/>
                  <input type = "hidden" name = "groupid" value = "${rep.groupid }"/>
                  <input type= "hidden" name = "email" value = "${rep.email }"/>
                </form>
                  <div class="flex-shrink-0">
                    <!-- 세션 프로필 아이디. -->
                    <img alt="Image placeholder" class="avatar rounded-circle me-3" src="${path}/resource/img/Member/profileimg/${profileImg}">
                  </div>
                  <div class="flex-grow-1 my-auto">
                      <form method = "post" action = "${path}/writeReReply.do" class="align-items-center">
                      <input type = "hidden" name = "communitynumber" value = "${dlist[0].communitynumber}">
                      <input type = "hidden" name = "groupid" value = "${rep.groupid }"/>   
                <div class="d-flex">
                   <textarea name = "content" class="form-control" placeholder="Write your comment" rows="1"></textarea>
                  <button  class="btn bg-gradient-primary mb-0 ms-2" style = "height: 38px;width: 70px;">
                    등록
                  </button>
                </div>
              </form>
                  </div>
                </div>
                 </c:forEach>
                
                   
                </div>
                 </c:if>
                 <c:if test="${fn:length(replyList) eq 0}">
                 <div style = "display: flex;
    align-items: center;
    flex-direction: column;">
								 <i style = "font-size: 30px;margin-top: 20px;" class="fa-regular fa-comment-dots"></i>
								 <p style = "margin-top:15px">등록된 댓글이 없습니다.</p>
								 </div>
				  </c:if>          
                <c:if test = "${not empty session}">
                <div class="d-flex mt-4">
                  <div class="flex-shrink-0">
                    <!-- 세션 프로필 아이디. -->
                    <img alt="Image placeholder" class="avatar rounded-circle me-3" src="${path}/resource/img/Member/profileimg/${profileImg}">
                  </div>
                  <div class="flex-grow-1 my-auto">
                      <form method = "post" action = "${path}/writeReply.do" class="align-items-center">
                      <input type = "hidden" name = "communitynumber" value = "${dlist[0].communitynumber}">
                <div class="d-flex">
                   <textarea name = "content" class="form-control" placeholder="Write your comment" rows="1"></textarea>
                  <button  class="btn bg-gradient-primary mb-0 ms-2" style = "height: 38px;width: 70px;">
                    등록
                  </button>
                </div>
              </form>
                  </div>
                </div>
                </c:if>
              </div>
            </div>
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
      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>
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
 
 
 <!-- 삭제 게시물 폼 -->
 <form id="infoForm" method="post" action = "${path }/deleteBoard.do">
							<input type="hidden" name="communityNumber" value="${dlist[0].communitynumber}"> 
							<input type="hidden" name="category" value = "${category}">
							<input type="hidden" name ="email" value = "${dlist[0].email }">					
</form>

<!-- 신고사유 폼  -->
<form id = "irrForm" method = "post" action="${path }/insertReport.do">
<input type="hidden" name="communityNumber" value="${dlist[0].communitynumber}"> 
<input type="hidden" name="irrType">
</form>

<!-- 업데이트페이지 -->
<form id = "updateForm" method = "get" action = "${path }/communityUpdatePage.do">
<input type="hidden" name="communityNumber" value="${dlist[0].communitynumber}">
</form>

<!-- 이전글 다음글 form  -->
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="communityNumber" value="${dlist[0].communitynumber}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value = "${keyword }">
		<input type="hidden" name="shift" value = "${shift }">
		<input type="hidden" name="category" value = "${category }">
	</form>
	<!--   Core JS Files   -->
  <script src="${path}/assets/js/plugins/photoswipe.min.js"></script>
  <script src="${path}/assets/js/plugins/photoswipe-ui-default.min.js"></script>
  <script>
 function moveroom(idx){
	 var dpd = $("#deleteReplyForm"+idx);
	 var emails = dpd.find("input[name='email']").val();
	 Swal.fire({
		    icon:'info',
	        text:'룸으로 이동하시겠습니까?',
	        confirmButtonColor: '#5e72e4',
	        confirmButtonText:'룸이동',
	        showCancelButton: true,
	        cancelButtonText:'취소',
	 }).then((result) =>{
		 if(result.isConfirmed){
		 location.href = "communityMemberRoom.do?email="+emails;
		 }
	 })
 }
  //댓글 삭제 
 function deleteItem(idx){
	  var dpd = $("#deleteReplyForm"+idx);
	  var emails = dpd.find("input[name='email']").val();
	  
	  if(myEmail == ''){
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
	  }else if(myEmail==emails){
		  Swal.fire({
			  icon:"error",
			  title: '정말 삭제하시겠습니까?',
		      confirmButtonText:'삭제',
		      showCancelButton: true,
		      cancelButtonText:'취소',	      
		}).then(function(result) { 
			if(result.isConfirmed){
			    dpd.find("input[name=replyNo]").val();
			    dpd.find("input[name=communityNumber]").val();
			    dpd.find("input[name=groupid]").val();
			    dpd.submit();
			}
			
			
		});
	  }else{
		  Swal.fire({
				icon:'warning',
				text:'작성자가 아닙니다.',				
		})
		 
	  }
  }
 //댓글 수정 처리
 
 function updateItem(idx){
	    var upd = $("#updateReplyForm"+idx);
	    var content = upd.find("input[name='repcontent']").val();
	    var email = upd.find("input[name='email']").val();
	    console.log(myEmail)
	    console.log(email);
	    
	    if(myEmail==''){
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
	    else if(myEmail == email){
	    Swal.fire({
			  title: '수정 내용을 적어주세요!',
			  input: 'textarea',
		      inputValue:content,
		      confirmButtonText:'수정',
		      showCancelButton: true,
		      cancelButtonText:'취소',
		      
		}).then(function(result) { 
			if(result.isConfirmed){
			    upd.find("input[name=replyNo]").val();
			    upd.find("input[name=communityNumber]").val();
			    upd.find("input[name=repcontent]").val(result.value);
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
 var moveForm = $("#moveForm");
 var updateForm = $("#updateForm");
 $(".page-item a").on("click", function(e) {

			e.preventDefault(); //기본 동작 제한    
			moveForm.find("input[name='communityNumber']").val();
			moveForm.find("input[name='keyword']").val();
			moveForm.find("input[name='shift']").val();
			moveForm.find("input[name='category']").val();
			moveForm.find("input[name='amount']").val(10);
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
});
//신고 처리 
 console.log('${irrmsg}');
 const irrResult = '${irrmsg}';
 if(irrResult==="irrSuccess"){
	 Swal.fire({
		 icon: 'success',
	      title: '신고해주셔서 감사합니다.',
	      text: '관리자가 검토후 삭제절차가 진행됩니다.',
	 })
 }
 if(irrResult==="irrfail"){
	 Swal.fire({
		 icon: 'error',
	     title: '신고 실패',
	     text:'신고한 게시물입니다.'
	      
	 })
 }
 //수정 처리
 const Result = '${msg}'
 if(Result==='수정성공'){
	 Swal.fire({
		 icon: 'success',
	     title: '수정 성공',
	 })
 }
 if(Result==='삭제완료'){
	 Swal.fire({
		 icon: 'success',
	     title: '삭제 완료',
	 })
 }
 if(Result==='삭제'){
	 Swal.fire({
		 icon: 'success',
	     title: '삭제 완료',
	 })
 }
 $('#updateStart').click(function(){
	 if(myEmail!=following){
		 Swal.fire({
			 icon:'error',
			 title:'작성자가 아닙니다.'
		 })
	 }
	 if(myEmail==''){
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
	 if(myEmail==following){
		 updateForm.find("input[name=communityNumber]").val();
		 updateForm.submit();
	 }
 })
 
 $("#promptStart").click(function () {
	 Swal.fire({
		  confirmButtonText: '신고',
		  cancelButtonText: '취소',
		  showCancelButton: true,
		  icon: "warning",
		  html: '<h2>신고사유</h2><select name="irrReport" id="irrReport"> <option value=1>스팸/홍보/도배글입니다.</option> <option value=2>음란물/욕설 표현 포함글입니다.</option> <option value=3>정치/혐오 글입니다.</option> <option value=4>개인정보 노출 게시물입니다.</option> </select>',
		  
	 }).then((result) => {
		 if(result.isConfirmed){
			 var elm = document.getElementById("irrReport");
			 
		     var session = '${session}';
		    	//삭제조건이 맞을때, 작성자 == 세션 
		     var email = '${dlist[0].email}'
		    	 if(email==session){
					 Swal.fire({
						 icon:'error',
						 title:'작성자는 신고하실 수 없습니다.'
					 })
			     }
		    	 else if(session!=''){
		    		$('input[name=irrType]').attr('value',elm.value);
		    		irrForm.submit();
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
		 }
	 })
 });
 //삭제 처리  
  $("#confirmStart").click(function () {
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
	    	var writer = '${dlist[0].email}';
	    	var session = '${session}';
	    	//삭제조건이 맞을때, 작성자 == 세션
	    	if(session == 'admin@contigo.com'){
	    		infoForm.submit();
	    	}else if(writer == session){
	    		infoForm.submit();
	    	}else if(session==''){
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
	    	   
	    	}else{
	    		Swal.fire({
	    				icon:'warning',
	    				text:'작성자가 아닙니다.',
	    				
	    		})
	    	}        
	      }
	    })
	  });

//function onclick 
function contItem(idx){		   
	      if(myEmail!=null && myEmail!=""){
		  if($("#showHide"+idx).css("display") == "none"){
		  $('#showHide'+idx).css({"display":"flex"});
		  }else{
	      $('#showHide'+idx).css({"display":"none"});
	      }
	}else{
		Swal.fire({
		    icon:'warning',
	        text:'로그인 후에 이용하실 수 있습니다.',
	        confirmButtonColor: '#5e72e4',
	        confirmButtonText:'로그인하러가기',
	        showCancelButton: true,
	        cancelButtonText:'취소',
	 }).then((result) =>{
		 if (result.isConfirmed) {
		 location.href = "${path}/SignIn.do";
		 }
	 })
	}
}
	 

//  
    var myEmail = '${session}';
    var communityNumber = '${dlist[0].communitynumber}';
    var following = '${dlist[0].email}';
    console.log(myEmail);
    //팔로우, 팔로잉 처리
    
    $("#followButton").on("click", function(e) {
    	if(myEmail == following){
        	Swal.fire({
    			icon:'warning',
    			text:'자기자신을 팔로잉할 수 없습니다.',
    			
    	})
        }
    	else if(myEmail!=null && myEmail!=""){
    	fetch("${path}/selectFriend.do?communityNumber=${dlist[0].communitynumber}&myEmail=${session}")
    	.then(res => res.json())
    	.then(data => {
    		console.log(data.followCheck);
    		var followCheck = data.followCheck;
    		console.log(followCheck);
    		if(followCheck==1){
    			fetch("${path}/deleteFriend.do",{
    	   			method : "POST",
    	   			header:{
    	   				"Content-Type": "application/json",
    	   			},
    	   			body:JSON.stringify({
    	   			myEmail:'${session}',
    	   			following:'${dlist[0].email}'
    	   		}),
    	   	})
    	   	    .then(res => res.json())  //응답 결과를 json으로 파싱
    	   	    .then(data => {
    	   	    		//***여기서 응답 결과로 실행할 동작을 정의하면 됨***
    	   	            // [ data.키값 ] 이런 형태로 value 추출 가능 
    	   	            console.log(data.string); //응답 결과를 console 창에 출력	 
    		            	$('#followButton').html('+ Follow');	            	
    		            	$('#followButton').attr('class','btn btn-xs bg-gradient-secondary mb-0')
    		               
    		            	
    	   	    })
    	   	    .catch(err => { // 오류 발생시 오류를 담아서 보여줌
    	   	        console.log('Fetch Error',err);
    	   	    });
    		}		
    		if(followCheck==0){
    			
    	    		fetch("${path}/insertFriend.do",{
    	    			method : "POST",
    	    			header:{
    	    				"Content-Type": "application/json",
    	    			},
    	    			body:JSON.stringify({
    	    			myEmail:'${session}',
    	    			following:'${dlist[0].email}'
    	    		}),
    	    	})
    	    	    .then(res => res.json())  //응답 결과를 json으로 파싱
    	    	    .then(data => {
    	    	    		//***여기서 응답 결과로 실행할 동작을 정의하면 됨***
    	    	            // [ data.키값 ] 이런 형태로 value 추출 가능 
    	    	            console.log(data.string); //응답 결과를 console 창에 출력
    	    	            	$('#followButton').html('- Following');
    	    	            	$('#followButton').attr('class','btn btn-xs bg-gradient-primary mb-0')
    	    	                
    	    	            	
    	    	    })
    	    	    .catch(err => { // 오류 발생시 오류를 담아서 보여줌
    	    	        console.log('Fetch Error',err);
    	    	    });
    		
    	
    	
    
    		}
    	})
    }else{
    	Swal.fire({
		    icon:'warning',
	        text:'로그인 후에 이용하실 수 있습니다.',
	        confirmButtonColor: '#5e72e4',
	        confirmButtonText:'로그인하러가기',
	        showCancelButton: true,
	        cancelButtonText:'취소',
	 }).then((result) =>{
		 if (result.isConfirmed) {
		 location.href = "${path}/SignIn.do";
		 }
	 })
    }
 
 });

//좋아요 수/ 댓글 수 표시하기

var likeVal = '${likeCheck}';

$("#Heart").on("click", function(e) {
	if(myEmail!=null && myEmail!=""){
	var likeCnt =${likeCnt};
	if(likeVal>0){
		console.log("허허 좋아요 눌렀어용!");	
		fetch("${path}/deleteLike.do",{
   			method : "POST",
   			header:{
   				"Content-Type": "application/json",
   			},
   			body:JSON.stringify({
   			email:'${session}',
   			communityNumber:'${dlist[0].communitynumber}'
   		}),
   	})
   	    .then(res => res.json())  //응답 결과를 json으로 파싱
   	    .then(data => {
   	    		//***여기서 응답 결과로 실행할 동작을 정의하면 됨***
   	            // [ data.키값 ] 이런 형태로 value 추출 가능 
   	            likeVal--;
   	            console.log(data.msg)
   	    		console.log(likeVal);
   	            $('.showId').text(data.likeCnt);
	            $('#Heart').attr('class','fa-regular fa-heart cursor-pointer')
	              	            	
   	    })
   	    .catch(err => { // 오류 발생시 오류를 담아서 보여줌
   	        console.log('Fetch Error',err);
   	    });
	}else{
	console.log("허허 좋아요 눌렀어용!");
		fetch("${path}/insertLike.do",{
   			method : "POST",
   			header:{
   				"Content-Type": "application/json",
   			},
   			body:JSON.stringify({
   			email:'${session}',
   			communityNumber:'${dlist[0].communitynumber}'
   		}),
   	})
   	    .then(res => res.json())  //응답 결과를 json으로 파싱
   	    .then(data => {
   	    		//***여기서 응답 결과로 실행할 동작을 정의하면 됨***
   	            // [ data.키값 ] 이런 형태로 value 추출 가능
   	            console.log(data.msg);
   	    		console.log(likeVal);
   	    		likeVal++;
   	    		$('.showId').text(data.likeCnt);
	            $('#Heart').attr('class','fa-solid fa-heart-circle-minus cursor-pointer')               
	            	
   	    })
   	    .catch(err => { // 오류 발생시 오류를 담아서 보여줌
   	        console.log('Fetch Error',err);
   	    });
}}else{
	Swal.fire({
	    icon:'warning',
        text:'로그인 후에 이용하실 수 있습니다.',
        confirmButtonColor: '#5e72e4',
        confirmButtonText:'로그인하러가기',
        showCancelButton: true,
        cancelButtonText:'취소',
 }).then((result) =>{
	 if (result.isConfirmed) {
	 location.href = "${path}/SignIn.do";
	 }
 })
}})


  
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
  
  
  <!-- Github buttons -->
 
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->

</body>

</html>