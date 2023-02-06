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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
		$("#goMain").click(function(){
			location.href="${path}/list.do"			
		});		
	});
</script>
</head>

<body>
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">게시판 상세</h4>
        <form method="post" class="validation-form" novalidate>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="no">글번호</label>
              <input type="text" name="no" class="form-control" id="no" 
              		value="${board.no}" readonly required>
              <div class="invalid-feedback">
                입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="refno">답글번호</label>            
              <input type="text" name="refno" class="form-control" id="no" 
              		value="${board.refno}" readonly required>
              <div class="invalid-feedback">
                입력해주세요.
              </div>
            </div>
          </div>  
          <div class="mb-3">
            <label for="subject">제목</label>
            <input name="subject" value="${board.subject}" type="text" class="form-control  ckValid" id="subject" placeholder="제목 입력" required>
            <div class="invalid-feedback">
              제목을 입력해주세요.
	           </div>
		  </div>
          <div class="row">      
	          <div class="col-md-6 mb-3">
	            <label for="writer">작성자</label>
	            <input type="text" name="writer"
	            	 value="${board.writer}"  class="form-control ckValid" id="writer" placeholder="작성자를 입력" required>
	            <div class="invalid-feedback">
	              작성자를 입력해주세요.
	            </div>
	          </div> 
	          <div class="col-md-6 mb-3">
	            <label for="readcnt">조회수</label>
	            <input type="text" name="readcnt"
	            	 value="${board.readcnt}" readonly class="form-control ckValid" id="readcnt"  required>
	            <div class="invalid-feedback">
	              입력해주세요.
	            </div>
	          </div> 	          
          </div> 
          <div class="row">
            <div class="col-md-6 mb-3">
              <label >등록일</label>
             
              <input type="text"  class="form-control" 
              		value='<fmt:formatDate pattern='yyyy-MM-dd' value="${board.regdte}"/>' >
              <div class="invalid-feedback">
                입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label >수정일</label>
             
              <input type="text" class="form-control"  
              		value='<fmt:formatDate pattern='yyyy-MM-dd' value="${board.updte}"/>' >
              <div class="invalid-feedback">
                입력해주세요.
              </div>
            </div>
          </div> 
        
          <div class="mb-3">
            <label for="content">내용</label>
            <textarea name="content"  class="form-control  ckValid" id="content" placeholder="내용 입력" required rows="5" >${board.content}</textarea>
            <div class="invalid-feedback">
              내용를 입력해주세요.
            </div>
          </div> 
          <div class="mb-4"></div>
	          <button id="regBtn" class="btn btn-warning btn-lg btn-block" type="button">게시물 수정</button>
	          <button id="delBtn" class="btn btn-danger btn-lg btn-block" type="button">게시물 삭제</button>
	          <button id="goMain" class="btn btn-info   btn-lg btn-block" type="button">조회 화면</button>
        </form>
      </div>
    </div>
</body>
</html>