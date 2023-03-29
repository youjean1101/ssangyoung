b<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<!-- nano regdate uptdate -->
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
  <link href="../../../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../../../assets/css/argon-dashboard.css?v=2.0.5" rel="stylesheet" />
</head>

<body class="g-sidenav-show bg-gray-100">
   <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid py-4" style="margin-top:8%;">
            <!--form panels-->
            <div class="row">
              <div class="col-12 col-lg-8 m-auto">
            </div>
        </div>
      <div class="row">
        <div class="col-md-8 col-sm-10 mx-auto">
          <form class="" action="index.html" method="post">
            <div class="card my-sm-5 my-lg-0">
              <div class="card-header text-center">
                <div class="row justify-content-between">
                  <div class="col-md-4 text-start">
s                </div>
                <br>
                     <h4 class="mb-0 text-start text-center">
                      공지사항 제목
                    </h4>
                <div class="row justify-content-md-between">
                  <div class="col-md-4 mt-auto">
                   <div class="col-md-6">
                        <h6 class="text-secondary mb-0">작성자</h6>
                      </div>
                  </div>
                  
                  <div class="col-lg-5 col-md-7 mt-auto">
                    <div class="row mt-md-5 mt-4 text-md-end text-start">
                      <div class="col-md-6">
                        <h6 class="text-secondary mb-0">작성일</h6>
                      </div>
                      <div class="col-md-4">
                        <h6 class="text-dark mb-4"  value="${fm.regdte}">2022/03/03</h6>
                      </div>
                    </div>
                    <div class="row text-md-end text-start">
                      <div class="col-md-6">
                        <h6 class="text-secondary mb-0"  value="${fm.uptdate}">수정일</h6>
                      </div>
                      <div class="col-md-4">
                        <h6 class="text-dark mb-4">2022/03/07</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive border-radius-lg">
                    		<div class="table-responsive mt-3">
								<table class="table table-flush" id="">
									<thead class="thead-light">
										<tr style="background-color: #ebebeb;">
										</tr>
									</thead>
									<tbody>
							    		<tr>
							    		<td>내용</td>
							    		</tr>
									 </tbody>
								</table>
							</div>
                    </div>
                  </div>
                </div>
                			
                			
              </div>
              <div class="card-footer mt-md-10 mt-4">
					
                  <div class="col-lg-7 text-md-end mt-md-0 mt-3">	
                    <button class="btn btn-primary mt-lg-7 mb-0" onClick="window.print()" type="button" name="button">다운로드</button>
                    <button class="btn btn-primary mt-lg-7 mb-0" onClick="window.print()" type="button" name="button">인쇄하기</button>
                  </div>
                </div>
              </div>
            </div>
          </form>
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
</div>
  </main>
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
  <script src="../../../assets/js/argon-dashboard.min.js?v=2.0.5"></script>
</body>

</html>