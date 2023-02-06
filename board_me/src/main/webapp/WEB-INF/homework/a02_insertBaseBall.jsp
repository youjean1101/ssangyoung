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
		var msg = "${msg}"
		if(msg!=""){
			if(confirm(msg+"\n 조회화면으로 이동하시겠습니까?")){
				location.href="${path}/baseballList.do"
			}
		}
		
		$("#goMain").click(function(){
			location.href="${path}/baseballList.do"			
		});
		$("#regBtn").click(function(){
			var isInValid = false
			for(var idx=0;idx<$(".ckValid").length;idx++){
				if($(".ckValid").eq(idx).val()==""){
					alert("입력하여야 등록 가능합니다.")
					$(".ckValid").eq(idx).focus()
					isInValid = true
					break;
				}
			}
			if(isInValid){
				return
			}
			$("form").submit()
		})
	
	});
</script>
</head>

<body>
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">야구팀 등록</h4>
        <form method="post" action="${path}/insertT.do" class="validation-form" novalidate>
          <div class="mb-3">
            <label for="teamname">팀명</label>
            <input name="teamname" type="text" class="form-control  ckValid" id="teamname" placeholder="팀명 입력" required>
            <div class="invalid-feedback">
              팀명을 입력해주세요.
            </div>
          </div>
          <div class="mb-3">
            <label for="ranking">순위</label>
            <input type="text" name="ranking" class="form-control ckValid" id="ranking" placeholder="순위 입력" required>
            <div class="invalid-feedback">
              순위를 입력해주세요.
            </div>
          </div>   
          <div class="mb-3">
            <label for="hometown">연고지</label>
            <input name="hometown" type="text" class="form-control  ckValid" id="hometown" placeholder="연고지 입력" required>
            <div class="invalid-feedback">
              연고지를 입력해주세요.
            </div>
          </div> 
          <div class="mb-3">
            <label for="player">선수</label>
            <textarea name="player"  class="form-control  ckValid" id="player" placeholder="선수 입력" required rows="5" ></textarea>
            <div class="invalid-feedback">
              선수를 입력해주세요.
            </div>
          </div> 
                    
          <div class="mb-4"></div>
          <button id="regBtn" class="btn btn-primary btn-lg btn-block" type="button">야구팀 등록</button>
          <button id="goMain" class="btn btn-info btn-lg btn-block" type="button">조회 화면</button>
        </form>
      </div>
    </div>
</body>
</html>